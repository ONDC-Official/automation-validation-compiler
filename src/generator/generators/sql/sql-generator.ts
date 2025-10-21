import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import { CodeGenerator } from "../classes/abstract-generator.js";
import { ConfigVariable, TestObject } from "../../../types/config-types.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { compileInputToSql } from "./sql-ast.js";

type FlattenContext = {
	skipPredicates: string[];
};

type VariableDefinition = {
	name: string;
	expression: string;
};

type SqlRule = {
	api: string;
	name: string;
	errorCode: number;
	successCode: number;
	condition: string;
	gateExpression: string;
	scopeArrayExpression: string;
	variables: VariableDefinition[];
	varsCteName: string;
	scopeCteName: string;
};

export class SqlGenerator extends CodeGenerator {
	generateSessionDataCode = async () => {
		// Session data persistence is not currently supported for SQL output.
		return;
	};

	generateValidationCode = async () => {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];
		for (const api of Object.keys(testConfig)) {
			const tests = testConfig[api];
			const rules = this.flattenTests(api, tests, { skipPredicates: [] });
			const script = this.buildAthenaScript(api, rules);
			await writeFileWithFsExtra(
				this.rootPath,
				`./athena/${api}.sql`,
				script
			);
		}
	};

	generateCode = async () => {
		await this.generateValidationCode();
	};

	private flattenTests(
		api: string,
		tests: TestObject[],
		context: FlattenContext
	): SqlRule[] {
		const rules: SqlRule[] = [];
		for (const test of tests) {
			const result = this.processTestObject(api, test, context);
			if (Array.isArray(result)) {
				rules.push(...result);
			} else {
				rules.push(result);
			}
		}
		return rules;
	}

	private processTestObject(
		api: string,
		test: TestObject,
		context: FlattenContext
	): SqlRule | SqlRule[] {
		const scopePath = test[TestObjectSyntax.Scope] ?? "$";

		const variables = this.extractVariables(test);
		const hasSkip = typeof test[TestObjectSyntax.Continue] === "string";

		if (Array.isArray(test[TestObjectSyntax.Return])) {
			if (scopePath !== "$") {
				throw new Error(
					`Nested validations with custom _SCOPE_ are not supported for SQL generation. Found in test ${test[TestObjectSyntax.Name]}`
				);
			}
			const skipExpression = hasSkip
				? compileInputToSql(
						test[TestObjectSyntax.Continue] as string,
						this.buildVariableLookup(variables, false, "doc")
				  )
				: undefined;
			const childContext: FlattenContext = {
				skipPredicates: skipExpression
					? [...context.skipPredicates, skipExpression]
					: [...context.skipPredicates],
			};
			const children = test[TestObjectSyntax.Return] as TestObject[];
			return this.flattenTests(api, children, childContext);
		}

		const skipExpression = hasSkip
			? compileInputToSql(
					test[TestObjectSyntax.Continue] as string,
					this.buildVariableLookup(variables, false, "test_obj")
			  )
			: undefined;

		const variableDefinitions = this.buildVariableDefinitions(variables);

		const condition = compileInputToSql(
			test[TestObjectSyntax.Return] as string,
			this.buildVariableLookup(variables, true, "test_obj")
		);

		const gatePredicates = [...context.skipPredicates];
		if (skipExpression) {
			gatePredicates.push(skipExpression);
		}

		const gateExpression =
			gatePredicates.length === 0
				? "TRUE"
				: `NOT COALESCE((${gatePredicates
						.map((expr) => `(${expr})`)
						.join(" OR ")}), FALSE)`;

		const errorCode =
			typeof test[TestObjectSyntax.ErrorCode] === "number"
				? test[TestObjectSyntax.ErrorCode]
				: 30000;

		const successCode =
			typeof test[TestObjectSyntax.SuccessCode] === "number"
				? test[TestObjectSyntax.SuccessCode]
				: 200;

		return {
			api,
			name: test[TestObjectSyntax.Name],
			errorCode,
			successCode,
			condition,
			gateExpression,
			scopeArrayExpression: this.buildScopeArrayExpression(scopePath),
			variables: variableDefinitions,
			scopeCteName: this.sanitizedIdentifier(test[TestObjectSyntax.Name], "scope"),
			varsCteName: this.sanitizedIdentifier(test[TestObjectSyntax.Name], "vars"),
		};
	}

	private extractVariables(test: TestObject) {
		const variables: { name: string; value: ConfigVariable }[] = [];
		for (const key of Object.keys(test)) {
			if (Object.values(TestObjectSyntax).includes(key as TestObjectSyntax)) {
				continue;
			}
			variables.push({
				name: key,
				value: test[key] as ConfigVariable,
			});
		}
		return variables;
	}

	private buildVariableDefinitions(
		variables: { name: string; value: ConfigVariable }[]
	): VariableDefinition[] {
		const vars: VariableDefinition[] = [];
		for (const variable of variables) {
			vars.push({
				name: variable.name,
				expression: this.buildVariableExpression(variable.value, "test_obj"),
			});
		}
		return vars;
	}

	private buildVariableLookup(
		variables: { name: string; value: ConfigVariable }[],
		useColumnReference: boolean,
		baseRef: "test_obj" | "doc"
	): Record<string, string> {
		const lookup: Record<string, string> = {};
		for (const variable of variables) {
			lookup[variable.name] = useColumnReference
				? variable.name
				: this.buildVariableExpression(variable.value, baseRef);
		}
		return lookup;
	}

	private buildScopeArrayExpression(scopePath: string): string {
		if (!scopePath || scopePath === "$") {
			return "ARRAY[doc]";
		}
		const escapedPath = scopePath.replace(/'/g, "''");
		return `COALESCE(
    CAST(json_extract(doc, '${escapedPath}') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)`;
	}

	private buildVariableExpression(
		value: ConfigVariable | undefined,
		baseRef: "test_obj" | "doc"
	): string {
		if (Array.isArray(value)) {
			return this.constantArrayExpression(value);
		}

		if (typeof value === "string") {
			const isExternal = value.startsWith("$.") && value.includes("._EXTERNAL.");
			const sourceRef = isExternal
				? "external_doc"
				: baseRef;
			const effectiveSource = sourceRef;
			const path = value.replace(/'/g, "''");
			const rawExpr = `json_extract(${effectiveSource}, '${path}')`;
			const scalarExpr = `json_extract_scalar(${effectiveSource}, '${path}')`;
			return `(CASE
    WHEN ${rawExpr} IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(${rawExpr}) = 'array' THEN
        CASE
            WHEN json_array_length(${rawExpr}) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(${rawExpr}) - 1),
                idx -> json_extract_scalar(${rawExpr}, format('$[%d]', idx))
            )
        END
    ELSE ARRAY[${scalarExpr}]
END)`;
		}

		return "CAST(ARRAY[] AS ARRAY(VARCHAR))";
	}

	private constantArrayExpression(values: ConfigVariable): string {
		const formatted = (values as unknown[]).map((value) => {
			if (value === null) return "'null'";
			if (typeof value === "string") {
				return `'${value.replace(/'/g, "''")}'`;
			}
			return `'${String(value)}'`;
		});
		if (formatted.length === 0) {
			return "CAST(ARRAY[] AS ARRAY(VARCHAR))";
		}
		return `ARRAY[${formatted.join(", ")}]`;
	}

	private buildAthenaScript(api: string, rules: SqlRule[]): string {
		if (rules.length === 0) {
			return `-- No validations defined for action: ${api}`;
		}

		const cteParts: string[] = [];
		const violationParts: string[] = [];

		for (const rule of rules) {
			cteParts.push(`${rule.scopeCteName} AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(${rule.scopeArrayExpression}) AS scope(scope_item)
)`);

			const variableProjection =
				rule.variables.length > 0
					? rule.variables
							.map(
								(variable) =>
									`        ${variable.expression} AS ${variable.name}`
							)
							.join(",\n")
					: "";

			cteParts.push(
				`${rule.varsCteName} AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj${
			variableProjection ? `,\n${variableProjection}` : ""
		}
    FROM ${rule.scopeCteName}
)`
			);

			violationParts.push(`SELECT
    '${api}' AS api,
    '${rule.name}' AS rule_name,
    ${rule.errorCode} AS error_code,
    ${rule.successCode} AS success_code,
    payload
FROM ${rule.varsCteName}
WHERE ${rule.gateExpression} AND NOT (${rule.condition})`);
		}

		return `-- Auto-generated Athena SQL validation rules for action: ${api}
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = '${api}'
),
${cteParts.join(",\n")}
, violations AS (
${violationParts.join("\nUNION ALL\n")}
)
SELECT * FROM violations;`;
	}

	private sanitizedIdentifier(name: string, suffix: string): string {
		const base = name
			.toLowerCase()
			.replace(/[^a-z0-9]+/g, "_")
			.replace(/^_+|_+$/g, "");
		const sanitized = base.length === 0 ? "rule" : base;
		return `${sanitized}_${suffix}`;
	}
}

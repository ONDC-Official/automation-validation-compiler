import { readFileSync } from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import Mustache from "mustache";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";
import { getVariablesFromTest as extractVariablesFromText } from "../../../utils/general-utils/test-object-utils.js";
import { ConfigVariable, TestObject } from "../../../types/config-types.js";
import { compileInputToPy } from "./py-ast.js";
import {
	CodeGenerator,
	CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeAndFormatCode } from "../../../utils/fs-utils.js";
import { ErrorDefinition } from "../../../types/error-codes.js";
import { MarkdownDocGenerator } from "../documentation/md-generator.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class PythonGenerator extends CodeGenerator {
	generateSessionDataCode = async () => {
		throw new Error("Method not implemented.");
	};

	generateValidationCode = async () => {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];
		for (const key in testConfig) {
			const testObjects = testConfig[key];
			const betaConfig = {
				[TestObjectSyntax.Name]: key + "_validations",
				[TestObjectSyntax.Return]: testObjects,
			};
			const testFunction = await this.generateTestFunction(betaConfig);
			const apiTestTemplate = readFileSync(
				path.resolve(__dirname, "./templates/api-test.mustache"),
				"utf-8"
			);
			const finalCode = Mustache.render(apiTestTemplate, {
				functionCode: testFunction.code,
				apiName: key,
			});
			await writeAndFormatCode(
				this.rootPath,
				`./api_tests/${key}.py`,
				finalCode,
				"python"
			);
		}
	};

	generateCode = async (codeConfig: CodeGeneratorProps) => {
		const jsonPathUtilsCode = readFileSync(
			path.resolve(__dirname, "./templates/json-path-utils.mustache"),
			"utf-8"
		);
		const validationUtils = readFileSync(
			path.resolve(__dirname, "./templates/validation-utils.mustache"),
			"utf-8"
		);
		const typesTemplate = readFileSync(
			path.resolve(__dirname, "./templates/test-config.mustache"),
			"utf-8"
		);
		const normalizerTemplate = readFileSync(
			path.resolve(__dirname, "./templates/json-normalizer.mustache"),
			"utf-8"
		);
		const apiTestsInitTemplate = readFileSync(
			path.resolve(__dirname, "./templates/api-tests-init.mustache"),
			"utf-8"
		);

		const requirementsTemplate = readFileSync(
			path.resolve(__dirname, "./templates/requirements.mustache"),
			"utf-8"
		);

		const typesCode = Mustache.render(typesTemplate, {
			externalData: this.getExternalKeys(),
		});

		const requirements = Mustache.render(requirementsTemplate, {});

		const apiNames = Object.keys(this.validationConfig[ConfigSyntax.Tests]);
		const apiTestsInitCode = Mustache.render(apiTestsInitTemplate, {
			apis: apiNames.map((name) => ({ name })),
		});

		await writeAndFormatCode(
			this.rootPath,
			"./utils/json_path_utils.py",
			jsonPathUtilsCode,
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./utils/json_normalizer.py",
			normalizerTemplate,
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./utils/validation_utils.py",
			validationUtils,
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./utils/__init__.py",
			"# Utils package",
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./types/test_config.py",
			typesCode,
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./types/__init__.py",
			"# Types package",
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./api_tests/__init__.py",
			apiTestsInitCode,
			"python"
		);

		await this.generateValidationCode();

		await writeAndFormatCode(
			this.rootPath,
			"requirements.txt",
			requirements,
			"text"
		);

		await writeAndFormatCode(
			this.rootPath,
			"error.py",
			this.generateErrorFile(this.errorCodes),
			"python"
		);
		await writeAndFormatCode(
			this.rootPath,
			"__init__.py",
			this.generateIndexFile(apiNames, codeConfig.codeName),
			"python"
		);
		await new MarkdownDocGenerator(
			this.validationConfig,
			this.errorCodes,
			this.rootPath
		).generateCode();
	};

	generateTestFunction = async (testObject: TestObject) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/test-object.mustache"),
			"utf-8"
		);

		const view: mustachRequirements = {
			name: testObject[TestObjectSyntax.Name],
			scopePath: testObject[TestObjectSyntax.Scope] ?? "$",
			variables: this.createVariablesCode(testObject),
			hasContinue: testObject[TestObjectSyntax.Continue] ? true : false,
			skipCheckStatement: testObject[TestObjectSyntax.Continue]
				? compileInputToPy(testObject[TestObjectSyntax.Continue])
				: undefined,
			validationCode: await this.createValidationLogicCode(testObject),
			successCode: testObject[TestObjectSyntax.SuccessCode] ?? 200,
			testName: testObject[TestObjectSyntax.Name],
			errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
			TEST_OBJECT: `${JSON.stringify(testObject)}`,
		};
		return {
			funcName: testObject[TestObjectSyntax.Name],
			code: Mustache.render(template, view),
		};
	};

	private CreateErrorMarkdown(
		testObject: TestObject,
		skipList: string[] | undefined
	) {
		return markdownMessageGenerator(
			testObject[TestObjectSyntax.Return] as string,
			testObject,
			testObject[TestObjectSyntax.Name],
			skipList
		);
	}

	private createVariablesCode(testObject: TestObject) {
		const variables: { name: string; value: string }[] = [];
		const varNames = extractVariablesFromText(testObject);
		for (const name of varNames) {
			const value = testObject[name] as ConfigVariable;
			const final =
				typeof value === "string"
					? `payload_utils["get_json_path"](${testObject[TestObjectSyntax.Name]}_obj, "${value}")`
					: this.convertArrayToStringPython(value);
			variables.push({
				name: name,
				value: final,
			});
		}
		return variables;
	}

	private convertArrayToStringPython(value: any[]): string {
		// Convert TypeScript array notation to Python list notation
		let stringified = JSON.stringify(value);
		stringified = stringified.replace(/\\\\\\/g, "\\");
		// Replace null with None, true with True, false with False
		return stringified
			.replace(/null/g, "None")
			.replace(/true/g, "True")
			.replace(/false/g, "False");
	}

	private indentCode(code: string, indentLevel: number = 1): string {
		const indent = "    ".repeat(indentLevel);
		return code
			.split("\n")
			.map((line) => (line.trim() ? indent + line : line))
			.join("\n");
	}

	private createValidationLogicCode = async (testObject: TestObject) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/validation-code.mustache"),
			"utf-8"
		);
		const skip = testObject[TestObjectSyntax.Continue];
		const skipList = skip ? [skip] : undefined;
		if (typeof testObject[TestObjectSyntax.Return] === "string") {
			const returnStatement = compileInputToPy(
				testObject[TestObjectSyntax.Return]
			);
			return Mustache.render(template, {
				isNested: false,
				returnStatement: returnStatement,
				errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
				errorDescription: this.CreateErrorMarkdown(testObject, skipList),
				testName: testObject[TestObjectSyntax.Name],
				TEST_OBJECT: `${JSON.stringify(testObject)}`,
			});
		} else {
			const subObjects = testObject[TestObjectSyntax.Return];
			const functionCodes: {
				funcName: string;
				code: string;
			}[] = [];
			for (const subObject of subObjects) {
				const func = await this.generateTestFunction(subObject);
				functionCodes.push(func);
			}
			const names = functionCodes.map((f) => {
				return { name: f.funcName };
			});

			// Properly indent nested functions
			const indentedNestedFunctions = functionCodes
				.map((f) => this.indentCode(f.code, 2))
				.join("\n\n");

			return Mustache.render(template, {
				isNested: true,
				nestedFunctions: indentedNestedFunctions,
				names: names,
				errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
				TEST_OBJECT: `${JSON.stringify(testObject)}`,
			});
		}
	};

	private generateErrorFile(errors: ErrorDefinition[]): string {
		const allCodes = errors.map((error) => error.code);
		if (allCodes.length !== new Set(allCodes).size) {
			throw new Error("Duplicate error codes found");
		}
		errors.push({
			code: 20006,
			Description: "Invalid response does not meet API contract specifications",
		});
		errors.push({
			code: 30000,
			Description: "Invalid request does not meet API contract specifications",
		});

		const errorsList = errors
			.map(
				(error) =>
					`    {"code": ${error.code}, "message": "${error.Description}"}`
			)
			.join(",\n");

		const errorConstant = `
errors = [
${errorsList}
]
		`;
		const errorFunction = `def get_error(code):
    for error in errors:
        if error["code"] == code:
            return error
    raise Exception(f"Error code {code} not found")`;
		return `${errorConstant}\n${errorFunction}`;
	}

	private getExternalKeys() {
		const apis = Object.keys(this.validationConfig[ConfigSyntax.SessionData]);
		const result: { name: string }[] = [];
		for (const api of apis) {
			const keys = Object.keys(
				this.validationConfig[ConfigSyntax.SessionData][api]
			);
			for (const key of keys) {
				result.push({ name: key });
			}
		}
		return result;
	}

	private generateIndexFile(
		apis: string[],
		functionName: string = "L1Validations"
	) {
		// Clean function name for Python
		functionName = functionName.replace(/[^a-zA-Z0-9_]/g, "");

		let importsCode = apis
			.map((api) => `from .api_tests import ${api}`)
			.join("\n");
		importsCode += `\nfrom .types.test_config import ValidationConfig\n`;
		const masterDoc = readFileSync(
			path.resolve(__dirname, "./templates/master-doc.mustache"),
			"utf-8"
		);
		const masterFunction = `
def perform_${functionName.toLowerCase()}(action, payload,config: ValidationConfig = None, external_data=None):
    ${masterDoc}

    if external_data is None:
        external_data = {}
    
    from .utils.json_normalizer import normalize_keys
    normalized_payload = normalize_keys(payload.copy())
    external_data["_SELF"] = normalized_payload
    default_config = {
        "only_invalid": True,
        "standard_logs": False,
        "_debug": False,
        "hide_parent_errors": True,
    }
    # Merge user config with default config
    if config is None:
        config = default_config
    else:
        config = {**default_config, **config}

    input_data = {
        "payload": normalized_payload,
        "external_data": external_data,
        "config": config,
    }
    
    if action == "${apis[0]}":
        return ${apis[0]}(input_data)
${apis
	.slice(1)
	.map(
		(api) => `    elif action == "${api}":
        return ${api}(input_data)`
	)
	.join("\n")}
    else:
        raise Exception("Action not found")
		`;

		return `${importsCode}\n${masterFunction}`;
	}
}

interface mustachRequirements {
	name: string;
	scopePath: string;
	variables: {
		name: string;
		value: string;
	}[];
	hasContinue: boolean;
	skipCheckStatement?: string;
	validationCode: string;
	successCode: number;
	testName: string;
	TEST_OBJECT: string;
	errorCode: number;
}

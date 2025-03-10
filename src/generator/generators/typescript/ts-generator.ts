import { readFileSync } from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import Mustache from "mustache";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";
import { getVariablesFromTest as extractVariablesFromText } from "../../../utils/general-utils/test-object-utils.js";
import { ConfigVariable, TestObject } from "../../../types/config-types.js";
import { ConvertArrayToString } from "../../../utils/general-utils/string-utils.js";
import { compileInputToTs } from "./ts-ast.js";
import {
	CodeGenerator,
	CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeAndFormatCode } from "../../../utils/fs-utils.js";
import { ErrorDefinition } from "../../../types/error-codes.js";
import { MarkdownDocGenerator } from "../documentation/md-generator.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class TypescriptGenerator extends CodeGenerator {
	generateSessionDataCode = async () => {
		throw new Error("Method not implemented.");
	};
	generateValidationCode = async () => {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];
		for (const key in testConfig) {
			const testObjects = testConfig[key];
			const betaConfig = {
				[TestObjectSyntax.Name]: key,
				[TestObjectSyntax.Return]: testObjects,
			};
			const testFunction = await this.generateTestFunction(betaConfig);
			const apiTestTemplate = readFileSync(
				path.resolve(__dirname, "./templates/api-test.mustache"),
				"utf-8"
			);
			const finalCode = Mustache.render(apiTestTemplate, {
				functionCode: testFunction.code,
			});
			await writeAndFormatCode(
				this.rootPath,
				`./api-tests/${key}.ts`,
				finalCode,
				"typescript"
			);
		}
	};
	generateCode = async (codeConfig: CodeGeneratorProps) => {
		const jsonPathUtilsCode = readFileSync(
			path.resolve(__dirname, "./templates/json-path-utils.mustache"),
			"utf-8"
		);
		const validtionUtils = readFileSync(
			path.resolve(__dirname, "./templates/validation-utils.mustache"),
			"utf-8"
		);
		const typesTemplate = readFileSync(
			path.resolve(__dirname, "./templates/test-config.mustache"),
			"utf-8"
		);

		const typesCode = Mustache.render(typesTemplate, {
			externalData: this.getExternalKeys(),
		});
		writeAndFormatCode(
			this.rootPath,
			"./utils/json-path-utils.ts",
			jsonPathUtilsCode,
			"typescript"
		);
		writeAndFormatCode(
			this.rootPath,
			"./utils/validation-utils.ts",
			validtionUtils,
			"typescript"
		);
		writeAndFormatCode(
			this.rootPath,
			"./types/test-config.ts",
			typesCode,
			"typescript"
		);
		await this.generateValidationCode();
		await writeAndFormatCode(
			this.rootPath,
			"error.ts",
			this.generateErrorFile(this.errorCodes),
			"typescript"
		);
		await writeAndFormatCode(
			this.rootPath,
			"index.ts",
			this.generateIndexFile(
				Object.keys(this.validationConfig[ConfigSyntax.Tests]),
				codeConfig.codeName
			),
			"typescript"
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
				? compileInputToTs(testObject[TestObjectSyntax.Continue])
				: undefined,
			validationCode: await this.createValidationLogicCode(testObject),
			successCode: testObject[TestObjectSyntax.SuccessCode] ?? 200,
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
					? `payloadUtils.getJsonPath(testObj, "${value}")`
					: ConvertArrayToString(value);
			variables.push({
				name: name,
				value: final,
			});
		}
		return variables;
	}

	private createValidationLogicCode = async (testObject: TestObject) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/validation-code.mustache"),
			"utf-8"
		);
		const skip = testObject[TestObjectSyntax.Continue];
		const skipList = skip ? [skip] : undefined;
		if (typeof testObject[TestObjectSyntax.Return] === "string") {
			const returnStatement = compileInputToTs(
				testObject[TestObjectSyntax.Return]
			);
			return Mustache.render(template, {
				isNested: false,
				returnStatement: returnStatement,
				errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
				errorDescription: this.CreateErrorMarkdown(testObject, skipList),
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
			return Mustache.render(template, {
				isNested: true,
				nestedFunctions: functionCodes.map((f) => f.code).join("\n"),
				names: names,
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
		const errorConstant = `
	const errors = [
		${errors.map((error) => `{code: ${error.code}, message: "${error.Description}"}`).join(",\n")}
	];
		`;
		const errorFunction = `export function getError(code: number) {
		const error = errors.find((error) => error.code === code);
		if (!error) {
			throw new Error(\`Error code \${code} not found\`);
		}
		return error;
		}`;
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
		functionName = functionName.replace(/[^a-zA-Z0-9_]/g, "");
		const importsCode = apis
			.map((api) => `import ${api} from "./api-tests/${api}";`)
			.join("\n");
		const masterFunction = `
				export function perform${functionName}(action: string, payload: any,allErrors = false, externalData = {}) {
					switch (action) {
						${apis
							.map(
								(api) => `case "${api}": return ${api}({
				payload: payload,
				externalData: externalData,
				config: {
					runAllValidations: allErrors,
				},
			});`
							)
							.join("\n")}
						default:
							throw new Error("Action not found");
					}
			}`;
		return `
				${importsCode}
				${masterFunction}
			`;
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
}

import { readFileSync } from "fs";
import path from "path";
import { fileURLToPath } from "url";
import {
	ConfigSyntax,
	ExternalDataSyntax,
	TestObjectSyntax,
} from "../../../constants/syntax.js";
import Mustache from "mustache";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";
import { getVariablesFromTest as extractVariablesFromText } from "../../../utils/general-utils/test-object-utils.js";
import { ConfigVariable, TestObject } from "../../../types/config-types.js";
import { compileInputToGo } from "./go-ast.js";
import {
	CodeGenerator,
	CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeAndFormatCode } from "../../../utils/fs-utils.js";
import { ErrorDefinition } from "../../../types/error-codes.js";
import { MarkdownDocGenerator } from "../documentation/md-generator.js";
import { collectLoadData } from "../../../utils/config-utils/load-variables.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class GolangGenerator extends CodeGenerator {
	codeConfig: CodeGeneratorProps | undefined;

	generateSessionDataCode = async () => {
		if (!this.codeConfig) {
			throw new Error("Code config not set. Please call generateCode first.");
		}
		const sessionData = this.validationConfig[ConfigSyntax.SessionData];
		const tests = this.validationConfig[ConfigSyntax.Tests];

		const relevantSessionData: Record<string, Record<string, string>> = {};
		collectLoadData(tests, relevantSessionData);
		console.log("Relevant Session Data for Loading:", relevantSessionData);

		// Load storage templates
		const storageInterfaceTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/storage-interface.mustache"
			),
			"utf-8"
		);
		const storageTypesTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/storage-types.mustache"
			),
			"utf-8"
		);
		const saveUtilsTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/save-utils.mustache"
			),
			"utf-8"
		);
		const storageHelpersTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/storage-helpers.mustache"
			),
			"utf-8"
		);
		const indexTemplate = readFileSync(
			path.resolve(__dirname, "./templates/storage-templates/index.mustache"),
			"utf-8"
		);
		const apiSaveTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/api-save.mustache"
			),
			"utf-8"
		);

		const allActions = Object.keys(tests);

		// Helper to capitalize and sanitize function names
		const capitalize = (name: string) =>
			name.charAt(0).toUpperCase() + name.slice(1);
		const sanitizeName = (name: string) => name.replace(/[^a-zA-Z0-9_]/g, "");

		// Generate index code with all actions
		const indexCode = Mustache.render(indexTemplate, {
			actions: allActions.map((action) => ({ action })),
			functionName: capitalize(sanitizeName(this.codeConfig.codeName)),
		});

		// Generate individual action storage files
		for (const action of allActions) {
			const loadData = relevantSessionData[action] || {};
			const saveData = sessionData[action] || {};

			const saveCode = Mustache.render(apiSaveTemplate, {
				storeActions: Object.keys(saveData).map((key) => ({
					key: key,
					value: saveData[key],
				})),
				loadActions: Object.keys(loadData).map((key) => ({
					key: loadData[key],
				})),
				action: action,
			});

			await writeAndFormatCode(
				this.rootPath,
				`./storageactions/${action}.go`,
				saveCode,
				"go"
			);
		}

		// Write common storage files
		await writeAndFormatCode(
			this.rootPath,
			"./utils/save_utils.go",
			saveUtilsTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./types/storage_types.go",
			storageTypesTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./interfaces/storage_interface.go",
			storageInterfaceTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./storageactions/helpers.go",
			storageHelpersTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./storageactions/index.go",
			indexCode,
			"go"
		);
	};

	generateValidationCode = async () => {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];

		// Helper to avoid Go reserved keywords
		const goSafeName = (name: string) => {
			const reserved = [
				"break",
				"case",
				"chan",
				"const",
				"continue",
				"default",
				"defer",
				"else",
				"fallthrough",
				"for",
				"func",
				"go",
				"goto",
				"if",
				"import",
				"init",
				"interface",
				"map",
				"package",
				"range",
				"return",
				"select",
				"struct",
				"switch",
				"type",
				"var",
			];
			return reserved.includes(name) ? `${name}Action` : name;
		};

		// Helper to capitalize first letter for exported functions
		const capitalize = (name: string) =>
			name.charAt(0).toUpperCase() + name.slice(1);

		for (const key in testConfig) {
			const testObjects = testConfig[key];
			const safeName = capitalize(goSafeName(key));
			const betaConfig = {
				[TestObjectSyntax.Name]: safeName + "Validations",
				[TestObjectSyntax.Return]: testObjects,
			};

			// Collect all functions (main + nested) with API prefix and deduplication
			const functionNameMap = new Map<string, number>(); // Track function names to handle duplicates
			const allFunctions = await this.collectAllFunctions(
				betaConfig,
				safeName,
				functionNameMap
			);

			const apiTestTemplate = readFileSync(
				path.resolve(__dirname, "./templates/api-test.mustache"),
				"utf-8"
			);
			const finalCode = Mustache.render(apiTestTemplate, {
				functionCode: allFunctions.map((f) => f.code).join("\n\n"),
				apiName: safeName,
			});
			await writeAndFormatCode(
				this.rootPath,
				`./apitests/${key}.go`,
				finalCode,
				"go"
			);
		}
	};

	// Helper to recursively collect all nested functions
	private async collectAllFunctions(
		testObject: TestObject,
		apiPrefix: string,
		functionNameMap: Map<string, number>
	): Promise<{ funcName: string; code: string }[]> {
		const result: { funcName: string; code: string }[] = [];

		// First pass: pre-calculate all function names to build the map
		this.preCalculateFunctionNames(testObject, apiPrefix, functionNameMap);

		// Second pass: generate the actual code with correct function references
		const mainFunc = await this.generateTestFunction(
			testObject,
			apiPrefix,
			functionNameMap
		);
		result.push(mainFunc);

		// If it has nested functions, collect them recursively
		if (Array.isArray(testObject[TestObjectSyntax.Return])) {
			for (const subObject of testObject[TestObjectSyntax.Return]) {
				const nestedFuncs = await this.collectAllFunctionsInner(
					subObject,
					apiPrefix,
					functionNameMap
				);
				result.push(...nestedFuncs);
			}
		}

		return result;
	}

	// Helper to pre-calculate function names
	private preCalculateFunctionNames(
		testObject: TestObject,
		apiPrefix: string,
		functionNameMap: Map<string, number>
	): void {
		const baseName = apiPrefix
			? `${apiPrefix}_${testObject[TestObjectSyntax.Name]}`
			: testObject[TestObjectSyntax.Name];
		const count = functionNameMap.get(baseName) || 0;
		functionNameMap.set(baseName, count + 1);

		// Recursively pre-calculate nested function names
		if (Array.isArray(testObject[TestObjectSyntax.Return])) {
			for (const subObject of testObject[TestObjectSyntax.Return]) {
				this.preCalculateFunctionNames(subObject, apiPrefix, functionNameMap);
			}
		}
	}

	// Inner helper that doesn't pre-calculate (used after first pass)
	private async collectAllFunctionsInner(
		testObject: TestObject,
		apiPrefix: string,
		functionNameMap: Map<string, number>
	): Promise<{ funcName: string; code: string }[]> {
		const result: { funcName: string; code: string }[] = [];

		const mainFunc = await this.generateTestFunction(
			testObject,
			apiPrefix,
			functionNameMap,
			true
		);
		result.push(mainFunc);

		if (Array.isArray(testObject[TestObjectSyntax.Return])) {
			for (const subObject of testObject[TestObjectSyntax.Return]) {
				const nestedFuncs = await this.collectAllFunctionsInner(
					subObject,
					apiPrefix,
					functionNameMap
				);
				result.push(...nestedFuncs);
			}
		}

		return result;
	}

	generateCode = async (codeConfig: CodeGeneratorProps) => {
		this.codeConfig = codeConfig;
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

		const typesCode = Mustache.render(typesTemplate, {
			externalData: this.getExternalKeys(),
		});

		await writeAndFormatCode(
			this.rootPath,
			"./utils/json_path_utils.go",
			jsonPathUtilsCode,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./utils/json_normalizer.go",
			normalizerTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./utils/validation_utils.go",
			validationUtils,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"./types/test_config.go",
			typesCode,
			"go"
		);

		await this.generateValidationCode();

		await writeAndFormatCode(
			this.rootPath,
			"error.go",
			this.generateErrorFile(this.errorCodes),
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			"main.go",
			this.generateMainFile(
				Object.keys(this.validationConfig[ConfigSyntax.Tests]),
				codeConfig.codeName
			),
			"go"
		);

		await writeAndFormatCode(
			this.rootPath,
			"go.mod",
			this.generateGoMod(codeConfig.codeName),
			"text"
		);

		await new MarkdownDocGenerator(
			this.validationConfig,
			this.errorCodes,
			this.rootPath
		).generateCode();
		await this.generateSessionDataCode();
	};

	generateTestFunction = async (
		testObject: TestObject,
		apiPrefix: string = "",
		functionNameMap?: Map<string, number>,
		isInnerPass: boolean = false
	) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/test-object.mustache"),
			"utf-8"
		);

		// Calculate function name with API prefix
		const baseName = apiPrefix
			? `${apiPrefix}_${testObject[TestObjectSyntax.Name]}`
			: testObject[TestObjectSyntax.Name];

		let funcName = baseName;
		// Handle duplicates by adding a counter suffix
		if (functionNameMap) {
			const usageKey = `${baseName}_usage`;
			const usageCount = functionNameMap.get(usageKey) || 0;
			functionNameMap.set(usageKey, usageCount + 1);

			const totalCount = functionNameMap.get(baseName) || 1;
			if (totalCount > 1) {
				// Always add suffix if there are duplicates: _1, _2, _3, etc.
				funcName = `${baseName}_${usageCount + 1}`;
			}
		}

		const view: MustacheRequirements = {
			name: funcName,
			scopePath: testObject[TestObjectSyntax.Scope] ?? "$",
			variables: this.createVariablesCode(testObject),
			hasContinue: testObject[TestObjectSyntax.Continue] ? true : false,
			skipCheckStatement: testObject[TestObjectSyntax.Continue]
				? compileInputToGo(testObject[TestObjectSyntax.Continue])
				: undefined,
			validationCode: await this.createValidationLogicCode(
				testObject,
				apiPrefix,
				functionNameMap,
				isInnerPass
			),
			successCode: testObject[TestObjectSyntax.SuccessCode] ?? 200,
			errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
			testName: testObject[TestObjectSyntax.Name],
			TEST_OBJECT: `${JSON.stringify(testObject)}`,
		};
		return {
			funcName: funcName,
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
		const variables: { name: string; value: string; isAssignment: boolean }[] =
			[];
		const varNames = extractVariablesFromText(testObject);

		for (const name of varNames) {
			const value = testObject[name] as ConfigVariable;
			const final =
				typeof value === "string"
					? `utils.GetJSONPath(testObj, "${value}")`
					: this.convertArrayToInterfaceGo(value);

			variables.push({
				name: name,
				value: final,
				isAssignment: false,
			});
		}

		// Add _ = variable for unused variables to avoid Go compile errors
		const returnStatement = testObject[TestObjectSyntax.Return];
		if (typeof returnStatement === "string") {
			for (const name of varNames) {
				if (!returnStatement.includes(name)) {
					variables.push({
						name: "_",
						value: name,
						isAssignment: true,
					});
				}
			}
		}

		return variables;
	}

	private convertArrayToInterfaceGo(value: any[]): string {
		// Convert TypeScript array notation to Go slice notation for []interface{}
		const elements = value.map((v) => {
			if (typeof v === "string") {
				// Use raw string literal for strings with backslashes (likely regex)
				if (v.includes("\\")) {
					return "`" + v + "`";
				}
				return `"${v}"`;
			}
			if (v === null) return "nil";
			if (typeof v === "boolean") return v ? "true" : "false";
			if (typeof v === "number") return v.toString();
			return JSON.stringify(v);
		});
		return `[]interface{}{${elements.join(", ")}}`;
	}

	private createValidationLogicCode = async (
		testObject: TestObject,
		apiPrefix: string = "",
		functionNameMap?: Map<string, number>,
		isInnerPass: boolean = false
	) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/validation-code.mustache"),
			"utf-8"
		);
		const skip = testObject[TestObjectSyntax.Continue];
		const skipList = skip ? [skip] : undefined;

		if (typeof testObject[TestObjectSyntax.Return] === "string") {
			const returnStatement = compileInputToGo(
				testObject[TestObjectSyntax.Return]
			);

			// Check if this is a stateful validation
			let isStateFull = false;
			for (const k in testObject) {
				const value = testObject[k];
				if (typeof value === "string") {
					if (
						value.includes(`${ExternalDataSyntax}.`) &&
						!value.includes("_SELF")
					) {
						isStateFull = true;
						break;
					}
				}
			}

			return Mustache.render(template, {
				isNested: false,
				isStateFull: isStateFull,
				returnStatement: returnStatement,
				errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
				errorDescription: this.CreateErrorMarkdown(testObject, skipList),
				testName: testObject[TestObjectSyntax.Name],
				TEST_OBJECT: `${JSON.stringify(testObject)}`,
			});
		} else {
			const subObjects = testObject[TestObjectSyntax.Return];
			// For nested functions in Go, calculate the correct function names to match definitions
			const names = subObjects.map((subObj: TestObject) => {
				const baseName = apiPrefix
					? `${apiPrefix}_${subObj[TestObjectSyntax.Name]}`
					: subObj[TestObjectSyntax.Name];

				let funcName = baseName;
				if (functionNameMap) {
					const callKey = `${baseName}_calls`;
					const currentCalls = functionNameMap.get(callKey) || 0;
					functionNameMap.set(callKey, currentCalls + 1);

					const totalCount = functionNameMap.get(baseName) || 1;
					if (totalCount > 1) {
						// Add suffix to match function definition: _1, _2, _3, etc.
						funcName = `${baseName}_${currentCalls + 1}`;
					}
				}

				return { name: funcName };
			});

			return Mustache.render(template, {
				isNested: true,
				names: names,
				testName: testObject[TestObjectSyntax.Name],
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
			.map((error) => `	{Code: ${error.code}, Message: "${error.Description}"}`)
			.join(",\n");

		return `package validations

import "fmt"

type Error struct {
	Code    int
	Message string
}

var errors = []Error{
${errorsList},
}

func GetError(code int) (*Error, error) {
	for _, err := range errors {
		if err.Code == code {
			return &err, nil
		}
	}
	return nil, fmt.Errorf("error code %d not found", code)
}
`;
	}

	private getExternalKeys() {
		const apis = Object.keys(this.validationConfig[ConfigSyntax.SessionData]);
		const result: { name: string }[] = [];
		for (const api of apis) {
			const keys = Object.keys(
				this.validationConfig[ConfigSyntax.SessionData][api]
			);
			for (const key of keys) {
				if (key !== "_SELF") {
					result.push({ name: key });
				}
			}
		}
		return result;
	}

	private generateMainFile(
		apis: string[],
		functionName: string = "L1Validations"
	) {
		functionName = functionName.replace(/[^a-zA-Z0-9_]/g, "");

		// Helper to avoid Go reserved keywords
		const goSafeName = (name: string) => {
			const reserved = [
				"break",
				"case",
				"chan",
				"const",
				"continue",
				"default",
				"defer",
				"else",
				"fallthrough",
				"for",
				"func",
				"go",
				"goto",
				"if",
				"import",
				"init",
				"interface",
				"map",
				"package",
				"range",
				"return",
				"select",
				"struct",
				"switch",
				"type",
				"var",
			];
			const safeName = reserved.includes(name) ? `${name}Action` : name;
			return safeName.charAt(0).toUpperCase() + safeName.slice(1);
		};

		const imports = `package validations

import (
	"fmt"
	"L1_validations/apitests"
	"L1_validations/storageactions"
	"L1_validations/types"
	"L1_validations/utils"
)
`;

		const masterFunction = `
// Perform${functionName} executes validation for the specified action
func Perform${functionName}(action string, payload map[string]interface{}, config *types.ValidationConfig, externalData map[string]interface{}) ([]types.ValidationOutput, error) {
	if config == nil {
		config = &types.ValidationConfig{
			OnlyInvalid:          true,
			StandardLogs:         false,
			HideParentErrors:     true,
			StateFullValidations: false,
			Debug:                false,
		}
	}

	if config.StateFullValidations && config.Store == nil {
		return nil, fmt.Errorf("state full validations require a storage interface to be provided in the config")
	}

	if config.StateFullValidations && config.UniqueKey == "" {
		return nil, fmt.Errorf("state full validations require a unique_key to be provided in the config")
	}

	normalizedPayload := utils.NormalizeKeys(payload).(map[string]interface{})
	
	if externalData == nil {
		externalData = make(map[string]interface{})
	}
	externalData["_SELF"] = normalizedPayload

	// Load stateful data if enabled
	if config.StateFullValidations {
		loadedData, err := storageactions.Perform${functionName}Load(action, config.UniqueKey, config.Store)
		if err == nil && loadedData != nil {
			// Merge loaded data with external data
			for k, v := range loadedData {
				if _, exists := externalData[k]; !exists {
					externalData[k] = v
				}
			}
		}
	}

	input := types.ValidationInput{
		Payload:      normalizedPayload,
		ExternalData: externalData,
		Config:       *config,
	}

	var result []types.ValidationOutput

	switch action {
${apis
	.map(
		(api) => `	case "${api}":
		result = apitests.${goSafeName(api)}(input)`
	)
	.join("\n")}
	default:
		return nil, fmt.Errorf("action not found: %s", action)
	}

	// Save stateful data if enabled
	if config.StateFullValidations {
		if err := storageactions.Perform${functionName}Save(action, config.UniqueKey, normalizedPayload, config.Store, config.StorageConfig); err != nil {
			// Log error but don't fail validation
			if config.Debug {
				fmt.Printf("Warning: Failed to save state: %v\\n", err)
			}
		}
	}

	return result, nil
}
`;

		return imports + masterFunction;
	}

	private generateGoMod(moduleName: string): string {
		moduleName = moduleName.replace(/[^a-zA-Z0-9_-]/g, "");
		return `module ${moduleName}

go 1.21

require (
	github.com/PaesslerAG/jsonpath v0.1.1
)
`;
	}
}

interface MustacheRequirements {
	name: string;
	scopePath: string;
	variables: {
		name: string;
		value: string;
		isAssignment: boolean;
	}[];
	hasContinue: boolean;
	skipCheckStatement?: string;
	validationCode: string;
	successCode: number;
	errorCode: number;
	testName: string;
	TEST_OBJECT: string;
}

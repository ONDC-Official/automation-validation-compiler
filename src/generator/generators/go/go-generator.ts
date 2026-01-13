import { readFileSync } from "fs";
import {
	CodeGenerator,
	CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import path from "path";
import { fileURLToPath } from "url";
import Mustache from "mustache";
import {
	ConfigSyntax,
	ExternalDataSyntax,
	TestObjectSyntax,
} from "../../../constants/syntax.js";
import { writeAndFormatCode } from "../../../utils/fs-utils.js";
import { collectLoadData } from "../../../utils/config-utils/load-variables.js";
import { ConfigVariable, TestObject } from "../../../types/config-types.js";
import { compileInputToGo } from "./go-ast.js";
import { getVariablesFromTest } from "../../../utils/general-utils/test-object-utils.js";
import {
	ConvertArrayToStringGoStyle,
	removeAllSpecialCharacters,
} from "../../../utils/general-utils/string-utils.js";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const packageName = "validationpkg";

export class GoGenerator extends CodeGenerator {
	codeConfig: CodeGeneratorProps | undefined;
	async generateSessionDataCode() {
		if (!this.codeConfig) {
			throw new Error("Code config is not set");
		}
		const sessionData = this.validationConfig[ConfigSyntax.SessionData];
		const tests = this.validationConfig[ConfigSyntax.Tests];

		const relevantSessionData: Record<string, Record<string, string>> = {};
		collectLoadData(tests, relevantSessionData);

		const sessionDataUtilsTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/save-utils.mustache"
			),
			"utf-8"
		);
		const storageInterfaceTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/storage-interface.mustache"
			),
			"utf-8"
		);

		const indexTemplate = readFileSync(
			path.resolve(__dirname, "./templates/storage-templates/index.mustache"),
			"utf-8"
		);
		const saveActionTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/api-save.mustache"
			),
			"utf-8"
		);
		const saveActionUtilsTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/storage-templates/api-save-utils.mustache"
			),
			"utf-8"
		);

		const allActions = Object.keys(tests);
		const indexCode = Mustache.render(indexTemplate, {
			actions: Array.from(allActions).map((action) => {
				return { action: action };
			}),
			functionName: this.codeConfig.codeName.replace(/[^a-zA-Z0-9_]/g, ""),
		});

		for (const action of allActions) {
			const loadData = relevantSessionData[action] || {};
			const saveData = sessionData[action] || {};
			const saveCode = Mustache.render(saveActionTemplate, {
				storeActions: Object.keys(saveData).map((key) => {
					return {
						key: key,
						value: saveData[key],
					};
				}),
				loadActions: Object.keys(loadData).map((key) => {
					console.log(loadData[key]);
					return {
						key: loadData[key],
					};
				}),
				action: action,
			});
			await writeAndFormatCode(
				this.rootPath,
				`./${packageName}/storageutils/${action}.go`,
				saveCode,
				"go"
			);
		}
		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/storageutils/save_utils.go`,
			sessionDataUtilsTemplate,
			"go"
		);

		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/validationutils/storage-interface.go`,
			storageInterfaceTemplate,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/storageutils/index.go`,
			indexCode,
			"go"
		);
		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/storageutils/api_save_utils.go`,
			saveActionUtilsTemplate,
			"go"
		);
	}
	async generateValidationCode() {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];
		for (const key in testConfig) {
			const testObjects = testConfig[key];
			const betaConfig = {
				[TestObjectSyntax.Name]: key + "Validations",
				[TestObjectSyntax.Return]: testObjects,
			};

			const testFunction = await this.generateTestFunction(betaConfig);
			const apiTestTemplate = readFileSync(
				path.resolve(__dirname, "./templates/api-tests.mustache"),
				"utf-8"
			);
			const finalCode = Mustache.render(apiTestTemplate, {
				functionCode: testFunction.code,
				apiName: stringToCaps(key),
			});
			await writeAndFormatCode(
				this.rootPath,
				`./${packageName}/jsonvalidations/${key}.go`,
				finalCode,
				"go"
			);
		}
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

		const goMod = readFileSync(
			path.resolve(__dirname, "./templates/go-mod.mustache"),
			"utf-8"
		);

		const typesCode = Mustache.render(typesTemplate, {
			externalData: this.getExternalKeys(),
		});

		writeAndFormatCode(
			this.rootPath,
			`./${packageName}/validationutils/json_path_utils.go`,
			jsonPathUtilsCode,
			"go"
		);
		writeAndFormatCode(
			this.rootPath,
			`./${packageName}/validationutils/validation_utils.go`,
			validationUtils,
			"go"
		);
		writeAndFormatCode(
			this.rootPath,
			`./${packageName}/validationutils/test-config.go`,
			typesCode,
			"go"
		);
		writeAndFormatCode(
			this.rootPath,
			`./${packageName}/validationutils/json_normalizer.go`,
			normalizerTemplate,
			"go"
		);
		await this.generateValidationCode();
		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/main-validator.go`,
			this.generateIndexFile(
				Object.keys(this.validationConfig[ConfigSyntax.Tests]),
				codeConfig.codeName
			),
			"go"
		);

		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/go.mod`,
			goMod,
			"text"
		);
		await this.generateSessionDataCode();
		await this.generateUnitTestingCode();
	};

	private generateIndexFile(
		apis: string[],
		functionName: string = "L1Validations"
	): string {
		functionName = functionName.replace(/[^a-zA-Z0-9_]/g, "");
		let importList = [
			`"validationpkg/validationutils"`,
			`"validationpkg/jsonvalidations"`,
			`"fmt"`,
			`"encoding/json"`,
			`"validationpkg/storageutils"`,
		];
		const masterTemplate = readFileSync(
			path.resolve(__dirname, "./templates/index.mustache"),
			"utf-8"
		);

		const masterFunction = `func Perform${functionName}(
            action string,
	        payload interface{},
	        config *validationutils.ValidationConfig,
	        externalData validationutils.ExternalData,
            ) ([]validationutils.ValidationOutput, error) {
                completeConfig := getCompleteConfig(config)

                // Validate stateful requirements
	            if completeConfig.StateFullValidations {
                    if completeConfig.Store == nil {
                        return nil, fmt.Errorf("stateful validations require a storage interface to be provided in the config")
                    }
                    if completeConfig.UniqueKey == nil || *completeConfig.UniqueKey == "" {
                        return nil, fmt.Errorf("stateful validations require a uniqueKey to be provided in the config")
                    }
                }
                        
                
                normalizedPayload := validationutils.NormalizeKeys(payload)

                // Set _SELF
	            externalData.Self = normalizedPayload

                // Load stateful data if needed
                if completeConfig.StateFullValidations {
                    loadedData, err := Perform${functionName}Load(action, *completeConfig.UniqueKey, completeConfig.Store)
                    if err != nil {
                        return nil, fmt.Errorf("failed to load stateful data: %w", err)
                    }
                    // Merge loaded data with external data
                    externalData = mergeExternalData(loadedData, externalData)
                }

                // Create validation input
                input := validationutils.ValidationInput {
                    Payload:      normalizedPayload,
                    ExternalData: externalData,
                    Config:       completeConfig,
                }

                // Route to action-specific validation
                switch action {
                ${apis
									.map(
										(api) => `
                case "${api}":
                    return jsonvalidations.${stringToCaps(api)}_Tests(input)
                `
									)
									.join("\n")}
                default:
                    return nil, fmt.Errorf("action not found: %s", action)
                }
            }

            // getCompleteConfig returns a complete config with defaults
func getCompleteConfig(config *validationutils.ValidationConfig) validationutils.ValidationConfig {
	if config == nil {
		return validationutils.ValidationConfig{
			OnlyInvalid:          true,
			HideParentErrors:     true,
			StateFullValidations: false,
			Debug:                false,
		}
	}

	// Return copy with defaults for unset fields
	completeConfig := *config
	// Go doesn't have a clean way to check if bool was explicitly set,
	// so we assume false means "use default true" only if it seems intentional
	// In practice, you might want to use pointers for optional bools
	return completeConfig
}

// mergeExternalData merges loaded data with provided external data
// using JSON marshal/unmarshal for a generic merge strategy.
// Non-null fields in provided override loaded fields.
func mergeExternalData(loaded, provided validationutils.ExternalData) validationutils.ExternalData {
	// Convert to maps
	loadedBytes, _ := json.Marshal(loaded)
	providedBytes, _ := json.Marshal(provided)
	
	var loadedMap, providedMap map[string]interface{}
	json.Unmarshal(loadedBytes, &loadedMap)
	json.Unmarshal(providedBytes, &providedMap)
	
	// Merge provided into loaded
	for key, value := range providedMap {
		if value != nil {
			loadedMap[key] = value
		}
	}
	
	// Convert back
	var result validationutils.ExternalData
	mergedBytes, _ := json.Marshal(loadedMap)
	json.Unmarshal(mergedBytes, &result)
	
	return result
}

var Perform${functionName}Load = storageutils.Perform${functionName}Load
var Perform${functionName}Save = storageutils.Perform${functionName}Save
            `;

		const importCode = `import (
${importList.map((imp) => `\t${imp}`).join("\n")}
            )`;

		return Mustache.render(masterTemplate, {
			importCode: importCode,
			masterFunction: masterFunction,
		});
	}

	private getExternalKeys() {
		const apis = Object.keys(this.validationConfig[ConfigSyntax.SessionData]);
		let result: { name: string }[] = [];
		for (const api of apis) {
			const keys = Object.keys(
				this.validationConfig[ConfigSyntax.SessionData][api]
			);
			for (const key of keys) {
				result.push({ name: key });
			}
		}
		result = result.filter((v) => v.name !== "_SELF");
		return result;
	}

	private generateTestFunction = async (testObject: TestObject) => {
		const template = readFileSync(
			path.resolve(__dirname, "./templates/test-object.mustache"),
			"utf-8"
		);

		const view: mustachRequirements = {
			name: stringToCaps(testObject[TestObjectSyntax.Name]),
			scopePath: testObject[TestObjectSyntax.Scope] ?? "$",
			variables: this.createVariablesCode(testObject),
			hasContinue: testObject[TestObjectSyntax.Continue] ? true : false,
			skipCheckStatement: testObject[TestObjectSyntax.Continue]
				? compileInputToGo(testObject[TestObjectSyntax.Continue])
				: undefined,
			validationCode: await this.createValidationLogicCode(testObject),
			successCode: testObject[TestObjectSyntax.SuccessCode] ?? 200,
			errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
			testName: testObject[TestObjectSyntax.Name],
			TEST_OBJECT: `${JSON.stringify(testObject)}`,
		};
		return {
			funcName: testObject[TestObjectSyntax.Name],
			code: Mustache.render(template, view),
		};
	};

	private createVariablesCode(testObject: TestObject) {
		const variables: { name: string; value: string }[] = [];
		const varNames = getVariablesFromTest(testObject);

		const returnStatement = testObject[TestObjectSyntax.Return];
		const continueStatement = testObject[TestObjectSyntax.Continue];
		let elementsList: string[] = [];

		// REPLACE ALL special WITH empty AND SPLIT
		if (typeof returnStatement === "string") {
			elementsList = removeAllSpecialCharacters(returnStatement).split(" ");
		}
		if (continueStatement) {
			const contElements =
				removeAllSpecialCharacters(continueStatement).split(" ");
			for (const elem of contElements) {
				if (!elementsList.includes(elem)) {
					elementsList.push(elem);
				}
			}
		}

		for (const name of varNames) {
			const value = testObject[name] as ConfigVariable;
			if (!elementsList.includes(name)) {
				continue;
			}
			let final = "";
			if (value.includes("_EXTERNAL")) {
				final = `validationutils.GetJsonPath(input, "${value}",true)`;
			} else {
				final =
					typeof value === "string"
						? `validationutils.GetJsonPath(testObjMap, "${value}",true)`
						: ConvertArrayToStringGoStyle(value);
			}

			variables.push({
				name: name,
				value: final,
			});
		}
		return variables;
	}

	private async createValidationLogicCode(testObject: TestObject) {
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
				testName: testObject[TestObjectSyntax.Name],
				TEST_OBJECT: `${JSON.stringify(testObject)}`,
			});
		}
	}

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

	public async generateUnitTestingCode() {
		const testTemplate = readFileSync(
			path.resolve(
				__dirname,
				"./templates/test-templates/validator-test.mustache"
			),
			"utf-8"
		);
		const finalTestCode = Mustache.render(testTemplate, {
			functionName: this.codeConfig?.codeName ?? "L1Validations",
		});
		await writeAndFormatCode(
			this.rootPath,
			`./${packageName}/main-validator_test.go`,
			finalTestCode,
			"go"
		);
	}
}

function stringToCaps(str: string): string {
	return str.charAt(0).toUpperCase() + str.slice(1);
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
	errorCode: number;
	testName: string;
	TEST_OBJECT: string;
}

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
import { ConvertArrayToString } from "../../../utils/general-utils/string-utils.js";
import { compileInputToTs } from "./ts-ast.js";
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

export class TypescriptGenerator extends CodeGenerator {
    codeConfig: CodeGeneratorProps | undefined;
    generateSessionDataCode = async () => {
        if (!this.codeConfig) {
            throw new Error(
                "Code config not set. Please call generateCode first.",
            );
        }
        const sessionData = this.validationConfig[ConfigSyntax.SessionData];
        const tests = this.validationConfig[ConfigSyntax.Tests];

        const relevantSessionData: Record<string, Record<string, string>> = {};
        collectLoadData(tests, relevantSessionData);
        const sessionDataUtilsTemplate = readFileSync(
            path.resolve(
                __dirname,
                "./templates/storage-templates/save-utils.mustache",
            ),
            "utf-8",
        );
        const storageInterfaceTemplate = readFileSync(
            path.resolve(
                __dirname,
                "./templates/storage-templates/storage-interface.mustache",
            ),
            "utf-8",
        );
        const storageTypesTemplate = readFileSync(
            path.resolve(
                __dirname,
                "./templates/storage-templates/storage-types.mustache",
            ),
            "utf-8",
        );
        const indexTemplate = readFileSync(
            path.resolve(
                __dirname,
                "./templates/storage-templates/index.mustache",
            ),
            "utf-8",
        );
        const saveActionTemplate = readFileSync(
            path.resolve(
                __dirname,
                "./templates/storage-templates/api-save.mustache",
            ),
            "utf-8",
        );

        const allActions = Object.keys(tests);

        const indexCode = Mustache.render(indexTemplate, {
            actions: Array.from(allActions).map((action) => {
                return { action: action };
            }),
            functionName: this.codeConfig.codeName.replace(
                /[^a-zA-Z0-9_]/g,
                "",
            ),
        });
        /*
			storeActions: {
				key: string;
				value: string;
			}[]
		*/

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
                `./storage-actions/${action}.ts`,
                saveCode,
                "typescript",
            );
        }
        await writeAndFormatCode(
            this.rootPath,
            "./utils/save-utils.ts",
            sessionDataUtilsTemplate,
            "typescript",
        );
        await writeAndFormatCode(
            this.rootPath,
            "./types/storage-types.ts",
            storageTypesTemplate,
            "typescript",
        );
        await writeAndFormatCode(
            this.rootPath,
            "./interfaces/storage-interface.ts",
            storageInterfaceTemplate,
            "typescript",
        );
        await writeAndFormatCode(
            this.rootPath,
            "./storage-actions/index.ts",
            indexCode,
            "typescript",
        );
    };
    generateValidationCode = async () => {
        const testConfig = this.validationConfig[ConfigSyntax.Tests];
        for (const key in testConfig) {
            const testObjects = testConfig[key];
            const betaConfig = {
                [TestObjectSyntax.Name]: key + "Validations",
                [TestObjectSyntax.Return]: testObjects,
            };
            const testFunction = await this.generateTestFunction(betaConfig);
            const apiTestTemplate = readFileSync(
                path.resolve(__dirname, "./templates/api-test.mustache"),
                "utf-8",
            );
            const finalCode = Mustache.render(apiTestTemplate, {
                functionCode: testFunction.code,
                apiName: key,
            });
            await writeAndFormatCode(
                this.rootPath,
                `./api-tests/${key}.ts`,
                finalCode,
                "typescript",
            );
        }
    };
    generateCode = async (codeConfig: CodeGeneratorProps) => {
        this.codeConfig = codeConfig;
        const jsonPathUtilsCode = readFileSync(
            path.resolve(__dirname, "./templates/json-path-utils.mustache"),
            "utf-8",
        );
        const validationUtils = readFileSync(
            path.resolve(__dirname, "./templates/validation-utils.mustache"),
            "utf-8",
        );
        const typesTemplate = readFileSync(
            path.resolve(__dirname, "./templates/test-config.mustache"),
            "utf-8",
        );
        const normalizerTemplate = readFileSync(
            path.resolve(__dirname, "./templates/json-normalizer.mustache"),
            "utf-8",
        );
        const typesCode = Mustache.render(typesTemplate, {
            externalData: this.getExternalKeys(),
        });
        writeAndFormatCode(
            this.rootPath,
            "./utils/json-path-utils.ts",
            jsonPathUtilsCode,
            "typescript",
        );
        writeAndFormatCode(
            this.rootPath,
            "./utils/json-normalizer.ts",
            normalizerTemplate,
            "typescript",
        );
        writeAndFormatCode(
            this.rootPath,
            "./utils/validation-utils.ts",
            validationUtils,
            "typescript",
        );
        writeAndFormatCode(
            this.rootPath,
            "./types/test-config.ts",
            typesCode,
            "typescript",
        );
        await this.generateValidationCode();
        await writeAndFormatCode(
            this.rootPath,
            "error.ts",
            this.generateErrorFile(this.errorCodes),
            "typescript",
        );
        await writeAndFormatCode(
            this.rootPath,
            "index.ts",
            this.generateIndexFile(
                Object.keys(this.validationConfig[ConfigSyntax.Tests]),
                codeConfig.codeName,
            ),
            "typescript",
        );
        await new MarkdownDocGenerator(
            this.validationConfig,
            this.errorCodes,
            this.rootPath,
        ).generateCode(codeConfig);
        await this.generateSessionDataCode();
    };

    generateTestFunction = async (testObject: TestObject) => {
        const template = readFileSync(
            path.resolve(__dirname, "./templates/test-object.mustache"),
            "utf-8",
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
            errorCode: testObject[TestObjectSyntax.ErrorCode] ?? 30000,
            testName: testObject[TestObjectSyntax.Name],
            TEST_OBJECT: `${JSON.stringify(testObject)}`,
        };
        return {
            funcName: testObject[TestObjectSyntax.Name],
            code: Mustache.render(template, view),
        };
    };

    private CreateErrorMarkdown(
        testObject: TestObject,
        skipList: string[] | undefined,
    ) {
        return markdownMessageGenerator(
            testObject[TestObjectSyntax.Return] as string,
            testObject,
            testObject[TestObjectSyntax.Name],
            skipList,
        );
    }

    private createVariablesCode(testObject: TestObject) {
        const variables: { name: string; value: string }[] = [];
        const varNames = extractVariablesFromText(testObject);
        for (const name of varNames) {
            const value = testObject[name] as ConfigVariable;
            const final =
                typeof value === "string"
                    ? `payloadUtils.getJsonPath(testObj, "${value}",true)`
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
            "utf-8",
        );
        const skip = testObject[TestObjectSyntax.Continue];
        const skipList = skip ? [skip] : undefined;
        if (typeof testObject[TestObjectSyntax.Return] === "string") {
            const returnStatement = compileInputToTs(
                testObject[TestObjectSyntax.Return],
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
                errorDescription: this.CreateErrorMarkdown(
                    testObject,
                    skipList,
                ),
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
    };

    private generateErrorFile(errors: ErrorDefinition[]): string {
        const allCodes = errors.map((error) => error.code);
        if (allCodes.length !== new Set(allCodes).size) {
            throw new Error("Duplicate error codes found");
        }
        errors.push({
            code: 20006,
            Description:
                "Invalid response does not meet API contract specifications",
        });
        errors.push({
            code: 30000,
            Description:
                "Invalid request does not meet API contract specifications",
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
        const apis = Object.keys(
            this.validationConfig[ConfigSyntax.SessionData],
        );
        let result: { name: string }[] = [];
        for (const api of apis) {
            const keys = Object.keys(
                this.validationConfig[ConfigSyntax.SessionData][api],
            );
            for (const key of keys) {
                result.push({ name: key });
            }
        }
        result = result.filter((v) => v.name !== "_SELF");
        return result;
    }

    private generateIndexFile(
        apis: string[],
        functionName: string = "L1Validations",
    ) {
        functionName = functionName.replace(/[^a-zA-Z0-9_]/g, "");
        let importsCode = apis
            .map((api) => `import ${api} from "./api-tests/${api}";`)
            .join("\n");
        importsCode += `\nimport { ValidationConfig,validationOutput } from "./types/test-config";`;
        importsCode += `\nimport normalizeKeys from "./utils/json-normalizer";`;
        importsCode += `\nimport { perform${functionName}Save, perform${functionName}Load}  from "./storage-actions";`;
        importsCode += `\nimport StorageInterface from "./interfaces/storage-interface";`;
        const masterTemplate = readFileSync(
            path.resolve(__dirname, "./templates/index.mustache"),
            "utf-8",
        );

        const masterFunction = `
				export async function perform${functionName}(action: string, payload: any, config?: Partial<ValidationConfig>, externalData: any = {}) {
					const completeConfig: ValidationConfig = {
						...{ onlyInvalid: true, standardLogs: false, hideParentErrors: true, stateFullValidations: false, _debug: false,skipTests: [] },
						...config,
					};
					completeConfig._skipTestsDict = {};
					for(const testName of completeConfig.skipTests ?? []) {
						completeConfig._skipTestsDict![testName] = true;
					}
					

					if (completeConfig.stateFullValidations  && !completeConfig.store) {
						throw new Error(
							"State Full validations require a storage interface to be provided in the config."
						);
					}
					if( completeConfig.stateFullValidations && !completeConfig.uniqueKey) {
       	 				throw new Error(
            				"State Full validations require a uniqueKey to be provided in the config."
        				);
    				}
					const normalizedPayload = normalizeKeys(JSON.parse(JSON.stringify(payload)));
					externalData._SELF = normalizedPayload;
					if (completeConfig.stateFullValidations) {
						externalData = {
							...await perform${functionName}Load(action, completeConfig.uniqueKey!, completeConfig.store!),
							...externalData,
						};
					}
					switch (action) {
						${apis
                            .map(
                                (api) => `case "${api}": return ${api}({
				payload: normalizedPayload,
				externalData: externalData,
				config: completeConfig,
			});`,
                            )
                            .join("\n")}
						default:
							throw new Error("Action not found");
					}
			}

			export {perform${functionName}Save, perform${functionName}Load, StorageInterface};

			`;
        return Mustache.render(masterTemplate, {
            importsCode: importsCode,
            masterFunction: masterFunction,
        });
    }

    public generateUnitTestingCode(): Promise<void> {
        throw new Error("Method not implemented.");
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
    errorCode: number;
    testName: string;
    TEST_OBJECT: string;
}

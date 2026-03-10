import { JSONSchema7 } from "json-schema";
import { BUILD_TYPE } from "../types/build.js";
import { loadAndDereferenceYaml } from "../utils/config-utils/yaml.js";
import { ExtractionService as SchemaExtractionService } from "../services/schema-service.js";
import { ErrorDefinition } from "../types/error-codes.js";
import { ValidationConfig } from "../types/config-types.js";
import { SupportedLanguages } from "../types/compiler-types.js";

import { TypescriptGenerator } from "./generators/typescript/ts-generator.js";
import { ConfigValidator } from "./validators/config-validator.js";
import { writeAndFormatCode } from "../utils/fs-utils.js";
import { readFileSync } from "fs";
import Mustache from "mustache";

import { fileURLToPath } from "url";
import path from "path";
import { duplicateVariablesInChildren } from "../utils/config-utils/duplicateVariables.js";
import { PythonGenerator } from "./generators/python/py-generator.js";
import { JavascriptGenerator } from "./generators/javascript/js-generator.js";
import { GoGenerator } from "./generators/go/go-generator.js";
import { MarkdownDocGenerator } from "./generators/documentation/md-generator.js";
import { RagGenerator } from "./generators/rag/rag-generator.js";
import { RagTableGenerator } from "./generators/rag/rag-table-generator.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
type CodeGeneratorConfig = {
    removeRequiredFromSchema: boolean;
    removeEnumsFromSchema: boolean;
    duplicateVariablesInChildren: boolean;
};

const defaultConfig: CodeGeneratorConfig = {
    removeRequiredFromSchema: true,
    removeEnumsFromSchema: true,
    duplicateVariablesInChildren: true,
};

export class ConfigCompiler {
    buildData: BUILD_TYPE | undefined;
    jsonSchemas: Record<string, JSONSchema7> | undefined;
    possibleJsonPaths: Record<string, string[]> | undefined;
    errorDefinitions: ErrorDefinition[] | undefined;
    generatorConfig: CodeGeneratorConfig | undefined;
    language: SupportedLanguages;
    domain?: string | string[];
    version?: string;
    private SchemaExtractionService: SchemaExtractionService;
    constructor(language: SupportedLanguages) {
        this.language = language;
        this.SchemaExtractionService = new SchemaExtractionService();
    }
    // 1. extract build, create schemas , extract possible paths , extract errorcodes
    initialize = async (
        buildYaml: string,
        generatorConfig: Partial<CodeGeneratorConfig> = {},
    ) => {
        const finalConfig = { ...defaultConfig, ...generatorConfig };
        this.generatorConfig = finalConfig;
        this.buildData = await loadAndDereferenceYaml<BUILD_TYPE>(buildYaml);
        this.jsonSchemas = await this.SchemaExtractionService.extractSchemas(
            this.buildData,
            finalConfig.removeRequiredFromSchema,
            finalConfig.removeEnumsFromSchema,
        );
        this.possibleJsonPaths =
            this.SchemaExtractionService.extractPossiblePaths(this.jsonSchemas);

        const errors = this.buildData["x-errorcodes"];
        this.errorDefinitions = errors.code;
        this.domain = this.buildData.info?.domain;
        this.version = this.buildData.info?.version;
    };

    performValidations = async (valConfig: ValidationConfig) => {
        if (!this.buildData) throw new Error("Build data not initialized");
        if (!this.jsonSchemas) throw new Error("Schemas not initialized");
        if (!this.possibleJsonPaths)
            throw new Error("Possible paths not initialized");
        if (!this.errorDefinitions)
            throw new Error("Error definitions not initialized");

        await new ConfigValidator(
            "",
            valConfig,
            this.possibleJsonPaths,
            this.errorDefinitions,
        ).validate();
    };

    withMinimalValidations = async (valConfig: ValidationConfig) => {
        await new ConfigValidator("", valConfig, {}, [], {
            minimal: true,
        }).validate();
    };

    generateCode = async (
        valConfig: ValidationConfig,
        codeGenConfig: CodeGenConfig | string = "L1-Validations",
    ) => {
        // Accept either the new CodeGenConfig object or the legacy positional
        // string (codeName) so existing call-sites continue to work.
        const config: CodeGenConfig =
            typeof codeGenConfig === "string"
                ? { codeName: codeGenConfig }
                : codeGenConfig;

        const {
            codeName = "L1-Validations",
            goPkgName = "validationpkg",
            minimal = false,
            outputPath = "./",
            absolutePath = false,
            domain = this.domain,
            version = this.version,
        } = config;
        try {
            console.log("[ CODE GENERATION ] Starting code generation...");
            valConfig = JSON.parse(JSON.stringify(valConfig));
            if (this.generatorConfig?.duplicateVariablesInChildren) {
                valConfig = duplicateVariablesInChildren(valConfig);
            }

            if (minimal) {
                await this.withMinimalValidations(valConfig);
            } else {
                await this.performValidations(valConfig);
            }
            // Generate code based on the language
            const targetPath = absolutePath
                ? outputPath
                : `${outputPath}generated/${codeName}`;
            switch (this.language) {
                case SupportedLanguages.Typescript:
                    await new TypescriptGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.Python:
                    await new PythonGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.Javascript:
                    await new JavascriptGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.Golang:
                    await new GoGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        goPkgName: goPkgName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.Markdown:
                    await new MarkdownDocGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.RAG:
                    await new RagGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                case SupportedLanguages.RAG_TABLE:
                    await new RagTableGenerator(
                        valConfig,
                        this.errorDefinitions ?? [],
                        targetPath,
                    ).generateCode({
                        codeName: codeName,
                        domain: domain,
                        version: version,
                    });
                    break;
                default:
                    throw new Error("Language not supported");
            }
            console.log(
                "[ CODE GENERATION ] Code generation completed successfully.",
            );
        } catch (e: any) {
            console.error(`\n [ CODE GENERATION ERROR ] ${e?.message || e}\n`);
            if (e?.stack) {
                console.error("Stack trace:");
                console.error(e.stack);
            }
        }
    };

    generateL0Schema = async (
        outputPath: string = "./",
        type: "json" | "typescript" = "typescript",
        absolutePath: boolean = false,
    ) => {
        if (!this.jsonSchemas) {
            throw new Error("Schemas not initialized");
        }

        const targetPath = absolutePath
            ? outputPath
            : `${outputPath}generated/L0-schemas/`;
        for (const schema in this.jsonSchemas) {
            const json = this.jsonSchemas[schema];
            if (type === "typescript") {
                writeAndFormatCode(
                    targetPath,
                    `${schema}.ts`,
                    `export const ${schema} = ${JSON.stringify(json, null, 2)}`,
                    "typescript",
                );
            } else if (type === "json") {
                writeAndFormatCode(
                    targetPath,
                    `${schema}.json`,
                    JSON.stringify(json, null, 2),
                    "json",
                );
            }
        }
        if (type === "typescript") {
            const actions = Object.keys(this.jsonSchemas).map((schema) => {
                return {
                    action: schema,
                };
            });
            const template = readFileSync(
                path.resolve(
                    __dirname,
                    "../generator/generators/typescript/templates/schema-template.mustache",
                ),
                "utf-8",
            );
            const l0 = Mustache.render(template, { actions });
            await writeAndFormatCode(targetPath, `index.ts`, l0, "typescript");
        }
    };

    generateValidPaths = async () => {
        if (!this.possibleJsonPaths)
            throw new Error("Possible paths not initialized");
        return this.possibleJsonPaths;
    };

    generateValidationFromBuild = async (
        codeGenConfig: CodeGenConfig | string,
        outputPath?: string,
        absolutePath?: boolean,
        goPackageName?: string,
    ) => {
        if (!this.buildData) throw new Error("Build data not initialized");
        const valConfig = this.buildData["x-validations"];
        if (!valConfig)
            throw new Error("No validation config found in build data");

        // Support legacy positional call: (codeName, outputPath, absolutePath, goPkgName)
        const config: CodeGenConfig =
            typeof codeGenConfig === "string"
                ? {
                      codeName: codeGenConfig,
                      outputPath: outputPath ?? "./",
                      absolutePath: absolutePath ?? false,
                      goPkgName: goPackageName ?? "validationpkg",
                      domain: this.buildData.info?.domain,
                      version: this.buildData.info?.version,
                  }
                : {
                      ...codeGenConfig,
                      domain:
                          codeGenConfig.domain ?? this.buildData?.info?.domain,
                      version:
                          codeGenConfig.version ??
                          this.buildData?.info?.version,
                  };

        await this.generateCode(valConfig, config);
    };

    extractPayloadsFromBuild = async (outputPath: string) => {
        if (!this.buildData) throw new Error("Build data not initialized");
        const payloads = this.SchemaExtractionService.extractPayloadExamples(
            this.buildData,
        );
    };
}

export type CodeGenConfig = {
    codeName: string;
    goPkgName?: string;
    domain?: string | string[];
    version?: string;
    /** Skip full path/enum validations and run minimal checks only. Default: false */
    minimal?: boolean;
    /** Base output directory. Default: "./" */
    outputPath?: string;
    /** Treat outputPath as absolute (skip prepending "generated/<codeName>"). Default: false */
    absolutePath?: boolean;
};

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
import logger from "../utils/logger.js";

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
		this.possibleJsonPaths = this.SchemaExtractionService.extractPossiblePaths(
			this.jsonSchemas,
		);

		const errors = this.buildData["x-errorcodes"];
		this.errorDefinitions = errors.code;
	};

	performValidations = async (valConfig: ValidationConfig) => {
		// try {
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
		// } catch (e) {
		// 	logger.error(e);
		// 	throw new Error(e as any);
		// }
	};

	withMinimalValidations = async (valConfig: ValidationConfig) => {
		// try {
		await new ConfigValidator("", valConfig, {}, [], {
			minimal: true,
		}).validate();
		// } catch (e) {
		// logger.error(e);
		// throw new Error("validation failed");
	};
	// };

	generateCode = async (
		valConfig: ValidationConfig,
		codeName: string = "L1-Validations",
		minimal: boolean = false,
		outputPath: string = "./",
		absolutePath: boolean = false,
	) => {
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
					});
					break;
				case SupportedLanguages.Python:
					await new PythonGenerator(
						valConfig,
						this.errorDefinitions ?? [],
						targetPath,
					).generateCode({
						codeName: codeName,
					});
					break;
				case SupportedLanguages.Javascript:
					await new JavascriptGenerator(
						valConfig,
						this.errorDefinitions ?? [],
						targetPath,
					).generateCode({
						codeName: codeName,
					});
					break;
				case SupportedLanguages.Golang:
					await new GoGenerator(
						valConfig,
						this.errorDefinitions ?? [],
						targetPath,
					).generateCode({
						codeName: codeName,
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
		// writeFileSync(
		// 	"./validPaths.json",
		// 	JSON.stringify(this.possibleJsonPaths, null, 2)
		// );
		return this.possibleJsonPaths;
	};

	generateValidationFromBuild = async (
		codeName: string,
		outputPath: string,
		absolutePath: boolean = false,
	) => {
		if (!this.buildData) throw new Error("Build data not initialized");
		const valConfig = this.buildData["x-validations"];
		if (!valConfig) throw new Error("No validation config found in build data");
		await this.generateCode(
			valConfig,
			codeName,
			false,
			outputPath,
			absolutePath,
		);
	};

	extractPayloadsFromBuild = async (outputPath: string) => {
		if (!this.buildData) throw new Error("Build data not initialized");
		const payloads = this.SchemaExtractionService.extractPayloadExamples(
			this.buildData,
		);
	};
}

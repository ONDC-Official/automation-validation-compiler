import { JSONSchema7 } from "json-schema";
import { BUILD_TYPE } from "../types/build.js";
import { loadAndDereferenceYaml } from "../utils/config-utils/yaml.js";
import { SchemaExtactionService as SchemaExtractionService } from "../services/schema-service.js";
import { ErrorDefinition } from "../types/error-codes.js";
import { ValidationConfig } from "../types/config-types.js";
import logger from "../utils/logger.js";
import { SupportedLanguages } from "../types/compiler-types.js";

import { TypescriptGenerator } from "./generators/typescript/ts-generator.js";
import { ConfigValidator } from "./validators/config-validator.js";
import { writeAndFormatCode } from "../utils/fs-utils.js";
import { readFileSync } from "fs";
import Mustache from "mustache";

import { fileURLToPath } from "url";
import path from "path";
import { duplicateVariablesInChildren } from "../utils/config-utils/duplicateVariables.js";
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
		generatorConfig: Partial<CodeGeneratorConfig> = {}
	) => {
		const finalConfig = { ...defaultConfig, ...generatorConfig };
		this.generatorConfig = finalConfig;
		this.buildData = await loadAndDereferenceYaml<BUILD_TYPE>(buildYaml);
		this.jsonSchemas = await this.SchemaExtractionService.extractSchemas(
			this.buildData,
			finalConfig.removeRequiredFromSchema,
			finalConfig.removeEnumsFromSchema
		);
		this.possibleJsonPaths = this.SchemaExtractionService.extractPossiblePaths(
			this.jsonSchemas
		);

		const errors = this.buildData["x-errorcodes"];
		this.errorDefinitions = errors.code;
	};

	performValidations = async (valConfig: ValidationConfig) => {
		try {
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
				this.errorDefinitions
			).validate();
		} catch (e) {
			logger.error(e);
			throw new Error("Validation failed");
		}
	};

	withMinimalValidations = async (valConfig: ValidationConfig) => {
		try {
			await new ConfigValidator("", valConfig, {}, [], {
				minimal: true,
			}).validate();
		} catch (e) {
			logger.error(e);
			throw new Error("validation failed");
		}
	};

	generateCode = async (
		valConfig: ValidationConfig,
		codeName: string = "L1-Validations",
		minimal: boolean = false,
		outputPath: string = "./"
	) => {
		valConfig = JSON.parse(JSON.stringify(valConfig));
		if (this.generatorConfig?.duplicateVariablesInChildren) {
			console.log("Duplicating variables");
			valConfig = duplicateVariablesInChildren(valConfig);
		}

		if (minimal) {
			await this.withMinimalValidations(valConfig);
		} else {
			await this.performValidations(valConfig);
		}
		// Generate code based on the language
		const targetPath = path.resolve(outputPath, `/generated/${codeName}`);
		switch (this.language) {
			case SupportedLanguages.Typescript:
				await new TypescriptGenerator(
					valConfig,
					this.errorDefinitions ?? [],
					// `./generated/${codeName}`
					targetPath
				).generateCode({
					codeName: codeName,
				});
				break;
			default:
				throw new Error("Language not supported");
		}
	};

	generateL0Schema = async () => {
		if (!this.jsonSchemas) {
			throw new Error("Schemas not initialized");
		}

		for (const schema in this.jsonSchemas) {
			const json = this.jsonSchemas[schema];
			writeAndFormatCode(
				`./generated/L0-schemas`,
				`${schema}.ts`,
				`export const ${schema} = ${JSON.stringify(json, null, 2)}`,
				"typescript"
			);
		}

		const actions = Object.keys(this.jsonSchemas).map((schema) => {
			return {
				action: schema,
			};
		});
		const template = readFileSync(
			path.resolve(
				__dirname,
				"../generator/generators/typescript/templates/schema-template.mustache"
			),
			"utf-8"
		);
		console.log(actions);
		const l0 = Mustache.render(template, { actions });
		await writeAndFormatCode(
			`./generated/L0-schemas`,
			`index.ts`,
			l0,
			"typescript"
		);
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
}

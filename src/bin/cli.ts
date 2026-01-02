#!/usr/bin/env node

import path from "path";
import fs from "fs/promises";
import { fileURLToPath } from "url";
import { program } from "commander";
import { ConfigCompiler, SupportedLanguages } from "../index.js";
import Cli from "./cli-tool.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// interface CLIOptions {
// 	config: string;
// 	output: string;
// 	lang: string;
// }

program
	.name("ondc-code-generator")
	.description("Ondc Validation Code Generator")
	.version("0.0.1");

program
	.command("ondc-validation-gen")
	.alias("xval")
	.option("-c, --config <path>", "Path to build.yaml file")
	.option(
		"-f, --function-name <name>",
		"Name of the validation function to generate"
	)
	.option("-o, --output <directory>", "Output directory for generated code")
	.option(
		"-l, --lang <language>",
		"Target programming language (typescript, python, javascript, go)"
	)
	.description("Generate validation code")
	.action(async (options) => {
		const { config, output, lang, functionName } = options;
		console.log(Cli.title("Ondc Validation Code Generator"));
		if (!config || !output || !lang) {
			console.log(
				Cli.description.error(
					"Please provide all required options: --config, --output, --lang"
				)
			);
			process.exit(1);
		}
		try {
			console.log(
				Cli.description.info(`Generating validation code for language: ${lang}`)
			);
			const functionName = options.functionName || "L1validations";
			const language = getSupportedLanguage(lang);
			const compiler = new ConfigCompiler(language);
			const buildPath = path.resolve(process.cwd(), config);
			console.log(
				Cli.description.info(`Reading build file from ${buildPath}...`)
			);
			const buildYaml = await fs.readFile(buildPath, "utf-8");
			console.log(Cli.description.info("Initializing compiler..."));
			await compiler.initialize(buildYaml);
			console.log(Cli.description.info("Generating validation code..."));
			await compiler.generateValidationFromBuild(functionName, output, true);
			console.log(
				Cli.description.success(
					`Validation code generated successfully in ${output} for language ${lang}`
				)
			);
		} catch (error) {
			const message = error instanceof Error ? error.message : String(error);
			console.error(Cli.description.error(`Error: ${message}`));
			process.exit(1);
		}
	});

program
	.command("schema-gen")
	.alias("schema")
	.option("-c, --config <path>", "Path to build.yaml file")
	.option("-o, --output <directory>", "Output directory for generated schema")
	.option("-f, --format <format>", "Output format (json, yaml,typescript)")
	.description("Generate L0 schema")
	.action(async (options) => {
		console.log(Cli.title("Ondc Schema Generator"));
		try {
			const { config, output, format } = options;
			if (!config || !output || !format) {
				console.log(
					Cli.description.error(
						"Please provide all required options: --config, --output, --format"
					)
				);
				process.exit(1);
			}
			console.log(Cli.description.info(`Generating L0 schema...`));
			const buildPath = path.resolve(process.cwd(), config);
			console.log(
				Cli.description.info(`Reading build file from ${buildPath}...`)
			);
			const buildYaml = await fs.readFile(buildPath, "utf-8");
			const compiler = new ConfigCompiler(SupportedLanguages.Typescript);
			await compiler.initialize(buildYaml);
			const formatType = getSchemaFormat(format);
			await compiler.generateL0Schema(output, formatType, true);
		} catch (error) {
			const message = error instanceof Error ? error.message : String(error);
			console.error(Cli.description.error(`Error: ${message}`));
			process.exit(1);
		}
	});

program
	.command("extract-payloads")
	.alias("ext-payloads")
	.description("Extract sample payloads from build.yaml")
	.option("-c, --config <path>", "Path to build.yaml file")
	.option("-o, --output <directory>", "Output directory for extracted payloads")
	.action(async (options) => {
		console.log(Cli.title("Ondc Sample Payload Extractor"));
		try {
			const { config, output } = options;
			if (!config || !output) {
				console.log(
					Cli.description.error(
						"Please provide all required options: --config, --output"
					)
				);
				process.exit(1);
			}
			console.log(Cli.description.info(`Extracting sample payloads...`));
			const buildPath = path.resolve(process.cwd(), config);
			console.log(
				Cli.description.info(`Reading build file from ${buildPath}...`)
			);
			const buildYaml = await fs.readFile(buildPath, "utf-8");
			const compiler = new ConfigCompiler(SupportedLanguages.Typescript);
			await compiler.initialize(buildYaml);
			await compiler.extractPayloadsFromBuild(output);
		} catch (error) {
			const message = error instanceof Error ? error.message : String(error);
			console.error(Cli.description.error(`Error: ${message}`));
			process.exit(1);
		}
	});

program.parse();

function getSupportedLanguage(lang: string): SupportedLanguages {
	switch (lang.toLowerCase()) {
		case "typescript":
			return SupportedLanguages.Typescript;
		case "python":
			return SupportedLanguages.Python;
		case "javascript":
			return SupportedLanguages.Javascript;
		case "go":
			return SupportedLanguages.Golang;
		default:
			throw new Error(
				`Unsupported language: ${lang}. Supported languages are: ${getValidLanguageOptions()}`
			);
	}
}

function getSchemaFormat(format: string): "json" | "typescript" {
	switch (format.toLowerCase()) {
		case "json":
			return "json";
		case "typescript":
			return "typescript";
		case "yaml":
			throw new Error("YAML format is not yet supported");
		default:
			throw new Error(
				`Unsupported format: ${format}. Supported formats are: json, typescript`
			);
	}
}

function getValidLanguageOptions(): string {
	return Object.values(SupportedLanguages).join(", ");
}

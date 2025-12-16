import { readFileSync, writeFileSync } from "fs";

import path from "path";
import { fileURLToPath } from "url";
import { ConfigCompiler } from "./generator/config-compiler.js";
import { SupportedLanguages } from "./types/compiler-types.js";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const main = async () => {
	const compiler = new ConfigCompiler(SupportedLanguages.Python);
	const buildPath = path.resolve(__dirname, "../samples/build.yaml");
	const valConfigPath = path.resolve(
		__dirname,
		"../samples/validation-config.json"
	);
	const buildYaml = readFileSync(buildPath, "utf-8");
	const valConfig = JSON.parse(readFileSync(valConfigPath, "utf-8"));
	await compiler.initialize(buildYaml);
	const validPaths = await compiler.generateValidPaths();
	writeFileSync(
		path.resolve(__dirname, "../alpha/possible-json-paths.json"),
		JSON.stringify(validPaths, null, 2),
		"utf-8"
	);
	await compiler.generateCode(
		valConfig,
		"L1_validations",
		false,
		"./alpha/python/"
	);
	const compilerTy = new ConfigCompiler(SupportedLanguages.Typescript);
	await compilerTy.initialize(buildYaml);
	await compilerTy.generateCode(
		valConfig,
		"L1_validations",
		false,
		"./alpha/typescript/"
	);
	await compilerTy.generateL0Schema("./alpha/typescript/L0_schema/");
	await compilerTy.generateL0Schema("./alpha/json/", "json");

	const compilerGo = new ConfigCompiler(SupportedLanguages.Golang);
	await compilerGo.initialize(buildYaml);
	await compilerGo.generateCode(
		valConfig,
		"L1_validations",
		false,
		"./alpha/golang/"
	);

	// JavaScript generation example
	// const compilerJs = new ConfigCompiler(SupportedLanguages.Javascript);
	// await compilerJs.initialize(buildYaml);
	// await compilerJs.generateCode(
	// 	valConfig,
	// 	"L1_validations",
	// 	false,
	// 	"./alpha/javascriptNative/"
	// );
};

(async () => {
	await main();
	console.log("========== Code generation completed. ==========");
})();

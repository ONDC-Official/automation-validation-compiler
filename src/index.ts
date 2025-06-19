import { ConfigCompiler } from "./generator/config-compiler.js";
export { ConfigCompiler };

import { readFileSync } from "fs";

import path from "path";
import { fileURLToPath } from "url";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
import { SupportedLanguages } from "./types/compiler-types.js";

const main = async () => {
	const compiler = new ConfigCompiler(SupportedLanguages.Typescript);
	const buildPath = path.resolve(__dirname, "../samples/build.yaml");
	const valConfigPath = path.resolve(
		__dirname,
		"../samples/validation-config.json"
	);
	const buildYaml = readFileSync(buildPath, "utf-8");
	const valConfig = JSON.parse(readFileSync(valConfigPath, "utf-8"));
	await compiler.initialize(buildYaml);
	await compiler.generateCode(valConfig, "L1-validations", true);
};

(async () => {
	await main();
})();

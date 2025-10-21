  import { readFileSync } from "fs";
import { ConfigCompiler } from "../generator/config-compiler.js";
import { SupportedLanguages } from "../types/compiler-types.js";

  async function main() {
    const buildYaml = readFileSync("samples/build.yaml", "utf-8");
    const valConfig = JSON.parse(
      readFileSync("samples/validation-config.json", "utf-8")
    );

    const compiler = new ConfigCompiler(SupportedLanguages.Sql);
    await compiler.initialize(buildYaml);
    await compiler.generateCode(valConfig);
  }

  main();

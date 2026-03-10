import { ConfigSyntax } from "../../../constants/syntax.js";
import {
    CodeGenerator,
    CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { marked } from "marked";
import Mustache from "mustache";
import { readFileSync } from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { RagTableGenerator } from "../rag/rag-table-generator.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * MarkdownDocGenerator — generates a readme.md and a styled index.html
 * for a validation config, reusing RagTableGenerator for the table layout.
 *
 * Output:
 *   ./readme.md          — concatenated GFM table markdown for all actions
 *   ./page/index.html    — the same content rendered to HTML with a stylesheet
 *   ./page/style.css     — stylesheet
 */
export class MarkdownDocGenerator extends CodeGenerator {
    generateSessionDataCode(): Promise<void> {
        throw new Error("Method not implemented.");
    }
    generateUnitTestingCode(): Promise<void> {
        throw new Error("Method not implemented.");
    }

    generateValidationCode = async () => {
        const testConfig = this.validationConfig[ConfigSyntax.Tests];

        // Reuse RagTableGenerator's table builder — same config, same error codes
        const tableGen = new RagTableGenerator(
            this.validationConfig,
            this.errorCodes,
            this.rootPath,
        );

        // Build one GFM table section per action and concatenate
        let finalMarkdown = "";
        for (const action of Object.keys(testConfig)) {
            const section = tableGen.buildActionMarkdown(
                action,
                action, // use action name as codeName heading inside the doc
                testConfig[action],
            );
            finalMarkdown += `\n\n${section}`;
        }
        finalMarkdown = finalMarkdown.trimStart();

        const cssData = readFileSync(
            path.resolve(__dirname, "./templates/style.css"),
            "utf-8",
        );
        const htmlTemplate = readFileSync(
            path.resolve(__dirname, "./templates/index.mustache"),
            "utf-8",
        );

        writeFileWithFsExtra(this.rootPath, "./readme.md", finalMarkdown);
        writeFileWithFsExtra(
            this.rootPath,
            "./page/index.html",
            Mustache.render(htmlTemplate, {
                content: await marked(finalMarkdown),
            }),
        );
        writeFileWithFsExtra(this.rootPath, "./page/style.css", cssData);
    };

    generateCode = async (_codeConfig?: CodeGeneratorProps) => {
        await this.generateValidationCode();
    };
}

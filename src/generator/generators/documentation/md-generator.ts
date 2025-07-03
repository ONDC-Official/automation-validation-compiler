import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import { TestObject } from "../../../types/config-types.js";
import { CodeGenerator } from "../classes/abstract-generator.js";
import { markdownMessageGenerator } from "./markdown-message-generator.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { marked } from "marked";

import Mustache from "mustache";

import { readFileSync } from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { addTabToMarkdown } from "../../../utils/general-utils/string-utils.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
export class MarkdownDocGenerator extends CodeGenerator {
	generateSessionDataCode(): Promise<void> {
		throw new Error("Method not implemented.");
	}
	generateValidationCode = async () => {
		const testConfig = this.validationConfig[ConfigSyntax.Tests];
		let finalMarkdown = "";
		for (const key in testConfig) {
			const testObjects = testConfig[key];
			const betaConfig = {
				[TestObjectSyntax.Name]: key,
				[TestObjectSyntax.Return]: testObjects,
			};
			const md = this.generateMarkdownForTest(betaConfig);
			finalMarkdown += `\n\n${md}`;
		}
		const cssData = readFileSync(
			path.resolve(__dirname, "./templates/style.css"),
			"utf-8"
		);
		const htmlTemplate = readFileSync(
			path.resolve(__dirname, "./templates/index.mustache"),
			"utf-8"
		);
		writeFileWithFsExtra(this.rootPath, "./readme.md", finalMarkdown);
		writeFileWithFsExtra(
			this.rootPath,
			"./page/index.html",
			Mustache.render(htmlTemplate, {
				content: await this.generateHtmlCode(finalMarkdown),
			})
		);
		writeFileWithFsExtra(this.rootPath, "./page/style.css", cssData);
	};
	generateCode = async () => {
		await this.generateValidationCode();
	};

	generateMarkdownForTest = (testObject: TestObject): string => {
		const ret = testObject[TestObjectSyntax.Return];
		if (typeof ret === "string") {
			const skip = testObject[TestObjectSyntax.Continue];
			return markdownMessageGenerator(
				ret,
				testObject,
				// testObject[TestObjectSyntax.Name],
				"A",
				skip ? [skip] : undefined
			);
		}
		const subMardowns = ret.map((r) => {
			return this.generateMarkdownForTest(r);
		});

		return `- **${testObject[TestObjectSyntax.Name]}** : All the following sub conditions must pass as per the api requirement\n\n${addTabToMarkdown(subMardowns.join("\n\n"))}`;
	};

	generateHtmlCode = async (markdownData: string) => {
		return await marked(markdownData);
	};
}

import fs from "fs-extra";
import * as path from "path";
import prettier from "prettier";
import logger from "./logger.js";
import { spawnSync } from "node:child_process";
export function writeFileWithFsExtra(
	rootPath: string,
	relativeFilePath: string,
	content: string
): void {
	// Resolve the full file path
	const filePath = path.resolve(rootPath, relativeFilePath);
	logger.debug(`Writing file to ${filePath}`);
	fs.outputFileSync(filePath, content);
}

export async function formatCode(code: string, lang: string) {
	if (lang === "text") {
		// No formatting for plain text files
		return code;
	}

	if (lang == "python") {
		// Basic Python formatting - clean up extra whitespace and blank lines
		return formatPythonCode(code);
	}

	if (lang === "go") {
		// Basic Go formatting - clean up extra whitespace and blank lines
		return formatGo(code);
	}

	return await prettier.format(code, {
		parser: lang,
		tabWidth: 4,
	});
}

function formatPythonCode(code: string): string {
	const lines = code.split("\n");
	const formattedLines: string[] = [];

	for (let i = 0; i < lines.length; i++) {
		const line = lines[i];

		// Skip lines that are only whitespace
		if (line.trim() === "") {
			// Only add empty line if the previous line wasn't empty
			if (
				formattedLines.length > 0 &&
				formattedLines[formattedLines.length - 1].trim() !== ""
			) {
				formattedLines.push("");
			}
			continue;
		}

		// Add the line as-is (preserve existing indentation)
		formattedLines.push(line);
	}

	// Remove multiple consecutive empty lines
	const cleanedLines: string[] = [];
	let lastWasEmpty = false;

	for (const line of formattedLines) {
		const isEmpty = line.trim() === "";
		if (isEmpty && lastWasEmpty) {
			continue; // Skip consecutive empty lines
		}
		cleanedLines.push(line);
		lastWasEmpty = isEmpty;
	}

	// Remove trailing empty lines
	while (
		cleanedLines.length > 0 &&
		cleanedLines[cleanedLines.length - 1].trim() === ""
	) {
		cleanedLines.pop();
	}

	return cleanedLines.join("\n") + "\n";
}

export function formatGo(code: string): string {
	const result = spawnSync("gofmt", [], {
		input: code,
		encoding: "utf8",
	});

	if (result.error) {
		throw result.error;
		// return code; // If gofmt is not available, return the original code
	}

	if (result.status !== 0) {
		throw new Error(result.stderr);
		// return code; // If gofmt fails, return the original code
	}

	return result.stdout;
}

export async function writeAndFormatCode(
	rootPath: string,
	relativeFilePath: string,
	content: string,
	lang: string
) {
	const formattedCode = await formatCode(content, lang);
	writeFileWithFsExtra(rootPath, relativeFilePath, formattedCode);
}

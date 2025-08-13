import {
	nodeReservedKeywords,
	TestObjectSyntax,
} from "../../constants/syntax.js";
import { TestObject } from "../../types/config-types.js";
import { getVariablesFromTest } from "./test-object-utils.js";

/**
 * 	Check if the string matches the pattern: lowercase letters and underscores only, no leading or trailing underscores
 *
 * @param str
 * @returns true if the string is in snake_case, false otherwise
 */
export function isSnakeCase(str: string): boolean {
	const snakeCasePattern = /^[a-z0-9A-Z]+(_[a-z0-9A-Z]+)*$/;
	return snakeCasePattern.test(str);
}

export function isValidVariableName(input: string): boolean {
	// Regular expression to match valid variable names
	const validVariableNameRegex = /^[a-zA-Z_$][a-zA-Z0-9_$]*$/;

	// Check if input matches the regex
	const matchesPattern = validVariableNameRegex.test(input);

	const isNotReservedKeyword = !nodeReservedKeywords.has(input);

	return matchesPattern && isNotReservedKeyword;
}

/**
 * Adds '>' at the beginning of each line in the given Markdown string.
 *
 * @param {string} markdown - The input Markdown string.
 * @returns {string} - The modified Markdown string with '>' added to each line.
 */
export function addBlockquoteToMarkdown(markdown: string): string {
	return markdown
		.split("\n") // Split the input string into an array of lines.
		.map((line) => ">" + (line.trim() !== "" ? " " + line : "")) // Add '>' in front of each line.
		.join("\n"); // Join the array of lines back into a single string.
}

export function ConvertArrayToStringsInTestObject(testObject: TestObject) {
	const variables = getVariablesFromTest(testObject);
	const testDuplicate = { ...testObject };
	const scope = testObject[TestObjectSyntax.Scope];
	for (const variable of variables) {
		if (Array.isArray(testObject[variable])) {
			let vals = testObject[variable].map((v) => `"${v}"`).join(", ");
			vals = vals.replace(/"/g, `"`);
			testDuplicate[variable] = `[${vals}]`;
		} else {
			if (scope) {
				const path = testDuplicate[variable] as string;
				const pathWithoutDollar = path.slice(2);
				testDuplicate[variable] = `${scope}.${pathWithoutDollar}`;
			}
		}
	}
	return testDuplicate;
}

export function ConvertArrayToString(arr: any[]) {
	for (const a of arr) {
		if (typeof a !== "string") {
			console.log(arr);
			throw new Error(`Array contains non-string element: ${a}`);
		}
	}
	let values = JSON.stringify(arr);
	values = values.replace(/\\\\\\/g, "\\");
	return values;
}

export function addTabToMarkdown(markdown: string) {
	// Split the markdown into lines, add a tab to each line, and rejoin
	return markdown
		.split("\n") // Split the input into individual lines
		.map((line) => `\t${line}`) // Add a tab character at the beginning of each line
		.join("\n"); // Rejoin the lines into a single string
}

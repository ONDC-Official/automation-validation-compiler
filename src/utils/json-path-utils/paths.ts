import jsonpath from "jsonpath";
export function isValidJsonPath(jsonPath: string) {
	try {
		jsonpath.query({}, jsonPath);
		return true;
	} catch (error) {
		return false;
	}
}

/**
 * Replaces all content inside square brackets in a JSONPath with an asterisk '*',
 * handling nested brackets if they occur.
 *
 * @param jsonPath - The JSONPath string to transform.
 * @returns The transformed JSONPath string with contents inside brackets replaced by '*'.
 */
export function replaceBracketsWithAsteriskNested(jsonPath: string): string {
	let result = "";
	let i = 0;

	while (i < jsonPath.length) {
		if (jsonPath[i] === "[" && jsonPath.substring(i).startsWith("[?(@.")) {
			// Start of query bracketed expression
			let bracketDepth = 1;
			let j = i + 1;
			while (j < jsonPath.length && bracketDepth > 0) {
				if (jsonPath[j] === "[") {
					bracketDepth++;
				} else if (jsonPath[j] === "]") {
					bracketDepth--;
				}
				j++;
			}
			// Replace the query condition with '*'
			result += "[*]";
			i = j; // Move i to after the closing ']'
		} else {
			// Copy character as-is
			result += jsonPath[i];
			i++;
		}
	}
	return result;
}

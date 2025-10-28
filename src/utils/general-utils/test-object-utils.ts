import { TestObjectSyntax } from "../../constants/syntax.js";
import { TestObject } from "../../types/config-types.js";
import { replaceBracketsWithAsteriskNested } from "../json-path-utils/paths.js";

export function getVariablesFromTest(testObject: TestObject) {
	const variables: string[] = [];
	const keys = Object.keys(testObject);
	for (const key of keys) {
		if (Object.values(TestObjectSyntax).includes(key as TestObjectSyntax)) {
			continue;
		}
		variables.push(key);
	}
	return variables;
}

export function mergePathWithScope(path: string, scope?: string) {
	if (scope) {
		const pathWithoutDollar = path.slice(2);
		path = `${scope}.${pathWithoutDollar}`;
	}
	return path;
}

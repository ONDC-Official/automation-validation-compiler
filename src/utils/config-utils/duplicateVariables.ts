import { ConfigSyntax, TestObjectSyntax } from "../../constants/syntax.js";
import {
	ConfigVariable,
	TestObject,
	ValidationConfig,
} from "../../types/config-types.js";
import { Primitive } from "../../types/general-types.js";
import {
	getVariablesFromTest,
	mergePathWithScope,
} from "../general-utils/test-object-utils.js";

export function duplicateVariablesInChildren(
	valConfig: ValidationConfig
): ValidationConfig {
	const tests = valConfig[ConfigSyntax.Tests];
	for (const key in tests) {
		const testArray = tests[key];
		for (const test of testArray) {
			duplicateVariables(test, {});
			// console.log(test);
		}
	}
	// console.log(JSON.stringify(valConfig, null, 2));

	return valConfig;
}

function duplicateVariables(
	test: TestObject,
	parentVariables: Record<string, ConfigVariable>
) {
	const variables = getVariablesFromTest(test);
	const extractedVariables: Record<string, ConfigVariable> = {};
	for (const v of variables) {
		const value = test[v];
		if (typeof value === "string") {
			const scope = test[TestObjectSyntax.Scope];
			extractedVariables[v] = mergePathWithScope(value, scope);
		} else if (Array.isArray(value)) {
			extractedVariables[v] = value as Primitive[];
		}
	}
	if (Array.isArray(test[TestObjectSyntax.Return])) {
		const returnArray = test[TestObjectSyntax.Return] as TestObject[];
		for (const returnTest of returnArray) {
			duplicateVariables(returnTest, {
				...parentVariables,
				...extractedVariables,
			});
		}
	} else {
		// console.log("adding variables", parentVariables, test);
		Object.assign(test, parentVariables);
		// console.log(test);
	}
}

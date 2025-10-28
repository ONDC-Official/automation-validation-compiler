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
	if(valConfig[ConfigSyntax.SessionData]["search"]){
		valConfig[ConfigSyntax.SessionData]["search"]._SELF = null;
	}else{
		valConfig[ConfigSyntax.SessionData]["search"] = {
			_SELF: null,
		};
	}
	return valConfig;
}

function duplicateVariables(
	test: TestObject,
	parentVariables: Record<string, ConfigVariable>
) {
	const variables = getVariablesFromTest(test);
	let extractedVariables: Record<string, ConfigVariable> = {};
	for (const v of variables) {
		const value = test[v];
		if (typeof value === "string") {
			const scope = test[TestObjectSyntax.Scope];
			extractedVariables[v] = mergePathWithScope(value, scope);
		} else if (Array.isArray(value)) {
			extractedVariables[v] = value as Primitive[];
		}
	}
	extractedVariables = convertToDuplicatePaths(extractedVariables);
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

function convertToDuplicatePaths(current : Record<string,ConfigVariable> ){
	for(const key in current){
		if(typeof current[key] === "string"){
			const value = current[key].slice(2);
			current[key] = `$._EXTERNAL._SELF.${value}`
		}
	}
	return current;
}
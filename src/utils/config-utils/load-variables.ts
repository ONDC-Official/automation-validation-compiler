import {
	ConfigSyntax,
	ExternalDataSyntax,
	TestObjectSyntax,
} from "../../constants/syntax.js";
import { TestArray, ValidationConfig } from "../../types/config-types.js";
import { getVariablesFromTest } from "../general-utils/test-object-utils.js";

export function collectLoadData(
	tests: ValidationConfig[ConfigSyntax.Tests],
	relevantSessionData: Record<string, Record<string, string>>
) {
	function processTestObjects(api: string, testObjects: TestArray) {
		for (const testObject of testObjects) {
			// Extract variables from this testObject
			const varNames = getVariablesFromTest(testObject);

			for (const varName of varNames) {
				if (typeof testObject[varName] === "string") {
					const path = testObject[varName] as string;
					if (path.includes("_SELF")) continue;
					if (path.startsWith(`$.${ExternalDataSyntax}`)) {
						relevantSessionData[api] = relevantSessionData[api] || {};

						// avoid duplication
						const value = path.split(`$.${ExternalDataSyntax}.`)[1];
						if (relevantSessionData[api][varName] !== value) {
							relevantSessionData[api][varName] = value;
						}
					}
				}
			}

			// Recursively process return objects (if array)
			const returnObj = testObject[TestObjectSyntax.Return];
			if (Array.isArray(returnObj)) {
				processTestObjects(api, returnObj);
			}
		}
	}

	for (const api in tests) {
		processTestObjects(api, tests[api]);
	}
}

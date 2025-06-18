import { TestObject } from "../../types/config-types";
import { ErrorDefinition } from "../../types/error-codes";

export interface IValidator {
	validationPath: string;
	validate(): Promise<void>;
}

export abstract class TestObjectValidator implements IValidator {
	targetObject: TestObject;
	validationPath: string;
	abstract validate(): Promise<void>;
	constructor(testObject: TestObject, path: string) {
		this.targetObject = testObject;
		this.validationPath = path;
	}
}

export interface TestsValidatorDependencies {
	stringJsonPaths: string[];
	errorDefinitions: ErrorDefinition[];
	externalVariables: string[];
	skipJsonPathTest?: boolean;
}

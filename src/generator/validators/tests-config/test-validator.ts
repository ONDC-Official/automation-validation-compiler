import { TestObjectSyntax } from "../../../constants/syntax.js";
import { TestObject } from "../../../types/config-types.js";

import {
	TestObjectValidator,
	TestsValidatorDependencies,
} from "../abstract-validator.js";
import {
	RequiredFieldsValidator,
	NameValidator,
	ScopeValidator,
	ErrorCodeValidator,
	VariableValidator,
	ContinueValidator,
	ReturnValidator,
} from "./sub-validations.js";

export class CompleteTestObjectValidator extends TestObjectValidator {
	dependencies: TestsValidatorDependencies;
	constructor(
		testObject: TestObject,
		path: string,
		dependencies: TestsValidatorDependencies
	) {
		super(testObject, path);
		this.dependencies = dependencies;
	}
	validate = async () => {
		await new RequiredFieldsValidator(
			this.targetObject,
			this.validationPath
		).validate();
		await new NameValidator(this.targetObject, this.validationPath).validate();

		if (this.targetObject[TestObjectSyntax.Scope]) {
			await new ScopeValidator(
				this.targetObject,
				this.validationPath,
				this.dependencies.stringJsonPaths
			).validate();
		}

		if (this.targetObject[TestObjectSyntax.ErrorCode]) {
			await new ErrorCodeValidator(
				this.targetObject,
				this.validationPath,
				this.dependencies.errorDefinitions
			).validate();
		}

		await new VariableValidator(
			this.targetObject,
			this.validationPath,
			this.dependencies.stringJsonPaths,
			this.dependencies.externalVariables,
			this.dependencies.skipJsonPathTest
		).validate();
		if (this.targetObject[TestObjectSyntax.Continue]) {
			await new ContinueValidator(
				this.targetObject,
				this.validationPath
			).validate();
		}
		await new ReturnValidator(
			this.targetObject,
			this.validationPath,
			this.dependencies
		).validate();
	};
}

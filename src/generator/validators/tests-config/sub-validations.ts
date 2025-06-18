import {
	TestObjectSyntax,
	nodeReservedKeywords,
	ExternalDataSyntax,
	ConfigSyntax,
} from "../../../constants/syntax.js";
import { buildAst } from "../../../services/return-complier/ast.js";
import { checkValidVariables } from "../../../services/return-complier/ast-functions/semantic-validations.js";
import { parseReturnInput } from "../../../services/return-complier/parser.js";
import { TestObject } from "../../../types/config-types.js";
import { ErrorDefinition } from "../../../types/error-codes.js";
import {
	isSnakeCase,
	isValidVariableName,
} from "../../../utils/general-utils/string-utils.js";
import { isValidVariableValueType } from "../../../utils/general-utils/validation-utils.js";
import {
	isValidJsonPath,
	replaceBracketsWithAsteriskNested,
} from "../../../utils/json-path-utils/paths.js";
import {
	TestObjectValidator,
	TestsValidatorDependencies,
} from "../abstract-validator.js";
import { TestsValidator } from "./test-list-validator.js";
import logger from "../../../utils/logger.js";

export class RequiredFieldsValidator extends TestObjectValidator {
	validate = async () => {
		if (!this.targetObject[TestObjectSyntax.Name]) {
			throw new Error(
				`${TestObjectSyntax.Name} is required at path ${this.validationPath}`
			);
		}
		if (!this.targetObject[TestObjectSyntax.Return]) {
			throw new Error(
				`${TestObjectSyntax.Return} is required at path ${this.validationPath}`
			);
		}
	};
}

export class NameValidator extends TestObjectValidator {
	validate = async () => {
		if (typeof this.targetObject[TestObjectSyntax.Name] !== "string") {
			throw new Error(
				`${TestObjectSyntax.Name} should be a string at path ${this.validationPath}`
			);
		}
		const name = this.targetObject[TestObjectSyntax.Name];
		if (name.length < 1) {
			throw new Error(
				`${TestObjectSyntax.Name} can't be a non-empty string at path ${this.validationPath}`
			);
		}
		if (nodeReservedKeywords.has(name)) {
			throw new Error(
				`${TestObjectSyntax.Name} can't be a reserved keyword at path ${this.validationPath}`
			);
		}
		if (!isSnakeCase(name)) {
			throw new Error(
				`${TestObjectSyntax.Name} must be in snake_case at path ${this.validationPath}`
			);
		}
	};
}

export class ScopeValidator extends TestObjectValidator {
	impossiblePaths: string[];
	constructor(testObject: TestObject, path: string, impossiblePaths: string[]) {
		super(testObject, path);
		this.impossiblePaths = impossiblePaths;
	}
	validate = async () => {
		const path = this.targetObject[TestObjectSyntax.Scope];
		if (typeof path !== "string") {
			throw new Error(
				`${TestObjectSyntax.Scope} should be a string at path ${this.validationPath}`
			);
		}
		if (!isValidJsonPath(path)) {
			throw new Error(
				`${TestObjectSyntax.Scope} should be a valid json path at path ${this.validationPath}`
			);
		}
		if (!path.startsWith(`$.`)) {
			throw new Error(
				`${TestObjectSyntax.Scope} json path should start with $. at ${this.validationPath}`
			);
		}
		if (
			this.impossiblePaths.includes(replaceBracketsWithAsteriskNested(path))
		) {
			throw new Error(
				`${TestObjectSyntax.Scope} can't be a path that returns a array of string it must be a json path which returns a array of objects at path ${this.validationPath}`
			);
		}
	};
}

export class ErrorCodeValidator extends TestObjectValidator {
	possibleErrorCodes: ErrorDefinition[];
	constructor(
		testObject: TestObject,
		path: string,
		possibleErrorCodes: ErrorDefinition[]
	) {
		super(testObject, path);
		this.possibleErrorCodes = possibleErrorCodes;
	}
	validate = async () => {
		if (!this.targetObject[TestObjectSyntax.ErrorCode]) {
			return;
		}

		if (typeof this.targetObject[TestObjectSyntax.Return] !== "string") {
			throw new Error(
				`You can't define a ${TestObjectSyntax.ErrorCode} with nested ${TestObjectSyntax.Return} at path ${this.validationPath}`
			);
		}

		if (typeof this.targetObject[TestObjectSyntax.ErrorCode] !== "number") {
			throw new Error(
				`${TestObjectSyntax.ErrorCode} should be a number at path ${this.validationPath}`
			);
		}
		const errorCode = this.targetObject[TestObjectSyntax.ErrorCode];
		if (!this.possibleErrorCodes.some((code) => code.code === errorCode)) {
			throw new Error(
				`${TestObjectSyntax.ErrorCode} don't exist in error codes at path ${this.validationPath}`
			);
		}

		if (!this.targetObject[TestObjectSyntax.SuccessCode]) {
			return;
		}
		if (typeof this.targetObject[TestObjectSyntax.SuccessCode] !== "number") {
			throw new Error(
				`${TestObjectSyntax.SuccessCode} should be a number at path ${this.validationPath}`
			);
		}
	};
}

export class VariableValidator extends TestObjectValidator {
	possibleJsonPaths: string[];
	externalVariables: string[];
	skipJsonPathTest: boolean = false;
	constructor(
		testObject: TestObject,
		path: string,
		posibleJsonPaths: string[],
		externalVariables: string[],
		skipJsonPathTest: boolean = false
	) {
		super(testObject, path);
		this.externalVariables = externalVariables;
		this.possibleJsonPaths = posibleJsonPaths;
		this.skipJsonPathTest = skipJsonPathTest;
	}
	validate = async () => {
		for (const key in this.targetObject) {
			if (Object.values(TestObjectSyntax).includes(key as TestObjectSyntax)) {
				continue;
			}
			this.validateKey(key);
			const value = this.targetObject[key];
			if (!isValidVariableValueType(value)) {
				throw new Error(
					`Variable: ${key} should be a string or array of primitives at path ${this.validationPath}`
				);
			}
			if (typeof value === "string") {
				if (!isValidJsonPath(value)) {
					throw new Error(
						`Variable: ${key} should be a valid jsonPath at ${this.validationPath}`
					);
				}
				if (!value.startsWith(`$.`)) {
					throw new Error(
						`Variable: ${key} should start with $. at ${this.validationPath}`
					);
				}
				if (value.startsWith(`$.${ExternalDataSyntax}`)) {
					this.validateExternalData(value, this.externalVariables);
					return;
				}

				let path = value;
				if (this.targetObject[TestObjectSyntax.Scope]) {
					const scope = this.targetObject[TestObjectSyntax.Scope];
					const pathWithoutDollar = path.slice(2);
					path = `${scope}.${pathWithoutDollar}`;
				}
				const replaced = replaceBracketsWithAsteriskNested(path);
				if (
					!this.possibleJsonPaths.includes(replaced) &&
					!this.skipJsonPathTest
				) {
					throw new Error(
						`Variable: ${key} should be a jsonPath that returns a array of strings or the path don't exist in the schema, at ${this.validationPath} found original ${path} replaces: ${replaced}`
					);
				}
			}
		}
	};

	validateKey(key: string) {
		if (nodeReservedKeywords.has(key)) {
			throw new Error(
				`${key} can't be a reserved keyword at path ${this.validationPath}`
			);
		}
		if (key.includes(" ")) {
			throw new Error(
				`${key} can't contain spaces at path ${this.validationPath}`
			);
		}
		if (key === this.targetObject[TestObjectSyntax.Name]) {
			throw new Error(
				`${key} can't be the same as ${TestObjectSyntax.Name} at path ${this.validationPath}`
			);
		}
		if (!isValidVariableName(key)) {
			throw new Error(
				`${key} is not a valid variable name at path ${this.validationPath}`
			);
		}
	}
	validateExternalData(path: string, definedExternalValues: string[]) {
		const externalData = path.split(".")[2];
		if (!definedExternalValues.includes(externalData)) {
			throw new Error(
				`${externalData} is not defined in ${ConfigSyntax.SessionData} data at path ${this.validationPath}`
			);
		}
	}
}

export class ContinueValidator extends TestObjectValidator {
	definedVariables: string[];
	constructor(testObject: TestObject, path: string) {
		super(testObject, path);
		this.definedVariables = Object.keys(testObject).filter(
			(key) =>
				!Object.values(TestObjectSyntax).includes(key as TestObjectSyntax)
		);
	}
	validate = async () => {
		try {
			const contStatement = this.targetObject[TestObjectSyntax.Continue];
			if (typeof contStatement === "string") {
				const cst = parseReturnInput(contStatement);
				const ast = buildAst(cst);
				checkValidVariables(ast, this.definedVariables, this.validationPath);
				return;
			}
			throw new Error(
				`${TestObjectSyntax.Continue} should be a string at path ${this.validationPath}`
			);
		} catch (err: any) {
			throw new Error(err.message + " at path " + this.validationPath);
		}
	};
}

export class ReturnValidator extends TestObjectValidator {
	definedVariables: string[];
	dependencies: TestsValidatorDependencies;
	constructor(
		testObject: TestObject,
		path: string,
		dependencies: TestsValidatorDependencies
	) {
		super(testObject, path);
		this.definedVariables = Object.keys(testObject).filter(
			(key) =>
				!Object.values(TestObjectSyntax).includes(key as TestObjectSyntax)
		);
		this.dependencies = dependencies;
	}
	validate = async () => {
		try {
			const returnStatement = this.targetObject[TestObjectSyntax.Return];
			if (typeof returnStatement === "string") {
				const cst = parseReturnInput(returnStatement);
				const ast = buildAst(cst);
				checkValidVariables(ast, this.definedVariables, this.validationPath);
				return;
			}
			if (Array.isArray(returnStatement)) {
				await new TestsValidator(
					returnStatement,
					this.validationPath,
					this.dependencies
				).validate();
				return;
			}
			throw new Error(
				`${TestObjectSyntax.Return} should be a string or arrays`
			);
		} catch (err: any) {
			throw new Error(err.message + " at path " + this.validationPath);
		}
	};
}

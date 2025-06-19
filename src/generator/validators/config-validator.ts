import { ConfigSyntax } from "../../constants/syntax.js";
import { ValidationConfig } from "../../types/config-types.js";
import { ErrorDefinition } from "../../types/error-codes.js";
import { getExternalVariables } from "../../utils/general-utils/validation-utils.js";
import {
	IValidator,
	TestsValidatorDependencies,
} from "./abstract-validator.js";
import { SessionDataValidator } from "./session-data-config/session-data-validator.js";
import { TestsValidator } from "./tests-config/test-list-validator.js";

export class ConfigValidator implements IValidator {
	validationPath: string;
	config: ValidationConfig;
	stringJsonPaths: Record<string, string[]>;
	errorDefinitions: ErrorDefinition[];
	validatorSettings: {
		minimal: boolean;
	};
	constructor(
		validationPath: string,
		config: ValidationConfig,
		stringJsonPaths: Record<string, string[]>,
		errorDefinitions: ErrorDefinition[],
		settings?: {
			minimal: boolean;
		}
	) {
		this.validationPath = validationPath;
		this.config = config;
		this.stringJsonPaths = stringJsonPaths;
		this.errorDefinitions = errorDefinitions;
		if (settings) {
			this.validatorSettings = settings;
		} else {
			this.validatorSettings = {
				minimal: false,
			};
		}
	}
	validate = async () => {
		if (!this.config[ConfigSyntax.Tests])
			throw new Error(`Tests not found in config`);
		if (!this.config[ConfigSyntax.SessionData])
			throw new Error(`SessionData not found in config`);

		const sessionData = this.config[ConfigSyntax.SessionData];
		const tests = this.config[ConfigSyntax.Tests];

		await new SessionDataValidator(
			`${this.validationPath}/${ConfigSyntax.SessionData}`,
			sessionData
		).validate();

		const externalVariables = getExternalVariables(sessionData);

		for (const api in tests) {
			const testList = tests[api];
			const path = `${this.validationPath}/${ConfigSyntax.Tests}/${api}`;
			const dependencies: TestsValidatorDependencies = {
				stringJsonPaths: this.stringJsonPaths[api],
				errorDefinitions: this.errorDefinitions,
				externalVariables: externalVariables,
				minimal: this.validatorSettings.minimal,
			};
			await new TestsValidator(testList, path, dependencies).validate();
		}
	};
}

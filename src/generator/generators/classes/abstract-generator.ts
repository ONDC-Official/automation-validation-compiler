import { ValidationConfig } from "../../../types/config-types";
import { ErrorDefinition } from "../../../types/error-codes";

/*
    1. generate code for session_data 
        1. a function take in payload and update the session_data in cache
        2. get function which returns the session_data object 
    2. generate code for test-objects
        1. single test object generation
            1. handle nested 
        2. combine all the tests
*/
export type CodeGeneratorProps = {
	codeName: string;
};

export abstract class CodeGenerator {
	validationConfig: ValidationConfig;
	rootPath: string;
	errorCodes: ErrorDefinition[];
	constructor(
		validationConfig: ValidationConfig,
		errorCodes: ErrorDefinition[],
		rootPath = "./"
	) {
		this.validationConfig = validationConfig;
		this.rootPath = rootPath;
		this.errorCodes = errorCodes;
	}
	abstract generateSessionDataCode(): Promise<void>;
	abstract generateValidationCode(): Promise<void>;
	abstract generateCode(codeConfig: CodeGeneratorProps): Promise<void>;
}

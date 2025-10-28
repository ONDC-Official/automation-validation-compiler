import { ErrorDefinition } from "./error-codes";

export interface Xattributes {
	[key: string]: AttributeSet;
}
export interface AttributeSet {
	attribute_set: AttributeSection;
}
export interface Attribute {
	required?: string;
	usage?: any;
	description?: string;
	owner?: string;
	type?: string;
}
export interface AttributeSection {
	[key: string]: Attribute | AttributeSection;
}

export type BuildPath = {
	[key: string]: {
		post: {
			description: string;
			requestBody: {
				content: {
					"application/json": {
						schema: any;
					};
				};
			};
			responses: {
				default: {
					content: {
						"application/json": {
							schema: any;
						};
					};
				};
			};
		};
	};
};

export interface BUILD_TYPE {
	paths: BuildPath;
	"x-enum": any;
	"x-attributes": Xattributes;
	"x-errorcodes": {
		code: ErrorDefinition[];
	};
}

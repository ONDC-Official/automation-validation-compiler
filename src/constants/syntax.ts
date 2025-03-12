export enum TestObjectSyntax {
	Name = "_NAME_",
	Return = "_RETURN_",
	Scope = "_SCOPE_",
	Continue = "_CONTINUE_",
	ErrorCode = "_ERROR_CODE_",
	SuccessCode = "_SUCCESS_CODE_",
	Description = "_DESCRIPTION_",
}

export const ExternalDataSyntax = "_EXTERNAL";

export enum ConfigSyntax {
	Tests = "_TESTS_",
	SessionData = "_SESSION_DATA_",
}

export const ConfigKeyWords = [
	TestObjectSyntax.Name,
	TestObjectSyntax.Return,
	TestObjectSyntax.Scope,
	TestObjectSyntax.Continue,
	TestObjectSyntax.ErrorCode,
	TestObjectSyntax.SuccessCode,
	ConfigSyntax.Tests,
	ConfigSyntax.SessionData,
];

// JavaScript/Node.js keywords
export const nodeReservedKeywords = new Set([
	"break",
	"case",
	"catch",
	"class",
	"const",
	"continue",
	"debugger",
	"default",
	"delete",
	"do",
	"else",
	"export",
	"extends",
	"finally",
	"for",
	"function",
	"if",
	"import",
	"in",
	"instanceof",
	"let",
	"new",
	"return",
	"super",
	"switch",
	"this",
	"throw",
	"try",
	"typeof",
	"var",
	"void",
	"while",
	"with",
	"yield",

	// Additional Node.js/ECMAScript-specific keywords
	"async",
	"await",
	"arguments",
	"eval",
	"of",

	// Reserved but may not yet be used in JavaScript
	"enum",
	"implements",
	"interface",
	"package",
	"private",
	"protected",
	"public",
	"static",
]);

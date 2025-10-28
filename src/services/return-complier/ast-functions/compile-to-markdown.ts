import logger from "../../../utils/logger.js";
import {
	AstNode,
	BinaryOperatorNode,
	CustomBinaryFunction,
	CustomUniaryFunction,
	NotOperatorNode,
	ReturnStatementNode,
} from "../ast.js";
import {
	AllIn,
	AnyIn,
	AreUnique,
	ArePresent,
	EqualTo,
	FollowRegex,
	GreaterThan,
	LessThan,
	NoneIn,
} from "../tokens.js";

/**
 * Leaf (unary/binary) message templates, rewritten to be short & human-friendly.
 * NOTE: We keep triple-mustaches so Mustache can expand safely.
 */
const uniaryMessages = {
	[AreUnique.LABEL ?? "are unique"]: (variable: string, forNot: boolean) =>
		`All values of {{{${variable}}}} ${forNot ? "must **not** be unique" : "are unique"}`,
	[ArePresent.LABEL ?? "are present"]: (variable: string, forNot: boolean) =>
		`{{{${variable}}}} ${forNot ? "must **not** be present" : "must be present"} in the payload`,
};

/**
 * Skip-specific message templates for more natural language in skip conditions
 */
const skipUniaryMessages = {
	[AreUnique.LABEL ?? "are unique"]: (variable: string, forNot: boolean) =>
		`{{{${variable}}}} values ${forNot ? "are not unique" : "are unique"}`,
	[ArePresent.LABEL ?? "are present"]: (variable: string, forNot: boolean) =>
		`{{{${variable}}}} ${forNot ? "is not in the payload" : "is in the payload"}`,
};

const binaryMessages = {
	[AllIn.LABEL ?? "all in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "Not all" : "All"} elements of {{{${lhs}}}} ${forNot ? "may be" : "must be"} in {{{${rhs}}}}`,
	[AnyIn.LABEL ?? "any in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "None of" : "At least one of"} {{{${lhs}}}} ${forNot ? "may be" : "must be"} in {{{${rhs}}}}`,
	[FollowRegex.LABEL ?? "follow regex"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`${forNot ? "Some elements of" : "All elements of"} {{{${lhs}}}} ${forNot ? "may fail to" : "must"} follow every regex in {{{${rhs}}}}`,
	[NoneIn.LABEL ?? "none in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "Some elements of" : "No element of"} {{{${lhs}}}} ${forNot ? "may be in" : "must be in"} {{{${rhs}}}}`,
	[EqualTo.LABEL ?? "equal to"]: (lhs: string, rhs: string, forNot: boolean) =>
		`{{{${lhs}}}} ${forNot ? "must **not** equal" : "must equal"} {{{${rhs}}}}`,
	[GreaterThan.LABEL ?? "greater than"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`{{{${lhs}}}} ${forNot ? "must **not** be greater than" : "must be greater than"} {{{${rhs}}}}`,
	[LessThan.LABEL ?? "less than"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`{{{${lhs}}}} ${forNot ? "must **not** be less than" : "must be less than"} {{{${rhs}}}}`,
};

/**
 * Skip-specific binary message templates for more natural language in skip conditions
 */
const skipBinaryMessages = {
	[AllIn.LABEL ?? "all in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "not all" : "all"} elements of {{{${lhs}}}} are in {{{${rhs}}}}`,
	[AnyIn.LABEL ?? "any in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "none of" : "any of"} {{{${lhs}}}} are in {{{${rhs}}}}`,
	[FollowRegex.LABEL ?? "follow regex"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`{{{${lhs}}}} ${forNot ? "doesn't follow" : "follows"} regex {{{${rhs}}}}`,
	[NoneIn.LABEL ?? "none in"]: (lhs: string, rhs: string, forNot: boolean) =>
		`${forNot ? "some" : "none"} of {{{${lhs}}}} are in {{{${rhs}}}}`,
	[EqualTo.LABEL ?? "equal to"]: (lhs: string, rhs: string, forNot: boolean) =>
		`{{{${lhs}}}} ${forNot ? "is not equal to" : "equals"} {{{${rhs}}}}`,
	[GreaterThan.LABEL ?? "greater than"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`{{{${lhs}}}} ${forNot ? "is not greater than" : "is greater than"} {{{${rhs}}}}`,
	[LessThan.LABEL ?? "less than"]: (
		lhs: string,
		rhs: string,
		forNot: boolean
	) =>
		`{{{${lhs}}}} ${forNot ? "is not less than" : "is less than"} {{{${rhs}}}}`,
};

/**
 * Public API: Compile an AST to *readable* Markdown with:
 * - No pointer numbering (no 1.1.1)
 * - Natural language groups ("All of the following…" / "Any of these…")
 * - Leaves rendered as short sentences
 *
 * @param ast
 * @param topLevel Whether this is the very first group under the title
 * @param depth    Controls bullet/indent
 * @param forNot   Carries NOT (!) context downward
 */
export function CompileToMarkdown(
	ast: AstNode,
	topLevel: boolean = true,
	depth: number = 0,
	forNot: boolean = false
): string {
	return compileToMarkdownInternal(ast, topLevel, depth, forNot, false);
}

/**
 * Skip-specific version: Compile an AST to *readable* Markdown for skip conditions with:
 * - More natural language ("{{lhs}} is not in the payload" instead of "{{lhs}} must not be present")
 * - Simpler phrasing suitable for skip conditions
 *
 * @param ast
 * @param topLevel Whether this is the very first group under the title
 * @param depth    Controls bullet/indent
 * @param forNot   Carries NOT (!) context downward
 */
export function CompileToMarkdownForSkip(
	ast: AstNode,
	topLevel: boolean = true,
	depth: number = 0,
	forNot: boolean = false
): string {
	return compileToMarkdownInternal(ast, topLevel, depth, forNot, true);
}

/**
 * Internal implementation shared by both CompileToMarkdown and CompileToMarkdownForSkip
 */
function compileToMarkdownInternal(
	ast: AstNode,
	topLevel: boolean = true,
	depth: number = 0,
	forNot: boolean = false,
	isSkip: boolean = false
): string {
	const indent = "  ".repeat(depth);

	// Render a group label (AND/OR) with correct style.
	function groupLabel(isAnd: boolean, asBullet: boolean, indentStr: string) {
		const label = isAnd
			? "**All of the following must be true:**"
			: "**Any of these must be true:**";
		return asBullet ? `${indentStr}- ${label}` : `${indentStr}${label}`;
	}

	// Ensure each line in a block is indented (used for nested groups).
	function indentBlock(block: string, extraDepth = 1): string {
		const pad = "  ".repeat(extraDepth);
		return block
			.split("\n")
			.map((l) => (l.length ? pad + l : l))
			.join("\n");
	}

	// RETURN: just compile its expression at same depth/topLevel
	if (ast.type === "returnStatement") {
		const ret = ast as ReturnStatementNode;
		return compileToMarkdownInternal(
			ret.expression,
			topLevel,
			depth,
			forNot,
			isSkip
		);
	}

	// AND / OR group
	if (ast.type === "binaryOperator") {
		const { operator, lhs, rhs } = ast as BinaryOperatorNode;
		const isAnd = operator === "&&";
		const labelLine = groupLabel(isAnd, !topLevel, indent);

		// Render children as bullet items (no numbering)
		const leftRendered = compileToMarkdownInternal(
			lhs,
			false,
			depth + 1,
			forNot,
			isSkip
		);
		const rightRendered = compileToMarkdownInternal(
			rhs,
			false,
			depth + 1,
			forNot,
			isSkip
		);

		// If top-level group: label as standalone line, then list items
		// If nested: label as bullet, then nested bullets further indented
		if (topLevel) {
			return [labelLine, leftRendered, rightRendered].join("\n");
		} else {
			return [labelLine, leftRendered, rightRendered].join("\n");
		}
	}

	// NOT
	if (ast.type === "notOperator") {
		const not = ast as NotOperatorNode;
		return compileToMarkdownInternal(
			not.expression,
			topLevel,
			depth,
			!forNot,
			isSkip
		);
	}

	// LEAVES (unary / binary custom functions)
	if (ast.type === "customUniaryFunction") {
		const custom = ast as CustomUniaryFunction;
		const fn = custom.customFunction;
		const lhs = custom.expression;
		const msgFn = isSkip
			? skipUniaryMessages[fn as keyof typeof skipUniaryMessages]
			: uniaryMessages[fn as keyof typeof uniaryMessages];
		return `${indent}- ${msgFn(lhs.name, forNot)}`;
	}

	if (ast.type === "customBinaryFunction") {
		const custom = ast as CustomBinaryFunction;
		const fn = custom.customFunction;
		const lhs = custom.lhs;
		const rhs = custom.rhs;
		const msgFn = isSkip
			? skipBinaryMessages[fn as keyof typeof skipBinaryMessages]
			: binaryMessages[fn as keyof typeof binaryMessages];
		return `${indent}- ${msgFn(lhs.name, rhs.name, forNot)}`;
	}

	throw new Error("Invalid AST node:" + JSON.stringify(ast));
}

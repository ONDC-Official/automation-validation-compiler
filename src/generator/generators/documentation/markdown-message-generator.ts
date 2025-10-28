import {
	CompileToMarkdown,
	CompileToMarkdownForSkip,
} from "../../../services/return-complier/ast-functions/compile-to-markdown.js";
import { buildAstFromInput } from "../../../services/return-complier/combined.js";
import { TestObject } from "../../../types/config-types.js";
import Mustache from "mustache";
import {
	addBlockquoteToMarkdown,
	addTabToMarkdown,
	ConvertArrayToStringsInTestObject,
} from "../../../utils/general-utils/string-utils.js";
import { TestObjectSyntax } from "../../../constants/syntax.js";

/**
 * Generates the human-friendly Markdown doc:
 * - Title: "### Validation: <NAME>"
 * - Body:  top-level AND/OR group (no 1.1.1 pointers)
 * - Skip:  blockquoted "Skip if:" with a unified "Any of these are true:" list
 */
export function markdownMessageGenerator(
	returnInput: string,
	variableValues: TestObject,
	startingPointer: string,
	skipInput?: string[]
) {
	const ast = buildAstFromInput(returnInput);

	const returnTemplate = variableValues[TestObjectSyntax.Description]
		? variableValues[TestObjectSyntax.Description]
		: CompileToMarkdown(ast, /*topLevel*/ true, /*depth*/ 0, /*forNot*/ false);

	let finalReturn =
		`#### **${startingPointer}**\n\n` +
		Mustache.render(
			returnTemplate,
			ConvertArrayToStringsInTestObject(variableValues)
		);

	if (skipInput && skipInput.length > 0) {
		let skipMarkdown = `**Skip if:**\n`;

		for (const expr of skipInput) {
			const skAst = buildAstFromInput(expr);
			const skBlock = CompileToMarkdownForSkip(
				skAst,
				/*topLevel*/ false,
				/*depth*/ 2,
				/*forNot*/ false
			);
			skipMarkdown += `\n${skBlock}`;
		}

		// ✅ Render the skip section with Mustache so {{{attr}}} etc. interpolate
		const renderedSkip = Mustache.render(
			skipMarkdown,
			ConvertArrayToStringsInTestObject(variableValues)
		);

		const blockSkip = addBlockquoteToMarkdown(renderedSkip);
		finalReturn += `\n\n${blockSkip}`;
	}

	return finalReturn;
}

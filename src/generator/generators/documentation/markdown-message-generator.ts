import { CompileToMarkdown } from "../../../services/return-complier/ast-functions/compile-to-markdown.js";
import { buildAstFromInput } from "../../../services/return-complier/combined.js";
import { TestObject } from "../../../types/config-types.js";
import Mustache from "mustache";
import {
	addBlockquoteToMarkdown,
	addTabToMarkdown,
	ConvertArrayToStringsInTestObject,
} from "../../../utils/general-utils/string-utils.js";
import { TestObjectSyntax } from "../../../constants/syntax.js";

export function markdownMessageGenerator(
	returnInput: string,
	variableValues: TestObject,
	startingPointer: string,
	skipInput?: string[]
) {
	const ast = buildAstFromInput(returnInput);
	const returnTemplate = variableValues[TestObjectSyntax.Description]
		? variableValues[TestObjectSyntax.Description]
		: CompileToMarkdown(ast, startingPointer, 0, false);

	let finalReturn = Mustache.render(
		returnTemplate,
		ConvertArrayToStringsInTestObject(variableValues)
	);
	if (skipInput) {
		let skipMarkdown = `Note: **Condition ${startingPointer}** can be skipped if the following conditions are met:`;
		const letters = "BCDEFGHIJKLMNOPQRSTUVWXYZ";
		let index = 0;
		for (const skip of skipInput) {
			const skipAst = buildAstFromInput(skip);
			const skipTemplate = CompileToMarkdown(skipAst, letters[index], 0, false);
			const finalSkip = Mustache.render(
				skipTemplate,
				ConvertArrayToStringsInTestObject(variableValues)
			);
			skipMarkdown += `\n\n${finalSkip}`;
			index++;
		}
		const blockSkip = addTabToMarkdown(addBlockquoteToMarkdown(skipMarkdown));
		finalReturn += `\n\n${blockSkip}`;
	}

	return finalReturn;
}

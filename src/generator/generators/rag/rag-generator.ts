import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import { TestObject } from "../../../types/config-types.js";
import {
    CodeGenerator,
    CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";
import { buildAstFromInput } from "../../../services/return-complier/combined.js";
import { CompileToMarkdownForSkip } from "../../../services/return-complier/ast-functions/compile-to-markdown.js";
import {
    addBlockquoteToMarkdown,
    ConvertArrayToStringsInTestObject,
} from "../../../utils/general-utils/string-utils.js";
import Mustache from "mustache";

/**
 * RagGenerator — produces one Markdown file per API action under ./rag-docs/.
 *
 * Each file is a self-contained, richly structured document intended to be
 * fed directly into a Retrieval-Augmented Generation (RAG) pipeline.
 *
 * Layout per file:
 *   ---
 *   YAML frontmatter (action, codeName, numTests, generated date)
 *   ---
 *   # <codeName> — <action> Validations
 *   Short context paragraph
 *   Numbered list of every test with its human-readable description,
 *   error code, scope, and (indented) skip condition when present.
 */
export class RagGenerator extends CodeGenerator {
    generateSessionDataCode(): Promise<void> {
        // Session-data code not needed for RAG output
        return Promise.resolve();
    }

    generateUnitTestingCode(): Promise<void> {
        // Unit-test code not needed for RAG output
        return Promise.resolve();
    }

    generateValidationCode = async (): Promise<void> => {
        // Driven by generateCode
    };

    generateCode = async (codeConfig: CodeGeneratorProps): Promise<void> => {
        const testConfig = this.validationConfig[ConfigSyntax.Tests];
        const { codeName } = codeConfig;

        for (const action of Object.keys(testConfig)) {
            const testArray = testConfig[action];
            const md = this.buildActionMarkdown(action, codeName, testArray);
            writeFileWithFsExtra(this.rootPath, `./rag-docs/${action}.md`, md);
        }
    };

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    private buildActionMarkdown(
        action: string,
        codeName: string,
        testArray: TestObject[],
    ): string {
        const leafCount = this.countLeafTests(testArray);
        const dateStr = new Date().toISOString().split("T")[0];

        // YAML front-matter — picked up as metadata by most RAG loaders
        const frontmatter = [
            "---",
            `action: ${action}`,
            `codeName: ${codeName}`,
            `numTests: ${leafCount}`,
            `generated: ${dateStr}`,
            "---",
        ].join("\n");

        // Human-readable header
        const header = [
            `# ${codeName} — \`${action}\` Validations`,
            "",
            `This document describes the **${leafCount}** validation rule(s) that are`,
            `applied when the \`${action}\` API call is processed in the **${codeName}** flow.`,
            `Each rule maps to a single test object and is evaluated sequentially against the`,
            `request/response payload.`,
            "",
            "---",
            "",
        ].join("\n");

        // One numbered ## section per top-level test object only.
        // Group nodes embed their children as ### sub-sections inside themselves.
        const sections = testArray
            .map((test, idx) => this.buildTestSection(test, idx + 1))
            .join("\n\n");

        return `${frontmatter}\n\n${header}${sections}\n`;
    }

    /** Count only leaf (non-group) tests recursively. */
    private countLeafTests(tests: TestObject[]): number {
        let count = 0;
        for (const test of tests) {
            const ret = test[TestObjectSyntax.Return];
            if (typeof ret === "string") {
                count++;
            } else {
                count += this.countLeafTests(ret);
            }
        }
        return count;
    }

    /**
     * Renders a numbered top-level section (##) for a test object.
     *
     * - Leaf test  → full human-readable description + metadata badges
     * - Group node → brief intro line + all children rendered as ### sub-sections
     *                (recursing further for deeply nested groups)
     *
     * This preserves the parent→child relationship in the output so RAG
     * consumers can see exactly which sub-validations belong to which group.
     */
    private buildTestSection(test: TestObject, index: number): string {
        const name = test[TestObjectSyntax.Name] ?? `test_${index}`;
        const ret = test[TestObjectSyntax.Return];

        if (typeof ret === "string") {
            return this.renderLeaf(test, name, `## ${index}. ${name}`);
        }

        // Group node — render intro + skip (before children) then nest children
        const childSections = ret
            .map((child, i) => this.renderChildSection(child, i + 1, "###"))
            .join("\n\n");

        const groupSkip = this.renderSkipBlock(test);

        return [
            `## ${index}. ${name}`,
            "",
            `Group of **${ret.length}** sub-validation(s). **All** of the following must pass:`,
            ...(groupSkip ? ["", groupSkip] : []),
            "",
            childSections,
        ].join("\n");
    }

    /**
     * Renders a child/nested section at the given heading level.
     * Recurses deeper (####, #####, …) for nested groups.
     */
    private renderChildSection(
        test: TestObject,
        index: number,
        headingLevel: string,
    ): string {
        const name = test[TestObjectSyntax.Name] ?? `sub_test_${index}`;
        const ret = test[TestObjectSyntax.Return];
        const heading = `${headingLevel} ${index}. ${name}`;

        if (typeof ret === "string") {
            return this.renderLeaf(test, name, heading);
        }

        // Nested group — go one heading level deeper
        const nextLevel = headingLevel + "#";
        const childSections = ret
            .map((child, i) => this.renderChildSection(child, i + 1, nextLevel))
            .join("\n\n");

        const groupSkip = this.renderSkipBlock(test);

        return [
            heading,
            "",
            `Group of **${ret.length}** sub-validation(s). **All** of the following must pass:`,
            ...(groupSkip ? ["", groupSkip] : []),
            "",
            childSections,
        ].join("\n");
    }

    /**
     * Renders the skip block for a group node as a blockquote.
     * Returns an empty string when there is no _CONTINUE_ on this node.
     */
    private renderSkipBlock(test: TestObject): string {
        const skip = test[TestObjectSyntax.Continue];
        if (!skip) return "";
        let skipMarkdown = `**Skip if:**\n`;
        const skAst = buildAstFromInput(skip);
        const skBlock = CompileToMarkdownForSkip(skAst, false, 2, false);
        skipMarkdown += `\n${skBlock}`;
        const rendered = Mustache.render(
            skipMarkdown,
            ConvertArrayToStringsInTestObject(test),
        );
        return addBlockquoteToMarkdown(rendered);
    }

    /** Renders a leaf test's heading, metadata badges, and compiled description. */
    private renderLeaf(
        test: TestObject,
        name: string,
        heading: string,
    ): string {
        const scope = test[TestObjectSyntax.Scope];
        const errorCode = test[TestObjectSyntax.ErrorCode];
        const successCode = test[TestObjectSyntax.SuccessCode];
        const skip = test[TestObjectSyntax.Continue];
        const ret = test[TestObjectSyntax.Return] as string;

        const badges: string[] = [];
        if (scope) badges.push(`**Scope:** \`${scope}\``);
        if (errorCode !== undefined)
            badges.push(`**Error Code:** \`${errorCode}\``);
        if (successCode !== undefined)
            badges.push(`**Success Code:** \`${successCode}\``);

        const badgeLine = badges.length > 0 ? badges.join(" · ") + "\n\n" : "";

        const body = markdownMessageGenerator(
            ret,
            test,
            name,
            skip ? [skip] : undefined,
        );

        return `${heading}\n\n${badgeLine}${body}`;
    }
}

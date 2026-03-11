import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import { TestObject } from "../../../types/config-types.js";
import {
    CodeGenerator,
    CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";

/**
 * RagGenerator — produces one richly structured Markdown file per API action
 * under `./rag-docs/`, designed for direct RAG pipeline ingestion.
 *
 * Format:
 *   ---
 *   YAML frontmatter (action, codeName, numTests, generated, domain, version)
 *   ---
 *   # Heading + context paragraph
 *
 *   ## TOP_LEVEL_GROUP
 *   Prose intro listing child names, scope, skip condition.
 *   ---
 *   ### CHILD_GROUP
 *   **LEAF_NAME**
 *   `group: PATH | type: leaf | error_code: X`
 *
 *   - bullet description lines
 *   - Skipped if ...
 */
export class RagGenerator extends CodeGenerator {
    generateSessionDataCode(): Promise<void> {
        return Promise.resolve();
    }

    generateUnitTestingCode(): Promise<void> {
        return Promise.resolve();
    }

    generateValidationCode = async (): Promise<void> => {};

    generateCode = async (codeConfig: CodeGeneratorProps): Promise<void> => {
        const testConfig = this.validationConfig[ConfigSyntax.Tests];
        const { codeName } = codeConfig;

        for (const action of Object.keys(testConfig)) {
            const testArray = testConfig[action];
            const md = this.buildActionMarkdown(
                action,
                codeName,
                testArray,
                codeConfig,
            );
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
        codeConfig: CodeGeneratorProps,
    ): string {
        const leafCount = this.countLeafTests(testArray);
        const topCount = testArray.length;
        const dateStr = new Date().toISOString().split("T")[0];

        const domainText = Array.isArray(codeConfig.domain)
            ? codeConfig.domain.join(", ")
            : (codeConfig.domain ?? "");

        const fmLines: string[] = [
            "---",
            `action: ${action}`,
            `codeName: ${codeName}`,
            `numTests: ${leafCount}`,
            `generated: ${dateStr}`,
        ];
        if (domainText) fmLines.push(`domain: ${domainText}`);
        if (codeConfig.version) fmLines.push(`version: ${codeConfig.version}`);
        fmLines.push("---");
        const frontmatter = fmLines.join("\n");

        const header = [
            `# ${codeName} — \`${action}\` Validations`,
            "",
            `These are the validation rules applied when processing the \`${action}\` API call in the ${codeName} flow.`,
            `There are **${leafCount}** validation rules organized into **${topCount}** top-level group(s).`,
            "",
            "---",
            "",
        ].join("\n");

        const sections = testArray
            .map((test) => this.buildTopLevelSection(test))
            .join("\n\n---\n\n");

        return `${frontmatter}\n\n${header}${sections}\n`;
    }

    /** Counts leaf (non-group) tests recursively. */
    private countLeafTests(tests: TestObject[]): number {
        let count = 0;
        for (const t of tests) {
            const ret = t[TestObjectSyntax.Return];
            count +=
                typeof ret === "string"
                    ? 1
                    : this.countLeafTests(ret as TestObject[]);
        }
        return count;
    }

    /** Formats a list of names as English prose: "A, B, and C". */
    private englishList(names: string[]): string {
        if (names.length === 0) return "";
        if (names.length === 1) return names[0];
        if (names.length === 2) return `${names[0]} and ${names[1]}`;
        return (
            names.slice(0, -1).join(", ") + ", and " + names[names.length - 1]
        );
    }

    /**
     * Top-level `##` section.
     * - Leaf  → `## NAME` + metadata line + body
     * - Group → `## NAME` + prose intro + `---` + children
     */
    private buildTopLevelSection(test: TestObject): string {
        const name = test[TestObjectSyntax.Name] ?? "unknown";
        const ret = test[TestObjectSyntax.Return];

        if (typeof ret === "string") {
            const body = this.renderLeafBody(test, "top-level", false);
            return [`## ${name}`, "", body].join("\n");
        }

        return this.renderGroupSection(test, name, "##", "###", []);
    }

    /**
     * Renders a group section recursively.
     * @param headingLevel  Markdown heading for this group node (e.g. "##")
     * @param childLevel    Markdown heading for its direct children (e.g. "###")
     * @param ancestorPath  Names of ancestor groups, used to build breadcrumbs
     */
    private renderGroupSection(
        test: TestObject,
        name: string,
        headingLevel: string,
        childLevel: string,
        ancestorPath: string[],
    ): string {
        const ret = test[TestObjectSyntax.Return] as TestObject[];
        const skip = test[TestObjectSyntax.Continue];
        const scope = test[TestObjectSyntax.Scope];

        const childNames = ret.map(
            (c: TestObject) => c[TestObjectSyntax.Name] ?? "?",
        );
        const leafCount = this.countLeafTests(ret);
        const allLeaves = ret.every(
            (c) => typeof c[TestObjectSyntax.Return] === "string",
        );

        // Prose intro sentence
        const introParts: string[] = [];
        if (allLeaves) {
            introParts.push(
                `This is a group of **${leafCount}** sub-validation(s) that all must pass: ` +
                    `${this.englishList(childNames)}.`,
            );
        } else {
            introParts.push(
                `This group contains **${ret.length}** sub-group(s)/validation(s): ` +
                    `${this.englishList(childNames)}.`,
            );
        }
        if (scope) {
            introParts.push(
                `It validates the \`${scope}\` path in the payload.`,
            );
        }
        const introLine = introParts.join(" ");

        // Skip block for the group itself (blockquote, before children)
        let skipBlock = "";
        if (skip) {
            skipBlock = this.renderSkipInlineBullet(test, skip);
        }

        // Render children
        const currentPath = [...ancestorPath, name];
        const grandChildLevel = childLevel + "#";

        const childSections = ret
            .map((child: TestObject) => {
                const childName = child[TestObjectSyntax.Name] ?? "unknown";
                const childRet = child[TestObjectSyntax.Return];

                if (typeof childRet === "string") {
                    return this.renderLeafBody(child, currentPath.join(" > "));
                }

                return this.renderGroupSection(
                    child,
                    childName,
                    childLevel,
                    grandChildLevel,
                    currentPath,
                );
            })
            .join("\n\n");

        return [
            `${headingLevel} ${name}`,
            "",
            introLine,
            ...(skipBlock ? ["", skipBlock] : []),
            "",
            "---",
            "",
            childSections,
        ].join("\n");
    }

    /**
     * Renders a leaf node's full content block:
     *   **NAME**
     *   `group: PATH | type: leaf | error_code: X`
     *
     *   - bullet description lines
     *   - Skipped if ...  (inline, from markdownMessageGenerator)
     */
    private renderLeafBody(
        test: TestObject,
        groupPath: string,
        showBoldName = true,
    ): string {
        const name = test[TestObjectSyntax.Name] ?? "unknown";
        const scope = test[TestObjectSyntax.Scope];
        const errorCode = test[TestObjectSyntax.ErrorCode];
        const successCode = test[TestObjectSyntax.SuccessCode];
        const skip = test[TestObjectSyntax.Continue];
        const ret = test[TestObjectSyntax.Return] as string;

        // Metadata inline-code line
        const metaParts: string[] = [`group: ${groupPath}`, `type: leaf`];
        if (scope) metaParts.push(`scope: ${scope}`);
        if (errorCode !== undefined) metaParts.push(`error_code: ${errorCode}`);
        if (successCode !== undefined)
            metaParts.push(`success_code: ${successCode}`);
        const metaLine = `\`${metaParts.join(" | ")}\``;

        // Get bullet-point body from compiler; strip the "#### **name**\n\n" heading.
        let bodyContent: string;
        try {
            const full = markdownMessageGenerator(
                ret,
                test,
                name,
                skip ? [skip] : undefined,
            );
            bodyContent = full
                .replace(/^#{1,6}\s+\*\*[^*]+\*\*\s*\n\n?/, "")
                .trim();
        } catch {
            bodyContent = `- ${ret}`;
            if (skip) bodyContent += `\n- Skipped if: ${skip}`;
        }

        return showBoldName
            ? [`**${name}**`, metaLine, "", bodyContent].join("\n")
            : [metaLine, "", bodyContent].join("\n");
    }

    /**
     * Renders a group's skip condition as a blockquote paragraph.
     * Uses markdownMessageGenerator to compile the JVAL expression.
     */
    private renderSkipInlineBullet(test: TestObject, skip: string): string {
        try {
            const full = markdownMessageGenerator(
                skip,
                test,
                "skip",
                undefined,
            );
            const body = full
                .replace(/^#{1,6}\s+\*\*[^*]+\*\*\s*\n\n?/, "")
                .trim();
            return `> **Skip if:**\n> ${body.replace(/\n/g, "\n> ")}`;
        } catch {
            return `> **Skip if:** ${skip}`;
        }
    }
}

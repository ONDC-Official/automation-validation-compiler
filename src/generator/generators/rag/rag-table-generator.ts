import { ConfigSyntax, TestObjectSyntax } from "../../../constants/syntax.js";
import { TestObject } from "../../../types/config-types.js";
import {
    CodeGenerator,
    CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeFileWithFsExtra } from "../../../utils/fs-utils.js";
import { markdownMessageGenerator } from "../documentation/markdown-message-generator.js";

/**
 * A single row in the output table.
 * `rowType` distinguishes group summary rows from leaf test rows so they
 * can be rendered differently (bold name, italic description, etc.).
 */
type TableRow = {
    index: number;
    rowType: "group" | "leaf";
    name: string;
    /** Ancestry chain, e.g. "order_validations > fulfillment_checks" */
    group: string;
    scope: string;
    description: string;
    skipIf: string;
    errorCode: string;
    successCode: string;
};

/**
 * JSON shape for a single action's table data written to raw_table.json.
 */
type RawTableAction = {
    action: string;
    codeName: string;
    numLeafTests: number;
    generated: string;
    rows: Omit<TableRow, "index">[];
};

/**
 * RagTableGenerator — produces one Markdown **table** file per API action
 * under `./rag-table-docs/`.
 *
 * Each file contains:
 *   - YAML front-matter (action, codeName, numTests, generated date)
 *   - A short summary paragraph
 *   - A single GFM table
 *
 * Columns: # | Type | Test Name | Group | Scope | Description | Skip If | Error Code
 *
 * Group nodes ARE rendered as their own rows. Their Description cell lists
 * the immediate child test names and their Skip If cell shows the group's own
 * _CONTINUE_ condition.  Child leaf rows follow immediately after, with the
 * Group column showing their parent's name — making hierarchy fully visible.
 *
 * This format is complementary to `RagGenerator` (heading-based): use it
 * when you need a dense, scannable overview of all rules at once.
 */
export class RagTableGenerator extends CodeGenerator {
    generateSessionDataCode(): Promise<void> {
        return Promise.resolve();
    }

    generateUnitTestingCode(): Promise<void> {
        return Promise.resolve();
    }

    generateValidationCode = async (): Promise<void> => {
        // Driven by generateCode
    };

    generateCode = async (codeConfig: CodeGeneratorProps): Promise<void> => {
        const testConfig = this.validationConfig[ConfigSyntax.Tests];
        const { codeName } = codeConfig;

        const rawJson: Record<string, RawTableAction> = {};

        for (const action of Object.keys(testConfig)) {
            const testArray = testConfig[action];
            const md = this.buildActionMarkdown(
                action,
                codeName,
                testArray,
                codeConfig,
            );
            writeFileWithFsExtra(
                this.rootPath,
                `./rag-table-docs/${action}.md`,
                md,
            );
            rawJson[action] = this.buildActionJson(action, codeName, testArray);
        }

        writeFileWithFsExtra(
            this.rootPath,
            `./rag-table-docs/raw_table.json`,
            JSON.stringify(rawJson, null, 2),
        );
    };

    // -------------------------------------------------------------------------
    // Private helpers
    // -------------------------------------------------------------------------

    /** Collects rows and returns structured JSON for one action. */
    private buildActionJson(
        action: string,
        codeName: string,
        testArray: TestObject[],
    ): RawTableAction {
        const rows: TableRow[] = [];
        this.collectRows(testArray, rows, "");
        rows.forEach((r, i) => (r.index = i + 1));

        return {
            action,
            codeName,
            numLeafTests: rows.filter((r) => r.rowType === "leaf").length,
            generated: new Date().toISOString().split("T")[0],
            rows: rows.map(({ index: _idx, ...rest }) => rest),
        };
    }

    public buildActionMarkdown(
        action: string,
        codeName: string,
        testArray: TestObject[],
        codeConfig: CodeGeneratorProps,
    ): string {
        const rows: TableRow[] = [];
        this.collectRows(testArray, rows, "");

        // Re-index after collection so numbering is clean
        rows.forEach((r, i) => (r.index = i + 1));

        const dateStr = new Date().toISOString().split("T")[0];

        const domainText = Array.isArray(codeConfig.domain)
            ? codeConfig.domain.join(", ")
            : (codeConfig.domain ?? "-");

        const frontmatter = [
            "---",
            `action: ${action}`,
            `codeName: ${codeName}`,
            `numTests: ${rows.length}`,
            `generated: ${dateStr}`,
            `domain: ${domainText}`,
            `version: ${codeConfig.version ?? "-"}`,
            "---",
        ].join("\n");

        const leafCount = rows.filter((r) => r.rowType === "leaf").length;
        const header = [
            `# ${codeName} — \`${action}\` Validations (Table View)`,
            "",
            `**${leafCount}** leaf validation rule(s) applied to \`${action}\` in the **${codeName}** flow.`,
            `Domain: \`${domainText}\`, Version: \`${codeConfig.version ?? "-"}\``,
            `Group rows (GRP) list their immediate sub-tests. Leaf rows (LF) show the actual validation logic.`,
            "",
            "---",
            "",
        ].join("\n");

        const table = this.renderTable(rows);

        return `${frontmatter}\n\n${header}${table}\n`;
    }

    /**
     * Walks the test tree depth-first.
     *
     * - **Group node** → emits one summary row whose Description lists the
     *   immediate child names, and whose Skip If shows the group's own
     *   _CONTINUE_. Then recurses so children follow immediately after.
     * - **Leaf node** → emits one row with the compiled description and its
     *   own _CONTINUE_ only (no skip inheritance from parents).
     */
    private collectRows(
        tests: TestObject[],
        acc: TableRow[],
        parentPath: string,
    ): void {
        for (const test of tests) {
            const name = test[TestObjectSyntax.Name] ?? "unknown";
            const ret = test[TestObjectSyntax.Return];
            const ownSkip = test[TestObjectSyntax.Continue];

            if (typeof ret === "string") {
                // ── Leaf row ──────────────────────────────────────────────
                const scope = test[TestObjectSyntax.Scope] ?? "";
                const errorCode = test[TestObjectSyntax.ErrorCode] ?? "30000";
                const successCode = test[TestObjectSyntax.SuccessCode];

                let description: string;
                try {
                    description = markdownMessageGenerator(
                        ret,
                        test,
                        name,
                        undefined,
                    )
                        .replace(/^#{1,6}\s+\*\*[^*]+\*\*\s*\n\n?/, "")
                        .trim();
                } catch {
                    description = ret;
                }

                let skipText = "";
                if (ownSkip) {
                    try {
                        skipText = markdownMessageGenerator(
                            ownSkip,
                            test,
                            name,
                            undefined,
                        )
                            .replace(/^#{1,6}\s+\*\*[^*]+\*\*\s*\n\n?/, "")
                            .trim();
                    } catch {
                        skipText = ownSkip;
                    }
                }

                acc.push({
                    index: acc.length + 1,
                    rowType: "leaf",
                    name,
                    group: parentPath,
                    scope: scope ? `\`${scope}\`` : "",
                    description: this.sanitizeCell(description),
                    skipIf: this.sanitizeCell(skipText),
                    errorCode: errorCode !== undefined ? String(errorCode) : "",
                    successCode:
                        successCode !== undefined ? String(successCode) : "",
                });
            } else {
                // ── Group row ─────────────────────────────────────────────
                const childNames = ret
                    .map((c) => c[TestObjectSyntax.Name] ?? "?")
                    .join(", ");

                let skipText = "";
                if (ownSkip) {
                    try {
                        skipText = markdownMessageGenerator(
                            ownSkip,
                            test,
                            name,
                            undefined,
                        )
                            .replace(/^#{1,6}\s+\*\*[^*]+\*\*\s*\n\n?/, "")
                            .trim();
                    } catch {
                        skipText = ownSkip;
                    }
                }

                acc.push({
                    index: acc.length + 1,
                    rowType: "group",
                    name: `**${name}**`,
                    group: parentPath,
                    scope: "",
                    description: this.sanitizeCell(`Sub-tests: ${childNames}`),
                    skipIf: this.sanitizeCell(skipText),
                    errorCode: "",
                    successCode: "",
                });

                // Recurse — children follow immediately after the group row
                const newPath = parentPath ? `${parentPath} > ${name}` : name;
                this.collectRows(ret, acc, newPath);
            }
        }
    }

    /**
     * Renders the GFM table with all rows.
     *
     * Columns shown depend on whether *any* row has a value:
     * - `Group` column hidden when no tests have a group (flat config)
     * - `Scope`, `Skip If`, `Error Code`, `Success Code` similarly pruned
     */
    private renderTable(rows: TableRow[]): string {
        const hasGroup = rows.some((r) => r.group !== "");
        const hasScope = rows.some((r) => r.scope !== "");
        const hasSkip = rows.some((r) => r.skipIf !== "");
        const hasSuccess = rows.some((r) => r.successCode !== "");

        // Build column definitions
        type Col = {
            header: string;
            align: "l" | "c" | "r";
            value: (r: TableRow) => string;
        };
        const cols: Col[] = [
            { header: "#", align: "r", value: (r) => String(r.index) },
            {
                header: "Type",
                align: "c",
                value: (r) => (r.rowType === "group" ? "GRP" : "LF"),
            },
            {
                header: "Test Name",
                align: "l",
                // Group rows already have **bold** markers; leaf rows get backticks
                value: (r) =>
                    r.rowType === "group" ? r.name : `\`${r.name}\``,
            },
            ...(hasGroup
                ? [
                      {
                          header: "Group",
                          align: "l" as const,
                          value: (r: TableRow) => r.group,
                      },
                  ]
                : []),
            ...(hasScope
                ? [
                      {
                          header: "Scope",
                          align: "l" as const,
                          value: (r: TableRow) => r.scope,
                      },
                  ]
                : []),
            { header: "Description", align: "l", value: (r) => r.description },
            ...(hasSkip
                ? [
                      {
                          header: "Skip If",
                          align: "l" as const,
                          value: (r: TableRow) => r.skipIf,
                      },
                  ]
                : []),
            {
                header: "Error Code",
                align: "c" as const,
                value: (r: TableRow) => r.errorCode,
            },
            ...(hasSuccess
                ? [
                      {
                          header: "Success Code",
                          align: "c" as const,
                          value: (r: TableRow) => r.successCode,
                      },
                  ]
                : []),
        ];

        const alignChar = (a: Col["align"]) =>
            a === "r" ? "---:" : a === "c" ? ":---:" : ":---";

        const headerRow = `| ${cols.map((c) => c.header).join(" | ")} |`;
        const sepRow = `| ${cols.map((c) => alignChar(c.align)).join(" | ")} |`;
        const dataRows = rows.map(
            (r) => `| ${cols.map((c) => c.value(r) || "—").join(" | ")} |`,
        );

        return [headerRow, sepRow, ...dataRows].join("\n");
    }

    /**
     * Sanitises a string for safe use inside a GFM table cell:
     * - Collapses newlines and excess whitespace to a single space
     * - Escapes pipe characters
     * - Strips any leading `####` heading markers left by the compiler
     */
    private sanitizeCell(text: string): string {
        return text
            .replace(/\r?\n/g, " ")
            .replace(/\s{2,}/g, " ")
            .replace(/\|/g, "\\|")
            .trim();
    }
}

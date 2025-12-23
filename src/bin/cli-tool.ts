import chalkLib from "chalk";

/** Color variants for different message types */
export enum CliVariant {
	INFO = "info",
	SUCCESS = "success",
	WARNING = "warning",
	ERROR = "error",
	DEBUG = "debug",
	SUBTLE = "subtle",
	PRIMARY = "primary",
	SECONDARY = "secondary",
}

/** Multiline-safe padding config */
export type CliPadding = {
	top?: number; // blank lines before
	bottom?: number; // blank lines after
	left?: number; // spaces to the left for each line
};

export type TitleOptions = {
	indentation?: number; // legacy alias for left padding
	padding?: CliPadding;
	badge?: string | null; // optional prefix like "TIP", "WARN"
};

export type SkipOptions = {
	indentation?: number;
	reasonLabel?: string; // e.g., "(skipped)" vs "(ignored)"
};

export type DescriptionOptions = {
	indentation?: number;
	padding?: CliPadding;
	icon?: string | null; // optional icon like "📝", "💡", "⚠️"
	prefix?: string | null; // optional prefix like "Note:", "Tip:"
};

type Formatter<TOpts = any> = (text: string, opts?: Partial<TOpts>) => string;

/**
 * A tiny utility to safely indent/pad across multiple lines (ANSI-friendly).
 */
function padLines(text: string, padding: CliPadding = {}): string {
	const { top = 0, bottom = 0, left = 0 } = padding;
	const leftPad = " ".repeat(left);
	const lines = text.split("\n").map((l) => (left > 0 ? leftPad + l : l));
	const topPad = Array.from({ length: top }, () => "").join("\n");
	const bottomPad = Array.from({ length: bottom }, () => "").join("\n");
	return (
		(top ? topPad + "\n" : "") +
		lines.join("\n") +
		(bottom ? "\n" + bottomPad : "")
	);
}

/**
 * Path helpers for dot-pattern registry: "title.fancy", "skip.subtle", etc.
 */
function getByPath<T>(obj: any, path: string): T | undefined {
	return path
		.split(".")
		.reduce<any>((acc, key) => (acc ? acc[key] : undefined), obj);
}
function setByPath(obj: any, path: string, value: any): void {
	const keys = path.split(".");
	const last = keys.pop()!;
	const parent = keys.reduce<any>((acc, key) => (acc[key] ??= {}), obj);
	parent[last] = value;
}

/**
 * Main CLI kit with:
 *  - Multiline-safe indent/padding
 *  - Extensible "dot-pattern" style registry (Cli.title.fancy, Cli.skip.subtle, etc.)
 *  - Pluggable chalk instance (DI) to avoid hard-binding
 */
export default class Cli {
	// You can inject your own chalk-like instance if needed (for tests, themes, etc.)
	private static _chalk = chalkLib;
	static setChalk(chalk: typeof chalkLib) {
		this._chalk = chalk;
	}

	/** Style registry, editable at runtime with Cli.use("path", fn). */
	private static registry: Record<string, any> = {
		title: {
			default: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.black.bgYellow(` ${badge} `) + " " : "") +
					this._chalk.bold.black.bgYellow(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			info: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.white.bgBlue(` ${badge} `) + " " : "") +
					this._chalk.bold.bgBlue.white(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			success: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.black.bgGreen(` ${badge} `) + " " : "") +
					this._chalk.bold.bgGreen.black(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			warning: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.black.bgYellow(` ${badge} `) + " " : "") +
					this._chalk.bold.bgYellow.black(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			error: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.white.bgRed(` ${badge} `) + " " : "") +
					this._chalk.bold.bgRed.white(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			debug: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.white.bgMagenta(` ${badge} `) + " " : "") +
					this._chalk.bold.bgMagenta.white(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			primary: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.white.bgCyan(` ${badge} `) + " " : "") +
					this._chalk.bold.bgCyan.black(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			secondary: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.black.bgGray(` ${badge} `) + " " : "") +
					this._chalk.bold.bgGray.white(` ${text} `);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			subtle: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const inner =
					(badge ? this._chalk.gray(`(${badge}) `) : "") +
					this._chalk.bold.underline(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<TitleOptions>,

			box: ((text: string, opts?: Partial<TitleOptions>) => {
				const { indentation = 0, padding, badge } = opts || {};
				const label = badge ? `[${badge}] ` : "";
				const content = label + text;
				const lines = content.split("\n");
				const width = Math.max(...lines.map((l) => l.length));
				const top = "┌" + "─".repeat(width + 2) + "┐";
				const bottom = "└" + "─".repeat(width + 2) + "┘";
				const body = lines.map((l) => `│ ${l.padEnd(width, " ")} │`).join("\n");
				const boxed = [top, body, bottom].join("\n");
				const prefixed =
					" ".repeat(indentation) +
					boxed.replace(/\n/g, "\n" + " ".repeat(indentation));
				return padLines(prefixed, padding ?? {});
			}) as Formatter<TitleOptions>,
		},

		skip: {
			default: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.yellowBright.italic(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			info: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.blue.italic(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			success: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.green.italic(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			warning: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "warning" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.yellow.italic(`⚠ ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			error: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "error" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.red.italic(`✗ ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			debug: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "debug" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.magenta.italic(`• ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			primary: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.cyan.italic(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			secondary: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.gray.italic(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,

			subtle: ((text: string, opts?: Partial<SkipOptions>) => {
				const { indentation = 0, reasonLabel = "skipped" } = opts || {};
				return (
					" ".repeat(indentation) +
					this._chalk.dim(`- ${text} (${reasonLabel})`)
				);
			}) as Formatter<SkipOptions>,
		},

		description: {
			default: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.gray(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			info: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "ℹ️  ";
				const prefixStr = prefix ? `${this._chalk.blue.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.blue(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			success: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.green.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.green(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			warning: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.yellow.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.yellow(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			error: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.red.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.red(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			debug: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.magenta.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.magenta(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			primary: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.cyan.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.cyan(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			secondary: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${icon} ` : "";
				const prefixStr = prefix ? `${this._chalk.gray.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.gray(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,

			subtle: ((text: string, opts?: Partial<DescriptionOptions>) => {
				const { indentation = 0, padding, icon, prefix } = opts || {};
				const iconStr = icon ? `${this._chalk.dim(icon)} ` : "";
				const prefixStr = prefix ? `${this._chalk.dim.bold(prefix)} ` : "";
				const inner = iconStr + prefixStr + this._chalk.dim(text);
				const block = " ".repeat(indentation) + inner;
				return padLines(block, padding ?? {});
			}) as Formatter<DescriptionOptions>,
		},

		util: {
			// Multiline-safe indentation (kept public as method wrapper below)
			indent: ((text: string, spaces = 0) =>
				padLines(text, { left: spaces })) as (
				text: string,
				spaces?: number
			) => string,

			// Multiline-safe padding helper (kept public as method wrapper below)
			padding: ((text: string, padding: CliPadding) =>
				padLines(text, padding)) as (
				text: string,
				padding: CliPadding
			) => string,

			// A clean horizontal rule that adapts to terminal width (fallback to 80)
			hr: ((width?: number) => {
				const w = width ?? (process.stdout.columns || 80);
				return "─".repeat(Math.max(16, w)); // ensure some minimum length
			}) as (width?: number) => string,
		},
	};

	/**
	 * Register/override a style function:
	 *   Cli.use("title.fancy", (text, opts) => "...custom...");
	 *   Cli.use("skip.warn",  (text, opts) => "...custom...");
	 */
	static use<T = any>(path: string, fn: Formatter<T>): void {
		setByPath(this.registry, path, fn);
	}

	/** Resolve a formatter by path; throws if missing. */
	private static resolve<T = any>(path: string): Formatter<T> {
		const got = getByPath<Formatter<T>>(this.registry, path);
		if (!got)
			throw new Error(
				`Cli: style "${path}" not found. Register it with Cli.use("${path}", fn).`
			);
		return got;
	}

	// ----------------------------
	// DOT-PATTERN PROXIES
	// ----------------------------

	// Title proxy: supports `Cli.title("text")` (default) and `Cli.title.box("text")`, etc.
	static readonly title: {
		(text: string, opts?: Partial<TitleOptions>): string;
		[variant: string]: (text: string, opts?: Partial<TitleOptions>) => string;
	} = new Proxy(
		((text: string, opts?: Partial<TitleOptions>) =>
			this.resolve<TitleOptions>("title.default")(text, opts)) as any,
		{
			get:
				(_target, prop: string) =>
				(text: string, opts?: Partial<TitleOptions>) =>
					this.resolve<TitleOptions>(`title.${prop}`)(text, opts),
		}
	);

	// Skip proxy: supports `Cli.skip("...", { reasonLabel: "ignored" })` and `Cli.skip.subtle("...")`
	static readonly skip: {
		(text: string, opts?: Partial<SkipOptions>): string;
		[variant: string]: (text: string, opts?: Partial<SkipOptions>) => string;
	} = new Proxy(
		((text: string, opts?: Partial<SkipOptions>) =>
			this.resolve<SkipOptions>("skip.default")(text, opts)) as any,
		{
			get:
				(_target, prop: string) =>
				(text: string, opts?: Partial<SkipOptions>) =>
					this.resolve<SkipOptions>(`skip.${prop}`)(text, opts),
		}
	);

	// Description proxy: supports `Cli.description("text")` and `Cli.description.info("text")`, etc.
	static readonly description: {
		(text: string, opts?: Partial<DescriptionOptions>): string;
		[variant: string]: (
			text: string,
			opts?: Partial<DescriptionOptions>
		) => string;
	} = new Proxy(
		((text: string, opts?: Partial<DescriptionOptions>) =>
			this.resolve<DescriptionOptions>("description.default")(
				text,
				opts
			)) as any,
		{
			get:
				(_target, prop: string) =>
				(text: string, opts?: Partial<DescriptionOptions>) =>
					this.resolve<DescriptionOptions>(`description.${prop}`)(text, opts),
		}
	);

	// Utility passthroughs
	static indent(text: string, spaces = 0) {
		return this.registry.util.indent(text, spaces);
	}
	static padding(text: string, padding: CliPadding) {
		return this.registry.util.padding(text, padding);
	}
	static hr(width?: number) {
		return this.registry.util.hr(width);
	}
}

import path from "path";
import { fileURLToPath } from "url";
import {
	CodeGenerator,
	CodeGeneratorProps,
} from "../classes/abstract-generator.js";
import { writeAndFormatCode } from "../../../utils/fs-utils.js";
import { TypescriptGenerator } from "../typescript/ts-generator.js";
import logger from "../../../utils/logger.js";
import fs from "fs-extra";
import { MarkdownDocGenerator } from "../documentation/md-generator.js";
import { exec } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export class JavascriptGenerator extends CodeGenerator {
	private tempTsPath: string;

	public generateUnitTestingCode(): Promise<void> {
		throw new Error("Method not implemented.");
	}

	constructor(
		validationConfig: any,
		errorCodes: any[],
		rootPath: string = "./"
	) {
		super(validationConfig, errorCodes, rootPath);
		this.tempTsPath = path.resolve(rootPath, "../temp-ts-generation");
	}

	generateSessionDataCode = async () => {
		throw new Error("Method not implemented.");
	};

	generateValidationCode = async () => {
		// This will be handled by the TypeScript generator in generateCode
	};

	generateCode = async (codeConfig: CodeGeneratorProps) => {
		try {
			logger.info("Generating JavaScript code using TypeScript compilation...");

			// Step 1: Generate TypeScript code in a temporary directory
			logger.debug("Step 1: Generating TypeScript code in temp directory");
			await fs.ensureDir(this.tempTsPath);
			const tsGenerator = new TypescriptGenerator(
				this.validationConfig,
				this.errorCodes,
				this.tempTsPath
			);
			await tsGenerator.generateCode(codeConfig);

			// Step 2: Create tsconfig.json for compilation
			logger.debug("Step 2: Creating TypeScript configuration");
			await this.createTsConfig();

			// Step 3: Install TypeScript if not available and compile
			logger.debug("Step 3: Compiling TypeScript to JavaScript");
			await this.compileToJavaScript();

			// Step 4: Copy and modify generated files
			logger.debug("Step 4: Processing generated files");
			await this.processGeneratedFiles();

			// Step 5: Generate package.json
			logger.debug("Step 5: Creating package.json");
			await this.generatePackageJson(codeConfig.codeName);

			// Step 6: Generate documentation
			logger.debug("Step 6: Generating documentation");
			await new MarkdownDocGenerator(
				this.validationConfig,
				this.errorCodes,
				this.rootPath
			).generateCode();

			// Step 7: Clean up temporary files
			logger.debug("Step 7: Cleaning up temporary files");
			await this.cleanup();

			logger.info("JavaScript code generation completed successfully");
		} catch (error) {
			logger.error("Error during JavaScript code generation:", error);
			await this.cleanup(); // Ensure cleanup even on error
			throw error;
		}
	};

	private async createTsConfig(): Promise<void> {
		const tsConfig = {
			compilerOptions: {
				target: "ES2020",
				module: "ESNext",
				moduleResolution: "node",
				declaration: true,
				outDir: "./js-output",
				rootDir: ".",
				strict: false,
				esModuleInterop: true,
				allowSyntheticDefaultImports: true,
				skipLibCheck: true,
				forceConsistentCasingInFileNames: true,
				allowJs: true,
				noEmitOnError: false,
				removeComments: false,
			},
			include: ["./**/*.ts"],
			exclude: ["node_modules", "./js-output"],
		};

		await writeAndFormatCode(
			this.tempTsPath,
			"tsconfig.json",
			JSON.stringify(tsConfig, null, 2),
			"json"
		);
	}

	private async compileToJavaScript(): Promise<void> {
		logger.debug("Compiling TypeScript to JavaScript...");

		try {
			// Try using npx tsc first
			await this.runCommand("npx tsc", this.tempTsPath);
		} catch (error) {
			// If npx tsc fails, try to install TypeScript locally and retry
			logger.info("TypeScript compilation failed, installing TypeScript...");
			await this.runCommand("npm init -y", this.tempTsPath);
			await this.runCommand(
				"npm install --save-dev typescript",
				this.tempTsPath
			);
			await this.runCommand("npx tsc", this.tempTsPath);
		}
	}

	private async processGeneratedFiles(): Promise<void> {
		const jsOutputPath = path.resolve(this.tempTsPath, "js-output");

		// Ensure the target directory exists
		await fs.ensureDir(this.rootPath);

		// Copy all .js files and modify imports
		await this.copyAndProcessJsFiles(jsOutputPath, this.rootPath);

		// Copy all .d.ts files
		await this.copyTypeDefinitions(jsOutputPath, this.rootPath);
	}

	private async copyAndProcessJsFiles(
		sourceDir: string,
		targetDir: string
	): Promise<void> {
		if (!(await fs.pathExists(sourceDir))) {
			throw new Error(`Source directory ${sourceDir} does not exist`);
		}

		const files = await this.getAllFiles(sourceDir, ".js");

		for (const file of files) {
			const relativePath = path.relative(sourceDir, file);
			const targetFile = path.resolve(targetDir, relativePath);

			let content = await fs.readFile(file, "utf-8");

			// Convert TypeScript-style imports to work better with JavaScript
			content = this.processJavaScriptImports(content);

			await fs.ensureDir(path.dirname(targetFile));
			await fs.writeFile(targetFile, content);
		}
	}

	private async copyTypeDefinitions(
		sourceDir: string,
		targetDir: string
	): Promise<void> {
		if (!(await fs.pathExists(sourceDir))) {
			logger.warn(
				`Type definitions source directory ${sourceDir} does not exist`
			);
			return;
		}

		const files = await this.getAllFiles(sourceDir, ".d.ts");

		for (const file of files) {
			const relativePath = path.relative(sourceDir, file);
			const targetFile = path.resolve(targetDir, relativePath);

			let content = await fs.readFile(file, "utf-8");

			// Process .d.ts imports
			content = this.processTypeDefinitionImports(content);

			await fs.ensureDir(path.dirname(targetFile));
			await fs.writeFile(targetFile, content);
		}
	}

	private processJavaScriptImports(content: string): string {
		// For ES modules, we need to keep the .js extensions in imports
		// But fix the .js.js issue if it occurs
		return content
			.replace(/\.js\.js/g, ".js")
			.replace(/from\s+["']([^"']+)\.ts["']/g, "from '$1.js'")
			.replace(/import\s+["']([^"']+)\.ts["']/g, "import '$1.js'");
	}

	private processTypeDefinitionImports(content: string): string {
		// Fix TypeScript imports in .d.ts files
		return content
			.replace(/from\s+["']([^"']+)\.ts["']/g, "from '$1'")
			.replace(/import\s+["']([^"']+)\.ts["']/g, "import '$1'")
			.replace(/\.js\.js/g, ".js");
	}

	private async getAllFiles(dir: string, extension: string): Promise<string[]> {
		const files: string[] = [];

		if (!(await fs.pathExists(dir))) {
			return files;
		}

		const items = await fs.readdir(dir, { withFileTypes: true });

		for (const item of items) {
			const fullPath = path.resolve(dir, item.name);

			if (item.isDirectory()) {
				const subFiles = await this.getAllFiles(fullPath, extension);
				files.push(...subFiles);
			} else if (item.isFile() && item.name.endsWith(extension)) {
				files.push(fullPath);
			}
		}

		return files;
	}

	private async generatePackageJson(codeName: string): Promise<void> {
		const packageJson = {
			name: codeName.toLowerCase().replace(/[^a-z0-9-]/g, "-"),
			version: "1.0.0",
			description: `Generated validation library: ${codeName}`,
			type: "module",
			main: "index.js",
			types: "index.d.ts",
			scripts: {
				test: 'echo "Error: no test specified" && exit 1',
			},
			dependencies: {
				// Add any runtime dependencies your generated code needs
				jsonpath: "^1.1.1",
			},
			keywords: ["validation", "api", "testing", "javascript", "ondc"],
			author: "Generated by ONDC Code Generator",
			license: "MIT",
		};

		await writeAndFormatCode(
			this.rootPath,
			"package.json",
			JSON.stringify(packageJson, null, 2),
			"json"
		);
	}

	private async runCommand(command: string, cwd: string): Promise<string> {
		try {
			const { stdout, stderr } = await execAsync(command, { cwd });
			if (stderr && !stderr.includes("npm WARN")) {
				logger.warn(`Command stderr: ${command}`, stderr);
			}
			return stdout;
		} catch (error: any) {
			logger.error(`Command failed: ${command}`, error.message);
			throw new Error(`Command failed: ${command}
${error.message}`);
		}
	}

	private async cleanup(): Promise<void> {
		try {
			if (await fs.pathExists(this.tempTsPath)) {
				await fs.remove(this.tempTsPath);
				logger.debug("Cleaned up temporary TypeScript files");
			}
		} catch (error) {
			logger.warn("Failed to clean up temporary files:", error);
		}
	}
}

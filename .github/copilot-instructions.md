# ONDC Code Generator - AI Coding Agent Instructions

## Project Overview

**JVAL** (JSON Validation Language) is a domain-specific language and code generator that creates validation functions in multiple target languages (TypeScript, Python, JavaScript) from YAML/JSON configurations. It's specifically designed for ONDC (Open Network for Digital Commerce) API validation.

## Key Architecture Components

### Core Data Flow

1. **Build YAML → Schema Extraction** (`src/services/schema-service.ts`)
2. **Configuration Validation** (`src/generator/validators/config-validator.ts`)
3. **Code Generation** (`src/generator/generators/`) per target language
4. **Output Structure**: `generated/{codeName}/` with consistent folder structure

### Critical File Structure Patterns

- **Generators**: `src/generator/generators/{language}/{language}-generator.ts` - Each extends `AbstractGenerator`
- **Templates**: Use Mustache templates in `generators/{language}/templates/`
- **AST Processing**: `src/services/return-complier/` - Custom parser for JVAL syntax
- **Generated Output**: Always follows pattern: `api-tests/`, `utils/`, `types/`, `interfaces/`

## JVAL Syntax System (Essential Knowledge)

### Test Object Structure

```json
{
	"_NAME_": "function_name",
	"_SCOPE_": "$.json.path",
	"variableName": "$.json.path.to.data",
	"_RETURN_": "JVAL_EXPRESSION"
}
```

### Custom Functions (src/services/return-complier/tokens.ts)

**Unary**: `var1 are present`, `var1 are unique`  
**Binary**: `var1 all in var2`, `var1 follow regex var2`, `var1 greater than var2`  
**Operators**: `&&`, `||`, `!`, parentheses for precedence

### Code Generation Pattern

- Each test object → individual validation function
- Variables resolved via JSONPath extraction (`utils/json-path-utils`)
- JVAL expressions compiled to target language via AST (`{language}-ast.ts`)

## Development Workflow

### Essential Commands

```bash
npm run dev          # Watch mode with custom ESM loader
npm run build        # TypeScript compilation + template copying
npm test            # Runs build + test execution
npm run clean       # Remove dist/ folder
```

### Key Dependencies

- **Chevrotain**: Custom DSL parser (JVAL syntax)
- **JSONPath**: Data extraction from JSON payloads
- **Mustache**: Template rendering for code generation
- **Prettier**: Code formatting for generated output

## Critical Patterns to Follow

### Adding New Language Support

1. Create `src/generator/generators/{language}/{lang}-generator.ts` extending `AbstractGenerator`
2. Implement `{lang}-ast.ts` for JVAL→target language compilation
3. Add templates in `generators/{language}/templates/`
4. Update `SupportedLanguages` enum in `src/types/compiler-types.ts`

### Working with Generators

- Always use `writeAndFormatCode()` from `src/utils/fs-utils.ts`
- Template data must include: `{codeName, errorCodes, testFunctions}`
- Each generator creates: validation functions, utils, types, session management

### AST Compilation (Critical)

Located in `src/services/return-complier/`:

- `tokens.ts`: Lexer tokens for JVAL functions
- `parser.ts`: Chevrotain-based parser rules
- `ast.ts`: AST node type definitions
- `{language}-ast.ts`: Language-specific compilation

### Configuration Structure

- `ValidationConfig`: Contains `_TESTS_` (test sets) and `_SESSION_DATA_`
- Test validation in `src/generator/validators/tests-config/`
- JSON Schema validation for build files in `src/services/schema-service.ts`

## Integration Points

### External Dependencies

- Requires **build.yaml** with `x-validations` and `x-errorcodes` sections
- JSON Schema definitions for payload validation
- Session data management for cross-request validation state

### Usage Pattern

```typescript
import { ConfigCompiler } from "ondc-code-generator";
const compiler = new ConfigCompiler(SupportedLanguages.Typescript);
await compiler.initialize(buildYamlString);
await compiler.generateCode(validationConfig, "L1-validations");
```

## Debugging & Error Handling

### Common Issues

- **JSONPath validation**: Check `src/utils/json-path-utils/` for path extraction
- **JVAL parsing errors**: Debug via `src/services/return-complier/parser.ts`
- **Template rendering**: Verify data structure matches Mustache template expectations
- **Schema conflicts**: Use `SchemaExtractionService` for debugging schema resolution

### Generated Code Structure

All generated code follows consistent patterns:

- Entry point: `api-tests/{action}.ts` functions
- Utilities: `utils/validation-utils.ts`, `utils/json-path-utils.ts`
- Types: `types/test-config.ts` with `validationInput`/`validationOutput`

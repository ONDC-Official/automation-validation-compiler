# JVAL Compiler Pipeline

This document traces what happens from the moment a `_RETURN_` string is read from a YAML config to the moment it becomes runnable validation code (or human-readable documentation).

---

## Big picture

```
_RETURN_ string
      │
      ▼
┌─────────────┐     tokens.ts
│   Lexer     │  ──────────────────  ReturnTokenize(input)
│  (Chevrotain│
│   Lexer)    │
└──────┬──────┘
       │  Token[]
       ▼
┌─────────────┐     parser.ts
│   Parser    │  ──────────────────  parseReturnInput(input)
│  (Chevrotain│
│  CstParser) │
└──────┬──────┘
       │  CST (CstNode)
       ▼
┌─────────────┐     ast.ts
│ AST Builder │  ──────────────────  buildAst(cst)
│  (Visitor)  │
└──────┬──────┘
       │  AstNode (typed tree)
       ▼
  ┌────┴─────────────────────────────────────┐
  │                                          │
  ▼                                          ▼
Code Generator                    Documentation Generator
{language}-ast.ts                 compile-to-markdown.ts
  │                                          │
  ▼                                          ▼
TypeScript / Python /             Markdown bullet list
JavaScript / Go code              for human-readable docs
```

The public entry point for consuming code is in `combined.ts`:

```typescript
import { buildAstFromInput } from "./combined.js";

const ast = buildAstFromInput("items all in catalog && price are present");
// → typed AstNode ready to consume
```

---

## Stage 1 — Lexing (`tokens.ts`)

**Function:** `ReturnTokenize(inputText: string): ILexingResult`

The Chevrotain `Lexer` scans the input string left-to-right and produces a flat array of `IToken` objects. Whitespace tokens are immediately discarded (`group: Lexer.SKIPPED`).

### Example

Input:
```
items all in catalog && price are present
```

Tokens produced:

| # | Token type | Image |
|---|-----------|-------|
| 1 | `Identifier` | `items` |
| 2 | `AllIn` | `all in` |
| 3 | `Identifier` | `catalog` |
| 4 | `AndOperator` | `&&` |
| 5 | `Identifier` | `price` |
| 6 | `ArePresent` | `are present` |

### Error behaviour

If the lexer encounters a character sequence that matches no token pattern (e.g. a literal number `42` or a hyphen `item-ids`), it throws immediately:

```
Error: Lexing errors encountered:
Unexpected character sequence: '-' at line 1, column 5.
```

---

## Stage 2 — Parsing (`parser.ts`)

**Function:** `parseReturnInput(inputText: string): CstNode`

`ReturnParser` is a `CstParser` (Chevrotain). It consumes the token array from Stage 1 and builds a **Concrete Syntax Tree** — a lossless tree that exactly reflects the grammar rules that fired.

### Grammar rule chain (simplified)

```
returnStatement
  └─ orExpression
       └─ andExpression  (× many, joined by &&)
            └─ notExpression
                 └─ primaryExpression
                      └─ atomicCustomExpression  ← leaves
                           Identifier  BinaryFunction  Identifier
                         | Identifier  UnaryFunction
```

### CST vs AST

The CST is very verbose — every grammar rule creates a node, even rules that matched only a single child. The AST builder in Stage 3 collapses this into a clean tree.

### Error behaviour

Parse errors throw with a descriptive message from Chevrotain's error recovery:

```
Error: Parsing errors detected:
Expecting token of type --> RParen <-- but found --> '' <--
```

---

## Stage 3 — AST Building (`ast.ts`)

**Function:** `buildAst(cst: CstNode): AstNode`  
**Class:** `AstBuilder extends ReturnParserInstance.getBaseCstVisitorConstructor()`

The `AstBuilder` is a Chevrotain **CST Visitor**. Each method corresponds to one grammar rule and returns the simplified AST node for that rule.

### Key transformations

| CST rule | AST output |
|----------|-----------|
| `returnStatement` | `ReturnStatementNode` wrapping inner expression |
| `orExpression` / `andExpression` with `>1` operator | Left-nested chain of `BinaryOperatorNode` |
| `orExpression` / `andExpression` with no operator | Just the child node, no wrapper created |
| `notExpression` with `!` | `NotOperatorNode` |
| `notExpression` without `!` | Just the child node |
| `parentheisizedExpression` | `ReturnStatementNode` (parentheses stripped) |
| `atomicCustomExpression` (two identifiers) | `CustomBinaryFunction` |
| `atomicCustomExpression` (one identifier) | `CustomUniaryFunction` |
| identifier token | `IdentifierNode` (via `visitIdentifier`) |

### Example (continued)

CST for `items all in catalog && price are present` collapses to:

```
ReturnStatementNode
└── BinaryOperatorNode (&&)
    ├── CustomBinaryFunction (all in)
    │   ├── IdentifierNode (items)
    │   └── IdentifierNode (catalog)
    └── CustomUniaryFunction (are present)
        └── IdentifierNode (price)
```

---

## Stage 4a — Semantic Validation (`ast-functions/semantic-validations.ts`)

**Function:** `checkValidVariables(ast, validVariables, path?)`

This is an **optional but important** post-AST pass. It walks every `IdentifierNode` in the tree and checks that `node.name` exists in the list of variables declared in the enclosing test object.

It is called by the config validator (`src/generator/validators/`) before code generation begins.

```typescript
checkValidVariables(ast, ["items", "catalog", "price"], "$.context.bpp_id");
```

If a variable is undeclared:
```
Error: Invalid variable fooBar at path $.context.bpp_id
```

---

## Stage 4b — Code Generation (`{language}-ast.ts` in each generator)

Each language-specific generator provides its own AST walker that emits target-language code. These files live in:

```
src/generator/generators/{language}/{language}-ast.ts
```

They follow the same visitor pattern described in [ast.md](./ast.md#8-walking-the-ast), producing strings like:

```typescript
// TypeScript output for:  items all in catalog && price are present
allIn(items, catalog) && arePresent(price)
```

```python
# Python output
all_in(items, catalog) and are_present(price)
```

---

## Stage 4c — Markdown Compilation (`ast-functions/compile-to-markdown.ts`)

**Functions:** `CompileToMarkdown(ast)` and `CompileToMarkdownForSkip(ast)`

Used by the documentation generator to produce a human-readable checklist from the same AST. These are used in the generated test documentation/comments.

### Output style

```markdown
**All of the following must be true:**
  - All elements of {{{items}}} must be in {{{catalog}}}
  - {{{price}}} must be present in the payload
```

### `forNot` flag propagation

`!` is handled without creating extra nesting. Instead, a `forNot: boolean` flag flips the leaf message:

```
!(items all in catalog)
```

→ `CompileToMarkdown` calls leaf with `forNot = true`  
→ leaf renders: `"Not all elements of {{{items}}} may be in {{{catalog}}}"`

### Skip vs normal mode

`CompileToMarkdownForSkip` uses more natural conditional phrasing for skip conditions:

| Normal mode | Skip mode |
|-------------|-----------|
| `{{{x}}} must be present in the payload` | `{{{x}}} is in the payload` |
| `All elements of {{{x}}} must be in {{{y}}}` | `all elements of {{{x}}} are in {{{y}}}` |

The `{{{variable}}}` triple-mustache syntax is intentional — it is later expanded by **Mustache** to inject human-readable descriptions of what each variable represents.

---

## Error flow summary

| Stage | Error type | Thrown by |
|-------|-----------|-----------|
| Lexing | Unexpected character | `ReturnTokenize` |
| Parsing | Grammar mismatch | `parseReturnInput` |
| Semantic validation | Unknown variable | `checkValidVariables` |
| AST building | Invalid node (`primaryExpression` branch) | `AstBuilder.primaryExpression` |
| Code generation | Unsupported `customFunction` key | language-specific `{lang}-ast.ts` |

All errors are thrown as standard JavaScript `Error` objects and caught by the config compiler (`config-compiler.ts`) which re-surfaces them with test-object path context.

---

## Calling the full pipeline

### Minimal usage

```typescript
import { buildAstFromInput } from "./combined.js";

const ast = buildAstFromInput("itemIds all in catalogIds && price are present");
// Use ast with your code generator
```

### With semantic validation

```typescript
import { buildAstFromInput } from "./combined.js";
import { checkValidVariables } from "./ast-functions/semantic-validations.js";

const ast = buildAstFromInput("itemIds all in catalogIds && price are present");
checkValidVariables(ast, ["itemIds", "catalogIds", "price"]);
```

### With markdown output

```typescript
import { buildAstFromInput } from "./combined.js";
import { CompileToMarkdown } from "./ast-functions/compile-to-markdown.js";

const ast = buildAstFromInput("itemIds all in catalogIds && price are present");
const markdown = CompileToMarkdown(ast);
console.log(markdown);
/*
**All of the following must be true:**
  - All elements of {{{itemIds}}} must be in {{{catalogIds}}}
  - {{{price}}} must be present in the payload
*/
```

# JVAL Return Expression DSL — Documentation

This folder documents the **JVAL Return Expression DSL** — the mini-language used inside the `_RETURN_` field of every test object in ONDC validation configs.

The DSL is implemented in `src/services/return-complier/` using the [Chevrotain](https://chevrotain.io/) parsing toolkit. It takes a string like:

```
items all in validItems && price are present
```

…and compiles it to a typed **Abstract Syntax Tree (AST)** that code generators then lower into TypeScript, Python, JavaScript, or Go validation logic.

---

## Contents

| File                             | What it covers                                                   |
| -------------------------------- | ---------------------------------------------------------------- |
| [grammar.md](./grammar.md)       | EBNF grammar, operator precedence, and formal language rules     |
| [operations.md](./operations.md) | Every token, operator, and built-in function with examples       |
| [ast.md](./ast.md)               | AST node types, their shapes, and how they nest                  |
| [pipeline.md](./pipeline.md)     | End-to-end pipeline: source string → tokens → CST → AST → output |

---

## Quick-start example

Suppose a test object has:

```yaml
_RETURN_: "itemIds all in catalogIds && price are present"
```

Where `itemIds`, `catalogIds`, and `price` are variable names bound earlier in the test object via JSONPath expressions.

### What happens internally

1. **Lexer** (`tokens.ts`) tokenises the string into:
   `[Identifier("itemIds"), AllIn, Identifier("catalogIds"), AndOperator, Identifier("price"), ArePresent]`

2. **Parser** (`parser.ts`) builds a **Concrete Syntax Tree (CST)** following the grammar.

3. **AST builder** (`ast.ts`) converts the CST into a typed AST:

```json
{
    "type": "returnStatement",
    "expression": {
        "type": "binaryOperator",
        "operator": "&&",
        "lhs": {
            "type": "customBinaryFunction",
            "customFunction": "all in",
            "lhs": { "type": "identifier", "name": "itemIds" },
            "rhs": { "type": "identifier", "name": "catalogIds" }
        },
        "rhs": {
            "type": "customUniaryFunction",
            "customFunction": "are present",
            "expression": { "type": "identifier", "name": "price" }
        }
    }
}
```

4. **Code generator** walks the AST and emits the target-language boolean expression.

5. **`CompileToMarkdown`** (optional) renders it as human-readable documentation:

```
**All of the following must be true:**
  - All elements of {{{itemIds}}} must be in {{{catalogIds}}}
  - {{{price}}} must be present in the payload
```

---

## Source file map

```
src/services/return-complier/
├── tokens.ts               ← Lexer: all token definitions
├── parser.ts               ← Chevrotain CstParser grammar rules
├── ast.ts                  ← AstBuilder (CST → AST) + TypeScript interfaces
├── combined.ts             ← Public entry point: buildAstFromInput(string)
└── ast-functions/
    ├── semantic-validations.ts   ← checkValidVariables() — scope validation
    └── compile-to-markdown.ts    ← CompileToMarkdown / CompileToMarkdownForSkip
```

---

## Design goals

- **Human-readable expressions** — authors write `x all in y`, not `allIn(x, y)`.
- **Case-insensitive keywords** — `ALL IN`, `all in`, `All In` are all identical.
- **Standard boolean connectives** — `&&`, `||`, `!` with conventional precedence.
- **Parentheses for grouping** — full support for arbitrary nesting `(a && b) || c`.
- **Multi-language lowering** — the same AST is consumed by each target-language generator (`{lang}-ast.ts`).

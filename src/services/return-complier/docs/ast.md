# JVAL AST Node Reference

The parser produces a **Concrete Syntax Tree (CST)** via Chevrotain.  
The `AstBuilder` class in `ast.ts` then performs a visitor pass over the CST to produce a clean, language-agnostic **Abstract Syntax Tree (AST)**.

All AST nodes share a single discriminant field: **`type`**.  
Code that walks the AST should switch on `node.type` to determine the shape.

---

## Node type overview

```
AstNode  (base)
├── ReturnStatementNode      type = "returnStatement"
├── BinaryOperatorNode       type = "binaryOperator"
├── NotOperatorNode          type = "notOperator"
├── CustomBinaryFunction     type = "customBinaryFunction"
├── CustomUniaryFunction     type = "customUniaryFunction"
└── IdentifierNode           type = "identifier"
```

---

## 1. `ReturnStatementNode`

The root node of every parsed expression.

```typescript
interface ReturnStatementNode extends AstNode {
    type: "returnStatement";
    expression: AstNode; // the actual content — one of the node types below
}
```

**When you see it:** Always at the top level; also re-appears inside each `ParenthesisedExpression` (the parser rule is recursive).

**Example input:** `price are present`

```json
{
    "type": "returnStatement",
    "expression": {
        "type": "customUniaryFunction",
        "customFunction": "are present",
        "expression": { "type": "identifier", "name": "price" }
    }
}
```

---

## 2. `BinaryOperatorNode`

Represents an `&&` or `||` expression connecting two sub-trees.

```typescript
interface BinaryOperatorNode extends AstNode {
    type: "binaryOperator";
    operator: "&&" | "||";
    lhs: AstNode; // left operand
    rhs: AstNode; // right operand
}
```

**Left-associativity:** When multiple same-precedence operators appear in a chain (`a && b && c`), the AST is left-nested:

```json
{
    "type": "binaryOperator",
    "operator": "&&",
    "lhs": {
        "type": "binaryOperator",
        "operator": "&&",
        "lhs": {
            /* a */
        },
        "rhs": {
            /* b */
        }
    },
    "rhs": {
        /* c */
    }
}
```

**Mixed precedence** (`a || b && c`):

```json
{
    "type": "binaryOperator",
    "operator": "||",
    "lhs": {
        /* a */
    },
    "rhs": {
        "type": "binaryOperator",
        "operator": "&&",
        "lhs": {
            /* b */
        },
        "rhs": {
            /* c */
        }
    }
}
```

---

## 3. `NotOperatorNode`

Represents a `!(…)` negation.

```typescript
interface NotOperatorNode extends AstNode {
    type: "notOperator";
    operator: "!";
    expression: AstNode; // the expression inside the parentheses
}
```

**Example input:** `!(items all in catalog)`

```json
{
    "type": "returnStatement",
    "expression": {
        "type": "notOperator",
        "operator": "!",
        "expression": {
            "type": "returnStatement",
            "expression": {
                "type": "customBinaryFunction",
                "customFunction": "all in",
                "lhs": { "type": "identifier", "name": "items" },
                "rhs": { "type": "identifier", "name": "catalog" }
            }
        }
    }
}
```

> **Important:** `compile-to-markdown.ts` does **not** emit a "NOT" node in the output. Instead it propagates a `forNot: boolean` flag down into the leaf renderers, which flip their message text. Code generators should do the same — flip the logic at the leaf, rather than emitting a wrapper NOT call.

---

## 4. `CustomBinaryFunction`

A function call that takes two identifier arguments.

```typescript
interface CustomBinaryFunction extends AstNode {
    type: "customBinaryFunction";
    customFunction: string; // the label of the matched token, e.g. "all in"
    lhs: IdentifierNode;
    rhs: IdentifierNode;
}
```

`customFunction` holds the **label** of the lexer token (lowercase with spaces), e.g.:

| Expression         | `customFunction` value |
| ------------------ | ---------------------- |
| `x all in y`       | `"all in"`             |
| `x any in y`       | `"any in"`             |
| `x none in y`      | `"none in"`            |
| `x follow regex y` | `"follow regex"`       |
| `x equal to y`     | `"equal to"`           |
| `x greater than y` | `"greater than"`       |
| `x less than y`    | `"less than"`          |

**Example input:** `itemIds all in catalogIds`

```json
{
    "type": "customBinaryFunction",
    "customFunction": "all in",
    "lhs": { "type": "identifier", "name": "itemIds" },
    "rhs": { "type": "identifier", "name": "catalogIds" }
}
```

---

## 5. `CustomUniaryFunction`

A function call that takes a single identifier argument.

```typescript
interface CustomUniaryFunction extends AstNode {
    type: "customUniaryFunction";
    customFunction: string; // e.g. "are present"
    expression: IdentifierNode;
}
```

`customFunction` values:

| Expression      | `customFunction` value |
| --------------- | ---------------------- |
| `x are present` | `"are present"`        |
| `x are unique`  | `"are unique"`         |

**Example input:** `transactionIds are unique`

```json
{
    "type": "customUniaryFunction",
    "customFunction": "are unique",
    "expression": { "type": "identifier", "name": "transactionIds" }
}
```

---

## 6. `IdentifierNode`

A leaf node representing a variable name. Never appears as the top-level node — always nested inside a function node.

```typescript
interface IdentifierNode extends AstNode {
    type: "identifier";
    name: string; // the raw variable name as written, case-sensitive
}
```

The `name` corresponds to a key declared in the enclosing test object (the JSONPath-bound variables).

---

## 7. Complete worked example

**Input:**

```
(itemIds all in catalogIds || price are present) && status equal to expectedStatus
```

**AST:**

```json
{
    "type": "returnStatement",
    "expression": {
        "type": "binaryOperator",
        "operator": "&&",
        "lhs": {
            "type": "returnStatement",
            "expression": {
                "type": "binaryOperator",
                "operator": "||",
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
        },
        "rhs": {
            "type": "customBinaryFunction",
            "customFunction": "equal to",
            "lhs": { "type": "identifier", "name": "status" },
            "rhs": { "type": "identifier", "name": "expectedStatus" }
        }
    }
}
```

---

## 8. Walking the AST

Use a recursive visitor pattern switching on `node.type`:

```typescript
function walk(node: AstNode): string {
    switch (node.type) {
        case "returnStatement":
            return walk((node as ReturnStatementNode).expression);

        case "binaryOperator": {
            const n = node as BinaryOperatorNode;
            const l = walk(n.lhs);
            const r = walk(n.rhs);
            return n.operator === "&&" ? `(${l} && ${r})` : `(${l} || ${r})`;
        }

        case "notOperator":
            return `!(${walk((node as NotOperatorNode).expression)})`;

        case "customBinaryFunction": {
            const n = node as CustomBinaryFunction;
            return `customBinary("${n.customFunction}", ${n.lhs.name}, ${n.rhs.name})`;
        }

        case "customUniaryFunction": {
            const n = node as CustomUniaryFunction;
            return `customUnary("${n.customFunction}", ${n.expression.name})`;
        }

        case "identifier":
            return (node as IdentifierNode).name;
    }
}
```

---

## 9. Semantic validation — `checkValidVariables`

Located in `ast-functions/semantic-validations.ts`.

After building the AST, call this to ensure every `IdentifierNode` references a variable that actually exists in the enclosing test object's scope:

```typescript
import { checkValidVariables } from "./ast-functions/semantic-validations.js";

checkValidVariables(ast, ["itemIds", "catalogIds", "price"], "$.context");
// throws: Error: Invalid variable foo at path $.context
```

The function recurses through the full AST and throws on the first unrecognised variable name.

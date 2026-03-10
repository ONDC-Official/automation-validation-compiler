# JVAL Operations Reference

Every expression in `_RETURN_` is built from three building blocks:

1. **Boolean connectives** — `&&`, `||`, `!`
2. **Unary functions** — operate on one variable (`lhs UnaryFn`)
3. **Binary functions** — operate on two variables (`lhs BinaryFn rhs`)

---

## 1. Boolean Connectives

### `&&` — AND

Evaluates to `true` only when **both** sides are `true`.

```
a are present && b are present
```

_"Both a and b must be present in the payload."_

- Left-associative; chains naturally: `a && b && c` ≡ `(a && b) && c`
- Higher precedence than `||`
- Token: `AndOperator`, pattern `&&`

---

### `||` — OR

Evaluates to `true` when **at least one** side is `true`.

```
a are present || b are present
```

_"Either a or b (or both) must be present."_

- Left-associative: `a || b || c` ≡ `(a || b) || c`
- Lower precedence than `&&`
- Token: `OrOperator`, pattern `\|\|`

---

### `!` — NOT

Inverts the result of a **parenthesised** sub-expression.

```
!(items all in catalog)
```

_"Not all items are in the catalog."_ (i.e. at least one item is absent from the catalog)

> **Syntax rule:** `!` must be followed directly by `(…)`.  
> `!x are present` is a **parse error** — use `!(x are present)` instead.

- Token: `NotOperator`, pattern `!`
- Propagated down the AST — `CompileToMarkdown` passes a `forNot` flag all the way to the leaf, which flips the human-readable phrase.

---

## 2. Unary Functions

Unary functions take **one identifier** (left-hand side) and produce a boolean.

Syntax: `<lhs> <function>`

### `are present`

Checks that the extracted value of `lhs` exists and is non-null/non-empty in the current payload.

```
price are present
```

_"price must be present in the payload."_

- Negated: `!(price are present)` → _"price must **not** be present in the payload."_
- Token: `ArePresent` (`/are present/i`)
- Category: `CustomUniaryFunctions`

---

### `are unique`

Checks that all values within the extracted array of `lhs` are distinct (no duplicates).

```
transactionIds are unique
```

_"All values of transactionIds are unique."_

- Typically used on arrays extracted via JSONPath.
- Negated: `!(transactionIds are unique)` → _"All values of transactionIds must **not** be unique."_
- Token: `AreUnique` (`/are unique/i`)
- Category: `CustomUniaryFunctions`

---

## 3. Binary Functions

Binary functions take **two identifiers** and produce a boolean.

Syntax: `<lhs> <function> <rhs>`

### `all in`

Every element of `lhs` (array) must appear somewhere in `rhs` (array).

```
itemIds all in catalogIds
```

_"All elements of itemIds must be in catalogIds."_

| Negated?     | Meaning                                                          |
| ------------ | ---------------------------------------------------------------- |
| No           | Every element of lhs exists in rhs                               |
| Yes (`!(…)`) | Not every element of lhs exists in rhs (at least one is missing) |

- Token: `AllIn` (`/all in/i`)
- Category: `CustomBinaryFunctions`

---

### `any in`

At least one element of `lhs` must appear in `rhs`.

```
selectedTags any in allowedTags
```

_"At least one of selectedTags must be in allowedTags."_

| Negated? | Meaning                                |
| -------- | -------------------------------------- |
| No       | At least one lhs element exists in rhs |
| Yes      | None of lhs elements exist in rhs      |

- Token: `AnyIn` (`/any in/i`)
- Category: `CustomBinaryFunctions`

---

### `none in`

No element of `lhs` may appear in `rhs`.

```
blacklistedItems none in orderItems
```

_"No element of blacklistedItems must be in orderItems."_

| Negated? | Meaning                            |
| -------- | ---------------------------------- |
| No       | No overlap between lhs and rhs     |
| Yes      | Some elements of lhs may be in rhs |

- Token: `NoneIn` (`/none in/i`)
- Category: `CustomBinaryFunctions`

---

### `follow regex`

Every element of `lhs` must match every regex pattern in `rhs`.

```
phoneNumbers follow regex phonePatterns
```

_"All elements of phoneNumbers must follow every regex in phonePatterns."_

- `rhs` is expected to resolve to an array of regex strings.
- Token: `FollowRegex` (`/follow regex/i`)
- Category: `CustomBinaryFunctions`

---

### `equal to`

`lhs` must equal `rhs`.

```
status equal to expectedStatus
```

_"status must equal expectedStatus."_

| Negated? | Meaning     |
| -------- | ----------- |
| No       | lhs === rhs |
| Yes      | lhs !== rhs |

- Token: `EqualTo` (`/equal to/i`)
- Category: `CustomBinaryFunctions`

---

### `greater than`

`lhs` must be strictly greater than `rhs` (numeric or comparable).

```
totalAmount greater than minAmount
```

_"totalAmount must be greater than minAmount."_

- Token: `GreaterThan` (`/greater than/i`)
- Category: `CustomBinaryFunctions`

---

### `less than`

`lhs` must be strictly less than `rhs`.

```
discountPercent less than maxDiscount
```

_"discountPercent must be less than maxDiscount."_

- Token: `LessThan` (`/less than/i`)
- Category: `CustomBinaryFunctions`

---

## 4. Token order in the lexer

Chevrotain matches tokens in the order they are listed in `allTokens`. The ordering is important to avoid ambiguity:

```typescript
export const allTokens = [
    WhiteSpace, // skipped first
    LParen,
    RParen, // single-char symbols
    AndOperator, // && (before any letter tokens)
    OrOperator, // ||
    NotOperator, // !
    AreUnique, // multi-word keywords before Identifier
    ArePresent,
    AllIn,
    AnyIn,
    EqualTo,
    GreaterThan,
    LessThan,
    FollowRegex,
    NoneIn,
    CustomUniaryFunctions, // abstract category tokens (never directly matched)
    CustomBinaryFunctions,
    BinaryOperator,
    Identifier, // catch-all — must be last
];
```

> **Why keywords before `Identifier`?** Each keyword pattern (e.g. `/all in/i`) is more specific. If `Identifier` were listed first it would greedily consume e.g. `all` as an identifier and `in` as another, breaking keyword recognition.

---

## 5. Complete token reference table

| Token name              | Category                | Pattern                    | Label             |
| ----------------------- | ----------------------- | -------------------------- | ----------------- |
| `Identifier`            | —                       | `/[a-zA-Z_][a-zA-Z0-9_]*/` | —                 |
| `WhiteSpace`            | SKIPPED                 | `/\s+/`                    | —                 |
| `LParen`                | —                       | `/\(/`                     | `(`               |
| `RParen`                | —                       | `/\)/`                     | `)`               |
| `AndOperator`           | `BinaryOperator`        | `/&&/`                     | `&&`              |
| `OrOperator`            | `BinaryOperator`        | `/\|\|/`                   | `\|\|`            |
| `NotOperator`           | —                       | `/!/`                      | `!`               |
| `ArePresent`            | `CustomUniaryFunctions` | `/are present/i`           | `are present`     |
| `AreUnique`             | `CustomUniaryFunctions` | `/are unique/i`            | `are unique`      |
| `AllIn`                 | `CustomBinaryFunctions` | `/all in/i`                | `all in`          |
| `AnyIn`                 | `CustomBinaryFunctions` | `/any in/i`                | `any in`          |
| `NoneIn`                | `CustomBinaryFunctions` | `/none in/i`               | `none in`         |
| `FollowRegex`           | `CustomBinaryFunctions` | `/follow regex/i`          | `follow regex`    |
| `EqualTo`               | `CustomBinaryFunctions` | `/equal to/i`              | `equal to`        |
| `GreaterThan`           | `CustomBinaryFunctions` | `/greater than/i`          | `greater than`    |
| `LessThan`              | `CustomBinaryFunctions` | `/less than/i`             | `less than`       |
| `CustomBinaryFunctions` | —                       | `Lexer.NA`                 | abstract category |
| `CustomUniaryFunctions` | —                       | `Lexer.NA`                 | abstract category |
| `BinaryOperator`        | —                       | `Lexer.NA`                 | abstract category |

> `Lexer.NA` means the token is never matched directly — it exists only as an abstract category so parser rules can refer to the group as a whole.

---

## 6. Adding a new function

1. **Define the token** in `tokens.ts`:

```typescript
export const CountEquals = createToken({
    name: "CountEquals",
    pattern: /count equals/i,
    categories: CustomBinaryFunctions, // or CustomUniaryFunctions
    label: "count equals",
});
```

2. **Register it** in `allTokens` _before_ `CustomBinaryFunctions` and _before_ `Identifier`.

3. **Add markdown messages** in `compile-to-markdown.ts` inside `binaryMessages` (or `uniaryMessages`):

```typescript
const binaryMessages = {
  ...
  [CountEquals.LABEL ?? "count equals"]: (lhs, rhs, forNot) =>
    `The count of {{{${lhs}}}} ${forNot ? "must **not** equal" : "must equal"} {{{${rhs}}}}`,
};
```

4. **Implement lowering** in each `{language}-ast.ts` file inside the code generators.

> No changes to `parser.ts` or `ast.ts` are needed — the category token mechanism handles new keywords automatically.

# JVAL Expression Grammar

## 1. Formal Grammar (EBNF)

```ebnf
(* Entry rule — the whole _RETURN_ string *)
Expression            ::= OrExpression

(* Boolean OR — lowest precedence *)
OrExpression          ::= AndExpression ( '||' AndExpression )*

(* Boolean AND — higher precedence than OR *)
AndExpression         ::= NotExpression ( '&&' NotExpression )*

(* Boolean NOT — right-to-left, applies to a parenthesised group only *)
NotExpression         ::= ( '!' ParenthesisedExpression )
                        | PrimaryExpression

(* Primary: either a grouped sub-expression or a function call leaf *)
PrimaryExpression     ::= ParenthesisedExpression
                        | AtomicCustomExpression

(* Explicit grouping with parentheses *)
ParenthesisedExpression ::= '(' Expression ')'

(* A single function call — the smallest meaningful unit *)
AtomicCustomExpression  ::= Identifier BinaryFunction Identifier   (* binary *)
                           | Identifier UnaryFunction               (* unary  *)

(* --- Terminals --- *)

(* Built-in binary functions (case-insensitive) *)
BinaryFunction  ::= 'all in'
                  | 'any in'
                  | 'none in'
                  | 'follow regex'
                  | 'equal to'
                  | 'greater than'
                  | 'less than'

(* Built-in unary functions (case-insensitive) *)
UnaryFunction   ::= 'are unique'
                  | 'are present'

(* Variable names — same as most programming language identifiers *)
Identifier      ::= [a-zA-Z_][a-zA-Z0-9_]*

(* Boolean connectives *)
AndOperator     ::= '&&'
OrOperator      ::= '||'
NotOperator     ::= '!'

(* Grouping *)
LParen          ::= '('
RParen          ::= ')'

(* Whitespace is skipped everywhere *)
WhiteSpace      ::= /\s+/   (* ignored by lexer *)
```

---

## 2. Operator Precedence (highest → lowest)

| Level       | Operator / Construct                       | Associativity | Notes                                        |
| ----------- | ------------------------------------------ | ------------- | -------------------------------------------- |
| 1 (highest) | `(…)` parentheses                          | n/a           | explicit grouping                            |
| 2           | `!` NOT                                    | right         | **must** wrap a `(…)` group — not bare atoms |
| 3           | function call (`all in`, `are present`, …) | n/a           | atomic leaf                                  |
| 4           | `&&` AND                                   | left          | chains flat                                  |
| 5 (lowest)  | `\|\|` OR                                  | left          | chains flat                                  |

> **Key restriction on `!`:** The `!` operator applies only to a **parenthesised expression**, not to a bare function call.  
> ✅ `!(x are present)`  
> ❌ `!x are present` ← parse error

---

## 3. Precedence examples

```
a all in b || c are present && d are unique
```

Parsed as (per standard precedence):

```
(a all in b) || ((c are present) && (d are unique))
```

---

```
(a all in b || c are present) && d are unique
```

Parentheses override — parsed as:

```
((a all in b) || (c are present)) && (d are unique)
```

---

```
!(a all in b) && c are present
```

NOT inverts the inner group:

```
(NOT (a all in b)) && (c are present)
```

---

## 4. Identifier rules

Identifiers follow the regex `[a-zA-Z_][a-zA-Z0-9_]*`, matching typical variable names in most languages.

An identifier in a JVAL expression **always refers to a variable name** declared in the enclosing test object — never a literal string or number. Variable names are case-sensitive.

Valid:

```
itemIds   price_v2   _count   TAX
```

Invalid (will produce a lexer error):

```
2ndItem   item-ids   "literal"
```

---

## 5. Case-insensitivity of keywords

All multi-word function keywords are lexed with the `i` flag, meaning:

```
all in   ALL IN   All In   aLl In
```

are all equivalent and produce the same `AllIn` token. Only `&&`, `||`, `!`, `(`, `)` are case-sensitive (they are single-character/symbol tokens).

---

## 6. Whitespace

Whitespace (spaces, tabs, newlines) is recognised by the lexer and **silently discarded** — it plays no grammatical role. A single space is required to delimit multi-word keywords from adjacent identifiers, but extra spaces or newlines are harmless.

```
items   all   in   catalog   &&   price   are   present
```

…is identical to:

```
items all in catalog && price are present
```

---

## 7. Grammar notes for parser implementers

- The grammar is **LL(1)** (no backtracking needed) — Chevrotain resolves all alternatives by look-ahead of one token.
- `OrExpression` and `AndExpression` use the **Chevrotain `MANY` loop** idiom to produce left-associative chains without left recursion.
- `NotExpression` uses `OR [ alt1, alt2 ]` with the NOT branch checked first (presence of `!` token).
- `AtomicCustomExpression` uses `OR [ binaryAlt, unaryAlt ]`; the binary alternative is tried first because it requires two identifiers and a binary-category token.
- `CustomBinaryFunctions` and `CustomUniaryFunctions` are **abstract category tokens** in Chevrotain — individual keywords (e.g. `AllIn`, `ArePresent`) belong to these categories, allowing the parser to match the category instead of listing every keyword.

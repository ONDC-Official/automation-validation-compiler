# JVAL — Full DSL Reference

**JVAL** (JSON Validation Language) is a declarative, JSON/YAML-based DSL for writing API payload validation rules. A JVAL config is compiled by the code generator into executable validation functions in TypeScript, Python, JavaScript, or Go.

This document covers the complete DSL — the config structure, every field, variable binding, scoping, conditional logic, session/stateful data, nested tests, and how it all maps to generated code.

---

## Table of Contents

1. [Top-Level Config Structure](#1-top-level-config-structure)
2. [Test Sets](#2-test-sets)
3. [Test Object — field reference](#3-test-object--field-reference)
4. [Variables](#4-variables)
5. [Scope](#5-scope)
6. [The `_RETURN_` field](#6-the-_return_-field)
7. [The `_CONTINUE_` field (conditional skip)](#7-the-_continue_-field-conditional-skip)
8. [Nested `_RETURN_` (grouped tests)](#8-nested-_return_-grouped-tests)
9. [Session Data & Cross-Request State](#9-session-data--cross-request-state)
10. [External Data & `$._EXTERNAL`](#10-external-data--_external)
11. [Generated Output Shape](#11-generated-output-shape)
12. [Runtime ValidationConfig](#12-runtime-validationconfig)
13. [Complete Annotated Examples](#13-complete-annotated-examples)
14. [Common Patterns Cookbook](#14-common-patterns-cookbook)
15. [Reserved Keywords](#15-reserved-keywords)

---

## 1. Top-Level Config Structure

A JVAL config is a JSON object with exactly two top-level keys:

```json
{
  "_TESTS_": {
    "<action_name>": [ <test_object>, ... ],
    "<action_name_2>": [ <test_object>, ... ]
  },
  "_SESSION_DATA_": {
    "<action_name>": {
      "<key>": "<json_path_expression>"
    }
  }
}
```

| Key              | Type   | Required | Description                                                                          |
| ---------------- | ------ | -------- | ------------------------------------------------------------------------------------ |
| `_TESTS_`        | Object | Yes      | All validation test sets, keyed by API action name                                   |
| `_SESSION_DATA_` | Object | Yes      | Declares what values to save after each action for stateful cross-request validation |

The action names under `_TESTS_` and `_SESSION_DATA_` are arbitrary strings that correspond to API operations (e.g., `search`, `on_search`, `init`, `confirm`, `cancel`, etc.). The code generator emits one validation function per action.

---

## 2. Test Sets

Each value under `_TESTS_` is an **ordered array of test objects**. The generated function for that action runs every test object in sequence.

```json
{
  "_TESTS_": {
    "search": [
      { /* test object 1 */ },
      { /* test object 2 */ },
      ...
    ],
    "on_confirm": [
      { /* test object 1 */ },
      ...
    ]
  }
}
```

- Tests within a set are **independent** — a failure in one does not stop subsequent tests from running.
- The generated function collects all results and returns them together.
- Test names must be **unique within a test set** (they become function names in generated code).

---

## 3. Test Object — field reference

A test object is a JSON object with a mix of **reserved system fields** (prefixed and suffixed with `_`) and **user-defined variable fields**.

### Full schema

```json
{
  "_NAME_":         "<string>",
  "_DESCRIPTION_":  "<string>",
  "_SCOPE_":        "<json_path>",
  "_CONTINUE_":     "<jval_expression>",
  "_ERROR_CODE_":   <number>,
  "_SUCCESS_CODE_": <number>,
  "_RETURN_":       "<jval_expression>" | [ <test_object>, ... ],

  "<varName1>": "<json_path>" | ["<string>", ...],
  "<varName2>": "<json_path>" | ["<string>", ...]
}
```

### Reserved fields

| Field            | Type            | Required | Default        | Description                                                                                                                                                     |
| ---------------- | --------------- | -------- | -------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `_NAME_`         | string          | **Yes**  | —              | Unique identifier for this test. Becomes the generated function name. Use `UPPER_SNAKE_CASE` or `snake_case`. No spaces or hyphens.                             |
| `_DESCRIPTION_`  | string          | No       | Auto-generated | Human-readable description shown in error output when the test fails.                                                                                           |
| `_SCOPE_`        | JSONPath        | No       | `"$"`          | Narrows the JSON subtree that tests run against. The path must resolve to an **array**; the test logic runs once per element.                                   |
| `_CONTINUE_`     | JVAL expression | No       | —              | If this expression evaluates to `true` for a scope element, **that element is skipped** (the test is not run for it). Used for conditional/optional validation. |
| `_ERROR_CODE_`   | number          | No       | `30000`        | Error code returned when the test fails.                                                                                                                        |
| `_SUCCESS_CODE_` | number          | No       | `200`          | Success code returned when the test passes.                                                                                                                     |
| `_RETURN_`       | string or array | **Yes**  | —              | Either a JVAL expression string (leaf test) or an array of nested test objects (grouped tests).                                                                 |

### User-defined variable fields

Any key that is **not** one of the reserved fields above is treated as a variable declaration. See [Section 4](#4-variables).

---

## 4. Variables

Variables are the bridge between the JSON payload and the JVAL expression in `_RETURN_`.

### Variable value types

#### A. JSONPath string

```json
"attr": "$.context.action"
```

At runtime, the generator extracts all matching values from the current scope object using this path. The variable `attr` becomes an array of extracted values (even if only one matches).

```json
"tags": "$.message.order.tags[*].descriptor.code"
```

Multiple-match paths (using `[*]`, `..`, filter expressions) produce arrays of all matching values.

#### B. String array literal

```json
"validActions": ["search", "select", "init"]
```

The variable `validActions` is a fixed list of strings. This is the primary way to supply enum allowlists inline.

#### C. External/session data reference

```json
"prevTransactionId": "$._EXTERNAL.transaction_id"
```

The `$._EXTERNAL` prefix accesses data from outside the current payload — either from previous API calls (via `_SESSION_DATA_`) or from externally injected data passed at runtime. See [Section 10](#10-external-data--_external).

### Variable name rules

- Must match `[a-zA-Z_][a-zA-Z0-9_]*` (same as a standard identifier).
- Case-sensitive.
- Must not clash with any reserved field name.
- Must not use language reserved keywords (JavaScript/TypeScript/Python keywords are all blocked — see [Section 15](#15-reserved-keywords)).

### How variables are resolved in generated code (TypeScript)

```typescript
// JSONPath variable
const attr = payloadUtils.getJsonPath(testObj, "$.context.action", true);

// Array literal variable
const validActions = ["search", "select", "init"];

// External data variable
const prevTransactionId = payloadUtils.getJsonPath(
    testObj,
    "$._EXTERNAL.transaction_id",
    true,
);
// (testObj._EXTERNAL is injected by the runner before extraction)
```

---

## 5. Scope

`_SCOPE_` is a JSONPath expression that determines **which part of the payload** a test operates on, and **how many times** the test body runs.

### Default scope

If `_SCOPE_` is omitted, it defaults to `"$"` (the root of the payload). A single virtual scope object containing the full payload is used, so the test runs exactly once.

### Array scope

When `_SCOPE_` resolves to an array, **the test runs once per element**. Variable paths inside the test object are relative to each element.

```json
{
    "_NAME_": "CHECK_PAYMENT_TRANSACTION",
    "_SCOPE_": "$.message.order.payments[*]",
    "statusPath": "$.status",
    "transactionId": "$.params.transaction_id",
    "paidStatus": ["PAID"],
    "_CONTINUE_": "!(statusPath all in paidStatus)",
    "_RETURN_": "transactionId are present"
}
```

For each payment object in the array:

1. `statusPath` extracts `$.status` from that payment object.
2. `transactionId` extracts `$.params.transaction_id` from that payment object.
3. `_CONTINUE_` is checked — if the payment is NOT `PAID`, skip this test for that element.
4. `_RETURN_` checks `transactionId are present` for PAID payments only.

### Scope with JSONPath filter expressions

`_SCOPE_` fully supports JSONPath filter expressions:

```json
"_SCOPE_": "$.message.order.tags[?(@.descriptor.code=='BAP_TERMS')]"
```

This iterates only over tags whose `descriptor.code` is `BAP_TERMS`. Within the test object, `$.list[*].descriptor.code` is then relative to that specific tag object.

### Key rule

**Variable JSONPaths inside a test object are always relative to the current scope element**, not the root payload. This is because before variable extraction the generator sets the scope object as the current context.

---

## 6. The `_RETURN_` field

`_RETURN_` is the core of a test object. It specifies **what boolean condition must hold** for the test to pass.

### Form 1: JVAL expression string (leaf test)

```json
"_RETURN_": "attr are present && attr all in enumList"
```

This is a JVAL expression. The full grammar and operator reference is in the `return-complier/docs/` subfolder. Quick summary:

- Variables evaluate to arrays extracted from the payload.
- Unary functions: `<var> are present`, `<var> are unique`
- Binary functions: `<lhs> all in <rhs>`, `<lhs> any in <rhs>`, `<lhs> none in <rhs>`, `<lhs> follow regex <rhs>`, `<lhs> equal to <rhs>`, `<lhs> greater than <rhs>`, `<lhs> less than <rhs>`
- Boolean connectives: `&&`, `||`, `!`
- Parentheses for grouping: `(…)`, with `!` only applicable to parenthesised groups: `!(…)`

When `_RETURN_` is a string:

- The expression is compiled to a boolean expression in the target language.
- If the expression evaluates to `false`, the test fails and returns `{ valid: false, code: _ERROR_CODE_, description: "…" }`.
- If `true`, the test passes and returns `{ valid: true, code: _SUCCESS_CODE_ }`.

### Form 2: Array of test objects (nested/grouped tests)

```json
"_RETURN_": [
  { "_NAME_": "sub_test_1", ... "_RETURN_": "..." },
  { "_NAME_": "sub_test_2", ... "_RETURN_": "..." }
]
```

When `_RETURN_` is an array, the parent test object becomes a **group wrapper**. The generator:

1. Generates individual sub-test functions for each item.
2. The parent function runs all sub-functions and aggregates their results.
3. The parent test object itself does not have a JVAL expression — it acts as a container.

This is how large conditional blocks are written, for example validating message body fields only when no error is present:

```json
{
    "_NAME_": "on_search_Message_TESTS",
    "errorBlock": "$.error.code",
    "_CONTINUE_": "errorBlock are present",
    "_RETURN_": [
        {
            "_NAME_": "REQUIRED_CATALOG_NAME",
            "attr": "$.message.catalog.descriptor.name",
            "_RETURN_": "attr are present"
        },
        {
            "_NAME_": "REQUIRED_PROVIDER_ID",
            "attr": "$.message.catalog.providers[*].id",
            "_RETURN_": "attr are present"
        }
    ]
}
```

Here if `errorBlock` (i.e. `$.error.code`) is present in the payload, the whole group is skipped. If it is absent, all sub-tests run.

---

## 7. The `_CONTINUE_` field (conditional skip)

`_CONTINUE_` is a JVAL expression that acts as a **skip gate**.

- Evaluated first, before `_RETURN_`.
- If `_CONTINUE_` evaluates to **`true`** for a scope element → **skip** (do not run `_RETURN_` for that element, treat it as passing trivially).
- If `_CONTINUE_` evaluates to **`false`** → proceed to evaluate `_RETURN_`.

### Semantics

`_CONTINUE_` means: _"Continue past this test (skip) if this condition holds."_

This is used for two main patterns:

#### Pattern 1: Optional field validation

```json
{
    "_NAME_": "VALID_ENUM_VEHICLE_CATEGORY",
    "enumList": ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"],
    "enumPath": "$.message.intent.fulfillment.vehicle.category",
    "_CONTINUE_": "!(enumPath are present)",
    "_RETURN_": "enumPath all in enumList"
}
```

- If `vehicle.category` is **not present** in the payload → `!(enumPath are present)` is `true` → skip. The field is optional, so absence is fine.
- If `vehicle.category` **is present** → `!(enumPath are present)` is `false` → run `_RETURN_`, validating the value is within the allowed list.

#### Pattern 2: Conditional group skipping

```json
{
  "_NAME_": "on_search_Message_TESTS",
  "errorBlock": "$.error.code",
  "_CONTINUE_": "errorBlock are present",
  "_RETURN_": [ ... ]
}
```

- If the payload contains an `error.code` (i.e. it's an error response) → skip the entire sub-test group.
- If no error → validate the message body.

#### Pattern 3: Scoped conditional

```json
{
    "_NAME_": "FULFILLMENT_STATE_ENDED",
    "_SCOPE_": "$.message.order.fulfillments[*]",
    "auth": "$.stops[*].authorization.status",
    "authStatus": ["CLAIMED"],
    "state": "$.state.descriptor.code",
    "stateCode": ["RIDE_ENDED"],
    "_CONTINUE_": "!(authStatus all in auth)",
    "_RETURN_": "state all in stateCode"
}
```

For each fulfillment element:

- Skip if its `authorization.status` is NOT `CLAIMED`.
- If it IS `CLAIMED`, validate that `state.descriptor.code` is `RIDE_ENDED`.

---

## 8. Nested `_RETURN_` (grouped tests)

When `_RETURN_` is an array of test objects, it creates a hierarchical validation structure.

### Rules

- The **parent test object** has its own `_NAME_`, can have `_SCOPE_`, and **can have `_CONTINUE_`** (applied to the whole group).
- The parent does NOT have a JVAL expression — it has no `_ERROR_CODE_` or `_SUCCESS_CODE_` that apply to itself as a leaf.
- Each **child test object** is a fully independent test object with its own `_NAME_`, `_SCOPE_`, `_CONTINUE_`, `_RETURN_`, `_ERROR_CODE_`, etc.
- Children can themselves have array `_RETURN_`, creating **arbitrary nesting depth**.
- The parent's result is derived from all child results: `valid = all children valid`.

### Generated structure

```
parentFunction(input)
  └─ runs all child functions:
       childFunction1(input) → validationOutput[]
       childFunction2(input) → validationOutput[]
       ...
  └─ returns combined array of all child results
```

The parent function's own result entry has `valid: true` only if every child returned `valid: true`.

### Common usage: error-gated message validation

For `on_*` ONDC API responses, a payload may be an error response (contains `error.code`) or a successful one (contains `message.*`). Nested `_RETURN_` with `_CONTINUE_` on the parent is the standard pattern:

```json
{
    "_NAME_": "on_confirm_Message_TESTS",
    "errorBlock": "$.error.code",
    "_CONTINUE_": "errorBlock are present",
    "_RETURN_": [
        {
            "_NAME_": "REQUIRED_ORDER_ID",
            "attr": "$.message.order.id",
            "_RETURN_": "attr are present"
        },
        {
            "_NAME_": "REQUIRED_ORDER_STATUS",
            "attr": "$.message.order.status",
            "_RETURN_": "attr are present"
        }
    ]
}
```

---

## 9. Session Data & Cross-Request State

`_SESSION_DATA_` enables **stateful validation** — saving values from one API call and using them in a later one.

### Structure

```json
"_SESSION_DATA_": {
  "<action_name>": {
    "<key>": "<json_path>"
  }
}
```

- `<action_name>` is the API action after which data is saved (e.g., `"search"`).
- `<key>` is the name under which the extracted value is stored.
- `<json_path>` is extracted from the payload of that action.

### Example

```json
"_SESSION_DATA_": {
  "search": {
    "transaction_id": "$.context.transaction_id"
  }
}
```

After a `search` call, `$.context.transaction_id` is extracted from the payload and stored in the session under the key `"transaction_id"`.

### Reading session data in a test

Use the `$._EXTERNAL.<key>` path for a variable:

```json
{
    "_NAME_": "VERIFY_TRANSACTION_CONTINUITY",
    "currentTxnId": "$.context.transaction_id",
    "prevTxnId": "$._EXTERNAL.transaction_id",
    "_RETURN_": "currentTxnId equal to prevTxnId"
}
```

This test verifies that the `transaction_id` in the current `on_search` payload matches the one saved from the `search` call.

### Runtime requirement

Stateful validations require enabling `stateFullValidations: true` in the `ValidationConfig` at runtime, plus providing a `store` (a `StorageInterface` implementation) and a `uniqueKey` to namespace the session:

```typescript
await performL1Validations("on_search", payload, {
    stateFullValidations: true,
    uniqueKey: "session-abc-123",
    store: myRedisStorage,
});
```

If `stateFullValidations` is `false` (default), variables with `$._EXTERNAL.*` paths are ignored and the validation is treated as stateless.

---

## 10. External Data & `$._EXTERNAL`

`$._EXTERNAL` is a special namespace that provides data from **outside the current payload**. It is populated at validation runtime and can come from two sources:

### Source 1: Session/stateful data

Values saved via `_SESSION_DATA_` from previous API calls (see Section 9).

### Source 2: Caller-injected data

Arbitrary data passed by the caller at runtime:

```typescript
// TypeScript
await performL1Validations("search", payload, config, {
  full_ids: { "10102": true, "10103": true },
});

// Go
results, err := PerformL1_validations(action, payload, cfg, validationutils.ExternalData{
  "full_ids": map[string]bool{ "10102": true },
})
```

This is used for data that must come from an external database, orchestration layer, or prior business logic — not from the payload itself.

### Source 3: `_SELF` — the current payload

`$._EXTERNAL._SELF` is always automatically populated with the **full normalised payload** being validated. This allows a test to reference the entire payload from within any scoped context.

```json
{
    "_SCOPE_": "$.message.items[*]",
    "itemId": "$.id",
    "allProviderIds": "$._EXTERNAL._SELF.message.catalog.providers[*].id",
    "_RETURN_": "itemId all in allProviderIds"
}
```

Variables referencing `_SELF` are **never collected into load/save session operations** — they are always available without stateful storage.

### Path syntax

```
$._EXTERNAL.<key>
$._EXTERNAL._SELF.<further_json_path>
```

In generated code, before variable extraction the `_EXTERNAL` object is injected onto `testObj`:

```typescript
testObj._EXTERNAL = input.externalData;
const allProviderIds = payloadUtils.getJsonPath(
    testObj,
    "$._EXTERNAL._SELF.message.catalog.providers[*].id",
    true,
);
```

---

## 11. Generated Output Shape

The code generator produces this directory structure (TypeScript example):

```
generated/<codeName>/
├── index.ts                    ← Entry: perform<CodeName>(action, payload, config, externalData)
├── error.ts                    ← Error code registry
├── api-tests/
│   ├── search.ts               ← search(input): validationOutput
│   ├── on_search.ts
│   ├── init.ts
│   └── ...
├── utils/
│   ├── json-path-utils.ts      ← payloadUtils.getJsonPath(...)
│   ├── validation-utils.ts     ← validations.arePresent(...), allIn(...)...
│   └── json-normalizer.ts      ← normalizeKeys(payload)
├── types/
│   └── test-config.ts          ← ValidationConfig, validationInput, validationOutput, ExternalData
├── interfaces/
│   └── storage-interface.ts    ← StorageInterface
└── storage-actions/
    ├── index.ts
    ├── search.ts               ← perform<CodeName>Save / perform<CodeName>Load per action
    └── ...
```

### `validationOutput` type

```typescript
type validationOutput = {
    testName: string; // The _NAME_ of the test object
    valid: boolean; // true = pass, false = fail
    code: number; // _SUCCESS_CODE_ or _ERROR_CODE_
    description?: string; // Only present on failure; markdown message
    _debugInfo?: {
        // Only present when config._debug = true
        fedConfig: any; // The raw test object JSON
    };
}[];
```

---

## 12. Runtime ValidationConfig

The generated entry function accepts a `ValidationConfig` object that controls runtime behaviour:

```typescript
interface ValidationConfig {
    onlyInvalid: boolean; // If true, only return failed test results (default: true)
    hideParentErrors: boolean; // If true, suppress parent group results that have no description (default: true)
    stateFullValidations: boolean; // If true, load/save session data (default: false)
    skipTests?: string[]; // Array of _NAME_ values to skip entirely
    uniqueKey?: string; // Session namespace key (required if stateFullValidations = true)
    store?: StorageInterface; // Storage backend (required if stateFullValidations = true)
    _debug?: boolean; // If true, include _debugInfo in output (default: false)
}
```

### Calling the generated function

```typescript
import { performMyValidations } from "./generated/my-validations";

const results = await performMyValidations(
    "search", // action name — must match a key in _TESTS_
    payload, // the raw JSON payload object
    {
        onlyInvalid: true,
        hideParentErrors: true,
        stateFullValidations: false,
    },
    {
        // optional external data injected as $._EXTERNAL.*
        full_ids: ["id1", "id2"],
    },
);

// results is validationOutput[]
// Each entry: { testName, valid, code, description? }
```

---

## 13. Complete Annotated Examples

### Example 1: Simple required field + enum check

```json
{
    "_NAME_": "REQUIRED_CONTEXT_ACTION",
    "attr": "$.context.action",
    "enumList": ["search"],
    "_ERROR_CODE_": 30001,
    "_DESCRIPTION_": "context.action must be present and must be 'search'",
    "_RETURN_": "attr are present && attr all in enumList"
}
```

- `attr` extracts `$.context.action` (an array, typically single-element: `["search"]`).
- `enumList` is the literal array `["search"]`.
- `_RETURN_` checks both presence and value correctness.
- If either sub-check fails, returns `{ valid: false, code: 30001, description: "…" }`.

---

### Example 2: Optional field with conditional enum validation

```json
{
    "_NAME_": "VALID_ENUM_VEHICLE_CATEGORY",
    "enumList": ["AUTO_RICKSHAW", "CAB", "TWO_WHEELER"],
    "enumPath": "$.message.order.fulfillments[*].vehicle.category",
    "_CONTINUE_": "!(enumPath are present)",
    "_RETURN_": "enumPath all in enumList"
}
```

- If `vehicle.category` is absent → `_CONTINUE_` is `true` → skip → no error.
- If `vehicle.category` is present → `_CONTINUE_` is `false` → validate that every value is in the enum list.

---

### Example 3: Scoped validation with conditional

```json
{
    "_NAME_": "FULFILLMENT_STATE_ENDED",
    "_SCOPE_": "$.message.order.fulfillments[*]",
    "auth": "$.stops[*].authorization.status",
    "authStatus": ["CLAIMED"],
    "state": "$.state.descriptor.code",
    "stateCode": ["RIDE_ENDED"],
    "_CONTINUE_": "!(authStatus all in auth)",
    "_RETURN_": "state all in stateCode"
}
```

- Iterates over each fulfillment.
- For each: extracts `authorization.status` array as `auth`.
- Skips if it does NOT contain `CLAIMED`.
- For CLAIMED fulfillments: validates that `state.descriptor.code` is `RIDE_ENDED`.

---

### Example 4: Nested test group (error-gated message validation)

```json
{
    "_NAME_": "on_search_Message_TESTS",
    "errorBlock": "$.error.code",
    "_CONTINUE_": "errorBlock are present",
    "_RETURN_": [
        {
            "_NAME_": "REQUIRED_CATALOG_NAME",
            "attr": "$.message.catalog.descriptor.name",
            "_RETURN_": "attr are present"
        },
        {
            "_NAME_": "REQUIRED_PROVIDER_ID",
            "attr": "$.message.catalog.providers[*].id",
            "_RETURN_": "attr are present"
        }
    ]
}
```

- `errorBlock` extracts `$.error.code`.
- If error code exists → skip all message validations (error response, not expected to have `message.catalog`).
- If no error → run all sub-tests checking catalog fields.

---

### Example 5: Tag code validation with scoped sub-tags

```json
{
  "_NAME_": "validate_BAP_TERMS_tags",
  "validTags": ["BAP_TERMS"],
  "tagPath": "$.message.order.tags[*].descriptor.code",
  "_CONTINUE_": "!(tagPath are present)",
  "_RETURN_": "tagPath all in validTags"
},
{
  "_NAME_": "validate_BAP_TERMS_sub_tags",
  "_SCOPE_": "$.message.order.tags[?(@.descriptor.code=='BAP_TERMS')]",
  "subTags": "$.list[*].descriptor.code",
  "validValues": ["BUYER_FINDER_FEES_TYPE", "SETTLEMENT_WINDOW", "SETTLEMENT_TYPE"],
  "_RETURN_": "subTags all in validValues"
}
```

Two-phase tag validation pattern:

1. First test: if any top-level tag is present, verify it is from the allowed set.
2. Second test: scope into specific tag objects (via filter expression), then validate their `list[*].descriptor.code` against the expected sub-tag names.

---

### Example 6: Cross-request state (transaction ID continuity)

Config:

```json
{
    "_TESTS_": {
        "search": [
            {
                "_NAME_": "REQUIRED_TRANSACTION_ID",
                "attr": "$.context.transaction_id",
                "_RETURN_": "attr are present"
            }
        ],
        "on_search": [
            {
                "_NAME_": "TRANSACTION_ID_CONTINUITY",
                "currentId": "$.context.transaction_id",
                "savedId": "$._EXTERNAL.transaction_id",
                "_RETURN_": "currentId equal to savedId"
            }
        ]
    },
    "_SESSION_DATA_": {
        "search": {
            "transaction_id": "$.context.transaction_id"
        }
    }
}
```

Runtime:

```typescript
const store = new MyRedisStorage();
const key = "session-xyz";

// On search call:
await performMyValidations("search", searchPayload, {
    stateFullValidations: true,
    store,
    uniqueKey: key,
});
// → saves transaction_id from searchPayload to store["session-xyz"]["transaction_id"]

// On on_search call:
await performMyValidations("on_search", onSearchPayload, {
    stateFullValidations: true,
    store,
    uniqueKey: key,
});
// → loads transaction_id from store, injects as externalData.transaction_id
// → test evaluates currentId equal to savedId
```

---

## 14. Common Patterns Cookbook

### Presence check

```json
{ "attr": "$.some.field", "_RETURN_": "attr are present" }
```

### Enum check (field must be in allowed list)

```json
{
    "attr": "$.field",
    "allowed": ["A", "B", "C"],
    "_RETURN_": "attr all in allowed"
}
```

### Presence + enum combined

```json
{
    "attr": "$.field",
    "allowed": ["A", "B"],
    "_RETURN_": "attr are present && attr all in allowed"
}
```

### Optional field enum validation (skip if absent)

```json
{
    "path": "$.optional.field",
    "allowed": ["X", "Y"],
    "_CONTINUE_": "!(path are present)",
    "_RETURN_": "path all in allowed"
}
```

### Uniqueness check

```json
{ "_SCOPE_": "$.items[*]", "ids": "$.id", "_RETURN_": "ids are unique" }
```

### Regex validation

```json
{
    "phones": "$.contacts[*].phone",
    "pattern": ["^\\+91[0-9]{10}$"],
    "_RETURN_": "phones follow regex pattern"
}
```

### Cross-field relationship

```json
{
    "itemIds": "$.message.order.items[*].id",
    "catalogIds": "$._EXTERNAL._SELF.message.catalog.providers[*].items[*].id",
    "_RETURN_": "itemIds all in catalogIds"
}
```

### Error-gated group

```json
{
  "_NAME_": "MESSAGE_TESTS",
  "err": "$.error.code",
  "_CONTINUE_": "err are present",
  "_RETURN_": [ ... sub-tests ... ]
}
```

### Scoped conditional

```json
{
    "_SCOPE_": "$.payments[*]",
    "status": "$.status",
    "paid": ["PAID"],
    "txnId": "$.params.transaction_id",
    "_CONTINUE_": "!(status all in paid)",
    "_RETURN_": "txnId are present"
}
```

---

## 15. Reserved Keywords

The following words **cannot be used as variable names**:

- All JavaScript/TypeScript reserved words: `break`, `case`, `catch`, `class`, `const`, `continue`, `debugger`, `default`, `delete`, `do`, `else`, `export`, `extends`, `finally`, `for`, `function`, `if`, `import`, `in`, `instanceof`, `let`, `new`, `return`, `super`, `switch`, `this`, `throw`, `try`, `typeof`, `var`, `void`, `while`, `with`, `yield`, `async`, `await`, `arguments`, `eval`, `of`, `enum`, `implements`, `interface`, `package`, `private`, `protected`, `public`, `static`, `abstract`, `as`, `declare`, `from`, `readonly`, `type`, `namespace`
- All Python reserved words: `False`, `None`, `True`, `and`, `as`, `assert`, `async`, `await`, `break`, `class`, `continue`, `def`, `del`, `elif`, `else`, `except`, `finally`, `for`, `from`, `global`, `if`, `import`, `in`, `is`, `lambda`, `nonlocal`, `not`, `or`, `pass`, `raise`, `return`, `try`, `while`, `with`, `yield`
- All JVAL system fields: `_NAME_`, `_RETURN_`, `_SCOPE_`, `_CONTINUE_`, `_ERROR_CODE_`, `_SUCCESS_CODE_`, `_DESCRIPTION_`, `_TESTS_`, `_SESSION_DATA_`

---

## Appendix: Quick field summary card

```
Test Object
├── _NAME_         (required) Unique ID / generated function name
├── _DESCRIPTION_  (optional) Error message on failure
├── _SCOPE_        (optional, default "$") JSONPath → array to iterate over
├── _CONTINUE_     (optional) JVAL expression: if true → skip this element
├── _ERROR_CODE_   (optional, default 30000) Failure code
├── _SUCCESS_CODE_ (optional, default 200)  Success code
├── _RETURN_       (required) JVAL string expression OR array of test objects
└── <varName>      User variable: JSONPath string or string[] literal

Variable value prefixes
├── "$.some.path"          Extract from current scope element
├── "$._EXTERNAL.<key>"    Read from external/session data
└── "$._EXTERNAL._SELF.*"  Access full normalised payload from any scope

Config root
├── _TESTS_         { action: [TestObject, ...] }
└── _SESSION_DATA_  { action: { key: "$.json.path" } }
```

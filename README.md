## JSON VALIDATIONS FOR ONDC - A domain specific language for JSON validations

**JVAL** is a code generator to add validations to a JSON. it allows to write json or yaml configs which results to executable code in multiple languages to validate a given JSON object.

<!-- [![NPM Package](https://nodei.co/npm/ondc-code-generator.png)](https://www.npmjs.com/package/ondc-code-generator) -->
<a href="https://www.npmjs.com/package/ondc-code-generator">
    <img src="https://nodei.co/npm/ondc-code-generator.png" width="200" alt="NPM Package">
</a>

# Getting Started

### Understanding Single Test Object:

each test object is a JSON object with the structure thats discussed below, each test object will result into a function in the generated code which will validate the given JSON object.

**TEST_OBJECT:**

```
{
    _NAME_: <STRING>,
    _DESCRIPTION_: <STRING>, // optional or will be generated at compile time
    _SCOPE_: <JSON-PATH>, // optional and default is "$"

    <VARIABLE_NAME> : <JSON-PATH> or <STRING[]> // define multiple variables to be used in <JVAL SYNTAX>

    _SUCCESS_CODE_: <NUMBER>, // optional and default is 200
    _ERROR_CODE_: <NUMBER>, // optional and default is 30000
    _CONTINUE_ : <JVAL SYNTAX> // optional and default is null
    _RETURN_: <JVAL SYNTAX> or <TEST_OBJECT[]>
}
```

```
output:
[
  {
      code: <NUMBER>,
      valid: <BOOLEAN>,
      description: <STRING>
  },
  ...
]
```

> note: only the fields described inside < > are placeholders and should be replaced with actual values in the test object else are absolute values

## **\_NAME\_** :

name of the test object, this will be used as the function name in the generated code make sure this is unique in the test set and should not contain any special characters or spaces. only \_ is allowed.

## **\_DESCRIPTION\_** :

description of the test object, in case the test fails this will be used as the error message. this is optional and if not provided will be generated at compile time.

## **VARIABLES**

variables are defined as keys in the test object and their value can be either a valid [JSON-PATH](https://www.rfc-editor.org/rfc/rfc9535.html) or an array of strings.

**note: if value is a json path it should be a json path of a leaf node in the JSON object.**

the set of variable names will be treated as valid variables in the JVAL SYNTAX.

```
{
    <VARIABLE_NAME>: <JSON-PATH> or <STRING[]>
}
```

valid examples

```
{
    "var1": "$.context.action",
    "test": "$.message.order.tags[?(@.descriptor.code=='SETTLEMENT_TERMS')].list[*].code"
    "var2" : ["ONDC", "HELLO"]
}
```

**JSON-PATH:**

JSONPath is a query language used for querying and extracting data from JSON structures. It is similar to XPath, but for JSON. With JSONPath, you can access specific elements or values within a JSON document using a simple path expression.

A JSONPath expression can be used to navigate through JSON data by referring to specific keys, arrays, or elements. It supports operations like filtering, slicing, and multi-level traversals, making it a powerful tool for working with JSON.

For more detailed information, refer to the official specification:
[JSONPath RFC 9535](https://www.rfc-editor.org/rfc/rfc9535.html)

## **\_SCOPE\_:**

scope is also a JSON PATH which determines the scope of JSON object where the test will be ran on and the variables will be extracted from. this is optional and default is "$",
scope should always result in a array of JSON objects.
**and tests are run on each object in the array iteratively.**

valid examples

```
{
    "_SCOPE_": "$.context"
    "var1": "$.action" // if scope is $.context then no need to mention $.context.action
}
```

## **\_ERROR_CODE\_:**

if the test is failed this error code will be returned in the response. this is optional and default is 30000.

## **\_SUCCESS_CODE\_:**

if the test is passed this success code will be returned in the response. this is optional and default is 200.

## **JVAL SYNTAX:**

To write validation syntax you need a set of valid variables which are defined as keys in the test object.

### Supported Functions

#### Unary Operators (Work on a Single Operand)

| Function        | Description                                                                                                                 | Example            |
| --------------- | --------------------------------------------------------------------------------------------------------------------------- | ------------------ |
| **are unique**  | Returns `true` if the operand array only has unique values.                                                                 | `var1 are unique`  |
| **are present** | Returns `true` if there is no `null`, `undefined`, or empty string (`""`) in the operand array, and the array is not empty. | `var1 are present` |

#### Binary Operators (Work on Two Operands: Left and Right)

| Function         | Description                                                                                                                                                                        | Example                  |
| ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| **all in**       | Returns `true` if all values in the left operand are present in the right operand.                                                                                                 | `var1 all in var2`       |
| **any in**       | Returns `true` if any value in the left operand is present in the right operand.                                                                                                   | `var1 any in var2`       |
| **none in**      | Returns `true` if none of the values in the left operand are present in the right operand.                                                                                         | `var1 none in var2`      |
| **equal to**     | Returns `true` if all values in the left and right operands are equal and in the same order.                                                                                       | `var1 equal to var2`     |
| **greater than** | Returns `true` if all values in the left operand are greater than the right operand. Both must be numbers, parsable numbers, or ISO date strings. Returns `false` for other types. | `var1 greater than var2` |
| **less than**    | Returns `true` if all values in the left operand are less than the right operand. Both must be numbers, parsable numbers, or ISO date strings. Returns `false` for other types.    | `var1 less than var2`    |
| **follow regex** | Returns `true` if all values in the left operand match all regex patterns in the right operand (right operand is treated as an array of regex patterns).                           | `var1 follow regex var2` |

### Example Valid JVAL Syntax

```
> var1 are present
> var2 are unique && var1 are present
> var1 all in var2
> !(var2 are present)
> var1 are present && var2 are present && var3 are present
> (var1 all in var2) || !(var2 equal to var3 && var4 are present)
> var1 follow regex var2
```

### How Complete X-validations should look like:

```

"x-validations": {
  "_TESTS_": {
      <TEST_SET_NAME>: [
         <TEST_OBJECT>,
         <TEST_OBJECT_2>,
         ...
      ],
      <TEST_SET_NAME_2>: [
         <TEST_OBJECT_3>,
         <TEST_OBJECT_4>,
         ...
      ],
  },
  "_SESSION_DATA_": {}
}

```

### Supported Generation Languages:

- Typescript

### Installation

`npm install ondc-code-generator`

### Code Usage

```javascript
import { ConfigCompiler } from "ondc-code-generator";


const comp = new ConfigCompiler(SupportedLanguages.Typescript);
const buildString = "<COMPLETE BUILD YAML OF ANY DOMAIN ODNC>";
await comp.initialize(buildString);
const x_validations = JSON.parse(buildString)["x-validations"] as any;
await comp.generateCode(x_validations, "L1-validations"); // pass the validations object and the name of the function of the generated code
```

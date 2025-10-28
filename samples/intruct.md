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

## Create files and folders

The file explorer is accessible using the button in left corner of the navigation bar. You can create a new file by clicking the **New file** button in the file explorer. You can also create folders by clicking the **New folder** button.

## Switch to another file

All your files and folders are presented as a tree in the file explorer. You can switch from one to another by clicking a file in the tree.

## Rename a file

You can rename the current file by clicking the file name in the navigation bar or by clicking the **Rename** button in the file explorer.

## Delete a file

You can delete the current file by clicking the **Remove** button in the file explorer. The file will be moved into the **Trash** folder and automatically deleted after 7 days of inactivity.

## Export a file

You can export the current file by clicking **Export to disk** in the menu. You can choose to export the file as plain Markdown, as HTML using a Handlebars template or as a PDF.

# Synchronization

Synchronization is one of the biggest features of StackEdit. It enables you to synchronize any file in your workspace with other files stored in your **Google Drive**, your **Dropbox** and your **GitHub** accounts. This allows you to keep writing on other devices, collaborate with people you share the file with, integrate easily into your workflow... The synchronization mechanism takes place every minute in the background, downloading, merging, and uploading file modifications.

There are two types of synchronization and they can complement each other:

- The workspace synchronization will sync all your files, folders and settings automatically. This will allow you to fetch your workspace on any other device.

  > To start syncing your workspace, just sign in with Google in the menu.

- The file synchronization will keep one file of the workspace synced with one or multiple files in **Google Drive**, **Dropbox** or **GitHub**.
  > Before starting to sync files, you must link an account in the **Synchronize** sub-menu.

## Open a file

You can open a file from **Google Drive**, **Dropbox** or **GitHub** by opening the **Synchronize** sub-menu and clicking **Open from**. Once opened in the workspace, any modification in the file will be automatically synced.

## Save a file

You can save any file of the workspace to **Google Drive**, **Dropbox** or **GitHub** by opening the **Synchronize** sub-menu and clicking **Save on**. Even if a file in the workspace is already synced, you can save it to another location. StackEdit can sync one file with multiple locations and accounts.

## Synchronize a file

Once your file is linked to a synchronized location, StackEdit will periodically synchronize it by downloading/uploading any modification. A merge will be performed if necessary and conflicts will be resolved.

If you just have modified your file and you want to force syncing, click the **Synchronize now** button in the navigation bar.

> **Note:** The **Synchronize now** button is disabled if you have no file to synchronize.

## Manage file synchronization

Since one file can be synced with multiple locations, you can list and manage synchronized locations by clicking **File synchronization** in the **Synchronize** sub-menu. This allows you to list and remove synchronized locations that are linked to your file.

# Publication

Publishing in StackEdit makes it simple for you to publish online your files. Once you're happy with a file, you can publish it to different hosting platforms like **Blogger**, **Dropbox**, **Gist**, **GitHub**, **Google Drive**, **WordPress** and **Zendesk**. With [Handlebars templates](http://handlebarsjs.com/), you have full control over what you export.

> Before starting to publish, you must link an account in the **Publish** sub-menu.

## Publish a File

You can publish your file by opening the **Publish** sub-menu and by clicking **Publish to**. For some locations, you can choose between the following formats:

- Markdown: publish the Markdown text on a website that can interpret it (**GitHub** for instance),
- HTML: publish the file converted to HTML via a Handlebars template (on a blog for example).

## Update a publication

After publishing, StackEdit keeps your file linked to that publication which makes it easy for you to re-publish it. Once you have modified your file and you want to update your publication, click on the **Publish now** button in the navigation bar.

> **Note:** The **Publish now** button is disabled if your file has not been published yet.

## Manage file publication

Since one file can be published to multiple locations, you can list and manage publish locations by clicking **File publication** in the **Publish** sub-menu. This allows you to list and remove publication locations that are linked to your file.

# Markdown extensions

StackEdit extends the standard Markdown syntax by adding extra **Markdown extensions**, providing you with some nice features.

> **ProTip:** You can disable any **Markdown extension** in the **File properties** dialog.

## SmartyPants

SmartyPants converts ASCII punctuation characters into "smart" typographic punctuation HTML entities. For example:

|                  | ASCII                           | HTML                          |
| ---------------- | ------------------------------- | ----------------------------- |
| Single backticks | `'Isn't this fun?'`             | 'Isn't this fun?'             |
| Quotes           | `"Isn't this fun?"`             | "Isn't this fun?"             |
| Dashes           | `-- is en-dash, --- is em-dash` | -- is en-dash, --- is em-dash |

## KaTeX

You can render LaTeX mathematical expressions using [KaTeX](https://khan.github.io/KaTeX/):

The _Gamma function_ satisfying $\Gamma(n) = (n-1)!\quad\forall n\in\mathbb N$ is via the Euler integral

$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
$$

> You can find more information about **LaTeX** mathematical expressions [here](http://meta.math.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference).

## UML diagrams

You can render UML diagrams using [Mermaid](https://mermaidjs.github.io/). For example, this will produce a sequence diagram:

```mermaid
sequenceDiagram
Alice ->> Bob: Hello Bob, how are you?
Bob-->>John: How about you John?
Bob--x Alice: I am good thanks!
Bob-x John: I am good thanks!
Note right of John: Bob thinks a long<br/>long time, so long<br/>that the text does<br/>not fit on a row.

Bob-->Alice: Checking with John...
Alice->John: Yes... John, how are you?
```

And this will produce a flow chart:

```mermaid
graph LR
A[Square Rect] -- Link text --> B((Circle))
A --> C(Round Rect)
B --> D{Rhombus}
C --> D
```

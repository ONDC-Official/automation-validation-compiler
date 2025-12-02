# JVAL DSL Best Practices & Naming Conventions

## Overview

This document outlines best practices for writing effective JVAL (JSON Validation Language) configurations for the ONDC Code Generator.

## Naming Conventions

### Test Object Names (`_NAME_`)

- **Use snake_case** for consistency with generated function names
- **Be descriptive and specific** about what the test validates
- **Include context** when validating nested objects

```json
// ✅ Good
"_NAME_": "validate_context_action_search"
"_NAME_": "check_provider_locations_present"
"_NAME_": "verify_payment_settlement_terms"

// ❌ Avoid
"_NAME_": "test1"
"_NAME_": "checkAction"
"_NAME_": "validate"
```

### Variable Names

- **Use descriptive names** that clearly indicate the data being extracted
- **Follow snake_case** convention
- **Include data type hints** when helpful (e.g., `_codes`, `_ids`, `_values`)

```json
// ✅ Good
"context_action": "$.context.action",
"provider_location_codes": "$.message.catalog.providers[*].locations[*].id",
"settlement_terms": "$.message.order.tags[?(@.descriptor.code=='SETTLEMENT_TERMS')].list[*].code"

// ❌ Avoid
"var1": "$.context.action",
"x": "$.message.catalog.providers[*].locations[*].id",
"data": "$.some.path"
```

### Test Set Names

- **Use lowercase with underscores** for test set keys
- **Group by API action** or logical functionality
- **Be specific about the validation scope**

```json
// ✅ Good
"search_validations": [...],
"on_search_catalog_validations": [...],
"payment_settlement_checks": [...]

// ❌ Avoid
"Search": [...],
"tests": [...],
"validations": [...]
```

## JSONPath Best Practices

### Path Structure

- **Always start with `$`** for root-level paths
- **Use specific filters** instead of broad wildcards when possible
- **Test paths** with sample data before implementation

```json
// ✅ Good - Specific filtering
"settlement_codes": "$.message.order.tags[?(@.descriptor.code=='SETTLEMENT_TERMS')].list[*].code"

// ⚠️ Less optimal - Too broad
"all_codes": "$.message..code"
```

### Scoping Strategy

- **Use `_SCOPE_`** to iterate over arrays of objects
- **Keep variables relative** to the scope when possible
- **Avoid deep nesting** in scoped validations

```json
// ✅ Good - Proper scoping
{
    "_SCOPE_": "$.message.catalog.providers[*]",
    "provider_id": "$.id",
    "location_ids": "$.locations[*].id",
    "_RETURN_": "provider_id are present && location_ids are present"
}

// ❌ Avoid - Absolute paths in scope
{
    "_SCOPE_": "$.message.catalog.providers[*]",
    "provider_id": "$.message.catalog.providers[*].id",  // Redundant
    "_RETURN_": "provider_id are present"
}
```

## JVAL Expression Guidelines

### Readability

- **Use parentheses** to clarify complex logic
- **Break complex expressions** into multiple test objects
- **Write descriptive variable names** that make expressions self-documenting

```json
// ✅ Good - Clear logic flow
"_RETURN_": "(context_action are present) && (context_action all in valid_actions)"

// ✅ Good - Complex logic broken down
"_RETURN_": [
    {
        "_NAME_": "check_required_fields",
        "context_action": "$.context.action",
        "message_intent": "$.message.intent",
        "_RETURN_": "context_action are present && message_intent are present"
    },
    {
        "_NAME_": "validate_action_values",
        "context_action": "$.context.action",
        "valid_actions": ["search", "select", "init"],
        "_RETURN_": "context_action all in valid_actions"
    }
]
```

### Error Handling

- **Always provide `_DESCRIPTION_`** for meaningful error messages
- **Use consistent error codes** within logical groups
- **Make descriptions actionable** for developers

```json
// ✅ Good - Clear, actionable descriptions
{
	"_NAME_": "validate_context_action_search",
	"context_action": "$.context.action",
	"valid_actions": ["search"],
	"_ERROR_CODE_": 30001,
	"_DESCRIPTION_": "context.action must be 'search' for search API calls",
	"_RETURN_": "context_action all in valid_actions"
}
```

## Configuration Structure

### Test Organization

- **Group related validations** in the same test set
- **Order tests logically** (basic → complex)
- **Use consistent error code ranges** per validation group

```json
{
	"x-validations": {
		"_TESTS_": {
			"basic_structure_validations": [
				// Basic field presence checks first
			],
			"business_logic_validations": [
				// Complex business rules second
			],
			"cross_field_validations": [
				// Inter-field dependency checks last
			]
		},
		"_SESSION_DATA_": {
			"search": {
				"transaction_id": "$.context.transaction_id"
			}
		}
	}
}
```

## Example: Complete Validation Set

```json
{
	"x-validations": {
		"_TESTS_": {
			"search_api_validations": [
				{
					"_NAME_": "validate_required_context_fields",
					"context_action": "$.context.action",
					"context_domain": "$.context.domain",
					"transaction_id": "$.context.transaction_id",
					"_ERROR_CODE_": 30001,
					"_DESCRIPTION_": "Required context fields must be present in search request",
					"_RETURN_": "context_action are present && context_domain are present && transaction_id are present"
				},
				{
					"_NAME_": "validate_search_action_value",
					"context_action": "$.context.action",
					"expected_action": ["search"],
					"_ERROR_CODE_": 30002,
					"_DESCRIPTION_": "context.action must be 'search' for search API calls",
					"_RETURN_": "context_action all in expected_action"
				},
				{
					"_NAME_": "validate_intent_structure",
					"_SCOPE_": "$.message.intent",
					"item_descriptor_name": "$.item.descriptor.name",
					"fulfillment_locations": "$.fulfillment.end.location.area_code",
					"_ERROR_CODE_": 30003,
					"_DESCRIPTION_": "Search intent must contain item descriptor and fulfillment location",
					"_RETURN_": "item_descriptor_name are present || fulfillment_locations are present"
				}
			]
		},
		"_SESSION_DATA_": {
			"search": {
				"transaction_id": "$.context.transaction_id",
				"domain": "$.context.domain"
			}
		}
	}
}
```

## Common Patterns

### Enum Validation

```json
{
	"field_value": "$.path.to.field",
	"allowed_values": ["value1", "value2", "value3"],
	"_RETURN_": "field_value all in allowed_values"
}
```

### Presence Validation

```json
{
	"required_fields": ["$.field1", "$.field2", "$.field3"],
	"_RETURN_": "required_fields are present"
}
```

### Uniqueness Validation

```json
{
	"_SCOPE_": "$.array.path[*]",
	"id_values": "$.id",
	"_RETURN_": "id_values are unique"
}
```

### Regex Pattern Validation

```json
{
	"email_field": "$.contact.email",
	"email_pattern": ["^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$"],
	"_RETURN_": "email_field follow regex email_pattern"
}
```

## Anti-Patterns to Avoid

1. **Generic variable names** like `var1`, `data`, `temp`
2. **Overly complex single expressions** - break into multiple tests instead
3. **Missing error descriptions** - always provide meaningful messages
4. **Inconsistent naming** - stick to snake_case throughout
5. **Hard-coded values in expressions** - use variables for maintainability
6. **Too broad JSONPath selectors** - be as specific as possible

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
- **Include data type hints** when helpful start constants with ("\_const") and json paths variable with ("\_var")

```json
// ✅ Good
"var_action": "$.context.action",
"var_location_codes": "$.message.catalog.providers[*].locations[*].id",
"var_settlement_terms": "$.message.order.tags[?(@.descriptor.code=='SETTLEMENT_TERMS')].list[*].code"
"const_valid_actions": ["search", "select", "init"]

// ❌ Avoid
"var1": "$.context.action",
"x": "$.message.catalog.providers[*].locations[*].id",
"data": "$.some.path"
"validActions": ["search", "select", "init"]
```

## JSONPath Best Practices

### Path Structure

- **Always start with `$`** for root-level paths
- **Use specific filters** instead of broad wildcards when possible
- **Test paths** with sample data before implementation

```json
// ✅ Good - Specific filtering
"var_settlement_codes": "$.message.order.tags[?(@.descriptor.code=='SETTLEMENT_TERMS')].list[*].code"

// ⚠️ Less optimal - Too broad
"var_all_codes": "$.message..code"
```

### Scoping Strategy

- **Use `_SCOPE_`** to iterate over arrays of objects
- **Avoid deep nesting** in scoped validations
- `NOTE` : to use json path outside the scope with scope present in the test, use $.\_EXTERNAL.\_SELF.context.action as complete payload is saved in \_EXTERNAL.\_SELF.<payload>

```json
// ✅ Good - Proper scoping
{
    "_SCOPE_": "$.message.catalog.providers[*]",
    "var_provider_id": "$.id",
    "var_location_ids": "$.locations[*].id",
    "var_action": "$._EXTERNAL._SELF.context.action",
    "const_valid_actions": ["search", "select", "init"],
    "_CONTINUE_" : "var_action all in const_valid_actions",
    "_RETURN_": "var_provider_id are present && var_location_ids are present",
    "_DESCRIPTION_": "provider.id and provider.locations[].id must be present for search, select, init actions",
}

// ❌ Wrong - Absolute paths in scope
{
    "_SCOPE_": "$.message.catalog.providers[*]",
    "var_provider_id": "$.message.catalog.providers[*].id",  // wrong will throw error
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

### TEST Key sequencing

- **Always start with the _NAME_ key** for clarity
- **Followed with _SCOPE_** if applicable
- **Then list variable extractions**
- **Then _CONTINUE_** if needed
- **End with _RETURN_, _ERROR_CODE_,_SUCCESS_CODE_ and _DESCRIPTION_**

```JSON
// ✅ Good
{
    "_NAME_": "validate_payments_transaction_id",
    "_SCOPE_": "$.message.payment[*]",
    "var_transaction_ids": "$.params.transaction_id",
    "var_payment_statuses": "$.status",
    "const_paid_status": ["PAID"],
    "_CONTINUE_": "!(var_payment_statuses all in const_paid_status)",
    "_RETURN_": "var_transaction_ids are present",
    "_ERROR_CODE_": 40001,
    "_DESCRIPTION_": "All payment.transaction_id must be present for PAID payments"
}
// ❌ BAD - messy order
{
    "var_transaction_ids": "$.params.transaction_id",
    "_RETURN_": "var_transaction_ids are present",
    "var_payment_statuses": "$.status",
    "_NAME_": "validate_payments_transaction_id",
    "const_paid_status": ["PAID"],
    "_CONTINUE_": "!(var_payment_statuses all in const_paid_status)",
    "_ERROR_CODE_": 40001,
    "_DESCRIPTION_": "All payment.transaction_id must be present for PAID payments"
}
```

### Test Organization

- **Group related validations** in the same test set
- **Order tests logically** (basic → complex)
- **Use consistent error code ranges** per validation group

```json
{
	"x-validations": {
		"_TESTS_": {
			"search": [
				{
                    "_NAME_": "validate_context",
                    "_RETURN_": [
                        {
                            ...
                        }
                    ]
                }
                {
                    "_NAME_": "validate_message",
                    "_RETURN_": [
                        {
                            ...
                        }
                    ]
                }
			],
			"on_search": [
                // on_search specific validations
			],
			"select": [
                // select specific validations
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
	"var_field_value": "$.path.to.field",
	"const_allowed_values": ["value1", "value2", "value3"],
	"_RETURN_": "var_field_value all in const_allowed_values"
}
```

### Presence Validation

```json
{
	"var_required_fields": "$.path.to.required_field",
	"_RETURN_": "var_required_fields are present"
}
```

### Uniqueness Validation

```json
// ❌ WRONG this wont work as after scoping the id will be in the scope so
// uniqueness will be checked in the scope only
{
	"_SCOPE_": "$.array.path[*]",
	"var_id_values": "$.id",
	"_RETURN_": "var_id_values are unique"
}

// ✅ CORRECT
{
    "var_id_values": "$.array.path[*].id",
    "_RETURN_": "var_id_values are unique"
}
```

### Regex Pattern Validation

```json
{
    "var_email_field": "$.contact.email",
    "const_email_pattern": ["^[\\w\\.-]+@[\\w\\.-]+\\.[a-zA-Z]{2,}$"],
    "_RETURN_": "var_email_field follow regex const_email_pattern"
    "_DESCRIPTION_": "Email format is invalid"
}
```

## Anti-Patterns to Avoid

1. **Generic variable names** like `var1`, `data`, `temp`
2. **Overly complex single expressions** - break into multiple tests instead
3. **Missing error descriptions** - always provide meaningful messages
4. **Inconsistent naming** - stick to snake_case throughout
5. **Hard-coded values in expressions** - use variables for maintainability
6. **Too broad JSONPath selectors** - be as specific as possible

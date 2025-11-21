-- Auto-generated Athena SQL validation rules for action: update
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'update'
),
required_context_domain_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_domain_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.domain') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.domain')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.domain')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.domain')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.domain'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.domain')]
END) AS attr,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_domain_scope
),
required_context_action_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_action_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.action') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.action')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.action')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.action')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.action'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.action')]
END) AS attr,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_action_scope
),
required_context_version_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_version_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.version') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.version')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.version')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.version')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.version'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.version')]
END) AS attr,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_version_scope
),
required_context_message_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_message_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.message_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.message_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.message_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.message_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.message_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.message_id')]
END) AS attr,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_message_id_scope
),
required_context_transaction_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_transaction_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.transaction_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.transaction_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.transaction_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.transaction_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.transaction_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.transaction_id')]
END) AS attr,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_transaction_id_scope
),
regex_context_timestamp_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
regex_context_timestamp_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.timestamp') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.timestamp')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.timestamp')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.timestamp')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.timestamp'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.timestamp')]
END) AS attr,
        ARRAY['^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$'] AS reg,
        ARRAY['update'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM regex_context_timestamp_scope
),
required_update_target_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_update_target_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.update_target') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.update_target')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.update_target')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.update_target')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.update_target'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.update_target')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_update_target_scope
),
valid_update_target_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_update_target_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.update_target') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.update_target')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.update_target')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.update_target')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.update_target'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.update_target')]
END) AS attr,
        ARRAY['fulfillment', 'payment', 'billing', 'items'] AS enumList,
        ARRAY['update'] AS action
    FROM valid_update_target_scope
),
required_order_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_order_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.id')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_order_id_scope
),
required_fulfillment_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_fulfillment_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].id')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_fulfillment_id_scope
),
required_tag_descriptor_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_tag_descriptor_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_tag_descriptor_code_scope
),
valid_tag_descriptor_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_tag_descriptor_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')]
END) AS attr,
        ARRAY['UPDATE_REQUEST', 'MODIFY'] AS enumList,
        ARRAY['update'] AS action
    FROM valid_tag_descriptor_code_scope
),
required_tag_list_descriptor_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_tag_list_descriptor_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_tag_list_descriptor_code_scope
),
required_tag_list_value_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_tag_list_value_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')]
END) AS attr,
        ARRAY['update'] AS action
    FROM required_tag_list_value_scope
)
, violations AS (
SELECT
    'update' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_CONTEXT_ACTION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_action_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REGEX_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM regex_context_timestamp_vars
WHERE TRUE AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_UPDATE_TARGET' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_update_target_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'VALID_UPDATE_TARGET' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_update_target_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_ORDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_order_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_FULFILLMENT_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_fulfillment_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_TAG_DESCRIPTOR_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_tag_descriptor_code_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'VALID_TAG_DESCRIPTOR_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_tag_descriptor_code_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_TAG_LIST_DESCRIPTOR_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_tag_list_descriptor_code_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'update' AS api,
    'REQUIRED_TAG_LIST_VALUE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_tag_list_value_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].tags[*].list[*].value')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
)
SELECT * FROM violations;
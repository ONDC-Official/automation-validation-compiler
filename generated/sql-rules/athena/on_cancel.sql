-- Auto-generated Athena SQL validation rules for action: on_cancel
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'on_cancel'
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
        ARRAY['on_cancel'] AS action,
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
        ARRAY['on_cancel'] AS action,
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
        ARRAY['on_cancel'] AS action,
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
        ARRAY['on_cancel'] AS action,
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
        ARRAY['on_cancel'] AS action,
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
        ARRAY['on_cancel'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM regex_context_timestamp_scope
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
        ARRAY['on_cancel'] AS action
    FROM required_order_id_scope
),
required_order_status_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_order_status_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.status')]
END) AS attr,
        ARRAY['on_cancel'] AS action
    FROM required_order_status_scope
),
valid_order_status_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_order_status_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.status')]
END) AS attr,
        ARRAY['CANCELLED'] AS enumList,
        ARRAY['on_cancel'] AS action
    FROM valid_order_status_scope
),
required_cancelled_by_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_cancelled_by_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation.cancelled_by') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation.cancelled_by')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation.cancelled_by')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation.cancelled_by')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation.cancelled_by'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation.cancelled_by')]
END) AS attr,
        ARRAY['on_cancel'] AS action
    FROM required_cancelled_by_scope
),
required_cancellation_reason_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_cancellation_reason_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation.reason.id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation.reason.id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation.reason.id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation.reason.id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation.reason.id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation.reason.id')]
END) AS attr,
        ARRAY['on_cancel'] AS action
    FROM required_cancellation_reason_id_scope
),
required_updated_at_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_updated_at_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.updated_at') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.updated_at')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.updated_at')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.updated_at')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.updated_at'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.updated_at')]
END) AS attr,
        ARRAY['on_cancel'] AS action
    FROM required_updated_at_scope
),
valid_cancellation_reason_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_cancellation_reason_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation.reason.id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation.reason.id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation.reason.id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation.reason.id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation.reason.id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation.reason.id')]
END) AS attr,
        ARRAY['000', '001', '002', '003', '004', '005', '011', '012', '013', '014'] AS enumList,
        ARRAY['on_cancel'] AS action
    FROM valid_cancellation_reason_id_scope
)
, violations AS (
SELECT
    'on_cancel' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CONTEXT_ACTION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_action_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REGEX_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM regex_context_timestamp_vars
WHERE TRUE AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_ORDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_order_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_ORDER_STATUS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_order_status_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'VALID_ORDER_STATUS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_order_status_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CANCELLED_BY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_cancelled_by_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_CANCELLATION_REASON_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_cancellation_reason_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'REQUIRED_UPDATED_AT' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_updated_at_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'VALID_CANCELLATION_REASON_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_cancellation_reason_id_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
)
SELECT * FROM violations;
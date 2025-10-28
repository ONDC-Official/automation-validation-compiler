-- Auto-generated Athena SQL validation rules for action: search
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'search'
),
validate_attribute_4_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_4_vars AS (
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
END) AS attr
    FROM validate_attribute_4_scope
),
validate_attribute_5_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_5_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.bap_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.bap_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.bap_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.bap_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.bap_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.bap_id')]
END) AS attr
    FROM validate_attribute_5_scope
),
validate_attribute_6_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_6_vars AS (
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
END) AS attr
    FROM validate_attribute_6_scope
),
validate_attribute_7_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_7_vars AS (
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
END) AS attr
    FROM validate_attribute_7_scope
),
validate_attribute_8_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_8_vars AS (
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
END) AS attr
    FROM validate_attribute_8_scope
),
validate_attribute_10_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_10_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.bap_uri') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.bap_uri')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.bap_uri')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.bap_uri')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.bap_uri'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.bap_uri')]
END) AS attr
    FROM validate_attribute_10_scope
),
validate_attribute_11_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_11_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.ttl') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.ttl')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.ttl')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.ttl')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.ttl'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.ttl')]
END) AS attr
    FROM validate_attribute_11_scope
),
validate_enum_1_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_1_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['search'] AS enumList,
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
END) AS enumPath
    FROM validate_enum_1_scope
),
validate_enum_2_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_2_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['IND'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.context.location.country.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.location.country.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.location.country.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.location.country.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.location.country.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.location.country.code')]
END) AS enumPath
    FROM validate_enum_2_scope
),
validate_enum_3_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_3_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.location.city.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.location.city.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.location.city.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.location.city.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.location.city.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.location.city.code')]
END) AS enumPath
    FROM validate_enum_3_scope
),
validate_enum_4_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_4_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['ONDC:TRV11'] AS enumList,
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
END) AS enumPath
    FROM validate_enum_4_scope
),
validate_enum_5_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_5_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BUS', 'METRO'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.vehicle.category') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.vehicle.category')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.vehicle.category')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.vehicle.category')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.vehicle.category'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.vehicle.category')]
END) AS enumPath
    FROM validate_enum_5_scope
),
validate_enum_6_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_6_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['ROUTE', 'TRIP'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.type')]
END) AS enumPath
    FROM validate_enum_6_scope
),
validate_enum_7_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_7_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['START', 'END', 'INTERMEDIATE_STOP', 'TRANSIT_STOP'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].type')]
END) AS enumPath
    FROM validate_enum_7_scope
),
validate_enum_8_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_8_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['QR'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')]
END) AS enumPath
    FROM validate_enum_8_scope
),
validate_enum_9_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_9_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['UNCLAIMED', 'CLAIMED'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')]
END) AS enumPath
    FROM validate_enum_9_scope
),
validate_tag_0_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_tag_0_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BUYER_FINDER_FEES', 'SETTLEMENT_TERMS'] AS validTags,
        (CASE
    WHEN json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.payment.tags[*].descriptor.code')]
END) AS tagPath
    FROM validate_tag_0_scope
),
validate_tag_0_buyer_finder_fees_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.intent.payment.tags[?(@.descriptor.code==''BUYER_FINDER_FEES'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_0_buyer_finder_fees_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.list[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.list[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.list[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.list[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.list[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.list[*].descriptor.code')]
END) AS subTags,
        ARRAY['BUYER_FINDER_FEES_TYPE', 'BUYER_FINDER_FEES_PERCENTAGE', 'BUYER_FINDER_FEES_AMOUNT'] AS validValues
    FROM validate_tag_0_buyer_finder_fees_scope
),
validate_tag_0_settlement_terms_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.intent.payment.tags[?(@.descriptor.code==''SETTLEMENT_TERMS'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_0_settlement_terms_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.list[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.list[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.list[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.list[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.list[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.list[*].descriptor.code')]
END) AS subTags,
        ARRAY['SETTLEMENT_WINDOW', 'SETTLEMENT_BASIS', 'SETTLEMENT_TYPE', 'MANDATORY_ARBITRATION', 'COURT_JURISDICTION', 'DELAY_INTEREST', 'STATIC_TERMS', 'SETTLEMENT_AMOUNT'] AS validValues
    FROM validate_tag_0_settlement_terms_scope
)
, violations AS (
SELECT
    'search' AS api,
    'validate_attribute_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_4_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_5_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_6_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_7_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_8_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_10' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_10_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_attribute_11' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_11_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_1' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_1_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_2' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_2_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_3' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_3_vars
WHERE TRUE AND NOT (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_4_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_5_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_6_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_7_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_8_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_enum_9' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_9_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.fulfillment.stops[*].authorization.status')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_tag_0' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.payment.tags[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.intent.payment.tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.intent.payment.tags[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(tagPath, value -> contains(validTags, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_tag_0_BUYER_FINDER_FEES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_buyer_finder_fees_vars
WHERE TRUE AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'search' AS api,
    'validate_tag_0_SETTLEMENT_TERMS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_settlement_terms_vars
WHERE TRUE AND NOT (all_match(subTags, value -> contains(validValues, value)))
)
SELECT * FROM violations;
-- Auto-generated Athena SQL validation rules for action: confirm
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'confirm'
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
validate_attribute_12_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_12_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.bpp_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.bpp_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.bpp_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.bpp_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.bpp_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.bpp_id')]
END) AS attr
    FROM validate_attribute_12_scope
),
validate_attribute_13_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_13_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.context.bpp_uri') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.context.bpp_uri')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.context.bpp_uri')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.context.bpp_uri')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.context.bpp_uri'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.context.bpp_uri')]
END) AS attr
    FROM validate_attribute_13_scope
),
validate_attribute_14_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_14_vars AS (
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
END) AS attr
    FROM validate_attribute_14_scope
),
validate_attribute_15_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_15_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].id')]
END) AS attr
    FROM validate_attribute_15_scope
),
validate_attribute_16_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_16_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].quantity.selected.count') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].quantity.selected.count')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].quantity.selected.count')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].quantity.selected.count')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].quantity.selected.count'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].quantity.selected.count')]
END) AS attr
    FROM validate_attribute_16_scope
),
validate_attribute_17_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_17_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.provider.id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.id')]
END) AS attr
    FROM validate_attribute_17_scope
),
validate_attribute_18_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_18_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].id')]
END) AS attr
    FROM validate_attribute_18_scope
),
validate_attribute_22_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_22_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.transaction_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.transaction_id')]
END) AS attr
    FROM validate_attribute_22_scope
),
validate_attribute_23_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_23_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.currency')]
END) AS attr
    FROM validate_attribute_23_scope
),
validate_attribute_24_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_24_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.amount') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.amount')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.amount')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.amount')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.amount'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.amount')]
END) AS attr
    FROM validate_attribute_24_scope
),
validate_attribute_25_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_25_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.transaction_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.transaction_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.transaction_id')]
END) AS attr
    FROM validate_attribute_25_scope
),
validate_attribute_26_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_26_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.currency')]
END) AS attr
    FROM validate_attribute_26_scope
),
validate_attribute_27_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_27_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.amount') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.amount')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.amount')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.amount')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.amount'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.amount')]
END) AS attr
    FROM validate_attribute_27_scope
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
        ARRAY['confirm'] AS enumList,
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
        ARRAY['SJT', 'SFSJT', 'RJT', 'PASS'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].descriptor.code')]
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
        ARRAY['BUS', 'METRO'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].vehicle.category')]
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
        ARRAY['ROUTE', 'TRIP'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
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
        ARRAY['START', 'END', 'INTERMEDIATE_STOP', 'TRANSIT_STOP'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
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
        ARRAY['QR'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')]
END) AS enumPath
    FROM validate_enum_9_scope
),
validate_enum_10_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_10_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['UNCLAIMED', 'CLAIMED'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')]
END) AS enumPath
    FROM validate_enum_10_scope
),
validate_enum_11_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_11_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['NOT-PAID', 'PAID'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].status')]
END) AS enumPath
    FROM validate_enum_11_scope
),
validate_enum_12_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_12_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BPP', 'BAP'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].collected_by') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].collected_by')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].collected_by')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].collected_by')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].collected_by'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].collected_by')]
END) AS enumPath
    FROM validate_enum_12_scope
),
validate_enum_13_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_13_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['PRE-ORDER', 'ON-FULFILLMENT', 'POST-FULFILLMENT'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].type')]
END) AS enumPath
    FROM validate_enum_13_scope
),
validate_enum_14_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_enum_14_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BASE_PRICE', 'REFUND', 'CANCELLATION_CHARGES', 'OFFER', 'TOLL'] AS enumList,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.breakup[*].title') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.breakup[*].title'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.breakup[*].title')]
END) AS enumPath
    FROM validate_enum_14_scope
)
, violations AS (
SELECT
    'confirm' AS api,
    'validate_attribute_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_4_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_5_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_6_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_7_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_8_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_10' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_10_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_11' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_11_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_12' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_12_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_13' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_13_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_14' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_14_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_15' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_15_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_16' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_16_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_17' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_17_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_18' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_18_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_22' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_22_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_23' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_23_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_24' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_24_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_25' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_25_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_26' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_26_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_attribute_27' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_27_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_1' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_1_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_2' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_2_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_3' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_3_vars
WHERE TRUE AND NOT (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_4_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_5_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_6_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].vehicle.category')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].vehicle.category'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].vehicle.category')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_7_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_8_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_9' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_9_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_10' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_10_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].authorization.status')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_11' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_11_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_12' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_12_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_13' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_13_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'confirm' AS api,
    'validate_enum_14' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_14_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.quote.breakup[*].title') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.breakup[*].title'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.breakup[*].title')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.quote.breakup[*].title') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].title')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.breakup[*].title'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.breakup[*].title')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
)
SELECT * FROM violations;
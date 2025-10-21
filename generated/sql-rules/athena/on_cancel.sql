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
        ARRAY['on_cancel'] AS enumList,
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
    WHEN json_extract(test_obj, '$.message.order.items[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].descriptor.name')]
END) AS attr
    FROM validate_attribute_17_scope
),
validate_attribute_19_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_19_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].price.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].price.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].price.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].price.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].price.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].price.currency')]
END) AS attr
    FROM validate_attribute_19_scope
),
validate_attribute_20_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_20_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].price.value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].price.value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].price.value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].price.value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].price.value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].price.value')]
END) AS attr
    FROM validate_attribute_20_scope
),
validate_attribute_21_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_21_vars AS (
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
    FROM validate_attribute_21_scope
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
    WHEN json_extract(test_obj, '$.message.order.items[*].fulfillment_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].fulfillment_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].fulfillment_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].fulfillment_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].fulfillment_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].fulfillment_ids[*]')]
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
    WHEN json_extract(test_obj, '$.message.order.items[*].category_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].category_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].category_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].category_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].category_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].category_ids[*]')]
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
    WHEN json_extract(test_obj, '$.message.order.items[*].time.label') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].time.label')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].time.label')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].time.label')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].time.label'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].time.label')]
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
    WHEN json_extract(test_obj, '$.message.order.items[*].time.duration') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].time.duration')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].time.duration')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].time.duration')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].time.duration'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].time.duration')]
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
    WHEN json_extract(test_obj, '$.message.order.provider.descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.descriptor.name')]
END) AS attr
    FROM validate_attribute_27_scope
),
validate_attribute_28_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_28_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.provider.descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.descriptor.images[*].url')]
END) AS attr
    FROM validate_attribute_28_scope
),
validate_attribute_29_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_29_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.provider.time.range.start') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.time.range.start')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.time.range.start')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.time.range.start')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.time.range.start'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.time.range.start')]
END) AS attr
    FROM validate_attribute_29_scope
),
validate_attribute_30_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_30_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.provider.time.range.end') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.time.range.end')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.time.range.end')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.time.range.end')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.time.range.end'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.time.range.end')]
END) AS attr
    FROM validate_attribute_30_scope
),
validate_attribute_31_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_31_vars AS (
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
END) AS attr
    FROM validate_attribute_31_scope
),
validate_attribute_33_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_33_vars AS (
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
END) AS attr
    FROM validate_attribute_33_scope
),
validate_attribute_35_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_35_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].stops[*].location.gps')]
END) AS attr
    FROM validate_attribute_35_scope
),
validate_attribute_37_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_37_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.price.value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.price.value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.price.value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.price.value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.price.value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.price.value')]
END) AS attr
    FROM validate_attribute_37_scope
),
validate_attribute_38_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_38_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.price.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.price.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.price.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.price.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.price.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.price.currency')]
END) AS attr
    FROM validate_attribute_38_scope
),
validate_attribute_40_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_40_vars AS (
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
    FROM validate_attribute_40_scope
),
validate_attribute_44_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_44_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.bank_code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.bank_code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.bank_code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.bank_code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.bank_code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.bank_code')]
END) AS attr
    FROM validate_attribute_44_scope
),
validate_attribute_45_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_45_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].params.bank_account_number') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].params.bank_account_number')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.bank_account_number')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].params.bank_account_number')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].params.bank_account_number'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].params.bank_account_number')]
END) AS attr
    FROM validate_attribute_45_scope
),
validate_attribute_46_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_46_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation_terms[*].external_ref.url')]
END) AS attr
    FROM validate_attribute_46_scope
),
validate_attribute_47_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_47_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation_terms[*].external_ref.mimetype')]
END) AS attr
    FROM validate_attribute_47_scope
),
validate_attribute_48_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_48_vars AS (
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
END) AS attr
    FROM validate_attribute_48_scope
),
validate_attribute_49_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_attribute_49_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.cancellation.time') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.cancellation.time')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.cancellation.time')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.cancellation.time')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.cancellation.time'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.cancellation.time')]
END) AS attr
    FROM validate_attribute_49_scope
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
        ARRAY['ROUTE_INFO', 'TICKET_INFO', 'TRIP_DETAILS'] AS validTags,
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
END) AS tagPath
    FROM validate_tag_0_scope
),
validate_tag_0_route_info_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.fulfillments[*].tags[?(@.descriptor.code==''ROUTE_INFO'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_0_route_info_vars AS (
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
        ARRAY['ROUTE_ID', 'ROUTE_DIRECTION'] AS validValues
    FROM validate_tag_0_route_info_scope
),
validate_tag_0_ticket_info_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.fulfillments[*].tags[?(@.descriptor.code==''TICKET_INFO'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_0_ticket_info_vars AS (
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
        ARRAY['NUMBER'] AS validValues
    FROM validate_tag_0_ticket_info_scope
),
validate_tag_0_trip_details_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.fulfillments[*].tags[?(@.descriptor.code==''TRIP_DETAILS'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_0_trip_details_vars AS (
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
        ARRAY['AVAILABLE_TRIPS', 'UTILIZED_TRIPS'] AS validValues
    FROM validate_tag_0_trip_details_scope
),
validate_tag_1_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_tag_1_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['FARE_POLICY'] AS validTags,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].tags[*].descriptor.code')]
END) AS tagPath
    FROM validate_tag_1_scope
),
validate_tag_1_fare_policy_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.items[*].tags[?(@.descriptor.code==''FARE_POLICY'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_1_fare_policy_vars AS (
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
        ARRAY['RESTRICTED_PERSON', 'RESTRICTION_PROOF'] AS validValues
    FROM validate_tag_1_fare_policy_scope
),
validate_tag_2_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
validate_tag_2_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BUYER_FINDER_FEES', 'SETTLEMENT_TERMS'] AS validTags,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')]
END) AS tagPath
    FROM validate_tag_2_scope
),
validate_tag_2_buyer_finder_fees_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.payments[*].tags[?(@.descriptor.code==''BUYER_FINDER_FEES'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_2_buyer_finder_fees_vars AS (
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
    FROM validate_tag_2_buyer_finder_fees_scope
),
validate_tag_2_settlement_terms_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.payments[*].tags[?(@.descriptor.code==''SETTLEMENT_TERMS'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
validate_tag_2_settlement_terms_vars AS (
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
    FROM validate_tag_2_settlement_terms_scope
)
, violations AS (
SELECT
    'on_cancel' AS api,
    'validate_attribute_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_4_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_5_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_6_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_7_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_8_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_10' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_10_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_11' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_11_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_12' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_12_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_13' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_13_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_1' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_1_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_2' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_2_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_3' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_3_vars
WHERE TRUE AND NOT (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_4' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_4_vars
WHERE TRUE AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_14' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_14_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_15' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_15_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_16' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_16_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_17' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_17_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_19' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_19_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_20' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_20_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_21' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_21_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_22' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_22_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_23' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_23_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_24' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_24_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_25' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_25_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_26' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_26_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_27' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_27_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_28' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_28_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_29' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_29_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_30' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_30_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_31' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_31_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_33' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_33_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_35' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_35_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_37' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_37_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_38' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_38_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_40' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_40_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_44' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_44_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_45' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_45_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_46' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_46_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_47' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_47_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_48' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_48_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_attribute_49' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_attribute_49_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_5' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_5_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_6' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_6_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_7' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_7_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_8' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_8_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
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
    'on_cancel' AS api,
    'validate_enum_9' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_9_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
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
    'on_cancel' AS api,
    'validate_enum_10' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_10_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
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
    'on_cancel' AS api,
    'validate_enum_11' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_11_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_12' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_12_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_13' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_13_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_enum_14' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_enum_14_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT ((all_match(enumPath, value -> contains(enumList, value))) AND (cardinality(enumPath) > 0 AND all_match(enumPath, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_0' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
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
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(tagPath, value -> contains(validTags, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_0_ROUTE_INFO' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_route_info_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_0_TICKET_INFO' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_ticket_info_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_0_TRIP_DETAILS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_0_trip_details_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_1' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_1_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].tags[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].tags[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(tagPath, value -> contains(validTags, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_1_FARE_POLICY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_1_fare_policy_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_2' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_2_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))) OR (NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.payments[*].tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.payments[*].tags[*].descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(tagPath, value -> contains(validTags, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_2_BUYER_FINDER_FEES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_2_buyer_finder_fees_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'on_cancel' AS api,
    'validate_tag_2_SETTLEMENT_TERMS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM validate_tag_2_settlement_terms_vars
WHERE NOT COALESCE(((cardinality((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(doc, '$.error.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(doc, '$.error.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(doc, '$.error.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(doc, '$.error.code')) - 1),
                idx -> json_extract_scalar(json_extract(doc, '$.error.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(doc, '$.error.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
)
SELECT * FROM violations;
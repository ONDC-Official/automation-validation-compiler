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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_domain_scope
),
required_context_country_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_country_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_country_scope
),
required_context_city_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_city_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_city_scope
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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_transaction_id_scope
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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_message_id_scope
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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_action_scope
),
required_context_timestamp_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_timestamp_vars AS (
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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_timestamp_scope
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
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_version_scope
),
required_context_bap_uri_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_bap_uri_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bap_uri_scope
),
required_context_bap_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_bap_id_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bap_id_scope
),
required_context_bpp_uri_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_bpp_uri_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bpp_uri_scope
),
required_context_bpp_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_bpp_id_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bpp_id_scope
),
required_context_ttl_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_ttl_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_ttl_scope
),
valid_context_country_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_context_country_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['IND'] AS enumList,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM valid_context_country_code_scope
),
valid_context_domain_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_context_domain_vars AS (
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
        ARRAY['ONDC:TRV13'] AS enumList,
        ARRAY['confirm'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM valid_context_domain_scope
),
required_provider_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_id_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_provider_id_scope
),
required_message_items_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_message_items_id_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_message_items_id_scope
),
required_message_items_add_ons_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_message_items_add_ons_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].add_ons[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].add_ons[*].id')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_message_items_add_ons_scope
),
required_items_locations_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_items_locations_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].location_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].location_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].location_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].location_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].location_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].location_ids[*]')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_items_locations_scope
),
required_items_quantity_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_items_quantity_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_items_quantity_scope
),
required_items_addons_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_items_addons_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.items[*].add_ons[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.items[*].add_ons[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.items[*].add_ons[*].id')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_items_addons_scope
),
required_quote_price_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_price_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_price_scope
),
required_quote_currency_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_currency_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_currency_scope
),
required_quote_breakup_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_breakup_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.breakup[*].price.value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.breakup[*].price.value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].price.value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].price.value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.breakup[*].price.value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.breakup[*].price.value')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_breakup_scope
),
required_quote_breakup_price_currency_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_breakup_price_currency_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.breakup[*].price.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.breakup[*].price.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].price.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.breakup[*].price.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.breakup[*].price.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.breakup[*].price.currency')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_breakup_price_currency_scope
),
required_quote_breakup_title_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_breakup_title_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_breakup_title_scope
),
required_quote_ttl_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_quote_ttl_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.quote.ttl') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.quote.ttl')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.quote.ttl')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.quote.ttl')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.quote.ttl'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.quote.ttl')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_quote_ttl_scope
),
required_payment_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_payment_id_vars AS (
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_payment_id_scope
),
required_payment_type_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_payment_type_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_payment_type_scope
),
valid_payment_types_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_payment_types_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['PRE-ORDER', 'ON-FULFILLMENT', 'PART-PAYMENT'] AS enumList,
        ARRAY['confirm'] AS action
    FROM valid_payment_types_scope
),
required_payment_status_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_payment_status_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_payment_status_scope
),
valid_payment_status_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_payment_status_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
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
END) AS attr,
        ARRAY['PAID', 'NOT-PAID'] AS enumList,
        ARRAY['confirm'] AS action
    FROM valid_payment_status_scope
),
required_billing_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.name')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_name_scope
),
required_billing_address_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_address_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.address') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.address')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.address')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.address')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.address'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.address')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_address_scope
),
required_billing_state_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_state_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.state.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.state.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.state.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.state.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.state.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.state.name')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_state_name_scope
),
required_billing_city_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_city_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.city.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.city.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.city.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.city.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.city.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.city.name')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_city_name_scope
),
required_billing_organization_descriptor_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_organization_descriptor_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.organization.descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.organization.descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.organization.descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.organization.descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.organization.descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.organization.descriptor.name')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_organization_descriptor_name_scope
),
required_billing_organization_address_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_organization_address_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.organization.address') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.organization.address')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.organization.address')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.organization.address')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.organization.address'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.organization.address')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_organization_address_scope
),
required_billing_email_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_email_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.email') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.email')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.email')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.email')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.email'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.email')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_email_scope
),
required_billing_phone_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_phone_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.phone') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.phone')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.phone')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.phone')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.phone'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.phone')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_phone_scope
),
required_billing_tax_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_billing_tax_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.billing.tax_id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.billing.tax_id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.billing.tax_id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.billing.tax_id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.billing.tax_id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.billing.tax_id')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_billing_tax_id_scope
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
        ARRAY['confirm'] AS action
    FROM required_fulfillment_id_scope
),
required_customer_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.person.name')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_name_scope
),
required_customer_age_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_age_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.age') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.age')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.age')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.age')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.age'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.person.age')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_age_scope
),
required_customer_dob_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_dob_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.dob') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.dob')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.dob')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.dob')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.dob'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.person.dob')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_dob_scope
),
required_customer_gender_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_gender_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.gender') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.gender')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.gender')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.gender')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.person.gender'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.person.gender')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_gender_scope
),
required_customer_contact_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_contact_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.phone') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.phone')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.phone')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.phone')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.phone'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.contact.phone')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_contact_scope
),
required_customer_contact_email_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_customer_contact_email_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.email') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.email')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.email')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.email')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.fulfillments[*].customer.contact.email'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.fulfillments[*].customer.contact.email')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_customer_contact_email_scope
),
required_tag_groups_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_tag_groups_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.tags[*].descriptor.code')]
END) AS attr,
        ARRAY['confirm'] AS action
    FROM required_tag_groups_scope
),
payment_tag_group_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
payment_tag_group_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        ARRAY['BAP_TERMS', 'BUYER_FINDER_FEES', 'BPP_TERMS'] AS validTags,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.tags[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.tags[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.tags[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.tags[*].descriptor.code')]
END) AS tagPath,
        ARRAY['confirm'] AS action
    FROM payment_tag_group_scope
),
required_payment_tag_bpp_terms_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(COALESCE(
    CAST(json_extract(doc, '$.message.order.tags[?(@.descriptor.code==''BPP_TERMS'')]') AS ARRAY(JSON)),
    CAST(ARRAY[] AS ARRAY(JSON))
)) AS scope(scope_item)
),
required_payment_tag_bpp_terms_vars AS (
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
        ARRAY['MAX_LIABILITY', 'MAX_LIABILITY_CAP', 'MANDATORY_ARBITRATION', 'COURT_JURISDICTION', 'DELAY_INTEREST', 'TAX_NUMBER'] AS validValues,
        ARRAY['confirm'] AS action
    FROM required_payment_tag_bpp_terms_scope
),
required_created_at_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_created_at_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.created_at') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.created_at')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.created_at')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.created_at')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.created_at'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.created_at')]
END) AS attr,
        ARRAY['^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$'] AS reg,
        ARRAY['confirm'] AS action
    FROM required_created_at_scope
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
        ARRAY['^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d{3}Z$'] AS reg,
        ARRAY['confirm'] AS action
    FROM required_updated_at_scope
)
, violations AS (
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_COUNTRY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_country_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_CITY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_city_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_ACTION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_action_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_timestamp_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_BAP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_BAP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_BPP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_BPP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CONTEXT_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'VALID_CONTEXT_COUNTRY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_country_code_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'VALID_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_domain_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_PROVIDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_MESSAGE_ITEMS_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_message_items_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_MESSAGE_ITEMS_ADD_ONS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_message_items_add_ons_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_ITEMS_LOCATIONS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_items_locations_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_ITEMS_QUANTITY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_items_quantity_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_ITEMS_ADDONS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_items_addons_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_PRICE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_price_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_BREAKUP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_BREAKUP_PRICE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_price_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_BREAKUP_TITLE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_title_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_QUOTE_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_PAYMENT_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_PAYMENT_TYPE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_type_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'VALID_PAYMENT_TYPES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_payment_types_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_PAYMENT_STATUS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_status_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'VALID_PAYMENT_STATUS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_payment_status_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_ADDRESS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_address_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_STATE_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_state_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_CITY_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_city_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_ORGANIZATION_DESCRIPTOR_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_organization_descriptor_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_ORGANIZATION_ADDRESS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_organization_address_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_EMAIL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_email_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_PHONE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_phone_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_BILLING_TAX_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_billing_tax_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_FULFILLMENT_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_fulfillment_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_AGE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_age_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_DOB' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_dob_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_GENDER' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_gender_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_CONTACT' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_contact_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CUSTOMER_CONTACT_EMAIL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_customer_contact_email_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_TAG_GROUPS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_tag_groups_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'confirm' AS api,
    'PAYMENT_TAG_GROUP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM payment_tag_group_vars
WHERE TRUE AND NOT (all_match(tagPath, value -> contains(validTags, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_PAYMENT_TAG_BPP_TERMS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_tag_bpp_terms_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
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
END)) > 0 AND all_match((CASE
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
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(subTags, value -> contains(validValues, value)))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_CREATED_AT' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_created_at_vars
WHERE TRUE AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
UNION ALL
SELECT
    'confirm' AS api,
    'REQUIRED_UPDATED_AT' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_updated_at_vars
WHERE TRUE AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
)
SELECT * FROM violations;
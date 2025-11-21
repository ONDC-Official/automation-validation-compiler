-- Auto-generated Athena SQL validation rules for action: select
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'select'
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action,
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
        ARRAY['select'] AS action
    FROM required_provider_id_scope
),
required_provider_time_label_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_time_label_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.order.provider.time.label') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.order.provider.time.label')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.order.provider.time.label')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.order.provider.time.label')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.order.provider.time.label'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.order.provider.time.label')]
END) AS attr,
        ARRAY['select'] AS action
    FROM required_provider_time_label_scope
),
required_provider_time_range_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_time_range_vars AS (
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
END) AS attr,
        ARRAY['select'] AS action
    FROM required_provider_time_range_scope
),
required_provider_time_range_end_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_time_range_end_vars AS (
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
END) AS attr,
        ARRAY['select'] AS action
    FROM required_provider_time_range_end_scope
),
required_item_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_id_vars AS (
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
        ARRAY['select'] AS action
    FROM required_item_id_scope
),
required_item_location_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_location_vars AS (
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
        ARRAY['select'] AS action
    FROM required_item_location_scope
),
required_item_quantity_selected_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_quantity_selected_vars AS (
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
        ARRAY['select'] AS action
    FROM required_item_quantity_selected_scope
),
required_item_addon_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_addon_id_vars AS (
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
        ARRAY['select'] AS action
    FROM required_item_addon_id_scope
),
required_fulfillment_tags_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_fulfillment_tags_vars AS (
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
        ARRAY['select'] AS action
    FROM required_fulfillment_tags_scope
),
valid_fulfillment_tag_guests_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_fulfillment_tag_guests_vars AS (
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
        ARRAY['GUESTS'] AS enumList,
        ARRAY['select'] AS action
    FROM valid_fulfillment_tag_guests_scope
),
valid_fulfillment_subtags_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_fulfillment_subtags_vars AS (
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
        ARRAY['ADULTS', 'CHILDREN'] AS enumList,
        ARRAY['select'] AS action
    FROM valid_fulfillment_subtags_scope
)
, violations AS (
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_COUNTRY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_country_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_CITY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_city_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_ACTION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_action_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_timestamp_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_BAP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_BAP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_BPP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_BPP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_CONTEXT_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'VALID_CONTEXT_COUNTRY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_country_code_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'select' AS api,
    'VALID_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_domain_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_PROVIDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_PROVIDER_TIME_LABEL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_time_label_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_PROVIDER_TIME_RANGE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_time_range_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_PROVIDER_TIME_RANGE_END' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_time_range_end_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_ITEM_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_ITEM_LOCATION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_location_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_ITEM_QUANTITY_SELECTED' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_quantity_selected_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_ITEM_ADDON_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_addon_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'REQUIRED_FULFILLMENT_TAGS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_fulfillment_tags_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'select' AS api,
    'VALID_FULFILLMENT_TAG_GUESTS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_fulfillment_tag_guests_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'select' AS api,
    'VALID_FULFILLMENT_SUBTAGS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_fulfillment_subtags_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
)
SELECT * FROM violations;
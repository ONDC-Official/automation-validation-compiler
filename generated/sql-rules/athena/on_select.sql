-- Auto-generated Athena SQL validation rules for action: on_select
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'on_select'
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action,
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
        ARRAY['on_select'] AS action
    FROM required_provider_id_scope
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
        ARRAY['on_select'] AS action
    FROM required_item_id_scope
),
required_item_adds_on_ids_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_adds_on_ids_vars AS (
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
        ARRAY['on_select'] AS action
    FROM required_item_adds_on_ids_scope
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
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
        ARRAY['on_select'] AS action
    FROM valid_payment_types_scope
)
, violations AS (
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_COUNTRY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_country_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_CITY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_city_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_ACTION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_action_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_timestamp_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_BAP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_BAP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_BPP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_BPP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_CONTEXT_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'VALID_CONTEXT_COUNTRY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_country_code_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_select' AS api,
    'VALID_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_domain_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_PROVIDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_ITEM_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_ITEM_ADDS_ON_IDS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_adds_on_ids_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_PRICE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_price_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_BREAKUP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_BREAKUP_PRICE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_price_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_BREAKUP_TITLE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_breakup_title_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_QUOTE_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_quote_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_PAYMENT_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'REQUIRED_PAYMENT_TYPE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_payment_type_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_select' AS api,
    'VALID_PAYMENT_TYPES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_payment_types_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
)
SELECT * FROM violations;
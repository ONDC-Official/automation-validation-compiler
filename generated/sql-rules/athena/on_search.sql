-- Auto-generated Athena SQL validation rules for action: on_search
-- Replace <payload_table> and optional external_data column references as required.
WITH payload_source AS (
    SELECT
        payload,
        json_parse(payload) AS doc,
        json_parse(COALESCE(external_data, '{}')) AS external_doc
    FROM <payload_table>
    WHERE action = 'on_search'
),
required_context_location_country_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_location_country_code_vars AS (
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
        (CASE
    WHEN json_extract(external_doc, '$._EXTERNAL.city_code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(external_doc, '$._EXTERNAL.city_code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(external_doc, '$._EXTERNAL.city_code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(external_doc, '$._EXTERNAL.city_code')) - 1),
                idx -> json_extract_scalar(json_extract(external_doc, '$._EXTERNAL.city_code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(external_doc, '$._EXTERNAL.city_code')]
END) AS cities,
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_location_country_code_scope
),
required_context_location_city_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_context_location_city_code_vars AS (
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_location_city_code_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_domain_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_timestamp_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bap_id_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bap_uri_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bpp_id_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_bpp_uri_scope
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
        ARRAY['on_search'] AS action,
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_message_id_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_version_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_context_ttl_scope
),
valid_context_location_country_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
valid_context_location_country_code_vars AS (
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM valid_context_location_country_code_scope
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
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM valid_context_domain_scope
),
required_catalog_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_catalog_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.name')]
END) AS attr,
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_catalog_name_scope
),
required_catalog_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_catalog_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.code')]
END) AS attr,
        ARRAY['on_search'] AS action,
        ARRAY['ONDC:TRV13'] AS domain,
        ARRAY['2.0.0'] AS version
    FROM required_catalog_code_scope
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
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].id')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_provider_id_scope
),
required_provider_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.name')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_provider_name_scope
),
required_provider_images_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_images_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')]
END) AS attr,
        ARRAY['^https://.*'] AS reg,
        ARRAY['on_search'] AS action
    FROM required_provider_images_scope
),
required_provider_locations_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_provider_locations_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].locations[*].id')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_provider_locations_scope
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
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].payments[*].type')]
END) AS enumPath,
        ARRAY['PRE-ORDER', 'ON-FULFILLMENT', 'PART-PAYMENT'] AS enumList,
        ARRAY['on_search'] AS action
    FROM valid_payment_types_scope
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
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].id')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_id_scope
),
required_item_label_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_label_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.label') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.label')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.label')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.label')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.label'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].time.label')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_label_scope
),
required_item_timestamps_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_timestamps_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].time.timestamp')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_timestamps_scope
),
required_item_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].descriptor.name')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_name_scope
),
required_item_code_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_code_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].descriptor.code')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_code_scope
),
required_item_images_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_images_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')]
END) AS attr,
        ARRAY['^https://.*'] AS reg,
        ARRAY['on_search'] AS action
    FROM required_item_images_scope
),
required_item_price_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_price_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].price.value')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_price_scope
),
required_item_price_currency_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_price_currency_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].price.currency')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_price_currency_scope
),
required_item_price_max_value_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_price_max_value_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].price.maximum_value')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_price_max_value_scope
),
required_item_quantity_available_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_quantity_available_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].quantity.available.count')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_quantity_available_scope
),
required_item_quantity_maximum_count_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_quantity_maximum_count_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].quantity.maximum.count')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_quantity_maximum_count_scope
),
required_item_location_link_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_location_link_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].location_ids[*]')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_location_link_scope
),
required_item_category_link_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_category_link_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].category_ids[*]')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_category_link_scope
),
required_item_payment_link_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_item_payment_link_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].payment_ids[*]')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_item_payment_link_scope
),
required_addon_id_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_addon_id_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].id')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_addon_id_scope
),
required_addon_name_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_addon_name_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].descriptor.name')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_addon_name_scope
),
required_addon_price_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_addon_price_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.value')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_addon_price_scope
),
required_addon_price_currency_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_addon_price_currency_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.currency')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_addon_price_currency_scope
),
required_addon_price_maximum_value_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_addon_price_maximum_value_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].add_ons[*].price.maximum_value')]
END) AS attr,
        ARRAY['on_search'] AS action
    FROM required_addon_price_maximum_value_scope
),
required_cancellation_terms_url_scope AS (
    SELECT
        payload,
        doc,
        external_doc,
        scope_item AS test_obj
    FROM payload_source
    CROSS JOIN UNNEST(ARRAY[doc]) AS scope(scope_item)
),
required_cancellation_terms_url_vars AS (
    SELECT
        payload,
        doc,
        external_doc,
        test_obj,
        (CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')]
END) AS attr,
        ARRAY['^https://.*'] AS reg,
        ARRAY['on_search'] AS action
    FROM required_cancellation_terms_url_scope
)
, violations AS (
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_LOCATION_COUNTRY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_location_country_code_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(cities, value)))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_LOCATION_CITY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_location_city_code_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_domain_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_TIMESTAMP' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_timestamp_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_BAP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_BAP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bap_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_BPP_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_BPP_URI' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_bpp_uri_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_TRANSACTION_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_transaction_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_MESSAGE_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_message_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_VERSION' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_version_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CONTEXT_TTL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_context_ttl_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'VALID_CONTEXT_LOCATION_COUNTRY_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_location_country_code_vars
WHERE TRUE AND NOT (any_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_search' AS api,
    'VALID_CONTEXT_DOMAIN' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_context_domain_vars
WHERE TRUE AND NOT (all_match(attr, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CATALOG_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_catalog_name_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.name')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.name')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CATALOG_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_catalog_code_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.code')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.descriptor.code') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.descriptor.code')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.descriptor.code'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.descriptor.code')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_PROVIDER_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_PROVIDER_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_name_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.name')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.name'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.name')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_PROVIDER_IMAGES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_images_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].descriptor.images[*].url')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_PROVIDER_LOCATIONS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_provider_locations_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].locations[*].id')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].locations[*].id'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].locations[*].id')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'VALID_PAYMENT_TYPES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM valid_payment_types_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].payments[*].type')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].payments[*].type'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].payments[*].type')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(enumPath, value -> contains(enumList, value)))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_LABEL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_label_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_TIMESTAMPS' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_timestamps_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_CODE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_code_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_IMAGES' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_images_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].descriptor.images[*].url')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_PRICE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_price_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_PRICE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_price_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_PRICE_MAX_VALUE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_price_max_value_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_QUANTITY_AVAILABLE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_quantity_available_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_QUANTITY_MAXIMUM_COUNT' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_quantity_maximum_count_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_LOCATION_LINK' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_location_link_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_CATEGORY_LINK' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_category_link_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ITEM_PAYMENT_LINK' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_item_payment_link_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ADDON_ID' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_addon_id_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ADDON_NAME' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_addon_name_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ADDON_PRICE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_addon_price_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ADDON_PRICE_CURRENCY' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_addon_price_currency_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_ADDON_PRICE_MAXIMUM_VALUE' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_addon_price_maximum_value_vars
WHERE TRUE AND NOT (cardinality(attr) > 0 AND all_match(attr, value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined')))
UNION ALL
SELECT
    'on_search' AS api,
    'REQUIRED_CANCELLATION_TERMS_URL' AS rule_name,
    30000 AS error_code,
    200 AS success_code,
    payload
FROM required_cancellation_terms_url_vars
WHERE NOT COALESCE(((NOT (cardinality((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')]
END)) > 0 AND all_match((CASE
    WHEN json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url') IS NULL THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
    WHEN json_type(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 'array' THEN
        CASE
            WHEN json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) = 0 THEN CAST(ARRAY[] AS ARRAY(VARCHAR))
            ELSE transform(
                sequence(0, json_array_length(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')) - 1),
                idx -> json_extract_scalar(json_extract(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url'), format('$[%d]', idx))
            )
        END
    ELSE ARRAY[json_extract_scalar(test_obj, '$.message.catalog.providers[*].items[*].cancellation_terms[*].external_ref.url')]
END), value -> value IS NOT NULL AND trim(value) <> '' AND lower(value) NOT IN ('null', 'undefined'))))), FALSE) AND NOT (all_match(reg, pattern -> all_match(attr, value -> regexp_like(value, pattern))))
)
SELECT * FROM violations;
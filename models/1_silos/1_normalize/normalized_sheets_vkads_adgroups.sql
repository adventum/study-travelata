SELECT 
JSONExtractString(_airbyte_data, 'ad_group_id') AS ad_group_id,
JSONExtractString(_airbyte_data, 'utm') AS utm,
JSONExtractString(_airbyte_data, 'name') AS name,
JSONExtractString(_airbyte_data, 'price') AS price,
JSONExtractString(_airbyte_data, 'issues') AS issues,
JSONExtractString(_airbyte_data, 'status') AS status,
JSONExtractString(_airbyte_data, 'banners') AS banners,
JSONExtractString(_airbyte_data, 'created') AS created, --date
JSONExtractString(_airbyte_data, 'updated') AS updated, -- date
JSONExtractString(_airbyte_data, 'date_end') AS date_end, --date
JSONExtractString(_airbyte_data, 'delivery') AS delivery,
JSONExtractString(_airbyte_data, 'language') AS language,
JSONExtractString(_airbyte_data, 'max_price') AS max_price,
JSONExtractString(_airbyte_data, 'objective') AS objective,
JSONExtractString(_airbyte_data, 'date_start') AS date_start,
JSONExtractString(_airbyte_data, 'enable_utm') AS enable_utm,
JSONExtractString(_airbyte_data, 'package_id') AS package_id,
JSONExtractString(_airbyte_data, 'targetings') AS targetings,
JSONExtractString(_airbyte_data, 'priced_goal') AS priced_goal,
JSONExtractString(_airbyte_data, 'audit_pixels') AS audit_pixels,
JSONExtractString(_airbyte_data, 'budget_limit') AS budget_limit,
JSONExtractString(_airbyte_data, 'pricelist_id') AS pricelist_id,
JSONExtractString(_airbyte_data, 'age_restrictions') AS age_restrictions,
JSONExtractString(_airbyte_data, 'autobidding_mode') AS autobidding_mode,
JSONExtractString(_airbyte_data, 'budget_limit_day') AS budget_limit_day,
JSONExtractString(_airbyte_data, 'uniq_shows_limit') AS uniq_shows_limit,
JSONExtractString(_airbyte_data, 'sk_ad_campaign') AS sk_ad_campaign,
JSONExtractString(_airbyte_data, 'uniq_shows_period') AS uniq_shows_period,
JSONExtractString(_airbyte_data, 'enable_offline_goals') AS enable_offline_goals,
JSONExtractString(_airbyte_data, 'banner_uniq_shows_limit') AS banner_uniq_shows_limit,
JSONExtractString(_airbyte_data, 'marketplace_app_client_id') AS marketplace_app_client_id,
JSONExtractString(_airbyte_data, 'package_priced_event_type') AS package_priced_event_type,
JSONExtractString(_airbyte_data, 'dinamic_without_remarketing') AS dynamic_without_remarketing,
JSONExtractString(_airbyte_data, 'dynamic_banners_use_storelink') AS	dynamic_banners_use_storelink,
toLowCardinality(__table_name) AS __table_name,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
NOW() AS __normalized_at
FROM
(SELECT *, 'travelata._airbyte_raw_sheets_vkads_travelata_ad_groups' AS __table_name
FROM travelata._airbyte_raw_sheets_vkads_travelata_ad_groups)
	
SELECT 
JSONExtractString(_airbyte_data, 'ad_plans_id') AS ad_plans_id,
JSONExtractString(_airbyte_data, 'name') AS name,
JSONExtractString(_airbyte_data, 'status') AS status,
JSONExtractString(_airbyte_data, 'created') AS created, --date
JSONExtractString(_airbyte_data, 'updated') AS updated, -- date
JSONExtractString(_airbyte_data, 'date_end') AS date_end, --date
JSONExtractString(_airbyte_data, 'ad_groups') AS ad_groups,
JSONExtractString(_airbyte_data, 'max_price') AS max_price,
JSONExtractString(_airbyte_data, 'objective') AS objective,
JSONExtractString(_airbyte_data, 'date_start') AS date_start,
JSONExtractString(_airbyte_data, 'priced_goal') AS priced_goal,
JSONExtractString(_airbyte_data, 'budget_limit') AS budget_limit,
JSONExtractString(_airbyte_data, 'pricelist_id') AS pricelist_id,
JSONExtractString(_airbyte_data, 'vkads_status') AS vkads_status,
JSONExtractString(_airbyte_data, 'autobidding_mode') AS autobidding_mode,
JSONExtractString(_airbyte_data, 'budget_limit_day') AS budget_limit_day,
toLowCardinality(__table_name) AS __table_name,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
NOW() AS __normalized_at
FROM
(SELECT *, 'travelata._airbyte_raw_sheets_vkads_travelata_ad_plans' AS __table_name
FROM travelata._airbyte_raw_sheets_vkads_travelata_ad_plans)
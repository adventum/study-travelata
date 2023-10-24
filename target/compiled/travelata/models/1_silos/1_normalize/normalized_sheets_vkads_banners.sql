SELECT 
JSONExtractString(_airbyte_data, 'id') AS id,
JSONExtractString(_airbyte_data, 'name') AS name,
JSONExtractString(_airbyte_data, 'url') AS url,
JSONExtractString(_airbyte_data, 'issues') AS issues,
JSONExtractString(_airbyte_data, 'status') AS status,
JSONExtractString(_airbyte_data, 'content') AS content,
JSONExtractString(_airbyte_data, 'created') AS created, --date
JSONExtractString(_airbyte_data, 'updated') AS updated, -- date
JSONExtractString(_airbyte_data, 'delivery') AS delivery,
JSONExtractString(_airbyte_data, 'textblocks') AS textblocks,
JSONExtractString(_airbyte_data, 'ad_group_id') AS ad_group_id,
JSONExtractString(_airbyte_data, 'moderation_status') ASmoderation_status,
JSONExtractString(_airbyte_data, 'moderation_reasons') AS moderation_reasons,
toLowCardinality(__table_name) AS __table_name,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
NOW() AS __normalized_at
FROM
(SELECT *, 'travelata._airbyte_raw_sheets_vkads_travelata_banners' AS __table_name
FROM travelata._airbyte_raw_sheets_vkads_travelata_banners)
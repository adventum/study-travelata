SELECT 
JSONExtractString(`_airbyte_data`,'campaign_id') as campagin_id,
JSONExtractString(`_airbyte_data`,'id') as id,
JSONExtractString(`_airbyte_data`,'textblocks') as textblocks,
JSONExtractString(`_airbyte_data`,'urls') as urls,
JSONExtractString(`_airbyte_data`,'_airbyte_ab_id') as airbyte_ab_id,
toLowCardinality(table_name) as table_name,
toDateTime32(_airbyte_emitted_at) as _emitted_at,
now() as _normalized_at 
from
(select *,'travelata._airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners' as table_name
from travelata.`_airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners`)
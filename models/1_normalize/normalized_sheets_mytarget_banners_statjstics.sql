SELECT 
JSONExtractString(`_airbyte_data`,'date') as _date,
JSONExtractString(`_airbyte_data`,'shows') as shows,
JSONExtractString(`_airbyte_data`,'clicks') as clics,
JSONExtractString(`_airbyte_data`,'goals') as goals,
JSONExtractString(`_airbyte_data`,'spent') as spent,
JSONExtractString(`_airbyte_data`,'banner_id') as banner_id,
JSONExtractString(`_airbyte_data`,'_airbyte_ab_id') as airbyte_ab_id,
toLowCardinality(__table_name) as __table_name,
toDateTime32(_airbyte_emitted_at) as _emitted_at,
now() as _normalized_at,
JSONExtractString(`_airbyte_data`,'load_date') as load_date
from
(select *,'travelata._airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners_statistics' as __table_name
from travelata.`_airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners_statistics`)
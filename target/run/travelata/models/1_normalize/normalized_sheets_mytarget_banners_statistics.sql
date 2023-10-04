

  create view travelata.normalized_sheets_mytarget_banners_statistics__dbt_tmp 
  
  as (
    SELECT 
--parseDateTime(JSONExtractString(`_airbyte_data`,'date'))as _datetime,
JSONExtractString(`_airbyte_data`,'date') as date,
JSONExtractString(`_airbyte_data`,'shows') as shows,
JSONExtractString(`_airbyte_data`,'clicks') as clics,
JSONExtractString(`_airbyte_data`,'goals') as goals,
JSONExtractString(`_airbyte_data`,'spent') as spent,
JSONExtractString(`_airbyte_data`,'_banner_id') as banner_id,
JSONExtractString(`_airbyte_data`,'_airbyte_ab_id') as airbyte_ab_id,
toLowCardinality(table_name) as table_name,
toDateTime32(_airbyte_emitted_at) as _emitted_at,
now() as _normalized_at 
from
(select *,'travelata._airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners_statistics' as table_name
from travelata.`_airbyte_raw_sheets_mytarget_travelata_normalize_mt_banners_statistics`)
  )
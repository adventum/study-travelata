

  create view travelata.normalized_sheets_mytarget_compaigns 
  
  as (
    SELECT 
JSONExtractString(`_airbyte_data`,'id') as id,
JSONExtractString(`_airbyte_data`,'name') as name,
JSONExtractString(`_airbyte_data`,'_airbyte_ab_id') as airbyte_ab_id,
toLowCardinality(table_name) as table_name,
toDateTime32(_airbyte_emitted_at) as _emitted_at,
now() as _normalized_at 
from
(select *,'travelata._airbyte_raw_sheets_mytarget_travelata_normalize_mt_compaigns' as table_name
from travelata.`_airbyte_raw_sheets_mytarget_travelata_normalize_mt_compaigns`)
  )
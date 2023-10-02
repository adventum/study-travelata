

  create view travelata.normalize_sheets_default_travelataappmetrica_profiles__dbt_tmp 
  
  as (
    SELECT 
JSONExtractString(_airbyte_data, 'profile_id') AS profile_id,
JSONExtractString(_airbyte_data, 'appmetrica_device_id') AS appmetrica_device_id,
JSONExtractString(_airbyte_data, 'mp_card_number') AS mp_card_number,
JSONExtractString(_airbyte_data, 'city_code') AS city_code,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_default_travelataappmetrica_profiles' as __table_name
from travelata._airbyte_raw_sheets_default_travelataappmetrica_profiles
)
  )
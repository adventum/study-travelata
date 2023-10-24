

  create view travelata.normalized_sheets_yandexdisk_mediaplans__dbt_tmp 
  
  as (
    select
JSONExtractString(_airbyte_data, 'Source') as Source,
JSONExtractString(_airbyte_data, 'Medium') as Medium,
JSONExtractString(_airbyte_data, 'Campaign') as Campaign,
JSONExtractString(_airbyte_data, 'ProductName') as ProductName,
JSONExtractString(_airbyte_data, 'Geo') as Geo,
JSONExtractString(_airbyte_data, 'Period_start') as Period_start,
JSONExtractString(_airbyte_data, 'Period_end') as Period_end,
JSONExtractString(_airbyte_data, 'Cost') as Cost,
toLowCardinality(__table_name) as __table_name,
toDateTime32(_airbyte_emitted_at) as __emitted_at,
NOW() as __normalized_at
from 
(select *, '_airbyte_raw_sheets_yandexdisk_travelata_yandexdisk_mediaplans' as __table_name
from travelata._airbyte_raw_sheets_yandexdisk_travelata_yandexdisk_mediaplans)
  )
<<<<<<< HEAD


  create view travelata.normalized_sheets_appmetrica_screenview__dbt_tmp 
  
  as (
    SELECT 
JSONExtractString(_airbyte_data, 'eventDateTime') AS __datetime,
JSONExtractString(_airbyte_data, 'eventDateTime') AS eventDateTime,
JSONExtractString(_airbyte_data, 'mobileAdsId') AS appmetricamobileAdsId_device_id,
JSONExtractString(_airbyte_data, 'accountName') AS accountName,
JSONExtractString(_airbyte_data, 'appmetricaDeviceId') AS appmetricaDeviceId,
JSONExtractString(_airbyte_data, 'cityName') AS cityName,
JSONExtractString(_airbyte_data, 'osName') AS osName,
JSONExtractString(_airbyte_data, 'crmUserId') AS crmUserId,
JSONExtractString(_airbyte_data, 'session_id') AS session_id,
JSONExtractString(_airbyte_data, 'screen_view') AS screen_view,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_appmetrica_travelata_screen_view' as __table_name
from travelata._airbyte_raw_sheets_appmetrica_travelata_screen_view
)
=======


  create view travelata.normalized_sheets_appmetrica_screenview__dbt_tmp 
  
  as (
    SELECT 
JSONExtractString(_airbyte_data, 'eventDateTime') AS __datetime,
JSONExtractString(_airbyte_data, 'eventDateTime') AS eventDateTime,
JSONExtractString(_airbyte_data, 'mobileAdsId') AS appmetricamobileAdsId_device_id,
JSONExtractString(_airbyte_data, 'accountName') AS accountName,
JSONExtractString(_airbyte_data, 'appmetricaDeviceId') AS appmetricaDeviceId,
JSONExtractString(_airbyte_data, 'cityName') AS cityName,
JSONExtractString(_airbyte_data, 'osName') AS osName,
JSONExtractString(_airbyte_data, 'crmUserId') AS crmUserId,
JSONExtractString(_airbyte_data, 'session_id') AS session_id,
JSONExtractString(_airbyte_data, 'screen_view') AS screen_view,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_appmetrica_travelata_screen_view' as __table_name
from travelata._airbyte_raw_sheets_appmetrica_travelata_screen_view
)
>>>>>>> c0adfb402ba38a3cf82ef774e9a887be0d61306a
  )
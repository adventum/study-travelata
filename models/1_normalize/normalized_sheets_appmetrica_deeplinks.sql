SELECT 
JSONExtractString(_airbyte_data, 'deeplink_url_parameters') AS deeplink_url_parameters,
JSONExtractString(_airbyte_data, 'event_datetime') AS __datetime,
JSONExtractString(_airbyte_data, 'profile_id') AS profile_id,
JSONExtractString(_airbyte_data, 'appmetrica_device_id') AS appmetrica_device_id,
JSONExtractString(_airbyte_data, 'city') AS city,
JSONExtractString(_airbyte_data, 'ios_ifa') AS ios_ifa,
JSONExtractString(_airbyte_data, 'google_aid') AS google_aid,
JSONExtractString(_airbyte_data, 'os_name') AS os_name,
JSONExtractString(_airbyte_data, 'publisher_name') AS publisher_name,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_appmetrica_travelata_deeplinks' as __table_name
from travelata._airbyte_raw_sheets_appmetrica_travelata_deeplinks
)
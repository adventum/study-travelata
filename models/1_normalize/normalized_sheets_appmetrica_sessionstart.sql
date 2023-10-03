SELECT 
JSONExtractString(_airbyte_data, 'session_id') AS session_id,
toDateTime(JSONExtractString(_airbyte_data, 'session_start_datetime')) AS session_start_datetime,
JSONExtractString(_airbyte_data, 'appmetrica_device_id') AS appmetrica_device_id,
JSONExtractString(_airbyte_data, 'appmetricaDeviceId') AS appmetricaDeviceId,
JSONExtractString(_airbyte_data, 'city') AS city,
JSONExtractString(_airbyte_data, 'google_aid') AS google_aid,
JSONExtractString(_airbyte_data, 'os_name') AS os_name,
JSONExtractString(_airbyte_data, 'profile_id') AS profile_id,
JSONExtractString(_airbyte_data, 'installation_id') AS installation_id,
JSONExtractString(_airbyte_data, 'ios_ifa') AS ios_ifa,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_appmetrica_sessions_starts' as __table_name
from travelata._airbyte_raw_sheets_appmetrica_sessions_starts
)
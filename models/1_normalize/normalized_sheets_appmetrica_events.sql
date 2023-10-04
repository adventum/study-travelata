SELECT
parseDateTime(JSONExtractString(_airbyte_data, 'event_datetime'), '%d.%m.%Y') AS __datetime,
JSONExtractString(_airbyte_data, 'event_datetime') AS event_datetime,
JSONExtractString(_airbyte_data, 'event_json') AS event_json,
JSONExtractString(_airbyte_data, 'event_name') AS event_name,
JSONExtractString(_airbyte_data, 'installation_id') AS installation_id,
JSONExtractString(_airbyte_data, 'appmetrica_device_id') AS appmetrica_device_id,
JSONExtractString(_airbyte_data, 'city') AS city,
JSONExtractString(_airbyte_data, 'google_aid') AS google_aid,
JSONExtractString(_airbyte_data, 'os_name') AS os_name,
JSONExtractString(_airbyte_data, 'profile_id') AS profile_id,
JSONExtractString(_airbyte_data, 'session_id') AS session_id,
JSONExtractString(_airbyte_data, 'app_version_name') AS app_version_name,
JSONExtractString(_airbyte_data, 'ios_ifa') AS ios_ifa,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_appmetrica_travelata_events' as __table_name
from travelata._airbyte_raw_sheets_appmetrica_travelata_events
)
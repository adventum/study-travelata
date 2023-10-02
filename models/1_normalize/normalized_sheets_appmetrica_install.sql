SELECT 
parseDateTime(JSONExtractString(_airbyte_data, 'install_datetime'), '%d.%m.%Y') AS __datetime,
JSONExtractString(_airbyte_data, 'city') AS city,
JSONExtractString(_airbyte_data, 'os_name') AS os_name,
JSONExtractString(_airbyte_data, 'google_aid') AS google_aid,
JSONExtractString(_airbyte_data, 'profile_id') AS profile_id,
JSONExtractString(_airbyte_data, 'click_datetime') AS click_datetime,
JSONExtractString(_airbyte_data, 'install_datetime') AS install_datetime,
JSONExtractString(_airbyte_data, 'appmetrica_device_id') AS appmetrica_device_id,
JSONExtractString(_airbyte_data, 'click_url_parameters') AS click_url_parameters,
JSONExtractString(_airbyte_data, 'is_reinstallation') AS is_reinstallation,
JSONExtractString(_airbyte_data, 'publisher_name') AS publisher_name,
JSONExtractString(_airbyte_data, 'ios_ifa') AS ios_ifa,
toDateTime32(_airbyte_emitted_at) AS __emitted_at,
toLowCardinality(__table_name) AS __table_name,
NOW() as __normalized_at
FROM 
(
select *, 'travelata._airbyte_raw_sheets_default_travelataappmetrica_install' as __table_name
from travelata._airbyte_raw_sheets_default_travelataappmetrica_install
)
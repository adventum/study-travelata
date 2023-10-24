{{
    config(
        materialized='view'
    )
}}

select 
    __datetime as __datetime,
    event_datetime as eventDateTime,
    toLowCardinality(splitByChar('_',  `__table_name`)[6]) as accountName,
    appmetrica_device_id as appmetricaDeviceId,
    assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as advertisingId,
    profile_id as crmUsereId,
    os_name as osName,
    city as cityName,
    JSONExtractString(event_json, 'item_name') AS itemName,
    JSONExtractString(event_json, 'item_id') AS itemId,
    JSONExtractString(event_json, 'item_category') AS itemCategory
    

from {{ ref('incremental_sheets_appmetrica_events') }}
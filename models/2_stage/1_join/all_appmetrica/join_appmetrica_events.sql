{{
    config(
        materialized='view'
    )
}}

select 
    __datetime as __datetime,
    __datetime as eventDateTime,
    toLowCardinality(splitByChar('_',  `__table_name`)[6]) as __table_name,
    appmetrica_device_id as appmetricaDeviceId,
    assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as mobileAdsId,
    profile_id as crmUserId,
    os_name as osName,
    city as cityName,
    session_id as sessionId,
    JSONExtractString(event_json, 'item_name') AS itemName,
    JSONExtractString(event_json, 'item_id') AS itemId,
    JSONExtractString(event_json, 'item_category') AS itemCategory
    

from {{ ref('incremental_sheets_appmetrica_events') }}
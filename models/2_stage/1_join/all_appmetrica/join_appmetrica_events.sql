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
    event_name as eventName,
    JSONExtractString(event_json, 'item_name') AS itemName,
    JSONExtractString(event_json, 'item_id') AS itemId,
    JSONExtractString(event_json, 'item_category') AS itemCategory,
    if(event_name='serp', 1, 0) as serp,
    if(event_name='hotel_page', 1, 0) as hotelPage,
    if(event_name='tour_page', 1, 0) as tourPage,
    if(event_name='checkout', 1, 0) as checkout,
    if(event_name='payment', 1, 0) as payment
    

from {{ ref('incremental_sheets_appmetrica_events') }}
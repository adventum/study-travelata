{{
    config(
        materialized = 'view'
    )
}}


select
__datetime,
__datetime as eventDateTime,
accountName,
appmetricaDeviceId,
appmetricamobileAdsId_device_id as mobileAdsId,
crmUserId,
osName,
cityName,
session_id as sessionId,
'' as itemName,
'' as itemId,
'' as itemCategory,
'' as eventName,
0 as serp,
0 as hotelPage,
0 as tourPage,
0 as checkout,
0 as payment

from {{ref ('incremental_sheets_appmetrica_screenview')}}


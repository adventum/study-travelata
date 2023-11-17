{{
    config(
        materialized = 'view'
    )
}}


select
__datetime,
eventDateTime,
accountName,
appmetricaDeviceId,
appmetricamobileAdsId_device_id as mobileAdsId,
crmUserId,
osName,
cityName,
session_id as sessionId,
'' as itemName,
'' as itemId,
'' as itemCategory

from {{ref ('incremental_sheets_appmetrica_screenview')}}


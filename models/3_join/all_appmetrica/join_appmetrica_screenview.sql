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
appmetricamobileAdsId_device_id as advertisingId,
crmUserId,
osName,
cityName,
session_id,
NULL as itemName,
NULL as itemId,
NULL as itemCategory
{{ref ('incremental_sheets_appmetrica_screenview')}}


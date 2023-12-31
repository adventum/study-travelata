{{
    config(
        materialized = 'view'
    )
}}

SELECT
session_id AS appSessionId,
session_start_datetime AS sessionStartDatetime,
__datetime as appSessionDateTime,
appmetrica_device_id AS appmetricaDeviceId,
city AS cityName,
assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) AS mobileAdsId,
os_name AS osName,
profile_id AS crmUserId,
installation_id AS installationId,
concat (installation_id, '-', appmetrica_device_id ) as installationDeviceId,
__table_name
FROM {{ref ('incremental_sheets_appmetrica_sessionstart')}}

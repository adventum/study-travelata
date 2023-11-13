{{
    config(
        materialized = 'view'
    )
}}

SELECT
session_id AS sessionId,
session_start_datetime AS sessionStartDatetime,
appmetrica_device_id AS appmetricaDeviceId,
city AS cityName,
assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) AS mobileAdsId,
os_name AS osName,
profile_id AS crmUserId,
installation_id AS installationId,
__table_name AS tableName
FROM {{ref ('incremental_sheets_appmetrica_sessionstart')}}

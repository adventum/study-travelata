{{
    config(
        materialized = 'view'
    )
}}


select
--раскрыть параметры из UTM меток: utmSource, utmMedium, utmCampaign, utmTerm, utmContent, utmHash составить из Content & Campaign

deeplink_url_parameters as deeplinkUrlParameters,
event_datetime as eventDatetime,
profile_id as profileId,
appmetrica_device_id as appmetricaDeviceId,
city as cityName,
assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as advertisingId ,
os_name as osName,
publisher_name as publisherName,
__table_name as tableName,
from
{{ref ('incremental_sheets_appmetrica_deeplinks')}}

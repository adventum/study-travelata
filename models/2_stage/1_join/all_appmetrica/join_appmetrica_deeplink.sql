{{
    config(
        materialized = 'view'
    )
}}

select
{{ extract_utm_data('deeplink_url_parameters', 'source')}} as utmSource,
{{ extract_utm_data('deeplink_url_parameters', 'medium')}} as utmMedium,
{{ extract_utm_data('deeplink_url_parameters', 'campaign')}} as utmCampaign,
event_datetime as eventDatetime,
profile_id as crmUserId,
appmetrica_device_id as appmetricaDeviceId,
city as cityName,
assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as mobileAdsId,
os_name as osName,
publisher_name as publisherName,
__table_name as tableName
from {{ref ('incremental_sheets_appmetrica_deeplinks')}}

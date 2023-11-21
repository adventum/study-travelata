{{
    config(
        materialized = 'view'
    )
}}

select
{{ extract_utm_data('deeplink_url_parameters', 'source')}} as utmSource,
{{ extract_utm_data('deeplink_url_parameters', 'medium')}} as utmMedium,
{{ extract_utm_data('deeplink_url_parameters', 'campaign')}} as utmCampaign,
{{ extract_utm_data('deeplink_url_parameters', 'hash')}} as utmHash,
__datetime as __datetime,
__datetime as deeplinkDateTime,
profile_id as crmUserId,
appmetrica_device_id as appmetricaDeviceId,
city as cityName,
assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as mobileAdsId,
os_name as osName,
publisher_name as publisherName,
__table_name
from {{ref ('incremental_sheets_appmetrica_deeplinks')}}

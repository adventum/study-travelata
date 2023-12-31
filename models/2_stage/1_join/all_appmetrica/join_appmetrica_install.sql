{{
    config(
        materialized='view'
    )
}}

select 
    __datetime as __datetime,
    parseDateTime(install_datetime, '%d.%m.%Y') as installDateTime,
    parseDateTime(click_datetime, '%d.%m.%Y') as clickDateTime,
    __table_name as __table_name,
    appmetrica_device_id as appmetricaDeviceId,
    is_reinstallation as isReinstallation,
    assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as mobileAdsId,
    profile_id as crmUserId,
    os_name as osName,
    city as cityName,
    {{ extract_utm_data('click_url_parameters', 'source') }} as utmSource,
    {{ extract_utm_data('click_url_parameters', 'medium') }} as utmMedium,
    {{ extract_utm_data('click_url_parameters', 'campaign') }} as utmCampaign,
    {{ extract_utm_data('click_url_parameters', 'term') }} as utmTerm,
    {{ extract_utm_data('click_url_parameters', 'content') }} as utmContent,
    toLowCardinality(splitByChar('~',  {{ extract_utm_data('click_url_parameters', 'campaign') }})[2]) as utmHash
    

from {{ ref('incremental_sheets_appmetrica_install') }}
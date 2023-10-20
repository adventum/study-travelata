{{
    config(
        materialized='view'
    )
}}

select 
    __datetime as __datetime,
    parseDateTime(install_datetime, '%d.%m.%Y') as installDateTime,
    parseDateTime(click_datetime, '%d.%m.%Y') as clickDateTime,
    toLowCardinality(splitByChar('_',  `__table_name`)[6]) as accountName,
    appmetrica_device_id as appmetricaDeviceId,
    is_reinstallation as isReinstallation,
    assumeNotNull(COALESCE(NULLIF(google_aid, ''), NULLIF(ios_ifa, ''), appmetrica_device_id, '')) as advertisingId,
    profile_id as crmUsereId,
    os_name as osName,
    city as cityName,
    {{ extract_utm_data('click_url_parameters', 'source') }},
    {{ extract_utm_data('click_url_parameters', 'medium') }},
    {{ extract_utm_data('click_url_parameters', 'campaign') }},
    {{ extract_utm_data('click_url_parameters', 'term') }},
    {{ extract_utm_data('click_url_parameters', 'content') }}
    

from {{ ref('incremental_sheets_appmetrica_install') }}
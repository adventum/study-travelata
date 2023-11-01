{{
    config(
        materialized='view'
    )
}}

select 
    profile_id as profileId,
    appmetrica_device_id as appmetricaDeviceId,
    mp_card_number as mpCardNumber,
    city_code as cityName,
    toLowCardinality(splitByChar('_',  `__table_name`)[6]) as accountName
    
from {{ ref('incremental_sheets_appmetrica_profiles') }}
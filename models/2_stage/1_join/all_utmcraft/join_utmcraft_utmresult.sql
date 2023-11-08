{{
    config(
        materialized='view'
    )
}}

select
__table_name as __table_name
cast(id as int) as id,
utm_hashcode as utmHash,
JSONExtractString(data, '4') AS utm_base_url,
JSONExtractString(data, '5') AS utm_utmSource,
JSONExtractString(data, '6') AS utm_utmMedium,
JSONExtractString(data, '9') AS utm_utmCampaign,
load_date
from {{ ref('incremental_sheets_utmcraft_utmresult') }}
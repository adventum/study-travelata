{{
    config(
        materialized='table',
        order_by=('toDate(__todate)')
        schema='travelata'
    )
}}

{%- set metadata = fromyaml(metadata_petr()) -%}

select *,
    {{ link_hash('AppDeeplinkStat', metadata) }},
    -- нет пока{{ entity_hash('UtmHash', metadata) }},
    {{ entity_hash('CrmUser', metadata) }},
    {{ entity_hash('AppMetricaDeviceId', metadata) }},
    {{ entity_hash('MobileAdsId', metadata) }}
from {{ ref('join_appmetrica_deeplinks') }}
where AppDeeplinkStatHash != ''
{{
    config(
        materialized='table',
        order_by=('toDate(__datetime)')
    )
}}

{%- set metadata = fromyaml(metadata_petr()) -%}

select *,
    {{ link_hash('AppDeeplinkStat', metadata) }},
    {{ entity_hash('UtmHash', metadata) }},
    {{ entity_hash('CrmUser', metadata) }},
    {{ entity_hash('appmetricaDeviceId', metadata) }},
    {{ entity_hash('MobileAdsId', metadata) }}
from {{ ref('join_appmetrica_deeplink') }}
where AppDeeplinkStatHash != ''
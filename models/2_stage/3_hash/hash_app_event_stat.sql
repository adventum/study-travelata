{{
    config(
        materialized='table',
        order_by=('toDate(__datetime)'),
        enabled=true,
    )
}}

{%- set metadata = fromyaml(metadata_dmitrii()) -%}

select *,
    {{ link_hash('AppEventStat', metadata) }},
    {{ entity_hash('Account', metadata) }},
    {{ entity_hash('AppMetricaDeviceId', metadata) }},
    {{ entity_hash('MobileAdsId', metadata) }},
    {{ entity_hash('CrmUser', metadata) }},
    {{ entity_hash('OsName', metadata) }},
    {{ entity_hash('City', metadata) }} 

from {{ ref('join_appmetrica_install') }}
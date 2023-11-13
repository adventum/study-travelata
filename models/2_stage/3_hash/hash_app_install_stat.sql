{{
    config(
        materialized='table',
        order_by=('toDate(installDateTime)','__table_name'),
        enabled=true,
    )
}}

{%- set metadata = fromyaml(metadata_dmitrii()) -%}

select *,
    {{ link_hash('AppInstallStat', metadata) }},
    {{ entity_hash('UtmParams', metadata) }},
    {{ entity_hash('AppMetricaDeviceId', metadata) }},
    {{ entity_hash('MobileAdsId', metadata) }},
    {{ entity_hash('CrmUser', metadata) }},
    {{ entity_hash('OsName', metadata) }},
    {{ entity_hash('City', metadata) }},
    {{ entity_hash('UtmHash', metadata) }}  

from {{ ref('join_appmetrica_install') }}
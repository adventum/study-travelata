{{
    config(
        materialized='table',
        order_by=('toDate(installDateTime)','accountName'),
        enabled=true,
    )
}}

{%- set metadata = fromyaml(metadata_dmitrii()) -%}

select *,
    {{ entity_hash('UtmParams', metadata) }}

from {{ ref('join_appmetrica_install') }}
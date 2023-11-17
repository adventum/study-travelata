{{
    config(
        materialized='table',
        order_by=('toDate(sessionStartDatetime)'),
        enabled=true
    )
}}

{%- set metadata = fromyaml(metadata_petr()) -%}

select *,
    {{ link_hash('AppSessionStat', metadata) }},
    {{ entity_hash('AppSession', metadata) }}
    from {{ ref('join_appmetrica_sessionstarts') }}
where AppSessionStatHash != ''
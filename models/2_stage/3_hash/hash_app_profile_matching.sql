{{
    config(
        materialized='table',
        order_by=('profileId','__table_name'),
        enabled=true,
    )
}}

/* в таблице join_profiles есть и для них делаю:
profileId - 
appmetricaDeviceId - хэш сущности
mpCardNumber - хэш сущности
cityName - не нужен
accountName - не нужен
*/

{%- set metadata = fromyaml(metadata_dmitrii()) -%}

select *,
    {{ link_hash('AppProfileMatching', metadata) }},
    {{ entity_hash('AppMetricaDeviceId', metadata) }},
    {{ entity_hash('MpCardNumber', metadata) }}


from {{ ref('join_appmetrica_profiles') }}
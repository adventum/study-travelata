{{
    config(
        materialized='table',
        order by = ('toDate(__datetime)'),
        schema = 'travelata'
    )
}}

{% set metadata = fromyaml(metadata()) %}

select 
        * ,
        {{ link_hash('MediaplanStat', metadata)}}

from {{ ref('combine_all_mediaplans') }}        
where MediaplanStatHash != ''
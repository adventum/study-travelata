{{
    config(
        materialized='table',
        order by = ('toDate(planCostDate)'),
        schema = 'travelata'
    )
}}

{% set metadata = fromyaml(metadata()) %}

select 
        * ,
        {{ link_hash('MediaplanStat', metadata)}}

from {{ ref('combine_all_mediaplans') }}        
where MediaplanStatHash != ''
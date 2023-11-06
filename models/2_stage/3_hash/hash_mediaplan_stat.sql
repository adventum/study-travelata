

{{
    config(
        materialized='table',
        order_by=('planCostDate')
    )
}}

{% set metadata = fromyaml(metadata_alexandra()) %}

select 
        * ,
        {{ link_hash('MediaplanStat', metadata)}}

from {{ ref('combine_all_mediaplans') }}        
where MediaplanStatHash != ''
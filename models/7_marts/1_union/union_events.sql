{{
    config(
        materialized='table',
        schema='maxi',
        order_by=('__datetime'),
        enabled=false
    )
}}

with 

union_events as (

    {{ 
        custom_union_relations(
            relations=[ref('full_link_ad_cost_stat'), 
                       ref('full_link_mediaplan_stat'),
                       ref('attr_final_table')]
        )
    }}
 
),

prepare as (select 
    * except(AdCostStatHash, MediaplanStatHash, adCostDate, planCostDate, _dbt_source_relation)
    REPLACE(
    multiIf (__id != '', __id, AdCostStatHash != '', AdCostStatHash, MediaplanStatHash) as __id,
    {{ get_utmhash_attr('__') }} as utmHash,
     multiIf(__datetime > '2000-01-01', __datetime, adCostDate > '2000-01-01', 
      adCostDate, planCostDate) as __datetime,
    if(record_source != '', record_source, _dbt_source_relation) as record_source)
      

from union_events),

hub_utmhash as (

    select * from {{ ref('hub_utm_hash') }}

)

select * REPLACE(
y.utm_base_url as utm_base_url,
y.utm_utmSource as utm_utmSource,
y.utm_utmMedium as utm_utmMedium,
y.utm_utmCampaign as utm_utmCampaign,
y.utm_project as utm_project,
y.utm_utmContent as utm_utmContent,
y.utm_strategy as utm_strategy,
y.utm_audience as utm_audience

) from prepare left join hub_utmhash as y using (utmHash)
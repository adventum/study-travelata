{{
    config(
        materialized='view'
    )
}}

with union_all_adcost as (
select * replace (adCost * 1.2 as adCost) from {{ref('join_mt_all_adcost')}}
union all
select * from {{ref('join_vk_all_adcost')}}
union all
select * replace (adCost * 1.2 as adCost) from {{ref('join_yd_all_adcost')}}
union all
select * from {{ref('join_yandexdisk_all_adcost')}}
union all
select * replace (adCost * 1.2 as adCost) from {{ref('join_vk_ads_all_adcost')}}
)

select * from union_all_adcost


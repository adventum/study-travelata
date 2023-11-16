{{
    config(
        materialized='table'
    )
}}

with
link_all_adcost as(
select * from {{ ref('link_ad_cost_stat') }}
),

hub_utmhash as(
select * from {{ ref('hub_utm_hash') }}
),

final as(
select x.*, y.* except(utmHash, load_date, UtmHashHash)
from link_all_adcost as x
left join hub_utmhash as y using (UtmHashHash)
)

select * from final
{{
    config(
        materialized='table'
    )
}}

SELECT a.*,b.* except(utmHash, load_date, UtmHashHash)
from {{ref('link_ym_visit')}} as a
left join {{ref('hub_utm_hash')}} as b using (UtmHashHash)
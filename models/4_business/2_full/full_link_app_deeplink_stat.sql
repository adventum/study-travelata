{{
    config(
        materialized='table'
    )
}}

SELECT a.*,b.* except(utmHash, load_date, UtmHashHash, __table_name)
from {{ref('link_app_deeplink_stat')}} as a
left join {{ref('hub_utm_hash')}} as b using (UtmHashHash)
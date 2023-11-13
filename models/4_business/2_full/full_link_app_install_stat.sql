{{
    config(
        materialized='table'
    )
}}

SELECT a.*,b.* except(utmHash, load_date, UtmHashHash)
from {{ref('link_app_install_stat')}} as a
left join {{ref('hub_utm_hash')}} as b using (UtmHashHash)
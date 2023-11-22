{{
    config(
        materialized='table',
        order_by = 'planCostDate'
    )
}}

SELECT *
from {{ref('link_mediaplan_stat')}}
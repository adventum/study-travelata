{{
    config(
        materialized='table'
    )
}}

SELECT *
from {{ref('link_app_event_stat')}}
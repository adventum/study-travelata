{{
    config(
        materialized='table'
    )
}}

SELECT *
from {{ref('link_app_session_stat')}}
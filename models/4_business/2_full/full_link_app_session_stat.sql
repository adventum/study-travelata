{{
    config(
        materialized='table'
    )
}}

select *
from {{ref('link_app_session_stat')}}
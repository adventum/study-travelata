{{
    config(
        materialized='table'
    )
}}

SELECT *
from {{ref('link_app_profile_matching')}}
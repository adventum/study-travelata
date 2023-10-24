{{
    config(
        materialized='view'
    )
}}

select *
from {{ ref('join_appmetrica_events') }}
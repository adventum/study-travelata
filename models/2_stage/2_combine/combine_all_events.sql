{{
    config(
        materialized='view'
    )
}}


with all_events as (
select *
from {{ ref('join_appmetrica_events') }}

union all

select *
from {{ ref('join_appmetrica_screenview') }}
)
select *
from all_events
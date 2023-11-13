{{
    config(
        materialized='table',
        order_by=('key_hash'),
        enabled=false
    )
}}

select * from {{ ref('graph_lookup') }}
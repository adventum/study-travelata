{{
    config(
        materialized='table',
        order_by=('key_hash'),
        enabled=true
    )
}}

select * from {{ ref('graph_lookup') }}
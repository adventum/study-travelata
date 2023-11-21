{{
    config(
        materialized='table',
        schema='maxi',
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=false
    )
}}

select
    * ,
    row_number() over (partition by qid order by __datetime, __priority, __id) AS __rn

from {{ ref('attr_create_events') }}

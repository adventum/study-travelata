{{
    config(
        materialized='table',
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=true
    )
}}

select
    y.qid, x.*
from {{ ref('attr_prepare_table') }} as x
left join {{ ref('graph_qid') }} as y
    using (__datetime, record_source, __id)

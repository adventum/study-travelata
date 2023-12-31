{{
    config(
        materialized='table',
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=true
    )
}}

select
    *,
    sum(toInt32(__is_new_period)) over (partition by qid order by __rn) AS __period_number

from {{ ref('attr_find_new_period') }}

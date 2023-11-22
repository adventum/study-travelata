{{
    config(
        materialized='table',
        schema='maxi',
<<<<<<< HEAD
        order_by=('qid', '__datetime', 'record_source', '__id')
=======
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=false
>>>>>>> main
    )
}}

select
    *,
    sum(toInt32(__is_new_period)) over (partition by qid order by __rn) AS __period_number

from {{ ref('attr_find_new_period') }}

{{
    config(
        materialized='table',
<<<<<<< HEAD
        schema='maxi',
        order_by=('qid', '__datetime', 'record_source', '__id')
=======
        order_by=('qid', '__datetime', 'record_source', '__id'),
<<<<<<< HEAD
        enabled=false
>>>>>>> main
=======
        enabled=true
>>>>>>> main
    )
}}

select
    * ,
    row_number() over (partition by qid order by __datetime, __priority, __id) AS __rn

from {{ ref('attr_create_events') }}

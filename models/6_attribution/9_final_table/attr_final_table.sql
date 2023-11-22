{{
    config(
        materialized='table',
        schema='maxi',
<<<<<<< HEAD
        order_by = ('__datetime')
=======
        order_by = ('__datetime'),
        enabled=false
>>>>>>> main
    )
}}

select * except(_dbt_source_relation) from
{{ ref('attr_prepare_with_qid') }}
join {{ ref('attr_last_click') }}
    using (qid, __datetime, __id)
    where not __is_missed
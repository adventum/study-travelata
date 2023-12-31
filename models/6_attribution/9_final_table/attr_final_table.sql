{{
    config(
        materialized='table',
        order_by = ('__datetime'),
        enabled=true
    )
}}

select * except(_dbt_source_relation) from
{{ ref('attr_prepare_with_qid') }}
join {{ ref('attr_last_click') }}
    using (qid, __datetime, __id)
    where not __is_missed
{{
    config(
        materialized='table',
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=true
    )
}}

with prep_new_period as (

    select
        *,
        max(case when __priority in (1,2,3,4,5,6) then __datetime else null end) over (partition by qid order by __rn rows between unbounded preceding and 1 preceding) as prep_new_period
    from {{ ref('attr_add_row_number') }}

)

select
    qid, record_source,
    __priority,
    __id,
    __datetime,
    __rn,
    if(toDate(__datetime) - toDate(prep_new_period) < 3, false, true) as __is_new_period

from prep_new_period

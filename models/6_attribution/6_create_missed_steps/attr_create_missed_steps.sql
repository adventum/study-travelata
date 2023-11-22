{{
    config(
        materialized='table',
        schema='maxi',
<<<<<<< HEAD
=======
        enabled=false
>>>>>>> main
    )
}}

with calc_max_priority as (
      select
          qid,
          max(__priority) as max_priority
    from {{ ref('attr_calculate_period_number') }}
    group by qid
),

generate_all_priorities as (

    select
        qid,
        arrayJoin(range(1, assumeNotNull(max_priority) + 1)) as gen_priority -- range(1,7) = [1,2,3,4,5,6]
    from calc_max_priority
),

final as (
    select
        first_value(nullIf(__id, '')) OVER (PARTITION BY qid ORDER BY gen_priority, __datetime ROWS BETWEEN current row AND UNBOUNDED FOLLOWING ) as __id,
        gen_priority as __priority,
        qid,
        first_value(nullIf(toDate(__datetime), '1970-01-01')) OVER (PARTITION BY qid ORDER BY gen_priority, __datetime ROWS BETWEEN current row AND UNBOUNDED FOLLOWING ) as __datetime,
        first_value(nullIf(__period_number, 0)) OVER (PARTITION BY qid, __datetime ORDER BY gen_priority, __datetime ROWS BETWEEN current row AND UNBOUNDED FOLLOWING ) as __period_number,
        case when period_number.qid = 0 then true else false end as __is_missed

    from generate_all_priorities
    left join {{ ref('attr_calculate_period_number') }} AS period_number
        on generate_all_priorities.qid = period_number.qid and
           generate_all_priorities.gen_priority = period_number.__priority
)

select
    __id,
    __priority,
    __period_number,
    __is_missed,
    row_number() over (partition by qid order by __datetime, __priority, __id) AS __rn

from final

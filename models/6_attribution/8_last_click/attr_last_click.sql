{{
    config(
        materialized='table',
        schema='maxi',
        order_by = ('qid', '__datetime', '__id')
    )
}}

with
max_last_click_rank as (

    select
        *,
        max(last_click_rank) over(partition by qid, __period_number order by __datetime, __priority, __id) as max_last_click_rank

    from {{ ref('attr_join_to_attr_prepare_with_qid') }}

),

target_count as (

    select
        *,
        last_click_rank = max_last_click_rank as __rank_condition,
        sum(case when __rank_condition then 1 else 0 end) over(partition by qid, __period_number order by __datetime, __priority, __id) as __target_count

    from max_last_click_rank

)
select
    qid, __datetime, __id, __priority,`__is_missed`,__period_number,
    first_value(adSourceClear) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_adSourceClear,
    first_value(adSourceDirty) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_adSourceDirty,
    first_value(utmMedium) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utmMedium,
    first_value(utmCampaign) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utmCampaign,
    first_value(utmTerm) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utmTerm,
    first_value(utm_utmContent) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utmContent,
    first_value(utm_project) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utm_project,
    first_value(utm_strategy) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utm_strategy,
    first_value(utm_audience) over(partition by qid, __period_number, __target_count order by __datetime, __priority, __id) as attributed_last_click_utm_audience
from target_count
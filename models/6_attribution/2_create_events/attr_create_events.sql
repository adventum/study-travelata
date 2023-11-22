{{
    config(
        materialized='table',
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=true
    )
}}

select
    qid, record_source,
    case
        when record_source = 'full_link_visit_stat' then 1
        when record_source = 'full_link_app_install_stat' then 1
        when record_source = 'full_link_app_session_stat' then 1
        when record_source = 'full_link_app_deeplink_stat' then 1
        when record_source = 'full_link_app_event_stat' and serp = 1 then 2
        when record_source = 'full_link_app_event_stat' and hotelPage = 1 then 3
        when record_source = 'full_link_app_event_stat' and tourPage = 1 then 4
        when record_source = 'full_link_app_event_stat' and checkout = 1 then 5
        when record_source = 'full_link_app_event_stat' and payment = 1 then 6
        else 1
    end as __priority,
    __id,
    __datetime

from {{ ref('attr_prepare_with_qid') }}
    union all
select
    qid, record_source,
    2 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
where record_source = 'full_link_visit_stat'
      and serp = 1
    union all
select
    qid, record_source,
    3 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
where record_source = 'full_link_visit_stat'
      and hotelPage = 1
    union all
select
    qid, record_source,
    4 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
where record_source = 'full_link_visit_stat' and tourPage = 1
    union all
select
    qid, record_source,
    5 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
where record_source = 'full_link_visit_stat' and checkout = 1
    union all
select
    qid, record_source,
    6 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
where record_source = 'full_link_visit_stat' and payment = 1
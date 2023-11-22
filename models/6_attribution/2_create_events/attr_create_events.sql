{{
    config(
        materialized='table',
<<<<<<< HEAD
        schema='maxi',
        order_by=('qid', '__datetime', 'record_source', '__id')
=======
        order_by=('qid', '__datetime', 'record_source', '__id'),
        enabled=true
>>>>>>> main
    )
}}

select
    qid, record_source,
    case
        when record_source = 'full_link_visit_stat' then 1
        when record_source = 'full_link_app_install_stat' then 1
        when record_source = 'full_link_app_session_stat' then 1
        when record_source = 'full_link_app_deeplink_stat' then 1
<<<<<<< HEAD
        when record_source = 'full_link_app_event_stat' and addToCartSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and cartViewSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and checkoutSessions = 1 then 3
        when record_source = 'full_link_app_event_stat' and webSalesSessions = 1 then 4
        when record_source = 'full_link_app_event_stat' and sales = 1 then 4
        when record_source = 'full_link_app_event_stat' and registrationCardSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and linkingCardToPhoneNumberSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and registrationCashbackSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and instantDiscountActivationSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and couponActivationSessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and participationInLotterySessions = 1 then 2
        when record_source = 'full_link_app_event_stat' and registrationButtonClick = 1 then 2
=======
        when record_source = 'full_link_app_event_stat' and serp = 1 then 2
        when record_source = 'full_link_app_event_stat' and hotelPage = 1 then 3
        when record_source = 'full_link_app_event_stat' and tourPage = 1 then 4
        when record_source = 'full_link_app_event_stat' and checkout = 1 then 5
        when record_source = 'full_link_app_event_stat' and payment = 1 then 6
>>>>>>> main
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
<<<<<<< HEAD
      and (addToCartSessions = 1 or cartViewSessions = 1 or registrationCardSessions = 1 or linkingCardToPhoneNumberSessions = 1 or linkingCardToPhoneNumberSessions = 1
            or registrationCashbackSessions = 1 or instantDiscountActivationSessions = 1 or couponActivationSessions = 1 or participationInLotterySessions = 1)
=======
      and serp = 1
>>>>>>> main
    union all
select
    qid, record_source,
    3 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
<<<<<<< HEAD
where record_source = 'full_link_visit_stat' and checkoutSessions = 1
=======
where record_source = 'full_link_visit_stat'
      and hotelPage = 1
>>>>>>> main
    union all
select
    qid, record_source,
    4 as __priority,
    __id,
    __datetime
from {{ ref('attr_prepare_with_qid') }}
<<<<<<< HEAD
where record_source = 'full_link_visit_stat' and (webSalesSessions = 1 or sales = 1)
=======
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
>>>>>>> main

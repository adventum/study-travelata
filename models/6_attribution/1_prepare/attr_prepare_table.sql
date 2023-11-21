{{
    config(
        materialized='table',
        order_by=('__datetime', 'record_source', '__id'),
        schema='maxi',
    )
}}

with 

union_events as (

    {{ 
        custom_union_relations(
            relations=[ref('full_link_visit_stat'), 
                       ref('full_link_app_deeplink_stat'),
                       ref('full_link_app_event_stat'),
                       ref('full_link_app_install_stat'),
                       ref('full_link_app_session_stat')]
        )
    }}
 
)

select 
    greatest(toDateTime(visitDateTime), toDateTime(appSessionDateTime), toDateTime(deeplinkDateTime), toDateTime(eventDateTime), toDateTime(installDateTime)) as __datetime,
    _dbt_source_relation as record_source,
    greatest(VisitStatHash, AppDeeplinkStatHash, AppEventStatHash, AppInstallStatHash, AppSessionStatHash ) as __id,
    * EXCEPT (VisitStatHash, AppDeeplinkStatHash, AppEventStatHash, AppInstallStatHash, AppSessionStatHash, visitDateTime, appSessionDateTime, deeplinkDateTime, eventDateTime, installDateTime)
from union_events

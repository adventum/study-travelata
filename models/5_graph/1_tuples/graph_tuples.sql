{{
    config(
        materialized='table',
        enabled=true
    )
}}

with

full_link_visit_stat as (

    select 1 from {{ ref('full_link_visit_stat') }}

),

full_link_app_deeplink_stat as (

    select 1 from {{ ref('full_link_app_deeplink_stat') }}

),

link_app_event_stat as (

    select 1 from {{ ref('full_link_app_event_stat') }}

),

full_link_app_install_stat as (

    select 1 from {{ ref('full_link_app_install_stat') }}

),

link_app_session_stat as (

    select 1 from {{ ref('full_link_app_session_stat') }}

),

link_app_profile_matching as (

    select 1 from {{ ref('full_link_app_profile_matching') }}

),


graph_tuples as (

    {{ graph_tuples(fromyaml(metadata()), 'travelata') }}

)

select 
    hash,
    node_left

from graph_tuples

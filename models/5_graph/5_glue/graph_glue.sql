{{
    config(
        materialized='table',
        order_by=('node_id_left'),
        pre_hook="{{ calc_graph('travelata') }}",
        enabled=true
    )
}}

select 
    node_id_left,
    max(group_id) as qid
from {{ ref('graph_edge') }}
group by node_id_left


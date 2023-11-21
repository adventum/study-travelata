{{
    config(
        materialized='table',
        order_by=('__datetime', 'record_source', '__id'),
        pre_hook="{{ calc_graph('travelata') }}",
        enabled=true
    )
}}

select 
    toLowCardinality(concat('full_link_', lower(replaceRegexpAll(substring(tupleElement(key_hash, 1), 1, length(tupleElement(key_hash, 1)) - 4), '(.)([A-Z])', '\\1_\\2')))) as record_source,
    tupleElement(key_hash, 2) as __datetime,
    tupleElement(key_hash, 3) as __id,
    qid
from {{ ref('graph_glue') }}
join {{ ref('graph_lookup') }} on key_number = node_id_left
where __datetime > '2000-01-01'


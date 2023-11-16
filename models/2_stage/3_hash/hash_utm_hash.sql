{{
    config(
        materialized='table',
        order_by=('UtmHashHash')
        )
}}

{% set metadata = fromyaml(metadata()) %}

select
*,
{{ entity_hash('UtmHash', metadata) }}
from {{ ref('join_utmcraft_utmresult') }}
where UtmHashHash != ''
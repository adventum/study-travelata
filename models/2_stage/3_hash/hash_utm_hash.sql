{{
    config(
        materialized='table',
        order_by=('UtmHashHash'),
        schema='travelata'
        )
}}

{% set metadata = fromyaml(metadata()) %}

select
*,
{{ entity_hash('UtmHash', metadata) }}
from {{ ref('join_utmcraft_utmresult') }}
where UtmHashHash != ''
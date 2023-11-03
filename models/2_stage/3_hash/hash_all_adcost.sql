{{
    config(
        materialized='table',
        order_by=('adCostDate','reportType')
    )
}}

{% set metadata = fromyaml(metadata_tatiana())%}

select
*,
{{ link_hash('AdCostStat',metadata)}},
{{entity_hash('UtmHash',metadata)}}

from {{ref('combine_all_adcostd')}}
where AdCostStatHash !=''
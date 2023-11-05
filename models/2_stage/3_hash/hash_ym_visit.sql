{{
    config(
        materialized='table',
        order_by=('visitDateTime','accountName')
    )
}}

{% set metadata = fromyaml(metadata_tatiana())%}

select
*,
{{ link_hash('VisitStat',metadata)}},
{{ link_hash('AdSessionStat',metadata)}},
{{entity_hash('Account',metadata)}},
{{entity_hash('YmClient',metadata)}},
{{entity_hash('Visit',metadata)}},
{{entity_hash('Transactions',metadata)}}

from {{ref('join_ym_visit')}}
where VisitStatHash !=''
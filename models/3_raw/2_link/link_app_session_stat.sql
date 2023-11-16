{{
    config(
        materialized='view',
        schema='travelata'
    )
}}

{% set metadata = fromyaml(metadata_petr()) %}
{{ make_link(metadata) }}
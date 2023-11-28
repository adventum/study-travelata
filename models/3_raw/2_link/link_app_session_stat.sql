{{
    config(
        materialized='view'
    )
}}

{% set metadata = fromyaml(metadata_petr()) %}
{{ make_link(metadata) }}
{{
    config(
        materialized='view')
}}

{% set metadata = fromyaml(metadata_alexandra()) %}
{{ make_link(metadata) }}
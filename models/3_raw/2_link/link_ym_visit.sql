{{
    config(
        materialized='view',
    )
}}

{% set metadata = fromyaml(metadata_tatiana())%}

{{make_link(metadata)}}
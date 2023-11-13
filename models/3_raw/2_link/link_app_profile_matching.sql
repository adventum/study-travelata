{{
    config(
        materialized='table',
    )
}}

{% set metadata = fromyaml(metadata_dmitrii())%}

{{make_link(metadata)}}
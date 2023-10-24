{{
    config(
        materialized='incremental',
        order_by=('toDate(__datetime)','__table_name'),
        incremental_strategy='delete+insert',
        unique_key=['toDate(__datetime)','__table_name']
    )
}}

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM {{ ref('normalized_sheets_yd_customreport')}}
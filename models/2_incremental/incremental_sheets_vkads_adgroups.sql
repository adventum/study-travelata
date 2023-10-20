{{
    config(
        materialized='table',
        order_by=('__table_name')
    )
}}

SELECT *
FROM {{ ref('normalized_sheets_vkads_adgroups')}}
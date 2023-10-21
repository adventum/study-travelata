{{
    config(
        materialized='table',
        order_by=('__table_name')
    )
}}

SELECT *  REPLACE(parseDateTime(load_date, '%d.%m.%Y %H:%i:%S') as load_date)
FROM {{ ref('normalized_sheets_yandexdisk_mediaplans')}}

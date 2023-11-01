{{
config(
materialized='table',
order_by=('__table_name'),
)
}}

select * replace (CAST (_date as date) as _date)
from {{ref('normalized_sheets_mytarget_banners')}}
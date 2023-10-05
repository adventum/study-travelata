{{
config(
materialized='table',
order_by=('table_name'),
)
}}

select * replace (CAST (_date as date) as _date)
from {{ref('normalized_sheets_mytarget_compagins_new')}}
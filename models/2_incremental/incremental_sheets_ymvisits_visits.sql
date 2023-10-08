{{
config(
materialized='incremental',
order_by=('toDate(_date)','table_name'),
incremental_strategy='delete+insert',
unique_key=['toDate(_date)','table_name']
)
}}

select * replace (toDate32(`_datatime`) as _date)
from {{ref('normalized_sheets_ymvisits_visits')}}
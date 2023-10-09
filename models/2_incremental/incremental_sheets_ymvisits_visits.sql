{{
config(
materialized='incremental',
order_by=('toDate(_datatime)','table_name'),
incremental_strategy='delete+insert',
unique_key=['toDate(_datatime)','table_name']
)
}}

select * replace(toDate32(`_datatime`) as _datatime)
from {{ref('normalized_sheets_ymvisits_visits')}}
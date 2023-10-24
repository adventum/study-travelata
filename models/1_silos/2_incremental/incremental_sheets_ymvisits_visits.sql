{{
config(
materialized='incremental',
order_by=('toDate(_datetime)','__table_name'),
incremental_strategy='delete+insert',
unique_key=['toDate(_datetime)','__table_name']
)
}}

select * replace(toDate32(`_datetime`) as _datetime)
from {{ref('normalized_sheets_ymvisits_visits')}}
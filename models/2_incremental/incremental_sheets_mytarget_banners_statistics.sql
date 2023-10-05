{{
config(
materialized='incremental',
order_by=('toDate(_date)','table_name'),
incremental_strategy='delete+insert',
unique_key=['toDate(_date)','table_name']
)
}}

select * replace (CAST (_date as date) as _date)
from {{ref('normalized_sheets_mytarget_banners_statjstics_new')}}
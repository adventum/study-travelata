{{
config(
materialized='incremental',
order_by=('toDate(_date)','__table_name'),
incremental_strategy='delete+insert',
unique_key=['toDate(_date)','__table_name']
)
}}

select * replace (toDate(_date) as _date)
from {{ref('normalized_sheets_mytarget_banners_statistics')}}
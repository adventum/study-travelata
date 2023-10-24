{{ 
config(materialized = 'table', 
order_by = ('__table_name')
) 
}}

select * 
from {{ ref('normalized_sheets_utmcraft_utmresult') }}
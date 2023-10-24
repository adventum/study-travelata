
  
    
    
        
        insert into travelata.incremental_sheets_mytarget_compagins__dbt_backup ("id", "name", "airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace (CAST (_date as date) as _date)
from travelata.normalized_sheets_mytarget_compagins
  
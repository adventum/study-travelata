
  
    
    
        
        insert into travelata.incremental_sheets_mytarget_banners__dbt_backup ("campagin_id", "id", "textblocks", "urls", "airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace (CAST (_date as date) as _date)
from travelata.normalized_sheets_mytarget_banners
  
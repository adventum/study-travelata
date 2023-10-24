
        
  
    
    
        
        insert into travelata.incremental_sheets_mytarget_banners_statisticsn ("_date", "shows", "clics", "goals", "spent", "banner_id", "airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace (toDate(_date) as _date)
from travelata.normalized_sheets_mytarget_banners_statjstics
  
    
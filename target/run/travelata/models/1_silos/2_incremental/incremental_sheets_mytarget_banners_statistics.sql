
        
  
    
    
        
        insert into travelata.incremental_sheets_mytarget_banners_statistics__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("_date", "shows", "clics", "goals", "spent", "banner_id", "airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace (toDate(_date) as _date)
from travelata.normalized_sheets_mytarget_banners_statistics
  
      
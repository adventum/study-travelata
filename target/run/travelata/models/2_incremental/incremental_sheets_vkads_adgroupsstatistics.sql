
        
  
    
    
        
        insert into travelata.incremental_sheets_vkads_adgroupsstatistics__dbt_new_data_59293156_049d_4402_a610_e3f8e61bdd39 ("__datetime", "tps", "spent", "shows", "clicks", "base", "date", "moat", "romi", "video", "events", "uniques", "carousel", "playable", "ad_group_id", "custom_event", "uniques_video", "_airbyte_ab_id", "load_date", "_normalized_at", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%M:%S') AS __datetime)
FROM travelata.normalized_sheets_vkads_adgroupsstatistics
  
      
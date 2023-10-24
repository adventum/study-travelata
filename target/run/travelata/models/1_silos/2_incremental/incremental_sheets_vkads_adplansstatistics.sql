
        
  
    
    
        
        insert into travelata.incremental_sheets_vkads_adplansstatistics__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "tps", "spent", "shows", "clicks", "base", "date", "moat", "romi", "video", "events", "uniques", "carousel", "playable", "ad_group_id", "custom_event", "uniques_video", "_airbyte_ab_id", "load_date", "_normalized_at", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%M:%S') AS __datetime)
FROM travelata.normalized_sheets_vkads_adplansstatistics

--meh
  
      
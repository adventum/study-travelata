
        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_deeplinks__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("deeplink_url_parameters", "event_datetime", "__datetime", "profile_id", "appmetrica_device_id", "city", "ios_ifa", "google_aid", "os_name", "publisher_name", "__emitted_at", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%i:%s') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_deeplinks
  
      
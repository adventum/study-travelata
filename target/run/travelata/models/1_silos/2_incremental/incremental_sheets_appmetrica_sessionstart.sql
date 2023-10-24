
        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_sessionstart__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("session_id", "session_start_datetime", "__datetime", "appmetrica_device_id", "appmetricaDeviceId", "city", "google_aid", "os_name", "profile_id", "installation_id", "ios_ifa", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%i:%s') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_sessionstart
  
      

        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_sessionstart__dbt_new_data_59293156_049d_4402_a610_e3f8e61bdd39 ("session_id", "session_start_datetime", "__datetime", "appmetrica_device_id", "appmetricaDeviceId", "city", "google_aid", "os_name", "profile_id", "installation_id", "ios_ifa", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%i:%s') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_sessionstart
  
      
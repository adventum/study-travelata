
        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_events__dbt_new_data_59293156_049d_4402_a610_e3f8e61bdd39 ("__datetime", "event_datetime", "event_json", "event_name", "installation_id", "appmetrica_device_id", "city", "google_aid", "os_name", "profile_id", "session_id", "app_version_name", "ios_ifa", "__emitted_at", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%d.%m.%Y') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_events
  
      

        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_events__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "event_datetime", "event_json", "event_name", "installation_id", "appmetrica_device_id", "city", "google_aid", "os_name", "profile_id", "session_id", "app_version_name", "ios_ifa", "__emitted_at", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%d.%m.%Y') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_events
  
      
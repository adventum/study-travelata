
        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_install__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "city", "os_name", "google_aid", "profile_id", "click_datetime", "install_datetime", "appmetrica_device_id", "click_url_parameters", "is_reinstallation", "publisher_name", "ios_ifa", "__emitted_at", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%d.%m.%Y') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_install
  
      
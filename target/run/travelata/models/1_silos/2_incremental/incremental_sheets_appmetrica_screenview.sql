
        
  
    
    
        
        insert into travelata.incremental_sheets_appmetrica_screenview__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "eventDateTime", "appmetricamobileAdsId_device_id", "accountName", "appmetricaDeviceId", "cityName", "osName", "crmUserId", "session_id", "screen_view", "__emitted_at", "__table_name", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%i:%s') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_screenview
  
      

        
  
    
    
        
        insert into travelata.incremental_sheets_yandexdisk_othercosts__dbt_new_data_59293156_049d_4402_a610_e3f8e61bdd39 ("__datetime", "Source", "Medium", "Campaign", "ProductName", "Cost", "Impressions", "Clicks", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM travelata.normalized_sheets_yandexdisk_othercosts
  
      

        
  
    
    
        
        insert into travelata.incremental_sheets_yandexdisk_othercosts__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "Source", "Medium", "Campaign", "ProductName", "Cost", "Impressions", "Clicks", "load_date", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM travelata.normalized_sheets_yandexdisk_othercosts
  
      

  
    
    
        
        insert into travelata.incremental_sheets_yandexdisk_mediaplans__dbt_backup ("Source", "Medium", "Campaign", "ProductName", "Geo", "Period_start", "Period_end", "Cost", "load_date", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT *  REPLACE(parseDateTime(load_date, '%d.%m.%Y %H:%i:%S') as load_date)       
FROM travelata.normalized_sheets_yandexdisk_mediaplans
  

  
    
    
        
        insert into travelata.incremental_sheets_vkads_adplans__dbt_backup ("ad_plans_id", "name", "status", "created", "updated", "date_end", "ad_groups", "max_price", "objective", "date_start", "priced_goal", "budget_limit", "pricelist_id", "vkads_status", "autobidding_mode", "budget_limit_day", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT *
FROM travelata.normalized_sheets_vkads_adplans
  
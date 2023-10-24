
        
  
    
    
        
        insert into travelata.incremental_sheets_yd_customreport__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("__datetime", "reportType", "CampaignId", "CampaignName", "CampaignType", "AdGroupId", "AdGroupName", "AdId", "CriterionId", "Criterion", "Cost", "Impressions", "Clicks", "load_date", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM travelata.normalized_sheets_yd_customreport
  
      
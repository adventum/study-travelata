
        
  
    
    
        
        insert into travelata.incremental__sheets_yd_customreport__dbt_new_data_98ba1e08_88c9_49fe_b5d1_4ce024412afa ("__datetime", "reportType", "CampaignId", "CampaignName", "CampaignType", "AdGroupId", "AdGroupName", "AdId", "CriterionId", "Criterion", "Cost", "Impressions", "Clicks", "load_date", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM travelata.normalized_sheets_yd_customreport
  
      
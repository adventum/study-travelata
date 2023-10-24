
        
  
    
    
        
        insert into travelata.incremental__sheets_yd_customreport__dbt_new_data_59293156_049d_4402_a610_e3f8e61bdd39 ("__datetime", "reportType", "CampaignId", "CampaignName", "CampaignType", "AdGroupId", "AdGroupName", "AdId", "CriterionId", "Criterion", "Cost", "Impressions", "Clicks", "__table_name", "__emitted_at", "__normalized_at")
  

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d') AS __datetime)
FROM travelata.normalized_sheets_yd_customreport
  
      
{{ 
  config(
  materialized='view')
}}
WITH adplans AS (SELECT * , JSONExtractString(JSONExtractString(ad_groups,1),'id') AS ad_group_id
                  FROM  {{ ref('incremental_sheets_vkads_adplans') }}), 
     adplans_statistics AS (SELECT * 
                  FROM  {{ ref('incremental_sheets_vkads_adplansstatistics') }})             
SELECT  adplans_statistics.__table_name AS __table_name, 
        toDate(adplans_statistics.__datetime) AS adCostDate,
        toLowCardinality('*') AS reportType, 
        'VK Ads' AS adSourceDirty,
        '' AS productName,
        adplans.name AS adCampaignName,
        adplans.ad_plans_id AS adCampaignId,
        '' AS adCampaignType,
        '' AS adGroupId,
        '' AS adGroupName,
        '' AS adId, --id чего?
        '' AS adPhraseName,  
        '' AS adPhraseId, 
        '' AS cityCode,
        '' AS utmSource,    
        '' AS utmMedium,
        '' AS utmCampaign, 
        '' AS utmTerm,
        '' AS utmContent,
        arrayElement(splitByChar('~', adplans.name), 2) AS utmHash, 
        -- '' AS adTitle1,
        -- '' AS adTitle2,
        -- '' AS asText, 
        -- '' AS adPhraseName
        toFloat64(adplans_statistics.spent) AS adCost, -- почему в mytarget не применяли ф-ю assumeNotNull??
        toInt32(adplans_statistics.shows) AS impressions,
        toInt32(adplans_statistics.clicks) AS clicks,
        adplans_statistics.load_date AS load_date --??
FROM adplans_statistics
JOIN adplans ON adplans_statistics.ad_plan_id = adplans.ad_plans_id

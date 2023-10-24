{{ 
  config(
  materialized='view')
}}
WITH adgroups AS (SELECT * 
                  FROM  {{ ref('incremental_sheets_vkads_adgroups') }}), --travelata.incremental_sheets_vkads_adgroups), 
     adgroups_statistics AS (SELECT * 
                  FROM   {{ ref('incremental_sheets_vkads_adgroupsstatistics') }}), 
     adplans AS (SELECT * , JSONExtractString(JSONExtractString(ad_groups,1),'id') AS ad_group_id
                  FROM  {{ ref('incremental_sheets_vkads_adplans') }}), 
     adplans_statistics AS (SELECT * 
                  FROM  {{ ref('incremental_sheets_vkads_adplansstatistics') }}),  
     ---- объединим  адпланс с адпланс статистик  
     adplans_joined AS (SELECT * 
                      FROM adplans_statistics
                      JOIN adplans ON adplans_statistics.ad_plan_id = adplans.ad_plans_id)              
SELECT  adgroups_statistics.__table_name AS __table__name, 
        toDate(adgroups_statistics.__datetime) AS adCostDate,
        toLowCardinality('*') AS reportType, -- зачем этот столбец - 17 минута видео, нам он пока не нужен
        'VK Ads' AS adSourceDirty,
        '' AS productName,
        adplans_joined.name AS adCampaignName,
        adplans_joined.ad_plan_id AS adCampaignId,
        '' AS adCampaignType,
        adgroups_statistics.ad_group_id AS adGroupId,
        adgroups.name AS adGroupName,
        '' AS adId, --id банера
        '' AS adPhraseName,  
        '' AS adPhraseId, 
        '' AS cityCode,
        extract(adgroups.utm, 'utm_source=([\w]*)') AS utmSource,    
        extract(adgroups.utm, 'utm_medium=([^&]*)') AS utmMedium,
        extract(adgroups.utm, 'utm_campaign=([^&]*)') AS utmCampaign, 
        '' AS utmTerm,
        '' AS utmContent,
        arrayElement(splitByChar('~', adplans_joined.name), 2) AS utmHash, -- ?? мин 29
        -- '' AS adTitle1,
        -- '' AS adTitle2,
        -- '' AS asText, 
        -- '' AS adPhraseName
        toFloat64(adgroups_statistics.spent) AS adCost, -- почему в mytarget не применяли ф-ю assumeNotNull??
        toInt32(adgroups_statistics.shows) AS impressions,
        toInt32(adgroups_statistics.clicks) AS clicks,
        adgroups_statistics.load_date AS load_date --??
FROM adgroups_statistics
JOIN adgroups USING(ad_group_id)
JOIN adplans_joined ON adgroups_statistics.ad_group_id=adplans_joined.ad_group_id

 
{{
    config(
        materialized='view'
    )
}}

  select
    toDate(__datetime) as adCostDate,
    toLowCardinality(upper(extract(__table_name, 'ydstat(.)'))) as reportType,
    toLowCardinality(__table_name) as __table_name,
    'Yandex Direct Ads' as adSourseDirty,
    '' as productName,
    CampaignId as adCampaignId,
    CampaignName as adCampainName,
    CampaignType as adCampaignType,
    AdGroupId as adGroupId,
    AdGroupName as adGroupName,
    AdId as adId,
    CriterionId as adPhraseId,
    Criterion as adPhraseName,
    '' as utmSourse,
    '' as utmMedium,
    '' as utmCampaign,
    '' as utmTerm,
    '' as utmContent,
    {{ get_utmhash('__', ['CampaignName']) }} as utmHash,
    toFloat64(Cost)/1000000 as adCost,
    toInt32(Impressions) as impressions,
    toInt32(Clicks) as clicks,
    load_date as load_date
    
from {{ref('incremental_sheets_yd_customreport')}}



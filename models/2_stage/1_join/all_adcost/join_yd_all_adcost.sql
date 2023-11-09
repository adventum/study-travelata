{{
    config(
        materialized='view'
    )
}}

  select
    toLowCardinality(__table_name) as __table_name,
    toDate(__datetime) as adCostDate,
    toLowCardinality(upper(extract(__table_name, 'ydstat(.)'))) as reportType,
        'Yandex Direct Ads' as adSourceDirty,
    '' as productName,
    CampaignName as adCampaignName,
    CampaignId as adCampaignId,
    CampaignType as adCampaignType,
    AdGroupId as adGroupId,
    AdGroupName as adGroupName,
    AdId as adId,
    Criterion as adPhraseName,
    CriterionId as adPhraseId,
    '' as cityCode,
    '' as utmSource,
    '' as utmMedium,
    '' as utmCampaign,
    '' as utmTerm,
    '' as utmContent,
    {{get_utmhash('~', ['CampaignName'])}} as utmHash,
    toFloat64(Cost)/1000000 as adCost,
    toInt32(Impressions) as impressions,
    toInt32(Clicks) as clicks,
    load_date as load_date
    
from {{ref('incremental_sheets_yd_customreport')}}



{{
    config(
        materialized='view'
    )
}}

select
    toLowCardinality(__table_name) as __table_name,
    toDate(__datetime) as adCostDate,
    toLowCardinality('*') as reportType,
    case 
    when Source = 'yandex' then 'Yandex Direct Ads'
    when Source = 'vk' then 'VK Ads'
    when Source = 'mt' then 'MyTarget'
    when Source = 'yandex-business' then 'Yandex Business'
    when Source = 'yandex-dzen' then 'Yandex Dzen Ads'
    when Source = 'ok' then 'OK Ads'
    when Source = 'tg' then 'TG Ads'
    else 'источник не определяется' 
    end as adSourceDirty,
    ProductName as productName,
    Campaign as adCampaignName,
    '' as adCampaignId,
    '' as adCampaignType,
    '' as adGroupId,
    '' as adGroupName,
    '' as adId,
    '' as adPhraseName,
    '' as adPhraseId,
    '' as cityCode,
    '' as utmSource,
    Medium as utmMedium,
    '' as utmCampaign,
    '' as utmTerm,
    '' as utmContent,
    {{get_utmhash('_'['Campaign'])}} as utmHash,
    toFloat64(Cost) as adCost,
    toInt32(Impressions) as impressions,
    toInt32(Clicks) as clicks,
    load_date

from {{ref('incremental_sheets_yandexdisk_othercosts')}}




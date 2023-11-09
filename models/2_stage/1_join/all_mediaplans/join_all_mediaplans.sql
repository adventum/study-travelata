{{
    config(
        materialized='view'
    )
}}

select
    assumeNotNull(toDate32(Period_start)) as planCostDateStart,
    assumeNotNull(toDate32(Period_end)) as planCostDateEnd,
    toLowCardinality(__table_name) as __table_name,
    ProductName as productName,
    Geo as cityCode,
    assumeNotNull(coalesce({{ get_adsourcedirty('Source', 'Medium') }}, '')) as adSourceDirty,
    case 
    when Source = 'yandex' then 'Yandex Direct Ads'
    when Source = 'vk' then 'VK Ads'
    when Source = 'mt' then 'MyTarget'
    when Source = 'yandex-business' then 'Yandex Business'
    when Source = 'yandex-dzen' then 'Yandex Dzen Ads'
    when Source = 'ok' then 'OK Ads'
    when Source = 'tg' then 'TG Ads'
    else 'источник из планов не определлился' 
    end as utmSource,
    Medium as utmMedium,
    CONCAT(Campaign, '_', toString(planCostDateStart), '_', toString(planCostDateEnd)) as utmCampaign,
    '' as utmTerm,
    '' as utmContent,
    '' as adGroupName,
    '' as adCampaignName,
    {{get_utmhash('~',['utmCampaign'])}} as utmHash,
    sum(toInt32(Cost)) as planCost,
    max(load_date) as load_date

from {{ref('incremental_sheets_yandexdisk_mediaplans')}}
where 
    Period_start is not null and Period_end is not null
group by planCostDateStart, planCostDateEnd, __table_name, productName, cityCode, adSourceDirty, utmSource, utmMedium, utmCampaign, utmTerm,
   utmContent, utmHash
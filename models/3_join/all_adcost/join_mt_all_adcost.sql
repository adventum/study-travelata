{{
    config(
        materialized='view'
    )
}}
with 
 ban as (select *
 from {{ ref('incremental_sheets_mytarget_banners') }}),
 cam as (select *
 from {{ ref('incremental_sheets_mytarget_compagins') }}),
 ban_st as (select *
 from {{ ref('incremental_sheets_mytarget_banners_statistics') }})
 select
 toLowCardinality(splitByChar('_',ban_st.__table_name)[6]) as __table_name, 
 toDate(ban_st._date) as adCostDate,
 'MyTarget' as adSourceDirty,
 cam.name as adCampaignName,
 cam.id as adCampaignId,
 '' as adCampaignType,
 '' as adGroupId,
 '' as adGroupName,
 cam.id as adId,
 '' as adPhraseName,
 '' as cityCode,
 EXTRACT(JSON_VALUE(REPLACE (ban.urls,'''','"'),'$.primary.url'),'utm_source=([^&]*)') as utmSource,
 EXTRACT(JSON_VALUE(REPLACE (ban.urls,'''','"'),'$.primary.url'),'utm_medium=([^&]*)') as utmMedium,
 EXTRACT(JSON_VALUE(REPLACE (ban.urls,'''','"'),'$.primary.url'),'utm_campaign=([^&]*)') as utmCampaign,
 EXTRACT(JSON_VALUE(REPLACE (ban.urls,'''','"'),'$.primary.url'),'utm_term=([^&]*)') as utmTerm,
 EXTRACT(JSON_VALUE(REPLACE (ban.urls,'''','"'),'$.primary.url'),'utm_content=([^&]*)') as utmContent,
 {{get_utmhash('_'['utmCampaign'])}} as utmHush,
 toFloat64(ban_st.spent) as adCost, 
 toInt32(ban_st.shows) as impressions,
 toInt32(ban_st.clics) as clicks,
 load_date
 FROM ban 
join ban_st on ban.id = ban_st.banner_id 
join cam on ban.campagin_id = cam.id 
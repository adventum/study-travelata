{{
    config(
        materialized='view'
    )
}}
select
 toDateTime(_datatime) as visitDateTime, 
 toLowCardinality(splitByChar('_',__table_name)[6]) as accountName, 
 visit_id as visitId,
 client_id as clientId,
 'web' as osName,
 region_city as cityName,
 arrayElement(splitByChar(',',(trim(BOTH '[]'from parsed_params_key2))),3) as cityCode,
 utm_medium as utmMedium,
 utm_campaign as utmCampaign,
 utm_sourse as utmSourse,
 arrayElement(splitByChar('~', utm_campaign), 2) AS utmHash, 
 if(countSubstrings(goals_id,'1')>0,1,0) as serp,
 if(countSubstrings(goals_id,'2')>0,1,0) as tourPage,
 if(countSubstrings(goals_id,'3')>0,1,0) as hotelPage,
 if(countSubstrings(goals_id,'4')>0,1,0) as checkout,
countSubstrings(goals_id,'5') as payment,
 assumeNotNull(coalesce({{ get_adsourcedirty('utmSourse', 'utmMedium') }}, 
      multiIf(last_traffic_source = 'ad', {{ get_adsourcedirty('last_adv_engine', 'last_traffic_source') }},
      last_traffic_source = 'organic', {{ get_adsourcedirty('last_referal_source', 'last_traffic_source') }},
      {{ get_adsourcedirty('last_referal_source', 'last_traffic_source') }}), '')) as adSourceDirty,
 '' as utmTern,
 '' as utmContent,
 utmSourse as utmSource,
 trim(BOTH '['']' from purchase_id) as transactionId,
 1 as session,
 assumeNotNull(coalesce(trim(both '[]' from purchase_revenue),0)) as amountSales,
 toInt32(page_views) as pageViews,
 load_date
 FROM {{ ref('incremental_sheets_ymvisits_visits') }}
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
 utm_medium as utmCampaign,
 utm_sourse as utmSourse,
 assumeNotNull(coalesce({{ get_adsourcedirty('utmSourse', 'utmMedium') }}, 
      multiIf(last_traffic_source = 'ad', {{ get_adsourcedirty('last_adv_engine', 'last_traffic_source') }},
      last_traffic_source = 'organic', {{ get_adsourcedirty('last_referal_source', 'last_traffic_source') }},
      {{ get_adsourcedirty('last_referal_source', 'last_traffic_source') }}), '')) as adSourceDirty,
 '' as utmTern,
 '' as utmContent,
 trim(BOTH '['']' from purchase_id) as tramsactionId,
 1 as session,
 assumeNotNull(coalesce(trim(both '[]' from purchase_revenue),0)) as amountSales,
 toInt32(page_views) as pageViews,
 load_date
 FROM {{ ref('incremental_sheets_ymvisits_visits') }}
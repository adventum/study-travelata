SELECT 
JSONExtractString(`_airbyte_data`,'dateTime') as _datetime,
JSONExtractString(`_airbyte_data`,'visitID') as visit_id,
JSONExtractString(`_airbyte_data`,'goalsID') as goals_id,
JSONExtractString(`_airbyte_data`,'lastTrafficSource') as last_traffic_source,
JSONExtractString(`_airbyte_data`,'lastReferalSource') as last_referal_source,
JSONExtractString(`_airbyte_data`,'regionCity') as region_city,
JSONExtractString(`_airbyte_data`,'clientID') as client_id,
JSONExtractString(`_airbyte_data`,'purchaseCoupon') as purchase_coupon,
JSONExtractString(`_airbyte_data`,'purchaseRevenue') as purchase_revenue,
JSONExtractString(`_airbyte_data`,'purchaseID') as purchase_id,
JSONExtractString(`_airbyte_data`,'goalsOrder') as goals_order,
JSONExtractString(`_airbyte_data`,'lastAdvEngine') as last_adv_engine,
JSONExtractString(`_airbyte_data`,'pageViews') as page_views,
JSONExtractString(`_airbyte_data`,'parsedParamsKey1') as parsed_params_key1,
JSONExtractString(`_airbyte_data`,'parsedParamsKey2') as parsed_params_key2,
JSONExtractString(_airbyte_data,'_airbyte_ab_id') as _airbyte_ab_id,
toLowCardinality(__table_name) as __table_name,
toDateTime32(_airbyte_emitted_at) as _emitted_at,
now() as _normalized_at 
from
(SELECT *,'travelata._airbyte_raw_sheets_ymvisits_travelata_ym_visits' as __table_name
FROM travelata.`_airbyte_raw_sheets_ymvisits_travelata_ym_visits`)

        
  
    
    
        
        insert into travelata.incremental_sheets_ymvisits_visits__dbt_new_data_d55149ab_e297_4dd6_99d1_a6e6009db815 ("_datetime", "visit_id", "goals_id", "last_traffic_source", "last_referal_source", "region_city", "client_id", "purchase_coupon", "purchase_revenue", "purchase_id", "goals_order", "last_adv_engine", "page_views", "parsed_params_key1", "parsed_params_key2", "_airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace(toDate32(`_datetime`) as _datetime)
from travelata.normalized_sheets_ymvisits_visits
  
      
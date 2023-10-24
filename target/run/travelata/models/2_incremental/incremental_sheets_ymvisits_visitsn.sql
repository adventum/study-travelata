
        
  
    
    
        
        insert into travelata.incremental_sheets_ymvisits_visitsn ("_datatime", "visit_id", "goals_id", "last_traffic_source", "last_referal_source", "region_city", "client_id", "purchase_coupon", "purchase_revenue", "purchase_id", "goals_order", "last_adv_engine", "page_views", "parsed_params_key1", "parsed_params_key2", "_airbyte_ab_id", "__table_name", "_emitted_at", "_normalized_at")
  

select * replace(toDate32(`_datatime`) as _datatime)
from travelata.normalized_sheets_ymvisits_visits
  
    
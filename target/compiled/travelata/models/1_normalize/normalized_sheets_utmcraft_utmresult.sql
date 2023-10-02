select
	JSONExtractString(_airbyte_data, 'id') as id,
	JSONExtractString(_airbyte_data, 'created_at') as created_at,
	JSONExtractString(_airbyte_data, 'updated_at') as updated_at,
	JSONExtractString(_airbyte_data, 'utm_hashcode') as utm_hashcode,
	JSONExtractString(_airbyte_data, 'data') as data,
	JSONExtractString(_airbyte_data, 'created_by_id') as created_by_id,
	JSONExtractString(_airbyte_data, 'form_id') as form_id,
	JSONExtractString(_airbyte_data, 'updated_by_id') as updated_by_id,
	JSONExtractString(_airbyte_data, '_airbyte_ab_id') as _airbyte_ab_id,
	JSONExtractString(_airbyte_data, 'load_date') as load_date,
	JSONExtractString(_airbyte_data, '_normalized_at') as _normalized_at,
	JSONExtractString(_airbyte_data, 'utm_hashcode') as utm_hashcode,
	toLowCardinality(__table_name) as __table_name,
	toDateTime32(_airbyte_emitted_at) as __emitted_at,
	now() as __normalized_at
from
	(select *,
	'travelata._airbyte_raw_sheets_default_travelatautmcraft_normalize_utmcraft_utmresult' as __table_name 
	from travelata.`_airbyte_raw_normalize_utmcraft_utmresult`) x
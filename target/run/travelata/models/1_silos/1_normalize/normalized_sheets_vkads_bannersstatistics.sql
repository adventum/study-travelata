

  create view travelata.normalized_sheets_vkads_bannersstatistics__dbt_tmp 
  
  as (
    select
	JSONExtractString(_airbyte_data, 'date') AS __datetime,
	JSONExtractString(_airbyte_data, 'tps') as tps,
	JSONExtractString(_airbyte_data, 'spent') as spent,
	JSONExtractString(_airbyte_data, 'shows') as shows,
	JSONExtractString(_airbyte_data, 'clicks') as clicks,
	JSONExtractString(_airbyte_data, 'base') as base,
	JSONExtractString(_airbyte_data, 'date') as date,
	JSONExtractString(_airbyte_data, 'moat') as moat,
	JSONExtractString(_airbyte_data, 'romi') as romi,
	JSONExtractString(_airbyte_data, 'video') as video,
	JSONExtractString(_airbyte_data, 'events') as events,
	JSONExtractString(_airbyte_data, 'uniques') as uniques,
	JSONExtractString(_airbyte_data, 'carousel') as carousel,
	JSONExtractString(_airbyte_data, 'playable') as playable,
	JSONExtractString(_airbyte_data, 'ad_group_id') as ad_group_id,
	JSONExtractString(_airbyte_data, 'custom_event') as custom_event,
	JSONExtractString(_airbyte_data, 'uniques_video') as uniques_video,
    JSONExtractString(_airbyte_data, '_airbyte_ab_id') as _airbyte_ab_id,
	JSONExtractString(_airbyte_data, 'load_date') as load_date,
	JSONExtractString(_airbyte_data, '_normalized_at') as _normalized_at,
	toLowCardinality(__table_name) as __table_name,
	toDateTime32(_airbyte_emitted_at) as __emitted_at,
	now() as __normalized_at
from
	(select *,
	'travelata.`_airbyte_raw_sheets_vkads_travelata_banners_statistics`' as __table_name 
	from travelata.`_airbyte_raw_sheets_vkads_travelata_banners_statistics`) x
  )
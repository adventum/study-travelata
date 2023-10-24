select
JSONExtractString(_airbyte_data, 'Date') as __datetime,
JSONExtractString(_airbyte_data, 'Source') as Source,
JSONExtractString(_airbyte_data, 'Medium') as Medium,
JSONExtractString(_airbyte_data, 'Campaign') as Campaign,
JSONExtractString(_airbyte_data, 'ProductName') as ProductName,
JSONExtractString(_airbyte_data, 'Cost') as Cost,
JSONExtractString(_airbyte_data, 'Impressions') as Impressions,
JSONExtractString(_airbyte_data, 'Clicks') as Clicks,
JSONExtractString(_airbyte_data, 'load_date') as load_date,
toLowCardinality(__table_name) as __table_name,
toDateTime32(_airbyte_emitted_at) as __emitted_at,
NOW() as __normalized_at
from 
(select *, 'travelata._airbyte_raw_sheets_yandexdisk_travelata_yandexdisk_othercosts' as __table_name
from travelata.`_airbyte_raw_sheets_yandexdisk_travelata_yandexdisk_othercosts`)
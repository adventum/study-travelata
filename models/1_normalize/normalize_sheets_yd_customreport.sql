select
parseDateTime(JSONExtractString(_airbyte_data, 'Date'), '%Y-%m-%d') as __datetime,
JSONExtractString(_airbyte_data, 'reportType') as reportType,
JSONExtractString(_airbyte_data, 'CampaignId') as CampaignId,
JSONExtractString(_airbyte_data, 'CampaignName') as CampaignName,
JSONExtractString(_airbyte_data, 'CampaignType') as CampaignType,
JSONExtractString(_airbyte_data, 'AdGroupId') as AdGroupId,
JSONExtractString(_airbyte_data, 'AdGroupName') as AdGroupName,
JSONExtractString(_airbyte_data, 'AdId') as AdId,
JSONExtractString(_airbyte_data, 'CriterionId') as CriterionId,
JSONExtractString(_airbyte_data, 'Criterion') as Criterion,
JSONExtractString(_airbyte_data, 'Cost') as Cost,
JSONExtractString(_airbyte_data, 'Impressions') as Impressions,
JSONExtractString(_airbyte_data, 'Clicks') as Clicks,
toLowCardinality(__table_name) as __table_name,
toDateTime32(_airbyte_emitted_at) as __emitted_at,
NOW() as __normalized_at
from 
(select *, '_travelata._airbyte_raw_sheets_default_travelatacustomreport_yd_custom_report_new' as __table_name
from travelata._airbyte_raw_sheets_default_travelatacustomreport_yd_custom_report_new)
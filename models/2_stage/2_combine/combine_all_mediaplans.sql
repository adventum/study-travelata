{{
    config(
        materialized='view'
    )
}}

with unnest_dates as (

select * ,
        dateAdd(planCostDateStart, arrayJoin(range(0, 1 + toUInt8(date_diff('day', planCostDateStart, planCostDateEnd))))) as planCostDate,
        count(*) over(partition by productName, adSourceDirty, planCostDateStart, utmCampaign) as divide_by_days
from {{ ref('join_all_mediaplans')}}        
)

select
planCostDate,
__table_name,
productName,
cityCode,
adSourceDirty,
utmSource,
utmMedium,
utmCampaign,
utmTerm,
utmContent,
planCost/divide_by_days as planCost,
load_date

from unnest_dates

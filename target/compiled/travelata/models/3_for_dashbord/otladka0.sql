
SELECT cast(__datetime as date) as date, 
        'yd_customreport' as type_table, 
        count(__datetime) as row_count, 
        sum(cast(Cost as float)) as cost_sum
from travelata.incremental_sheets_yd_customreport
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'yandexdisk_othercosts' as type_table,
        count(__datetime) as row_count, 
        sum(cast(Cost as float)) as cost_sum
from travelata.incremental_sheets_yandexdisk_othercosts
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'appmetrica_deeplinks' as type_table,
        count(__datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_appmetrica_deeplinks
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'appmetrica_events' as type_table,
        count(__datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_appmetrica_events
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'appmetrica_install' as type_table,
        count(__datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_appmetrica_install
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'appmetrica_screenview' as type_table,
        count(__datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_appmetrica_screenview
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'appmetrica_sessionstart' as type_table,
        count(__datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_appmetrica_sessionstart
group by date
UNION all
SELECT cast(_date as date) as date, 
        'banners_statistics' as type_table,
        count(_date) as row_count, 
        sum(round(cast(spent as float))) as cost_sum
from travelata.incremental_sheets_mytarget_banners_statistics
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'vkads_adgroupsstatistics' as type_table,
        count(__datetime) as row_count, 
        sum(round(cast(spent as float))) as cost_sum
from travelata.incremental_sheets_vkads_adgroupsstatistics
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'vkads_adplansstatistics' as type_table,
        count(__datetime) as row_count, 
        sum(round(cast(spent as float))) as cost_sum
from travelata.incremental_sheets_vkads_adplansstatistics
group by date
UNION all
SELECT cast(__datetime as date) as date, 
        'vkads_bannersstatistics' as type_table,
        count(__datetime) as row_count, 
        sum(round(cast(spent as float))) as cost_sum
from travelata.incremental_sheets_vkads_bannersstatistics
group by date
UNION all
SELECT cast(_datetime as date) as date, 
        'ymvisits_visits' as type_table,
        count(_datetime) as row_count, 
        0 as cost_sum
from travelata.incremental_sheets_ymvisits_visits
group by date
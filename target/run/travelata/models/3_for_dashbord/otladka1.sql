
  
    
    
        
        insert into travelata.otladka1__dbt_backup ("type_table", "row_count")
  
SELECT 
        'yd_customreport' as type_table, 
        count(*) as row_count
from travelata.incremental_sheets_yd_customreport
UNION all
SELECT 'yandexdisk_othercosts' as type_table,
        count(*) as row_count 
from travelata.incremental_sheets_yandexdisk_othercosts
UNION all
SELECT 
        'appmetrica_deeplinks' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_deeplinks
UNION all
SELECT 
        'appmetrica_events' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_events
UNION all
SELECT  
        'appmetrica_install' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_install
UNION all
SELECT  
        'appmetrica_profiles' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_profiles
UNION all
SELECT 
        'appmetrica_screenview' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_screenview
UNION all
SELECT 
        'appmetrica_sessionstart' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_appmetrica_sessionstart
UNION all
SELECT 
        'banners_statistics' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_mytarget_banners_statistics
UNION all
SELECT 
        'vkads_adgroupsstatistics' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_adgroupsstatistics
UNION all
SELECT 
        'vkads_adplansstatistics' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_adplansstatistics
UNION all
SELECT 
        'vkads_bannerssstatistics' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_bannersstatistics
UNION all
SELECT 
        'ymvisits_visits' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_ymvisits_visits
UNION all
SELECT 
        'vkads_adgroups' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_adgroups
UNION all
SELECT 
        'vkads_adplans' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_adplans
UNION all
SELECT 
        'vkads_bannervkads_banners' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_vkads_banners
UNION all
SELECT 
        'yandexdisk_mediaplans' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_yandexdisk_mediaplans
UNION all
SELECT 
        'utmcraft_utmresult' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_utmcraft_utmresult
UNION all
SELECT 
        'mytarget_compagins' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_mytarget_compagins
UNION all
SELECT 
        'mytarget_banners' as type_table,
        count(*) as row_count
from travelata.incremental_sheets_mytarget_banners
  
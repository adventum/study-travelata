SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_appmetrica_deeplinks
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_appmetrica_events
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_appmetrica_install
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_appmetrica_screenview
group by 1,2
union all
SELECT toDate(_date) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_mytarget_banners_statistics
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_vkads_adgroupsstatistics
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_vkads_adplansstatistics
group by 1,2
union all
SELECT toDate(__datetime) as _datetime,
       __table_name  as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_vkads_bannerssstatistics
group by 1,2
union all
SELECT toDate(_datatime) as _datetime,
       __table_name  as tablename,
       COUNT(*) as total
from travelata.incremental_sheets_ymvisits_visits
group by 1,2
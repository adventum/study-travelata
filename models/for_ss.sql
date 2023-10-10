SELECT toDate(`__datetime`) as `__datetime` , `__table_name`, count(*) as total
FROM travelata.normalized_sheets_yd_customreport
group by 1, 2
UNION all
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_appmetrica_deeplinks
group by 1, 2
union ALL
SELECT parseDateTime(__datetime, '%d.%m.%Y') AS  `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_appmetrica_events
group by 1, 2
union ALL 
SELECT parseDateTime(__datetime, '%d.%m.%Y') AS  `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_appmetrica_install
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_appmetrica_screenview
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_appmetrica_sessionstart
group by 1, 2
union all
SELECT toDate(`_date`) AS  `__datetime`, table_name as `__table_name`, count(*) as total
FROM travelata.normalized_sheets_mytarget_banners_statjstics_new
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`,`__table_name`, count(*) as total
FROM travelata.normalized_sheets_vkads_adgroupsstatistics
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_vkads_adplansstatistics
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_vkads_bannersstatistics
group by 1, 2
union ALL 
SELECT toDate(`__datetime`) as `__datetime`, `__table_name`, count(*) as total
FROM travelata.normalized_sheets_yandexdisk_othercosts
group by 1, 2
union ALL 
SELECT toDate(`_datatime`) as `__datetime` , `table_name` as `__table_name` , count(*) as total
FROM travelata.normalized_sheets_ymvisits_visits
group by 1, 2
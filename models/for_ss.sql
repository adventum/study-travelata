SELECT toDate(__datetime) AS __datetime,  __table_name, count(*) AS total
FROM travelata.incremental__sheets_yd_customreport
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name,count(*) AS total
FROM travelata.incremental_sheets_appmetrica_deeplinks
GROUP BY 1, 2
UNION ALL
SELECT toDate(__datetime) AS __datetime, __table_name,count(*) AS total
FROM travelata.incremental_sheets_appmetrica_events
GROUP BY  1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name,count(*) AS total
FROM travelata.incremental_sheets_appmetrica_install
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name, count(*) AS total
FROM travelata.incremental_sheets_appmetrica_screenview
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name,count(*) AS total
FROM travelata.incremental_sheets_appmetrica_sessionstart
GROUP BY 1,2
UNION ALL
SELECT toDate(_date) AS __datetime, table_name AS __table_name, count(*) AS total
FROM travelata.incremental_sheets_mytarget_banners_statistics
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name,count(*) AS total
FROM travelata.incremental_sheets_vkads_adgroupsstatistics
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name,count(*) AS total
FROM travelata.incremental_sheets_vkads_adplansstatistics
GROUP BY 1, 2
UNION ALL
SELECT toDate(__datetime) AS __datetime, __table_name, count(*) AS total
FROM travelata.incremental_sheets_vkads_bannerssstatistics
GROUP BY 1,2
UNION ALL
SELECT toDate(__datetime) AS __datetime,__table_name, count(*) AS total
FROM travelata.incremental_sheets_yandexdisk_othercosts
GROUP BY 1,2
UNION ALL
SELECT toDate(_datatime) AS __datetime, table_name AS __table_name, count(*) AS total
FROM travelata.incremental_sheets_ymvisits_visits
GROUP BY 1, 2
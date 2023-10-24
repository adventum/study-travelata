

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%M:%S') AS __datetime)
FROM travelata.normalized_sheets_vkads_adgroupsstatistics
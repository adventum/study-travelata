

SELECT * REPLACE(parseDateTime(__datetime, '%Y-%m-%d %H:%i:%s') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_sessionstart
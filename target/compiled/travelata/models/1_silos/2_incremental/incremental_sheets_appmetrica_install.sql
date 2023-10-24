

SELECT * REPLACE(parseDateTime(__datetime, '%d.%m.%Y') AS __datetime)
FROM travelata.normalized_sheets_appmetrica_install


SELECT *  REPLACE(parseDateTime(load_date, '%d.%m.%Y %H:%i:%S') as load_date)       
FROM travelata.normalized_sheets_yandexdisk_mediaplans








select MAX(planCostDate) as planCostDate, 
       MAX(__table_name) as __table_name, 
       MAX(productName) as productName, 
       MAX(cityCode) as cityCode,
       MAX(adSourceDirty) as adSourceDirty,
       MAX(utmSource) as utmSource, 
       MAX(utmMedium) as utmMedium, 
       MAX(utmCampaign) as utmCampaign,
       MAX(utmTerm) as utmTerm, 
       MAX(utmContent) as utmContent,
       SUM(planCost) as planCost, 
       MAX(load_date) as load_date,
       MediaplanStatHash
from travelata.hash_mediaplan_stat
group by MediaplanStatHash
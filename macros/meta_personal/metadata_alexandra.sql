{%- macro metadata_alexandra() -%}
entities:
  Account:
    keys:
    - name: __table_name
  Product:
    keys:
    - name: productName
  AdSource:
    keys:
    - name: adSourceDirty
  UtmParams:
    keys:
    - name: utmSource
    - name: utmMedium
    - name: utmCampaign
    - name: utmTerm
    - name: utmContent
  UtmHash:
    keys:
    - name: utmHash
  AdPhrase:
    keys:
    - name: adPhraseId
  AdCampaign:
    keys:
    - name: adCampaignName
  AdGroup:
    keys:
    - name: adGroupName
  Ad:
    keys:
    - name: adId
  CityCode:
    keys:
    - name: cityCode  
links:
  AdCostStat:
    keys:
    - name: adCostDate
    - name: reportType
    entities:
    - Account
    - AdSource
    - AdCampaign
    - AdGroup
    - Ad
    - AdPhrase
    - UtmParams
    - UtmHash
  MediaplanStat:
    keys:
    - name: planCostDate
    entities:
    - Account
    - Product
    - CityCode
    - AdSource
    - UtmParams
{%- endmacro -%}    
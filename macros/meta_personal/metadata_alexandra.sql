{%- macro metadata_alexandra() -%}
entities:
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
  Account:
    keys:
    - name: __table_name
  ProductName:
    keys:
    - name: productName
  CityCode:
    keys:
    - name: cityCode
links:
  MediaplanStat:
    keys:
    - name: planCostDate
    entities:
    - AdSource
    - Account
    - ProductName
    - CityCode
    - UtmParams
{%- endmacro -%}
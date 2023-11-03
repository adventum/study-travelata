{%- macrometadata() -%}
entities:
    Account:
      keys:
      - name: __table_name
    Product:  
      keys:
      - name: productName
    ReportType:  
      keys:
      - name: reportType
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
      - name: UtmHash
    adPhrase:
      keys:
      - name: adPhraseId
    AdCampaign:
      keys:
      - name: adCampaignName
    AdCampaignId:
      keys:
      - name: adCampaignId
    AdCampaignType:
      keys:
      - name: adCampaignType
    AdGroup:
      keys:
      - name: adGroupName
    AdGroupId:
      keys:
      - name: adGroupId
    Ad:
      keys:
      - name: adId
    CityCode:
      keys:
      - name: cityCode
links:
  AdCostStat:
    keys:
    - name: toDate(adCostDate)
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
    - name: toDate(planCostDate)
    entities:
    - Account
    - Product
    - CityCode
    - AdSource
    - UtmParams
    


{%- macro metadata_t() -%}
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
  Account:
    keys:
    - name: accountName
  YmClient:
    glue: yes
    keys:
    - name: clientId
  City:
    keys:
    - name: cityName
  CityCode:
    keys:
    - name: cityCode
  Visit:
    keys:
    - name: visitId
  Transaction:
    keys:
    - name: transactionId
  AppSession:
    keys:
    - name: appSessionId
    ---- name: installationDeviceId
links:
  AdCostStat:
    keys:
    - name: adCostDate
    - name: reportType
    entities:
    - AdSource
    - AdCampaign
    - AdGroup
    - Ad
    - AdPhrase
    - UtmParams
    - UtmHash 
  AppSessionStat:
    keys:
    - name: toDate(__datetime)
    entities:
    - AppSession
  VisitStat:
    keys:
    - name: toDate(__datetime)
    entities:
    - Visit 
{%- endmacro -%}
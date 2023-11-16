{%- macro metadata_tatiana() -%}
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
  Visit:
    keys:
    - name: visitId
  Transactions:
    keys:
    - name: transactionId
  AppSession:
    keys:
    - name: session
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
  AdSessionStat:
    keys:
    - name: toDate(visitDateTime)
    entities:
    - AppSession
  VisitStat:
    keys:
    - name: toDate(visitDateTime)
    entities:
    - Visit
{%- endmacro -%}
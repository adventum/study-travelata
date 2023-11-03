{%- macro metadata_dmitrii() -%}
entities:
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
  Account:
    keys:
    - name: accountName
  AppMetricaDevice:
    glue: yes
    keys:
    - name: appmetricaDeviceId
  MobileAdsId:
    glue: yes
    keys:
    - name: mobileAdsId
  CrmUser:
    glue: yes
    keys:
    - name: crmUserId
  City:
    keys:
    - name: cityName
  OsName:
    keys:
    - name: osName
links:
  AppInstallStat:
    keys:
    - name: installDateTime
    entities:
    - Account
    - AppMetricaDevice
    - MobileAdsId
    - CrmUser
    - OsName
    - City
    - UtmParams
    - UtmHash
{%- endmacro -%}
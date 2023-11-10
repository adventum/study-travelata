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
  AppMetricaDeviceId:
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
  MpCardNumber:
    glue: yes
    keys:
    - name: mpCardNumber
links:
  AppInstallStat:
    keys:
    - name: installDateTime
    entities:
    - Account
    - AppMetricaDeviceId
    - MobileAdsId
    - CrmUser
    - OsName
    - City
    - UtmParams
  AppProfileMatching:
    entities:
    - AppMetricaDeviceId
    - MpCardNumber
  AppEventStat:
    keys:
    - name: __datetime
    entities:
    - Account
    - AppMetricaDeviceId
    - MobileAdsId
    - CrmUser
    - OsName
    - City
{%- endmacro -%}
{%- macro metadata_petr() -%}
entities:
  Account:
    keys:
    - name: __table_name
  UtmParams:
    keys:
    - name: utmSource
    - name: utmMedium
    - name: utmCampaign
  UtmHash:
    keys:
    - name: utmHash
  eventDatetime:
    keys:
    -name: eventDatetime
  appmetricaDeviceId:
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
  publisherName:
    keys:
    - name: publisherName
  sessionId:
    keys:
    - name: sessionId
  installationId:
    keys:
    - name: installationId
  AppSession:
    keys:
    - name: appSessionId
links:
  AppDeeplinkStat:
    keys:
    - name: __datetime
    entities:
    - Account
    - appmetricaDeviceId
    - MobileAdsId
    - CrmUser
    - OsName
    - City
    - UtmParams
    - UtmHash
{%- endmacro -%}
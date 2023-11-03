{%- macro metadata() -%}
entities:
  Account:
    keys:
    - name: accountName
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
  YmClient:
    glue: yes
    keys:
    - name: clientId
  CrmUser:
    glue: yes
    keys:
    - name: crmUserId
  PromoCode:
    keys:
    - name: promoCode
  City:
    keys:
    - name: cityName
  CityCode:
    keys:
    - name: cityCode
  AppMetricaDevice:
    glue: yes
    keys:
    - name: appmetricaDeviceId
  MobileAdsId:
    glue: yes
    keys:
    - name: mobileAdsId
  AppMetricaDeviceId:
    keys:
    - name: appmetricaDeviceId
  OsName:
    keys:
    - name: osName
  MpCardNumber:
    glue: yes
    keys:
    - name: mpCardNumber
  Visit:
    keys:
    - name: visitId
  Transaction:
    keys:
    - name: transactionId
  AppSession:
    keys:
    - name: appSessionId
    - name: installationDeviceId
links:
  AdCostStat:
    keys:
    - name: toDate(__datetime)
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
    - name: toDate(__datetime)
    entities:
    - Account
    - Product
    - CityCode
    - AdSource
    - UtmParams
  AppInstallStat:
    keys:
    - name: __datetime
    entities:
    - Account
    - AppMetricaDevice
    - MobileAdsId
    - CrmUser
    - OsName
    - City
    - AdSource
    - UtmParams
    - UtmHash
  AppEventStat:
    keys:
    - name: __datetime
    entities:
    - Account
    - AppMetricaDevice
    - MobileAdsId
    - CrmUser
    - Transaction
    - PromoCode
    - OsName
    - City
  AppSessionStat:
    keys:
    - name: toDate(__datetime)
    entities:
    - AppSession
  AppDeeplinkStat:
    keys:
    - name: __datetime
    entities:
    - Account
    - AppMetricaDevice
    - MobileAdsId
    - CrmUser
    - OsName
    - City
    - AdSource
    - UtmParams
    - UtmHash
  VisitStat:
    keys:
    - name: toDate(__datetime)
    entities:
    - Visit
  AppProfileMatching:
    entities:
    - AppMetricaDeviceId
    - CrmUser
    - MpCardNumber
    - CityCode
glue_models:
  full_link_visit_stat:
    datetime_field: visitDateTime
    cols:
    - VisitStatHash
    - YmClientHash
    - MpCardNumberHash
  full_link_app_event_stat:
    datetime_field: eventDateTime
    cols:
    - AppEventStatHash
    - CrmUserHash 
    - AppMetricaDeviceIdHash
  full_link_app_install_stat:
    datetime_field: installDateTime
    cols:
    - AppInstallStatHash
    - CrmUserHash
    - AppMetricaDeviceIdHash
  full_link_app_session_stat:
    datetime_field: appSessionDateTime
    cols:
    - AppSessionStatHash
    - CrmUserHash
    - AppMetricaDeviceIdHash
  full_link_app_deeplink_stat:
    datetime_field: deeplinkDateTime
    cols:
    - AppDeeplinkStatHash
    - CrmUserHash
    - AppMetricaDeviceIdHash
  full_link_app_profile_matching:
    datetime_field: toDateTime(0)
    cols:
    - AppProfileMatchingHash
    - MpCardNumberHash
    - AppMetricaDeviceIdHash
{%- endmacro -%}

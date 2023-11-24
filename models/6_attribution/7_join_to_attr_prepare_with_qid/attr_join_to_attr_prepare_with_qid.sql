{{
    config(
        materialized='table',
<<<<<<< HEAD
        schema='maxi',
<<<<<<< HEAD
=======
        enabled=false
>>>>>>> main
=======
        enabled=true
>>>>>>> main
    )
}}

select 
__id,
    __datetime,
    record_source,
    --productName,
    accountName,
    visitId,
    case
        when __is_missed and __priority = 1 then '[Без сессии]'
        when __is_missed and __priority = 2 then '[Без поиска]'
        when __is_missed and __priority = 3 then '[Визит без hotelPage]'
        when __is_missed and __priority = 4 then '[Визит tourPage]'
        when __is_missed and __priority = 5 then '[Покупка без checkout]'
        else adSourceDirty
    end as adSourceDirty,
    --adId,
    --adText,
    --adTitle1,
    --adTitle2,
    --adPhraseId,
    --adPhraseName,
    transactionId,
    --adGroupName,
    crmUserId,
    clientId,
    --osType,
    --adCampaignName, pochemu-to net 
    utmSource,
    utmMedium,
    utmCampaign,
    utmContent,
    utmTerm,
    --landingPageName,
    utmHash,
    --adDeviceName,
    cityName,
    --promoCode,
    serp, --dobavila
    tourPage, --dobavila
    hotelPage, --dobavila
    checkout, --dobavila
    payment, -- dobavila
    session,
    --addToCartSessions,
    --cartViewSessions,
    --checkoutSessions,
    --webSalesSessions,
    --sales,
    --amountSales,
    --registrationCardSessions,
    --linkingCardToPhoneNumberSessions,
    --registrationLendingPromotionsSessions,
    --registrationCashbackSessions,
    --couponActivationSessions,
    --participationInLotterySessions,
    UtmHashHash,
    appmetricaDeviceId, --popravila
    --applicationId,
    --deviceType,
    --deviceModel,
    appSessionId,
    osName, --popravila
    --instantDiscountActivationSessions,
    --installs,
    installationId, -- dobavila
    --installApp,
    itemId, --dobavila, no vopros
    itemCategory, --dobavila, no vopros
    pageViews,
    qid,
    __priority,
    __period_number,
    __is_missed,
    __rn,
 multiIf(__priority != 1, 0, --utochnit
            adSourceDirty like '%travelata%', 1, 
            adSourceDirty like '%site%', 1, 
            adSourceDirty like '%mp%', 1, 
            adSourceDirty = '', 1, 
            adSourceDirty like '%organic%', 2,
            adSourceDirty like '%referal%', 2,
            adSourceDirty like '%social%', 2,
            adSourceDirty like '%post%', 2,
            3) as last_click_rank
from travelata.attr_prepare_with_qid
left join {{ ref('attr_create_missed_steps') }}
    using (__id)

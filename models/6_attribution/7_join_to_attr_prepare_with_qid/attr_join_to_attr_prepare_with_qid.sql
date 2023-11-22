{{
    config(
        materialized='table',
        schema='maxi',
<<<<<<< HEAD
=======
        enabled=false
>>>>>>> main
    )
}}

select
    __id,
    __datetime,
    record_source,
    productName,
    accountName,
    visitId,
    case
        when __is_missed and __priority = 1 then '[Без сессии]'
        when __is_missed and __priority = 2 then '[Без добавления в корзину]'
        when __is_missed and __priority = 3 then '[Заказ без чекаута]'
        else adSourceDirty
    end as adSourceDirty,
    adId,
    adText,
    adTitle1,
    adTitle2,
    adPhraseId,
    adPhraseName,
    transactionId,
    adGroupName,
    crmUserId,
    clientId,
    osType,
    adCampaignName,
    utmSource,
    utmMedium,
    utmCampaign,
    utmContent,
    utmTerm,
    landingPageName,
    utmHash,
    adDeviceName,
    cityName,
    promoCode,
    sessions,
    addToCartSessions,
    cartViewSessions,
    checkoutSessions,
    webSalesSessions,
    sales,
    amountSales,
    registrationCardSessions,
    linkingCardToPhoneNumberSessions,
    registrationLendingPromotionsSessions,
    registrationCashbackSessions,
    couponActivationSessions,
    participationInLotterySessions,
    UtmHashHash,
    appMetrikaDeviceId,
    applicationId,
    deviceType,
    deviceModel,
    appSessionId,
    os_name,
    instantDiscountActivationSessions,
    installs,
    installApp,
    pageViews,
    qid,
    __priority,
    __period_number,
    __is_missed,
    __rn,
    multiIf(__priority != 1, 0, adSourceClear = 'Прямые заходы', 1, 
    adSourceClear = 'Офлайн', 2,
    adSourceClear = 'Свои площадки', 3,
    adSourceClear IN ('Поисковая органика', 'Переходы с сайтов', 'Органическая установка'), 4, 5) as last_click_rank

from maxi.attr_prepare_with_qid
left join {{ ref('attr_create_missed_steps') }}
    using (__id)

CREATE OR REPLACE VIEW P_LC_PROMO_LOOKUP AS
(
SELECT DISTINCT
      PROMOTION_ID                                      AS LC_PROMO_ID
    , TO_CHAR(CREATE_DATE, 'YYYY-MM-DD HH24:MI:SS')     AS CREATE_DATETIME
    , TO_CHAR(START_DATE, 'YYYY-MM-DD')                 AS START_DATE
    , TO_CHAR(END_DATE, 'YYYY-MM-DD')                   AS END_DATE
    , NAME                                              AS PROMO_NAME
    , PRICE                                             AS PROMO_AMT
    , TYPE                                              AS PROMO_TYPE
    , ISACTIVE                                          AS IS_ACTIVE
    , DB
FROM DIM_PROMOTION_IRN_DD
)
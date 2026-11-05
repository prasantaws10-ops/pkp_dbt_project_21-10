SELECT
    s.CUSTOMER_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    s.QUANTITY,
    s.SALE_DATE,
    (s.QUANTITY * p.PRICE) AS TOTAL_REVENUE

FROM {{ ref('sales2_temp') }} s

JOIN {{ ref('prod_info') }} p
    ON s.PRODUCT_ID = p.PRODUCT_ID
where s.SALE_DATE>= dateadd(month, -15, current_date)
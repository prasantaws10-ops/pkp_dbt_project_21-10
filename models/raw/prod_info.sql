SELECT
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE
FROM {{ source('raw_data', 'cust') }} c
JOIN {{ source('prod_data', 'prod') }} p
    ON c.CUSTOMER_ID = p.CUSTOMER_ID
  
SELECT
    -- Customer Information
    c.CUSTOMER_ID,
    c.FIRST_NAME,
    c.LAST_NAME,
    c.EMAIL,

    -- Product Purchase Information
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.CATEGORY,
    p.PRICE,
    p.PURCHASE_DATE,

    -- Delivery Status Mapping
    CASE d.DELIVERY_ID
        WHEN 1 THEN 'Delivered'
        WHEN 2 THEN 'Shipped'
        WHEN 3 THEN 'In Transit'
        WHEN 4 THEN 'Pending'
        ELSE 'Unknown'
    END AS CURRENT_DELIVERY_STATUS,

    -- Delivery Tracking Information
    d.DELIVERY_DATE,
    d.COURIER_NAME,
    d.TRACKING_ID,
    d.DELIVERY_REMARKS

FROM {{ source('raw_data', 'cust') }} c

JOIN {{ source('prod_data', 'prod') }} p
    ON c.CUSTOMER_ID = p.CUSTOMER_ID

LEFT JOIN {{ source('prod_data', 'del') }} d
    ON p.PRODUCT_ID = d.PRODUCT_ID


{% snapshot supply_chain_check_scd2 %}
    {{
        config(
            target_schema='silver_sch',
            target_database='DBT_LABS',
            unique_key='order_id',
            strategy='check',
            check_cols=["SUPPLIER_NAME","PRODUCT_NAME","QUANTITY","UNIT_COST","TOTAL_COST","STATUS","UPDATED_AT"],
            query_tag= dbt_scd2_check
        )
    }}

    select ORDER_ID,
    SUPPLIER_ID,
    SUPPLIER_NAME,
    PRODUCT_ID,
    PRODUCT_NAME,
    WAREHOUSE_ID,
    WAREHOUSE_REGION,
    ORDER_DATE,
    DELIVERY_DATE,
    QUANTITY,
    UNIT_COST,
    TOTAL_COST,
    STATUS,
    UPDATED_AT
    from {{ source('raw_data', 'supply_chain') }}
 {% endsnapshot %}
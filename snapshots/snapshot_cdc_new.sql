{%{% snapshot supply_chain_orders_snapshot_key_based_hard_delete_2 %}
    {{
        config(
            target_schema='SILVER_SCH',
            target_database='DBT_LABS',
            unique_key='ORDER_ID',
            strategy='check',
            check_cols=["SUPPLIER_NAME","PRODUCT_NAME","QUANTITY","UNIT_COST","TOTAL_COST","STATUS","DELIVERY_DATE"],
            hard_deletes= 'new_record',
            query_tag='DBT_CDC'
            )
    }}
        --- ENSURES THE DATA IS NOT STALES BEYOND 90 DAYS
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
 {% endsnapshot %}%}
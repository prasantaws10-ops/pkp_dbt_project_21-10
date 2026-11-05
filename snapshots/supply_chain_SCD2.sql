{% snapshot scd2_orders_timestamp %}
    {{
        config(
            target_schema='Silver_SCHEMA',
            target_database='DBT_LABS_SILVER',
            unique_key='ORDER_ID',
            strategy='timestamp',
            updated_at='updated_at',
            query_tag = 'dbt_scd2'
        )
    }}

    select * from {{ source('raw_data', 'supply_chain') }}
 {% endsnapshot %}
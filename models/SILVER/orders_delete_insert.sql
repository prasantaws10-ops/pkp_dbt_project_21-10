{{
    config(
        materialized='incremental',
        unique_key="order_id",
        incremental_strategy='delete+insert',
        query_tag='dbt_insert',
        on_schema_change='sync_all_columns'
        
    )
}}

select * from {{ source('raw_data', 'ord') }} --- create temp table->delete target table -> insert from souce to target
--- how to optimize add filter
{% if is_incremental() %}
    where order_date >= dateadd(day,-5,current_date)  
{% endif %}


{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}

SELECT * FROM {{ source('raw_data', 'ord') }}

{% if is_incremental() %}
    WHERE order_id > (SELECT MAX(order_id) FROM {{ this }})
{% endif %}
{{
    config(
        materialized='view',
        query_tag='DBT',
        database='DBT_LAB2',
        schema='prasant_LAB2_schema'

    )
}}



 {#SELECT 
    CUSTOMER_ID as CUSTID, FIRST_NAME,LAST_NAME, concat_ws (' ',FIRST_NAME,LAST_NAME) as full_name,
    EMAIL,PHONE AS PHN_NUMBER,CITY,STATE
FROM SNOWFLAKE_DBT_DATA.SF_SCHEMA.CUSTOMER #}

{#
{{
    config(
        materialized='table',
        query_tag='DBT',
        schema='RAW_SCHEMA'
    )
}}
#}

SELECT 
    CUSTOMER_ID as CUSTID, FIRST_NAME,LAST_NAME, concat_ws (' ',FIRST_NAME,LAST_NAME) as full_name,
    EMAIL,PHONE AS PHN_NUMBER,CITY,STATE
FROM  {{ source('raw_data', 'cust') }}   -- jinja code 'source_name'=raw_data, 'object_name'=cust based on source.yml file



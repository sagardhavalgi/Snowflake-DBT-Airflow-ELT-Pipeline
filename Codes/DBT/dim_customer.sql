-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.

{{ config(materialized='table') }}

SELECT DISTINCT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    STATUS
FROM {{ ref('stg_customer') }}

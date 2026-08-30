-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.

{{ config(materialized='table') }}

SELECT
    ORDER_ID,
    CUSTOMER_ID,
    ORDER_DATE,
    ORDER_AMOUNT,
    ORDER_STATUS
FROM {{ ref('int_customer_orders') }}

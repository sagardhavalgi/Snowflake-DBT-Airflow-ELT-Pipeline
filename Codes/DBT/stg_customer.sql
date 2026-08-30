-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.
{{ config(materialized='view') }}

SELECT
    CUSTOMER_ID,
    TRIM(CUSTOMER_NAME) AS CUSTOMER_NAME,
    LOWER(EMAIL) AS EMAIL,
    STATUS,
    CREATED_AT,
    UPDATED_AT
FROM {{ source('raw', 'customer') }}
WHERE CUSTOMER_ID IS NOT NULL

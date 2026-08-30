-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.

{{ config(materialized='incremental') }}

SELECT
    c.CUSTOMER_ID,
    c.CUSTOMER_NAME,
    o.ORDER_ID,
    o.ORDER_DATE,
    o.ORDER_AMOUNT,
    o.ORDER_STATUS
FROM {{ ref('stg_customer') }} c
INNER JOIN {{ source('raw', 'orders') }} o
    ON c.CUSTOMER_ID = o.CUSTOMER_ID

{% if is_incremental() %}
WHERE o.UPDATED_AT >
(
    SELECT COALESCE(MAX(UPDATED_AT),'1900-01-01')
    FROM {{ this }}
)
{% endif %}

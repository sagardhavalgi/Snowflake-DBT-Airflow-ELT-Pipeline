-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.

CREATE OR REPLACE TASK TASK_CUSTOMER_CDC
WAREHOUSE = COMPUTE_WH
SCHEDULE = 'USING CRON 0 * * * * UTC'
AS
CALL SP_LOAD_CUSTOMER();

ALTER TASK TASK_CUSTOMER_CDC RESUME;

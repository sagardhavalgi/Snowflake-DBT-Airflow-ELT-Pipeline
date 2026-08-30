-- Sample DBT models created for portfolio purposes. No client or confidential business information is included.

CREATE OR REPLACE PROCEDURE SP_LOAD_CUSTOMER()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN

    MERGE INTO CURATED.DIM_CUSTOMER T
    USING (
        SELECT *
        FROM STR_CUSTOMER
    ) S
    ON T.CUSTOMER_ID = S.CUSTOMER_ID

    WHEN MATCHED THEN
        UPDATE SET
            T.CUSTOMER_NAME = S.CUSTOMER_NAME,
            T.EMAIL         = S.EMAIL,
            T.UPDATED_AT    = CURRENT_TIMESTAMP()

    WHEN NOT MATCHED THEN
        INSERT
        (
            CUSTOMER_ID,
            CUSTOMER_NAME,
            EMAIL,
            CREATED_AT
        )
        VALUES
        (
            S.CUSTOMER_ID,
            S.CUSTOMER_NAME,
            S.EMAIL,
            CURRENT_TIMESTAMP()
        );

    RETURN 'CUSTOMER CDC LOAD COMPLETED';

END;
$$;

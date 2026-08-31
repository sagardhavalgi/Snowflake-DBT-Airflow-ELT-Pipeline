# Production-style Airflow DAG created for portfolio purposes.
# All client-specific logic, source systems, credentials, and business rules have been removed or anonymized.

from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.empty import EmptyOperator
from airflow.operators.python import PythonOperator


# ------------------------------------------------------------------
# Sample Functions
# ------------------------------------------------------------------

def execute_cdc_procedure():
    print("Executing Snowflake CDC Stored Procedure...")


def run_data_quality_checks():
    print("Running data quality validations...")


def trigger_dbt_models():
    print("Executing DBT models...")


def run_dbt_tests():
    print("Executing DBT tests...")


def send_notification():
    print("Pipeline completed successfully.")


# ------------------------------------------------------------------
# Default Arguments
# ------------------------------------------------------------------

default_args = {
    "owner": "data-engineering",
    "depends_on_past": False,
    "email_on_failure": True,
    "email_on_retry": False,
    "retries": 2,
    "retry_delay": timedelta(minutes=5)
}


# ------------------------------------------------------------------
# DAG Definition
# ------------------------------------------------------------------

with DAG(
    dag_id="snowflake_elt_pipeline",
    description="Production-style ELT pipeline using Snowflake, Airflow, and DBT",
    default_args=default_args,
    start_date=datetime(2025, 1, 1),
    schedule="@hourly",
    catchup=False,
    tags=["snowflake", "dbt", "elt", "cdc"]
) as dag:

    start = EmptyOperator(
        task_id="start"
    )

    execute_cdc = PythonOperator(
        task_id="execute_cdc_procedure",
        python_callable=execute_cdc_procedure
    )

    data_quality_check = PythonOperator(
        task_id="data_quality_validation",
        python_callable=run_data_quality_checks
    )

    run_dbt = PythonOperator(
        task_id="run_dbt_models",
        python_callable=trigger_dbt_models
    )

    dbt_tests = PythonOperator(
        task_id="run_dbt_tests",
        python_callable=run_dbt_tests
    )

    notification = PythonOperator(
        task_id="send_notification",
        python_callable=send_notification
    )

    end = EmptyOperator(
        task_id="end"
    )

    (
        start
        >> execute_cdc
        >> data_quality_check
        >> run_dbt
        >> dbt_tests
        >> notification
        >> end
    )

from airflow import DAG
from airflow.operators.bash import BashOperator
from pendulum import datetime  

with DAG(
    dag_id='dbt_run_pipeline',
    start_date=datetime(2024, 1, 1, tz="UTC"),
    schedule=None,  
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /home/mariam/snowflake_dbt_project && dbt run',
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='cd /home/mariam/snowflake_dbt_project && dbt test',
    )

dbt_run >> dbt_test

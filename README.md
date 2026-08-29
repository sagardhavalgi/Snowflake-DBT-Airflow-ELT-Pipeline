# Snowflake-DBT-Airflow-ELT-Pipeline

Modern data engineering project demonstrating ELT orchestration, CDC implementation, data transformation, and dimensional modeling using Snowflake, Airflow, and DBT.


## Project Overview

This project demonstrates a modern cloud-based ELT architecture that ingests data from multiple REST APIs into Snowflake, implements Change Data Capture (CDC), performs data transformations using DBT, and orchestrates workflows through Apache Airflow.

The solution follows industry-standard data engineering practices including incremental loading, data quality validation, automated transformations, and monitoring.

## Business Use Case

Organizations receive operational data from multiple external systems such as inventory, supplier, product, and transaction management platforms. This project centralizes the data into Snowflake and transforms it into analytics-ready datasets for reporting and business intelligence.

This solution addresses these challenges by implementing an automated ELT framework that:

Ingests data from source systems into Snowflake.
Captures incremental changes using CDC patterns.
Applies business transformations using DBT.
Performs automated data quality checks.
Delivers curated fact and dimension tables for downstream analytics.

## Technology Stack

- Data Warehouse: Snowflake
- Data Ingestion: Fivetran, REST APIs
- Orchestration: Apache Airflow
- Transformation: DBT, SQL
- CDC: Snowflake Streams, Stored Procedures, MERGE
- Data Modeling: Star Schema, Fact & Dimension Tables
- Monitoring: Airflow Alerts, Logging
- Reporting: Power BI, Tableau
- Version Control: Git, GitHub

## Architecture Diagram
<h2>Architecture Diagram</h2>
<p align="center">
  <img src="ELT-Flow.png" width="700">
</p>

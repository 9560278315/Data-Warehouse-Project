
🛒 Retail Data Warehouse Project


## Project Overview
Designed and developed a Retail Data Warehouse using PostgreSQL and advanced SQL concepts.

## Business Objective
Build a centralized analytical database for reporting sales, customer behaviour, product performance and revenue.


Data-Warehouse-Project/
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_schema.sql
│   ├── 03_create_dimension_tables.sql
│   ├── 04_create_fact_tables.sql
│   ├── 05_staging_tables.sql
│   ├── 06_load_dimensions.sql
│   ├── 07_load_fact_tables.sql
│   ├── 08_scd_type1.sql
│   ├── 09_scd_type2.sql
│   ├── 10_analytical_queries.sql
│   └── 11_data_quality_checks.sql
│
├── schema/
│   ├── star_schema.png
│   └── data_dictionary.md
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   └── orders.csv
│
└── README.md





## Technologies
- PostgreSQL
- Advanced SQL
- Data Warehousing
- Star Schema
- ETL
- SCD Type 1 and Type 2

## Architecture
Source CSV Files
       
Staging Tables
       
Data Transformation
       
Dimension Tables
       
Fact Tables
       
Analytical Reporting

## Database Design
### Dimension Tables
- dim_customer
- dim_product
- dim_seller
- dim_date

### Fact Tables
- fact_sales
- fact_payments

<img width="1358" height="716" alt="image" src="https://github.com/user-attachments/assets/fb6457b1-aa3e-4630-9e3c-d05011534002" />



## Key Implementations
- Star Schema design
- Staging layer
- Dimension and fact loading
- Incremental data loading
- SCD Type 1
- SCD Type 2
- SQL performance optimization
- Data quality validation

## Business Queries
- Monthly revenue
- Top-selling products
- Customer purchase analysis
- Regional sales performance

## How to Run
1. Create PostgreSQL database.
2. Execute schema scripts.
3. Create staging and warehouse tables.
4. Import sample CSV files.
5. Execute dimension loading scripts.
6. Execute fact loading scripts.
7. Run analytical SQL queries.



A Retail Data Warehouse built using PostgreSQL and Advanced SQL to centralize retail business data and support analytical reporting, sales analysis, customer behaviour analysis, and revenue insights.

📌 Project Overview

This project demonstrates the design and development of a Retail Data Warehouse using modern data warehousing concepts.

The warehouse integrates customer, product, seller, order, and payment data into a centralized analytical database using a Star Schema architecture.

It implements an ETL workflow, dimension and fact table loading, incremental data loading concepts, Slowly Changing Dimensions (SCD Type 1 and Type 2), analytical SQL queries, and data quality checks.

🎯 Business Objectives
Build a centralized database for retail analytics.
Analyze sales and revenue performance.
Identify top-selling products.
Understand customer purchasing behaviour.
Analyze regional sales performance.
Maintain historical customer information.
Improve data consistency through quality checks.

🛠️ Technologies Used
Technology	Purpose
PostgreSQL	Data warehouse database
Advanced SQL	Data transformation and analysis
pgAdmin	Database management
CSV	Source data files
ETL	Data extraction, transformation, and loading
Star Schema	Dimensional data modeling
SCD Type 1 & 2	Customer history management
🏗️ Data Warehouse Architecture

The project follows a structured ETL architecture.

text
          SOURCE DATA
               |
       +-------+-------+
       |       |       |
   Customers Products Orders
       |       |       |
       +-------+-------+
               |
               v
       STAGING TABLES
               |
               v
    DATA TRANSFORMATION
               |
               v
       DIMENSION TABLES
               |
               v
         FACT TABLES
               |
               v
      ANALYTICAL REPORTING

ETL Workflow
Extract retail data from CSV source files.
Load raw data into PostgreSQL staging tables.
Transform and validate source data.
Load dimension tables using business keys.
Load fact tables using surrogate keys.
Apply SCD Type 1 and Type 2 for customer data management.
Execute analytical queries and data quality checks.


⭐ Database Design

The warehouse follows a Star Schema architecture.

Dimension Tables
Table	Description
dim_customer	Customer information and historical changes
dim_product	Product details and categories
dim_seller	Seller information
dim_date	Calendar and date attributes
Fact Tables
Table	Description
fact_sales	Sales transactions, quantity, and revenue
fact_payments	Payment methods, installments, and payment amounts
Star Schema Diagram

!Star Schema

🔄 Slowly Changing Dimensions (SCD)
SCD Type 1

Implemented to update existing customer attributes without maintaining historical versions.

Example:

Previous city: Mumbai
Updated city: Pune

The existing dimension record is updated.

SCD Type 2

Implemented to maintain historical customer records when customer attributes change.

The following columns are used:

effective_start_date
effective_end_date
is_current

Example:

Customer ID	City	is_current
C001	Pune	FALSE
C001	Bengaluru	TRUE

This allows historical customer information to be preserved.

<img width="1920" height="1022" alt="image" src="https://github.com/user-attachments/assets/836ff3b1-e3b9-4f65-8e52-12a7d50fe95d" />




📊 Analytical SQL Queries

Four business analytical queries were developed.

1. Monthly Revenue Analysis

Calculates monthly revenue using the sales fact table and date dimension.

2. Top-Selling Products

Identifies products with the highest sales quantities and revenue.

3. Customer Purchase Analysis

Analyzes customer orders, quantities purchased, and total spending.

4. Regional Sales Performance

Analyzes sales revenue and order distribution across different regions.

✅ Data Quality Checks

Implemented six data quality validations:

Duplicate customer records.
Multiple current customer records in SCD Type 2.
NULL values in fact_sales.
Invalid quantities and sales amounts.
Missing dimension references.
SCD Type 2 date validation.

These checks help maintain data consistency and warehouse reliability.

📁 Project Structure
text
Retail-Data-Warehouse/
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_schema.sql
│   ├── 03_create_dimension_tables.sql
│   ├── 04_create_fact_tables.sql
│   ├── 05_staging_tables.sql
│   ├── 06_load_dimensions.sql
│   ├── 07_load_fact_tables.sql
│   ├── 08_scd_type1.sql
│   ├── 09_scd_type2.sql
│   ├── 10_analytical_queries.sql
│   └── 11_data_quality_checks.sql
│
├── schema/
│   ├── star_schema.png
│   └── data_dictionary.md
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── payments.csv
│
├── screenshots/
│   ├── dimension_tables.png
│   ├── fact_sales.png
│   ├── fact_payments.png
│   ├── scd_type2.png
│   └── analytical_results.png
│
└── README.md

⚙️ How to Run the Project
Prerequisites
PostgreSQL installed.
pgAdmin or PostgreSQL command-line tools.
CSV source files included in the data folder.
Step 1: Create Database
sql
CREATE DATABASE retail_datawarehouse;

Connect to the newly created database.

Step 2: Create Schemas

Execute:
sql/02_create_schema.sql

Step 3: Create Dimension and Fact Tables

Execute:
sql/03_create_dimension_tables.sql
sql/04_create_fact_tables.sql

Step 4: Create Staging Tables

Execute:
sql/05_staging_tables.sql

Step 5: Import CSV Files

Import the following files into their respective staging tables:

customers.csv
products.csv
orders.csv
payments.csv

Use pgAdmin's Import/Export functionality or PostgreSQL COPY.

Step 6: Load Dimension Tables

Execute:
sql/06_load_dimensions.sql

Step 7: Load Fact Tables

Execute:
sql/07_load_fact_tables.sql

Step 8: Implement SCD

Execute:
sql/08_scd_type1.sql
sql/09_scd_type2.sql

Step 9: Execute Analytical Queries

Execute:
sql/10_analytical_queries.sql

Step 10: Run Data Quality Checks

Execute:
sql/11_data_quality_checks.sql

📸 Project Screenshots

Screenshots of the PostgreSQL implementation and query results will be included here.

1. Dimension Tables

2. Fact Sales

3. Fact Payments

4. SCD Type 2 Implementation

5. Analytical Query Results

   <img width="1920" height="925" alt="image" src="https://github.com/user-attachments/assets/19ad3077-d67b-43ee-933b-45b01b9d83b1" />
<img width="1885" height="1000" alt="image" src="https://github.com/user-attachments/assets/54cfeffe-cf31-4290-9ce6-794478f4bb74" />


Replace these image paths with your actual screenshots before publishing.

💡 Key Learnings

Through this project, I gained practical experience in:

Designing a relational data warehouse.
Implementing Star Schema architecture.
Working with staging, dimension, and fact tables.
Writing advanced PostgreSQL queries.
Implementing ETL processes.
Managing customer history using SCD Type 1 and Type 2.
Developing analytical business reports.
Performing data quality validation.
👨‍💻 Author

SQL Developer | Aspiring Data Engineer

Skills: PostgreSQL | Advanced SQL | Data Warehousing | ETL | Star Schema | SCD Type 1 & 2



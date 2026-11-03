# Retail Data Warehouse Project


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
       |
       v
Staging Tables
       |
       v
Data Transformation
       |
       v
Dimension Tables
       |
       v
Fact Tables
       |
       v
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

## Author
SQL Developer | Aspiring Data Engineer


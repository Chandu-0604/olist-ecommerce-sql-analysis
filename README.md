# Olist E-commerce Sales Analysis — PostgreSQL

## Project Overview

Analyzed the Olist Brazilian e-commerce dataset using PostgreSQL to evaluate sales performance, customer behavior, product performance, seller performance, and delivery operations.

The project focuses on using SQL to transform transactional data into business insights through multi-table joins, aggregations, CTEs, window functions, ranking, and date-based analysis.

## Dataset

The project uses the Olist Brazilian E-commerce dataset.

The dataset contains information about:

- Customers
- Orders
- Order items
- Products
- Sellers
- Payments
- Reviews

The dataset covers orders from September 2016 to October 2018.

## Tools Used

- PostgreSQL
- pgAdmin
- SQL
- VS Code

## SQL Skills Demonstrated

- SELECT and WHERE
- JOIN
- GROUP BY
- Aggregate functions
- CASE statements
- Common Table Expressions (CTEs)
- DATE_TRUNC
- Date and time calculations
- LAG()
- RANK()
- PARTITION BY
- NULLIF
- Conditional aggregation

## Project Structure

```text
olist-ecommerce-sql-analysis/
│
├── README.md
│
└── sql/
    ├── 01_schema.sql
    ├── 02_data_validation.sql
    ├── 03_order_analysis.sql
    ├── 04_revenue_analysis.sql
    ├── 05_product_analysis.sql
    ├── 06_customer_analysis.sql
    ├── 07_delivery_analysis.sql
    └── 08_seller_analysis.sql

# Olist E-commerce Sales Analysis — PostgreSQL

## Overview

Analyzed the Olist Brazilian e-commerce dataset using PostgreSQL to understand **sales, customers, products, sellers, and delivery performance**.

The project focuses on practical SQL analysis using joins, aggregations, CTEs, window functions, ranking, and date-based analysis.

## Tools

- PostgreSQL
- pgAdmin
- SQL
- VS Code
- Git & GitHub

## Key Findings

- **99,441** total orders, with **96,478 delivered**.
- `beleza_saude` was the **highest-revenue product category**.
- The highest-revenue individual product generated approximately **R$63,560**.
- **93,099** customers were one-time buyers, compared with **2,997** repeat customers.
- Average order value was **R$160.65** for one-time customers and **R$147.66** for repeat customers.
- Average delivery time was **12.56 days**.
- **7,826 of 96,470 delivered orders** were late, giving an overall late-delivery rate of **8.11%**.
- Late-delivery rates varied significantly by state, with **AL (23.93%)**, **MA (19.67%)**, and **PI (15.97%)** among the highest observed.
- Delivery timing showed an association with review scores: 5-star orders were delivered an average of **12.69 days before the estimated date**, compared with **3.36 days** for 1-star orders.
- The highest-revenue seller generated **R$226,987.93** across 1,124 orders, while another generated **R$217,940.44** from only 348 orders, highlighting differences in seller order value.

## Business Recommendations

### 1. Investigate High-Risk Delivery Regions

Investigate the causes of high late-delivery rates in **AL, MA, and PI**, including distance, logistics partners, seller location, and regional capacity.

### 2. Improve Repeat-Customer Value

Since repeat customers showed a lower average order value, test **loyalty programs, bundles, and cross-selling** to increase repeat-customer spending.

### 3. Improve Delivery Estimates

The relationship between delivery timing and review scores suggests evaluating **more accurate delivery estimates** as a potential way to improve customer satisfaction.

### 4. Evaluate Sellers Using Multiple KPIs

Seller performance should be evaluated using **revenue, order volume, revenue per order, delivery performance, and reviews**, rather than revenue alone.

## Data Quality Validation

Before analysis, the dataset was checked for:

- Duplicate records
- NULL values in key columns
- Foreign-key consistency
- Orphaned records
- Table row counts

These checks are included in `02_data_validation.sql`.

## Analysis

| Script | Analysis |
|---|---|
| `01_schema.sql` | Database schema |
| `02_data_validation.sql` | Data quality checks |
| `03_order_analysis.sql` | Orders & customer geography |
| `04_revenue_analysis.sql` | Revenue & monthly trends |
| `05_product_analysis.sql` | Product rankings |
| `06_customer_analysis.sql` | Customer behavior & AOV |
| `07_delivery_analysis.sql` | Delivery & review analysis |
| `08_seller_analysis.sql` | Seller performance |

## SQL Skills Demonstrated

- Multi-table `JOIN`
- `GROUP BY` and aggregations
- `CASE`
- CTEs
- `LAG()`
- `RANK()`
- `PARTITION BY`
- `DATE_TRUNC()`
- Date/time calculations
- Conditional aggregation
- `NULLIF`

## Revenue Definition

Revenue analysis uses **delivered orders** and:

```sql
SUM(order_items.price)
```

Therefore, product, category, monthly, and seller revenue figures represent **product-price revenue excluding freight**.

Customer average order value separately includes:

```sql
price + freight_value
```

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
```
## Conclusion

This project demonstrates practical PostgreSQL skills by turning e-commerce transaction data into **actionable insights across sales, customers, products, sellers, and delivery operations**.

# MySQL Query Performance Optimization — Olist E-Commerce Dataset

Analysis and indexing strategy project on the Brazilian E-Commerce (Olist) dataset, focused on identifying slow query patterns using `EXPLAIN`, applying targeted indexes, and comparing query execution plans before and after optimization.

## Overview

This project loads a subset of the Olist e-commerce dataset (customers, orders, order items, products, and payments) into MySQL, profiles a set of common analytical queries with `EXPLAIN`, applies indexes based on the access patterns observed, and re-runs the same `EXPLAIN` analysis to compare the query plans.

## Dataset

Four core tables were used:
- `customers`
- `orders`
- `order_items`
- `products`
- `order_payments`

Data was loaded via `LOAD DATA INFILE`, with `NULLIF()` handling applied for empty/NULL datetime fields.

## Tech Stack

- MySQL 8.x
- SQL (DDL, indexing, views, `EXPLAIN`)

## Project Structure

```
MySQL-Query-Performance-Optimization/
│
├── README.md
├── LICENSE
│
├── sql/
│   ├── 01_create_indexes.sql        -- Index definitions applied to all 5 tables
│   ├── 02_performance_queries.sql   -- The actual analytical queries being optimized
│   ├── 03_explain_results.sql       -- EXPLAIN plans, before and after indexing
│   └── 04_views.sql                 -- Reusable views built on top of the optimized queries
│
└── screenshots/
    ├── 01_database_tables.png
    ├── 02_before_explain_customer_state.png
    ├── 03_before_explain_top_sellers.png
    ├── 04_before_explain_orders_date.png
    ├── 05_indexes_created.png
    ├── 06_after_explain_customer_state.png
    ├── 07_after_explain_top_sellers.png
    ├── 08_after_explain_orders_date.png
    ├── 09_top_sellers_result.png
    ├── 10_orders_by_state_result.png
    └── 11_views_output.png
```

## Queries Analyzed

1. Orders from customers in a given state (join: `customers` ↔ `orders`)
2. Top sellers by revenue (aggregation on `order_items`)
3. Orders placed within a date range (`orders.order_purchase_timestamp`)
4. Product count by category (aggregation on `products`)
5. Top customers by order count (aggregation on `orders`)
6. Average payment value by payment type (aggregation on `order_payments`)
7. Order count by customer state (join + aggregation)

## Indexing Strategy

Indexes were added based on the columns driving joins, `WHERE` filters, and `GROUP BY` clauses in the queries above:

| Table | Index | Rationale |
|---|---|---|
| `customers` | `customer_id`, `customer_state`, `customer_city` | Join key + frequent filter/group column |
| `orders` | `customer_id`, `order_status`, `order_purchase_timestamp`, `order_id` | Join key, filter, and date-range scans |
| `order_items` | `order_id`, `product_id`, `seller_id` | Join key + `GROUP BY seller_id` |
| `products` | `product_category_name`, `product_id` | `GROUP BY` column + join key |
| `order_payments` | `order_id`, `payment_type` | Join key + `GROUP BY` column |

## Methodology

1. Ran `EXPLAIN` on all 7 queries against the un-indexed schema (`03_explain_results.sql`, "BEFORE" section).
2. Applied indexes (`01_create_indexes.sql`).
3. Re-ran `EXPLAIN` on the same queries (`03_explain_results.sql`, "AFTER" section) and compared `type`, `key`, and `rows` columns across plans.
4. Wrapped the core aggregation queries as views (`04_views.sql`) for repeatable reporting.


## How to Reproduce

```bash
# Run the "BEFORE" section of 03_explain_results.sql first to capture the pre-index plans,
# then continue with the steps below.
mysql -u <user> -p <database> < sql/01_create_indexes.sql
mysql -u <user> -p <database> < sql/02_performance_queries.sql
mysql -u <user> -p <database> < sql/03_explain_results.sql
mysql -u <user> -p <database> < sql/04_views.sql
```

## Screenshots

See the `screenshots/` folder for the database schema, before/after `EXPLAIN` plans, and sample query/view outputs referenced above.

## Author

**Pallavi Chavan**
[GitHub](https://github.com/pallavi962) · [LinkedIn](https://www.linkedin.com/in/pallavi-chavan-7b6585321)

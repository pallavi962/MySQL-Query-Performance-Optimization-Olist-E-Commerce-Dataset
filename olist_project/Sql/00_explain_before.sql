
-- ===========================================
-- BEFORE OPTIMIZATION (NO INDEXES)
-- ===========================================

-- Query 1: Orders from São Paulo Customers
EXPLAIN
SELECT
    o.order_id,
    c.customer_city,
    c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.customer_state = 'SP';

-- Query 2: Top Sellers by Revenue
EXPLAIN
SELECT
    seller_id,
    SUM(price) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Query 3: Orders Placed in 2018
EXPLAIN
SELECT *
FROM orders
WHERE order_purchase_timestamp
BETWEEN '2018-01-01'
AND '2018-12-31';

-- Query 4: Product Categories
EXPLAIN
SELECT
    product_category_name,
    COUNT(*) AS total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC;

-- Query 5: Top Customers
EXPLAIN
SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 20;

-- Query 6: Payment Analysis
EXPLAIN
SELECT
    payment_type,
    AVG(payment_value)
FROM order_payments
GROUP BY payment_type;

-- Query 7: Orders by Customer State
EXPLAIN
SELECT
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

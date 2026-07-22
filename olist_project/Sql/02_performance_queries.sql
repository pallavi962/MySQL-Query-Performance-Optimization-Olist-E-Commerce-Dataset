USE olist_db;

-- Query 1
SELECT
o.order_id,
c.customer_city,
c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
WHERE c.customer_state='SP'
LIMIT 20;

-- Query 2
SELECT
seller_id,
SUM(price) revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;

-- Query 3
SELECT *
FROM orders
WHERE order_purchase_timestamp
BETWEEN '2018-01-01'
AND '2018-12-31';

-- Query 4
SELECT
product_category_name,
COUNT(*) total_products
FROM products
GROUP BY product_category_name
ORDER BY total_products DESC;

-- Query 5
SELECT
customer_id,
COUNT(*) total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 20;

-- Query 6
SELECT
ROUND(AVG(price),2) average_price
FROM order_items;

-- Query 7
SELECT
ROUND(AVG(freight_value),2) average_freight,
MAX(freight_value) highest_freight,
MIN(freight_value) lowest_freight
FROM order_items;

-- Query 8
SELECT
payment_type,
ROUND(AVG(payment_value),2) average_payment,
COUNT(*) total_payments
FROM order_payments
GROUP BY payment_type;

-- Query 9
SELECT
product_id,
SUM(price) revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 20;

-- Query 10
SELECT
c.customer_state,
COUNT(o.order_id) total_orders
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;
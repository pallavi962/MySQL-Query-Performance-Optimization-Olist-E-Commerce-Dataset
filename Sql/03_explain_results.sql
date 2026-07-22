
EXPLAIN
SELECT
o.order_id,
c.customer_city,
c.customer_state
FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
WHERE c.customer_state='SP';

EXPLAIN
SELECT
seller_id,
SUM(price)
FROM order_items
GROUP BY seller_id
ORDER BY SUM(price) DESC;

EXPLAIN
SELECT *
FROM orders
WHERE order_purchase_timestamp
BETWEEN '2018-01-01'
AND '2018-12-31';

EXPLAIN
SELECT
customer_id,
COUNT(*)
FROM orders
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

EXPLAIN
SELECT
payment_type,
AVG(payment_value)
FROM order_payments
GROUP BY payment_type;
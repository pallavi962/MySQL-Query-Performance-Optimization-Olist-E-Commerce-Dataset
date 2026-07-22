
CREATE OR REPLACE VIEW vw_top_sellers AS
SELECT
seller_id,
SUM(price) AS revenue
FROM order_items
GROUP BY seller_id;

CREATE OR REPLACE VIEW vw_customer_orders AS
SELECT
customer_id,
COUNT(*) total_orders
FROM orders
GROUP BY customer_id;

CREATE OR REPLACE VIEW vw_product_categories AS
SELECT
product_category_name,
COUNT(*) total_products
FROM products
GROUP BY product_category_name;

SELECT *
FROM vw_top_sellers
ORDER BY revenue DESC
LIMIT 10;

SELECT *
FROM vw_customer_orders
ORDER BY total_orders DESC
LIMIT 20;

SELECT *
FROM vw_product_categories
ORDER BY total_products DESC;
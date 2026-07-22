
-- Customers
CREATE INDEX idx_customer_id ON customers(customer_id(50));
CREATE INDEX idx_customer_state ON customers(customer_state(10));
CREATE INDEX idx_customer_city ON customers(customer_city(50));

-- Orders
CREATE INDEX idx_orders_customer ON orders(customer_id(50));
CREATE INDEX idx_order_status ON orders(order_status(30));
CREATE INDEX idx_order_purchase ON orders(order_purchase_timestamp(30));
CREATE INDEX idx_order_id ON orders(order_id(50));

-- Order Items
CREATE INDEX idx_orderitems_order ON order_items(order_id(50));
CREATE INDEX idx_product ON order_items(product_id(50));
CREATE INDEX idx_seller ON order_items(seller_id(50));

-- Products
CREATE INDEX idx_products_category ON products(product_category_name(100));
CREATE INDEX idx_products_id ON products(product_id(50));

-- Payments
CREATE INDEX idx_payment_order ON order_payments(order_id(50));
CREATE INDEX idx_payment_type ON order_payments(payment_type(30));

SHOW INDEX FROM customers;
SHOW INDEX FROM orders;
SHOW INDEX FROM order_items;
SHOW INDEX FROM products;
SHOW INDEX FROM order_payments;

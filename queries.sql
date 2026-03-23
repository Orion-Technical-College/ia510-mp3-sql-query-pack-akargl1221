-- Q1: list customers
SELECT id, name, email FROM customers ORDER BY id;

-- Q2: list products under $25
SELECT sku, name, unit_price FROM products WHERE unit_price < 25 ORDER BY unit_price;

-- Q3: order count per customer
SELECT c.name, COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name
ORDER BY c.name;

-- Q4: revenue per product (from line items)
SELECT p.name, SUM(ol.line_total) AS revenue
FROM order_lines ol
JOIN products p ON p.id = ol.product_id
GROUP BY p.id, p.name
ORDER BY revenue DESC;

-- Q5: last order per customer (by created_at)
SELECT DISTINCT ON (c.id) c.name, o.id AS order_id, o.status, o.created_at
FROM customers c
JOIN orders o ON o.customer_id = c.id
ORDER BY c.id, o.created_at DESC;

-- Q6: customers with no orders
SELECT c.name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
WHERE o.id IS NULL;

-- Q7: average line quantity
SELECT AVG(qty)::numeric(10,2) AS avg_qty FROM order_lines;

-- Q8: subquery — products never ordered
SELECT name FROM products WHERE id NOT IN (SELECT DISTINCT product_id FROM order_lines);

-- Q9: filter confirmed orders
SELECT id, customer_id FROM orders WHERE status = 'CONFIRMED';

-- Q10: join customers to latest order status
SELECT c.email, o.status
FROM customers c
JOIN orders o ON o.customer_id = c.id
WHERE c.email LIKE '%example.com';

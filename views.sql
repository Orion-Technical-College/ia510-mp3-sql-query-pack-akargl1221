-- Optional views for your query pack (extend/replace).

CREATE OR REPLACE VIEW v_customer_order_counts AS
SELECT c.id, c.name, COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.name;

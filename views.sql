-- Optional views for your query pack (extend/replace).

--View for Q3: order count per customer
CREATE OR REPLACE VIEW v_customer_order_counts AS
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS order_count
FROM CUSTOMER c
LEFT JOIN ORDERS o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName;

--View for Q5: last order per customer
CREATE OR REPLACE VIEW v_customer_latest_order AS
SELECT DISTINCT ON (o.CustomerID)
    o.CustomerID,
    o.OrderID,
    o.Status,
    o.OrderDate
FROM ORDERS o
ORDER BY o.CustomerID, o.OrderDate DESC;

--View for Q4: revenue per product
CREATE OR REPLACE VIEW v_product_revenue AS
SELECT
    p.ProductID,
    p.ProductName,
    SUM(ol.Quantity * ol.UnitPrice) AS revenue
FROM PRODUCT p
JOIN ORDER_LINE ol ON ol.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName;

--View for Q6: customers with no orders
CREATE OR REPLACE VIEW v_customers_without_orders AS
SELECT c.CustomerID, c.CompanyName
FROM CUSTOMER c
LEFT JOIN ORDERS o ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;
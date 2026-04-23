-- Q1: list customers
SELECT CustomerID, CompanyName, Email FROM CUSTOMER ORDER BY CustomerID;

-- Q2: list products under $25
SELECT ProductID, ProductName, ListPrice FROM PRODUCT WHERE ListPrice < 25 ORDER BY ListPrice;

-- Q3: order count per customer
SELECT c.CompanyName, COUNT(o.OrderID) AS order_count
FROM CUSTOMER c
LEFT JOIN ORDERS o ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY c.CompanyName;

-- Q4: revenue per product (from line items)
SELECT p.ProductName, SUM(ol.Quantity * ol.UnitPrice) AS revenue
FROM ORDER_LINE ol
JOIN PRODUCT p ON p.ProductID = ol.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY revenue DESC;

-- Q5: last order per customer (by created_at)
SELECT DISTINCT ON (c.CustomerID) c.CompanyName, o.OrderID AS order_id, o.Status, o.OrderDate,
FROM CUSTOMER c
JOIN ORDERS o ON o.CustomerID = c.CustomerID
ORDER BY c.CustomerID, o.created_at DESC;

-- Q6: customers with no orders
SELECT c.CompanyName
FROM CUSTOMER c
LEFT JOIN ORDERS o ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL;

-- Q7: average line quantity
SELECT AVG(Quantity)::numeric(10,2) AS avg_qty FROM ORDER_LINE;

-- Q8: subquery — products never ordered
SELECT ProductName FROM PRODUCT WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM ORDER_LINE);

-- Q9: filter confirmed orders
SELECT OrderID, CustomerID FROM ORDERS WHERE Status = 'CONFIRMED';

-- Q10: join customers to latest order status
SELECT c.Email, o.Status
FROM CUSTOMER c
JOIN ORDERS o ON o.CustomerID = c.CustomerID
WHERE c.Email LIKE '%example.com';
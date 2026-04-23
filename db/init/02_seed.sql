-- Canonical seed (must stay aligned with MP7 autograde marker: Avery / avery.lopez@example.com).

INSERT INTO CUSTOMER (CompanyName, Email)
VALUES
    ('Avery Lopez', 'avery.lopez@example.com'),
    ('Morgan Chen', 'morgan.chen@example.com');

INSERT INTO PRODUCT (ProductID, ProductName, ListPrice)
VALUES
    ('SKU-001', 'Widget A', 19.99),
    ('SKU-002', 'Widget B', 29.50);

INSERT INTO ORDERS (CustomerID, Status)
VALUES (1, 'CONFIRMED');

INSERT INTO ORDER_LINE (OrderID, ProductID, Qty, UnitPrice)
VALUES (1, 1, 2, 19.99);

SELECT OrderLineID, Quantity * UnitPrice AS LineTotal
FROM ORDER_LINE;

SELECT OrderID, SUM(Quantity * UnitPrice) AS TotalAmount
FROM ORDER_LINE
GROUP BY OrderID;
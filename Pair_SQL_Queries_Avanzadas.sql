USE northwind;

SELECT * 
FROM Products;

#1
SELECT MIN(UnitPrice) AS lowestPrice, MAX(UnitPrice) AS highestPrice
FROM products;

#2
SELECT COUNT(UnitPrice)
FROM products; 

SELECT COUNT(ProductName)
FROM products; #no suma

SELECT ROUND(AVG(UnitPrice),2)
FROM products;

#3
SELECT MAX(Freight),MIN(Freight)
FROM Orders
WHERE ShipCountry = "UK";

#4
SELECT AVG(UnitPrice)
FROM Products;

SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > 28.86
ORDER BY UnitPrice DESC;

#5
SELECT ProductName, Discontinued
FROM products
WHERE Discontinued = 1;

#6
SELECT ProductName, ProductID, Discontinued
FROM products
WHERE Discontinued = 0
ORDER BY ProductID DESC
LIMIT 10;

#7 
SELECT * 
FROM Orders;

SELECT EmployeeID, COUNT(OrderID), MAX(Freight)
FROM Orders
GROUP BY EmployeeID;

SELECT DISTINCT EmployeeID
FROM Orders;

#8
SELECT OrderDate
FROM Orders;


SELECT EmployeeID, COUNT(OrderID), MAX(Freight)
FROM Orders
WHERE OrderDate IS NOT NULL
GROUP BY EmployeeID;


SELECT OrderDate
FROM Orders;

#9
SELECT
DAY(OrderDate) AS Dia,
MONTH(OrderDate) AS Mes,
YEAR(OrderDate) AS Ano
FROM Orders;

#10 (agrupe los pedidos por cada mes concreto de cada año)
SELECT 
    MONTH(OrderDate) AS Mes,
    YEAR(OrderDate) AS Ano,
    COUNT(*) AS NumeroDePedidos
FROM Orders
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY 
    Ano,
    Mes;





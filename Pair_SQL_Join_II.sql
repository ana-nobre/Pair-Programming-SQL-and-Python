
# (1) Empleadas que sean de la misma ciudad:
# Desde recursos humanos nos piden realizar una consulta que muestre por pantalla los datos de todas las empleadas y sus supervisoras. 
# Concretamente nos piden: la ubicación, nombre, y apellido tanto de las empleadas como de las jefas. Investiga el resultado, 
# ¿sabes decir quién es el director? Andrew

USE Northwind;

SELECT*
FROM Employees; 

SELECT Trabajadoras.FirstName, Trabajadoras.LastName, Trabajadoras.Country, Jefas.FirstName, Jefas.LastName, Jefas.Country
FROM Employees AS Trabajadoras 
INNER JOIN Employees AS Jefas
ON Trabajadoras.ReportsTo = Jefas.EmployeeID;

SELECT Trabajadoras.FirstName, Trabajadoras.LastName, Trabajadoras.Country, Jefas.FirstName, Jefas.LastName, Jefas.Country
FROM Employees AS Trabajadoras 
LEFT JOIN Employees AS Jefas
ON Trabajadoras.ReportsTo = Jefas.EmployeeID;


# (2) El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados. 
# Queremos obtener el nombre de la categoría y el nombre de los productos dentro de cada categoría. Podriamos usar un RIGTH JOIN con 'categories'?, usemos tambien la tabla 'products'.

SELECT*
FROM Products; #Category ID

SELECT*
FROM Categories; #CategoryName #CategoryID


SELECT Products. ProductID, Products. ProductName, Products.CategoryID, Categories.CategoryName 
FROM Products 
LEFT JOIN Categories
USING (CategoryID); # ordena por producto # Aunque tenga categoria NULL

SELECT Products. ProductID, Products. ProductName, Products.CategoryID, Categories.CategoryName 
FROM Products 
RIGHT JOIN Categories
USING (CategoryID); # ordena por categoria


# (3) Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes. 
# Sin embargo, hay algunos pedidos que pueden no tener un cliente asignado. Necesitamos asegurarnos de incluir todos los pedidos, 
# incluso si no tienen cliente registrado.


SELECT Orders.OrderID, Customers.CompanyName
FROM Orders
LEFT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CompanyName
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;


# (4) El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no. 
# Queremos obtener una lista con todas las empleadas y, si han gestionado pedidos, mostrar los detalles del pedido.

SELECT *
FROM Orders; # Employee ID # Order_ID # OrderDate # Freight

SELECT *
FROM Employees; # Employee ID # FirstName(Select) # 

SELECT Employees.EmployeeID,Employees.FirstName, Orders.OrderID,Orders.OrderDate,Orders.Freight
FROM Employees
LEFT JOIN Orders
USING(EmployeeID);

# (5) Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado. 
# Queremos asegurarnos de incluir todos los transportistas, incluso si no han enviado pedidos.


SELECT *
FROM Shippers; #ShipperID # CompanyName # Left

SELECT *
FROM Orders; #OrderID # ShipVia

SELECT Shippers.ShipperID, Shippers.CompanyName, Orders.OrderID
FROM Shippers
LEFT JOIN Orders
ON Shippers.ShipperID = Orders.ShipVia;




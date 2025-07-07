
USE northwind;

# 1 (subconsulta correlacionada/funcion MAX)
# Extraed los pedidos con el máximo "order_date" para cada empleado.
# Nuestro jefe quiere saber la fecha de los pedidos más recientes que ha gestionado cada empleado. 
# Para eso nos pide que lo hagamos con una query correlacionada.


SELECT *
FROM Employees; 

SELECT *
FROM Orders; 
# OrderID # OrderDate #EmployeeID

SELECT OrderDate # ordena por los mas recientes
FROM Orders
ORDER BY OrderDate DESC;

SELECT MAX(OrderDate) # fecha mas reciente
FROM Orders;

SELECT EmployeeID  # agrupa empleados 
FROM Orders
GROUP BY EmployeeID;

# Respuesta sin correlacion: 
SELECT EmployeeID, MAX(OrderDate) 
FROM Orders
GROUP BY EmployeeID;

SELECT EmployeeID, OrderID, OrderDate #Fecha mas reciente pero solo ensena 4 de los 9 empleados (pues salio las maximos orders - que tiene valores iguales - pero no por empleado)
FROM Orders
WHERE OrderDate IN (SELECT MAX(OrderDate) 
					FROM Orders);
                    
SELECT MAX(OrderDate)  # Devuelve una fecha
FROM Orders WHERE EmployeeID = 5;

            
# Respuesta: 
SELECT EmployeeID, OrderID, OrderDate
FROM Orders AS O
WHERE OrderDate = (SELECT MAX(OrderDate) 
					FROM Orders WHERE EmployeeID = O.EmployeeID);
                    
                    
                    

SELECT EmployeeID, MAX(OrderDate) # Max order por empleado
FROM Orders
GROUP BY EmployeeID;


SELECT EmployeeID, OrderID, OrderDate
FROM Orders;









# 2
# Extraed información de los productos "Beverages"
# En este caso nuestro jefe nos pide que le devolvamos toda la información necesaria para identificar un tipo de producto. En concreto, tienen especial interés por los productos con categoría "Beverages". 
# Devuelve el ID del producto, el nombre del producto y su ID de categoría.





# 3 
# Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
# Suponemos que si se trata de ofrecer un mejor tiempo de entrega a los clientes, entonces podría dirigirse a estos países para buscar proveedores adicionales.


# 4
# Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"
# Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.


# Bonus
# Qué producto es más popular: Extraed cuál es el producto que más ha sido comprado y la cantidad que se compró. 
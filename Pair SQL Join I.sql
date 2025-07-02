/* Pair Join I Ejercicios*/

USE northwind;
/* 1.  Pedidos por empresa en UK:
Desde las oficinas en UK nos han pedido con urgencia que realicemos una consulta a la base de datos con la que podamos 
conocer cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.*/
-- Primer paso: comprender las tablas
SELECT * FROM customers; -- aqui tenemos nombre empresa (company_name) y pais (country) y identificador del cliente(customer_id)
SELECT * FROM orders; -- aqui tenemos identificador del cliente(customer_id) y identificador del pedido (order_id)
-- Segundo paso: unir las tablas
SELECT * 
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id; 
-- Tercer paso: limpiar el SELECT y dejar lo q nos interesa
SELECT company_name, country, customers.customer_id, order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id; 
-- Cuarto paso: GROUP BY country xq os pide por UK y COUNT(order_id) xq nos pide num pedidos
SELECT company_name, country, customers.customer_id, order_id
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY company_name, country, order_id
HAVING country = "UK";
-- ahora vemos el COUNT
SELECT company_name, customers.customer_id, COUNT(order_id) AS "Numero_pedidos"
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE country = "UK"  -- country es columna de la tabla por lo q sería WHERE
GROUP BY company_name, customers.customer_id -- nos da fallo el COUNT: en lugar de contar el numero pedidos cuenta cada pedido y no hace un recuento final
;                 -- pero si metemos customers.customer_id en GROUP BY o hacemos una función agregada  sí debería funcionar
-- MODO RESTRICTIVO revisa que las columnas estén en GROUP BY o en funciones agregadas porque mi versión da error 


/* 2. Productos pedidos por empresa en UK por año:
Desde Reino Unido se quedaron muy contentas con nuestra rápida respuesta a su petición anterior y han decidido pedirnos una serie de consultas adicionales. 
La primera de ellas consiste en una query que nos sirva para conocer cuántos objetos ha pedido cada empresa cliente de UK durante cada año. 
Nos piden concretamente conocer el nombre de la empresa, el año, y la cantidad de objetos que han pedido. Para ello hará falta hacer 2 joins */
-- Primer paso: comprender las tablas: tenemos q unir customers con orders y luego con order_details
SELECT * FROM customers; -- aqui tenemos nombre empresa (company_name) y identificador del cliente(customer_id)
SELECT * FROM orders; -- aqui tenemos identificador del cliente(customer_id) y identificador del pedido (order_id) y fecha (order_date)
SELECT * FROM order_details; -- aqui tenemos identificador del pedido (order_id) y identificador del producto (product_id)





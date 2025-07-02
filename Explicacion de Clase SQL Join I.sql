-- Clase del 02/07/2025:
-- Para realizar los ejercicios tenemos que ir poco a poco. Hacemos el 5. de los ejercicos de la lección
USE tienda;
-- 5. Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
-- Primero tenemos que entender las tablas: INSPECCIONAR ESQUEMA Y TABLAS
-- employees (empleadas) con employee_number (id_empleada), last_name (apellido) first_name (nombre)
SELECT * FROM employees LIMIT 5;
-- customers (clientes) con sales_rep_employee_number (id_empleada)
SELECT * FROM customers LIMIT 5;

-- Ahora queremos comprobar si uniendo las tablas nos salen los datos: UNIR LOS DATOS POR SU COLUMNA DE UNIÓN
SELECT * -- dejamos * en el SELECT para poder comprobar
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number; -- distinto nombre, le decimos tabla.columna

-- Siguiente paso: COMPROBACIONES DE QUÉ NECESITAMOS EN EL SELECT
SELECT employee_number, first_name, last_name, customer_number, customer_name, sales_rep_employee_number
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number;

-- Para el siguiente paso tenemos que agrupar y contar: INCLUIR GROUP BY Y COUNT Y LIMPIAR EL SELECT
SELECT employee_number, first_name, last_name, COUNT(customer_number)
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY employee_number;
-- SEGÚN LA VERSIÓN DE MySQL PUEDE NECESITAR QUE LE DIGAMOS QUE AGRUPE POR MÁS DATOS (misma consulta, distinta síntexis)
SELECT employee_number, first_name, last_name, COUNT(customer_number)
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY employee_number, first_name, last_name; -- AQUI

-- Para el siguiente paso tenemos que aplicar el filtro que nos piden "con más de 8 clientes"
SELECT employee_number, first_name, last_name, COUNT(customer_number)
FROM employees AS e                           -- si pensamos q puede haber duplicados: COUNT(DISTINCT customer_number)
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY employee_number
HAVING COUNT(customer_number) > 8;

-- Paso final: LIMPIAR EL SELECT PARA DAR LOS DATOS SOLICITADOS
SELECT employee_number, first_name, last_name
FROM employees AS e
INNER JOIN customers AS c
ON e.employee_number = c.sales_rep_employee_number
GROUP BY employee_number
HAVING COUNT(customer_number) > 8
ORDER BY COUNT(customer_number) ASC;
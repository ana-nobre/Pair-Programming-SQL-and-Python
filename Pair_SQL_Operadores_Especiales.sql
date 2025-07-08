USE northwind;
/*1. Ciudades que empiezan con "A" o "B". Por un extraño motivo, nuestro jefe quiere que le devolvamos una tabla con aquellas compañías 
que están afincadas en ciudades que empiezan por "A" o "B". Necesita que le devolvamos la ciudad, el nombre de la compañía y el nombre de contacto. */
SELECT city, company_name, contact_name
FROM customers
WHERE city REGEXP '^[AB]';

/*2. Número de pedidos que han hecho en las ciudades que empiezan con L. En este caso, nuestro objetivo es devolver los mismos campos 
que en la query anterior el número de total de pedidos que han hecho todas las ciudades que empiezan por "L".*/
SELECT city, company_name, contact_name
FROM customers
WHERE city LIKE 'L%';
-- customers tenemos customer_id, company_name y city y en orders tenemos customer_id y order_id
SELECT count(order_id), city  -- ciudades
FROM orders
JOIN customers
WHERE city LIKE 'L%'
GROUP BY city;
SELECT count(order_id), city, company_name, contact_name -- aqui incluimos las empresas
FROM orders
JOIN customers
WHERE city LIKE 'L%'
GROUP BY city, company_name, contact_name;

/*3. Todos los clientes cuyo "country" no incluya "Sales".Nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle" . 
Extraer el nombre de contacto, su titulo de contacto y el nombre de la compañía. */
-- entendemos que nuestro objetivo es extraer los clientes que no tengan el titulo de "Sales" en "ContactTitle"
SELECT company_name, contact_name, contact_title
FROM customers
WHERE contact_title NOT REGEXP '^Sales'; -- opción REGEX
SELECT company_name, contact_name, contact_title
FROM customers
WHERE contact_title NOT LIKE '%Sales%'; -- opción LIKE

/* 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre. Devolved unicamente el nombre de contacto. */
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE '_A%';


/* 5. Extraer toda la información sobre las compañías que tengamos en la bases de datos. Nuestros jefes nos han pedido que creemos una query 
que nos devuelva todos los clientes y proveedores que tenemos en la bases de datos. Mostrad la ciudad a la que pertenecen, el nombre de la empresa y 
el nombre del contacto, además de la relación (Proveedor o Cliente). Pero importante! No debe haber duplicados en nuestra respuesta. 
La columna Relationship no existe y debe ser creada como columna temporal. Para ello añade el valor que le quieras dar al campo y utilizada como alias Relationship.
Nota: Deberás crear esta columna temporal en cada instrucción SELECT. */
-- customers y suppliers (city, company_name, contact_name),  Relationship (Proveedor o Cliente) por UNION
SELECT city, company_name, contact_name, "Cliente" AS Relationship
FROM customers
UNION 
SELECT city, company_name, contact_name, "Proveedor"
FROM suppliers;

/* 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".*/
SELECT category_name, description
FROM categories
WHERE description NOT LIKE '%weet%'; -- imp: cualquier weet que encuentre en la frase 
SELECT category_name, description
FROM categories
WHERE description NOT LIKE '_weet'; -- imp: sólo los weet que encuentre aislados 










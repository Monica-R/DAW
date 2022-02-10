DROP DATABASE IF EXISTS TiendaInformatica;
CREATE DATABASE TiendaInformatica CHARACTER SET utf8mb4;
USE TiendaInformatica;

CREATE TABLE Fabricante(
    CODIGO INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL
);

CREATE TABLE Producto(
    CODIGO INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    PRECIO DEC(5,2) NOT NULL,
    CODIGO_FABRICANTE INT(10) UNSIGNED NOT NULL,
    FOREIGN KEY (CODIGO_FABRICANTE) REFERENCES Fabricante(CODIGO)
);

INSERT INTO Fabricante (NOMBRE) VALUES
    ('Asus'),
    ('Lenovo'),
    ('Hewlett-Packard'),
    ('Samsung'),
    ('Seagate'),
    ('Crucial'),
    ('Gigabyte'),
    ('Huawei'),
    ('Xianmi');

INSERT INTO Producto (NOMBRE, PRECIO, CODIGO_FABRICANTE) VALUES
    ('Disco Duro',86.99,5),
    ('Memoria Ram DDR4 8GB',120,6),
    ('Disco SSD 1 TB',150.99,4),
    ('GeForce GTX 1050Ti',185,7),
    ('GeForce GTX 1080 Xtreme',755,6),
    ('Portátil Yoga 520',559,2),
    ('Portátil Ideap 320',444,2),
    ('Impresora HP Deskjet 3720',59.99,3),
    ('Impresora HP Laserjet Pro M26nw',180,3);


/******** CONSULTAS *******/
/* 1. Lista todas las columnas que hay en la tabla producto.*/
SELECT * FROM Producto;
+--------+---------------------------------+--------+-------------------+
| CODIGO | NOMBRE                          | PRECIO | CODIGO_FABRICANTE |
+--------+---------------------------------+--------+-------------------+
|      1 | Disco Duro                      |  86.99 |                 5 |
|      2 | Memoria Ram DDR4 8GB            | 120.00 |                 6 |
|      3 | Disco SSD 1 TB                  | 150.99 |                 4 |
|      4 | GeForce GTX 1050Ti              | 185.00 |                 7 |
|      5 | GeForce GTX 1080 Xtreme         | 755.00 |                 6 |
|      6 | Port?til Yoga 520               | 559.00 |                 2 |
|      7 | Port?til Ideap 320              | 444.00 |                 2 |
|      8 | Impresora HP Deskjet 3720       |  59.99 |                 3 |
|      9 | Impresora HP Laserjet Pro M26nw | 180.00 |                 3 |
+--------+---------------------------------+--------+-------------------+
/* 2. Lista los nombres y los precios de todos los productos de la tabla producto.*/
SELECT NOMBRE, PRECIO FROM Producto;
+---------------------------------+--------+
| NOMBRE                          | PRECIO |
+---------------------------------+--------+
| Disco Duro                      |  86.99 |
| Memoria Ram DDR4 8GB            | 120.00 |
| Disco SSD 1 TB                  | 150.99 |
| GeForce GTX 1050Ti              | 185.00 |
| GeForce GTX 1080 Xtreme         | 755.00 |
| Port?til Yoga 520               | 559.00 |
| Port?til Ideap 320              | 444.00 |
| Impresora HP Deskjet 3720       |  59.99 |
| Impresora HP Laserjet Pro M26nw | 180.00 |
+---------------------------------+--------+
/* 3. Lista los nombres y los precios de los productos de la tabla producto. 
convirtiéndolos en: mayúsculas, minúscula con alias.*/
SELECT UPPER(NOMBRE), LOWER(NOMBRE), PRECIO FROM Producto;
+---------------------------------+---------------------------------+--------+
| UPPER(NOMBRE)                   | LOWER(NOMBRE)                   | PRECIO |
+---------------------------------+---------------------------------+--------+
| DISCO DURO                      | disco duro                      |  86.99 |
| MEMORIA RAM DDR4 8GB            | memoria ram ddr4 8gb            | 120.00 |
| DISCO SSD 1 TB                  | disco ssd 1 tb                  | 150.99 |
| GEFORCE GTX 1050TI              | geforce gtx 1050ti              | 185.00 |
| GEFORCE GTX 1080 XTREME         | geforce gtx 1080 xtreme         | 755.00 |
| PORT?TIL YOGA 520               | port?til yoga 520               | 559.00 |
| PORT?TIL IDEAP 320              | port?til ideap 320              | 444.00 |
| IMPRESORA HP DESKJET 3720       | impresora hp deskjet 3720       |  59.99 |
| IMPRESORA HP LASERJET PRO M26NW | impresora hp laserjet pro m26nw | 180.00 |
+---------------------------------+---------------------------------+--------+
/* 4. Lista el nombre de todos los fabricantes con las dos primeros caracteres 
en mayúsculas, el valor del precios redondeándolo.*/
SELECT CONCAT(UPPER(SUBSTRING(NOMBRE, 1,2)), SUBSTRING(NOMBRE, 3)) FROM Fabricante;
/* 5. Lista el nombre y los precios de los productos truncando éstos, 
sin decimales.*/
SELECT NOMBRE, TRUNCATE(PRECIO, 0) 
FROM Producto;
+---------------------------------+---------------------+
| NOMBRE                          | TRUNCATE(PRECIO, 0) |
+---------------------------------+---------------------+
| Disco Duro                      |                  86 |
| Memoria Ram DDR4 8GB            |                 120 |
| Disco SSD 1 TB                  |                 150 |
| GeForce GTX 1050Ti              |                 185 |
| GeForce GTX 1080 Xtreme         |                 755 |
| Port?til Yoga 520               |                 559 |
| Port?til Ideap 320              |                 444 |
| Impresora HP Deskjet 3720       |                  59 |
| Impresora HP Laserjet Pro M26nw |                 180 |
+---------------------------------+---------------------+
/* 6. Lista el código de los fabricantes que tienen productos en la 
tabla producto sin repetirlos.*/
SELECT DISTINCT CODIGO_FABRICANTE 
FROM Producto;
+-------------------+
| CODIGO_FABRICANTE |
+-------------------+
|                 2 |
|                 3 |
|                 4 |
|                 5 |
|                 6 |
|                 7 |
+-------------------+
/* 7. Lista los nombres de los productos ordenados en primer lugar por el nombre 
de forma ascendente y en segundo lugar el precio de forma descendente.*/
SELECT NOMBRE 
FROM Producto
ORDER BY NOMBRE ASC, PRECIO DESC;
+---------------------------------+
| NOMBRE                          |
+---------------------------------+
| Disco Duro                      |
| Disco SSD 1 TB                  |
| GeForce GTX 1050Ti              |
| GeForce GTX 1080 Xtreme         |
| Impresora HP Deskjet 3720       |
| Impresora HP Laserjet Pro M26nw |
| Memoria Ram DDR4 8GB            |
| Port?til Ideap 320              |
| Port?til Yoga 520               |
+---------------------------------+
/* 8. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. 
La cuarta también se debe incluir. */
SELECT * FROM Fabricante LIMIT 2 OFFSET 3;
+--------+---------+
| CODIGO | NOMBRE  |
+--------+---------+
|      4 | Samsung |
|      5 | Seagate |
+--------+---------+
/* 9. Lista el nombre y el precio del producto más barato (order by y limit). */
SELECT NOMBRE, PRECIO 
FROM Producto
ORDER BY PRECIO
LIMIT 1;
+---------------------------+--------+
| NOMBRE                    | PRECIO |
+---------------------------+--------+
| Impresora HP Deskjet 3720 |  59.99 |
+---------------------------+--------+
/* 10. Lista el nombre de todos los productos de fabricante cuyo código de 
fabricante es igual a 2. */
SELECT * FROM Producto WHERE CODIGO_FABRICANTE LIKE 2;
+--------+--------------------+--------+-------------------+
| CODIGO | NOMBRE             | PRECIO | CODIGO_FABRICANTE |
+--------+--------------------+--------+-------------------+
|      6 | Portátil Yoga 520  | 559.00 |                 2 |
|      7 | Portátil Ideap 320 | 444.00 |                 2 |
+--------+--------------------+--------+-------------------+
/* 11. Lista el nombre de los productos que tienen un precio menor o igual a 120€. */
SELECT NOMBRE 
FROM Producto
WHERE PRECIO <= 120;
+---------------------------+
| NOMBRE                    |
+---------------------------+
| Disco Duro                |
| Memoria Ram DDR4 8GB      |
| Impresora HP Deskjet 3720 |
+---------------------------+
/* 12. Lista los productos que tengan un precio entre 60€ y 200€ utilizando el operador Between. */
SELECT * FROM Producto
WHERE PRECIO BETWEEN 60 AND 200;
+--------+---------------------------------+--------+-------------------+
| CODIGO | NOMBRE                          | PRECIO | CODIGO_FABRICANTE |
+--------+---------------------------------+--------+-------------------+
|      1 | Disco Duro                      |  86.99 |                 5 |
|      2 | Memoria Ram DDR4 8GB            | 120.00 |                 6 |
|      3 | Disco SSD 1 TB                  | 150.99 |                 4 |
|      4 | GeForce GTX 1050Ti              | 185.00 |                 7 |
|      9 | Impresora HP Laserjet Pro M26nw | 180.00 |                 3 |
+--------+---------------------------------+--------+-------------------+
/* 13. Lista todos los productos que tengan un precio superior a 200€ y que el código 
de fabricante sea igual a 6. */
SELECT * FROM Producto
WHERE PRECIO > 200 AND CODIGO_FABRICANTE LIKE 6;
+--------+-------------------------+--------+-------------------+
| CODIGO | NOMBRE                  | PRECIO | CODIGO_FABRICANTE |
+--------+-------------------------+--------+-------------------+
|      5 | GeForce GTX 1080 Xtreme | 755.00 |                 6 |
+--------+-------------------------+--------+-------------------+
/* 14. Lista todos los productos donde el código de fabricante sea 1,3 o 5.
Utilizando el operador IN. */
SELECT * FROM Producto
WHERE CODIGO_FABRICANTE IN (1,3,5);
+--------+---------------------------------+--------+-------------------+
| CODIGO | NOMBRE                          | PRECIO | CODIGO_FABRICANTE |
+--------+---------------------------------+--------+-------------------+
|      1 | Disco Duro                      |  86.99 |                 5 |
|      8 | Impresora HP Deskjet 3720       |  59.99 |                 3 |
|      9 | Impresora HP Laserjet Pro M26nw | 180.00 |                 3 |
+--------+---------------------------------+--------+-------------------+
/* 15. Lista el nombre y el precios de los productos en céntimos(habrá que multiplicarlo 
por 100 el valor del precio) Crea un alias para la columna que contiene el precio que se 
llame céntimos. */
SELECT NOMBRE, PRECIO * 100 AS CENTIMOS
FROM Producto;
+---------------------------------+----------+
| NOMBRE                          | CENTIMOS |
+---------------------------------+----------+
| Disco Duro                      |  8699.00 |
| Memoria Ram DDR4 8GB            | 12000.00 |
| Disco SSD 1 TB                  | 15099.00 |
| GeForce GTX 1050Ti              | 18500.00 |
| GeForce GTX 1080 Xtreme         | 75500.00 |
| Port?til Yoga 520               | 55900.00 |
| Port?til Ideap 320              | 44400.00 |
| Impresora HP Deskjet 3720       |  5999.00 |
| Impresora HP Laserjet Pro M26nw | 18000.00 |
+---------------------------------+----------+
/* 16. Lista los nombres de los fabricantes cuyo nombre termine por vocal e. */
SELECT NOMBRE 
FROM Fabricante
WHERE NOMBRE LIKE "%e";
+----------+
| NOMBRE   |
+----------+
| Seagate  |
| Gigabyte |
+----------+
/* 17. Devuelve una lista con el nombre de todos los productos que contienen la cadena 
Portátil en el nombre. */
SELECT * FROM Producto
WHERE NOMBRE LIKE "%Port?til%";
+--------+--------------------+--------+-------------------+
| CODIGO | NOMBRE             | PRECIO | CODIGO_FABRICANTE |
+--------+--------------------+--------+-------------------+
|      6 | Port?til Yoga 520  | 559.00 |                 2 |
|      7 | Port?til Ideap 320 | 444.00 |                 2 |
+--------+--------------------+--------+-------------------+
/* 18. Devuelve una lista con el nombre de todos lo productos que contienen la cadena 
portátil en el nombre y tienen un precio superior a 215€. */
SELECT * FROM Producto
WHERE NOMBRE LIKE "%Port?til%" AND PRECIO > 215;
+--------+--------------------+--------+-------------------+
| CODIGO | NOMBRE             | PRECIO | CODIGO_FABRICANTE |
+--------+--------------------+--------+-------------------+
|      6 | Port?til Yoga 520  | 559.00 |                 2 |
|      7 | Port?til Ideap 320 | 444.00 |                 2 |
+--------+--------------------+--------+-------------------+

/******** CONSULTAS MULTITABLA *********/

/* 19. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de 
todos los productos de la base de datos.*/
SELECT Producto.NOMBRE, Producto.PRECIO, Fabricante.NOMBRE 
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO;
+---------------------------------+--------+-----------------+
| NOMBRE                          | PRECIO | NOMBRE          |
+---------------------------------+--------+-----------------+
| Disco Duro                      |  86.99 | Seagate         |
| Memoria Ram DDR4 8GB            | 120.00 | Crucial         |
| Disco SSD 1 TB                  | 150.99 | Samsung         |
| GeForce GTX 1050Ti              | 185.00 | Gigabyte        |
| GeForce GTX 1080 Xtreme         | 755.00 | Crucial         |
| Port?til Yoga 520               | 559.00 | Lenovo          |
| Port?til Ideap 320              | 444.00 | Lenovo          |
| Impresora HP Deskjet 3720       |  59.99 | Hewlett-Packard |
| Impresora HP Laserjet Pro M26nw | 180.00 | Hewlett-Packard |
+---------------------------------+--------+-----------------+
/* 20. Devuelve el nombre del producto, su precio y el nombre de su fabricante, 
del producto más barato. */
SELECT Producto.NOMBRE, Producto.PRECIO, Fabricante.NOMBRE
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
AND Producto.PRECIO = 
    (SELECT MIN(Producto.PRECIO) 
    FROM Producto);
+---------------------------+--------+-----------------+
| NOMBRE                    | PRECIO | NOMBRE          |
+---------------------------+--------+-----------------+
| Impresora HP Deskjet 3720 |  59.99 | Hewlett-Packard |
+---------------------------+--------+-----------------+
/* 21. Devuelve una lista de todos los productos del fabricante lenovo. */
SELECT Producto.*, Fabricante.NOMBRE 
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
AND Fabricante.NOMBRE LIKE "Lenovo";
+--------+--------------------+--------+-------------------+--------+
| CODIGO | NOMBRE             | PRECIO | CODIGO_FABRICANTE | NOMBRE |
+--------+--------------------+--------+-------------------+--------+
|      6 | Port?til Yoga 520  | 559.00 |                 2 | Lenovo |
|      7 | Port?til Ideap 320 | 444.00 |                 2 | Lenovo |
+--------+--------------------+--------+-------------------+--------+
/* 22. Devuelve una lista de todos los productos del fabricante Crucial que 
tengan un precio mayor que 200€. */
SELECT Producto.NOMBRE, Producto.PRECIO, Fabricante.NOMBRE
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
AND Producto.PRECIO > 200
AND Producto.NOMBRE LIKE "Crucial";
/* 23. Devuelve un listado con todos los productos de los fabricante Asus, 
Hewlett-Packard. */
SELECT Producto.*, Fabricante.NOMBRE
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO -- falta algo;

/* 24. Devuelve un listado con el nombre y el precio de todos los productos 
de los fabricantes cuyo nombre termine por la vocal e. */
SELECT Producto.NOMBRE, Producto.PRECIO 
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
AND Fabricante.NOMBRE LIKE "%e";
+--------------------+--------+
| NOMBRE             | PRECIO |
+--------------------+--------+
| Disco Duro         |  86.99 |
| GeForce GTX 1050Ti | 185.00 |
+--------------------+--------+
/* 25. Devuelve un listado con el nombre del producto, precio y nombre de 
fabricante de todos los productos que tengan un precio mayor o igual a 180€. 
Ordene el resultado en primer lugar por el precio(en orden descendente) y en 
segundo lugar por el  nombre(en orden descendente). */
SELECT Producto.NOMBRE, Producto.PRECIO, Fabricante.NOMBRE 
FROM Producto, Fabricante
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
AND Producto.PRECIO >= 180 ORDER BY Producto.PRECIO DESC, Producto.NOMBRE DESC;
+---------------------------------+--------+-----------------+
| NOMBRE                          | PRECIO | NOMBRE          |
+---------------------------------+--------+-----------------+
| GeForce GTX 1080 Xtreme         | 755.00 | Crucial         |
| Port?til Yoga 520               | 559.00 | Lenovo          |
| Port?til Ideap 320              | 444.00 | Lenovo          |
| GeForce GTX 1050Ti              | 185.00 | Gigabyte        |
| Impresora HP Laserjet Pro M26nw | 180.00 | Hewlett-Packard |
+---------------------------------+--------+-----------------+
SELECT Producto.NOMBRE, Producto.PRECIO, Fabricante.NOMBRE 
FROM Producto INNER JOIN Fabricante
ON Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
WHERE Producto.PRECIO >= 180 ORDER BY Producto.PRECIO DESC, Producto.NOMBRE DESC;
-- EL AND ES OPCIONAL
/* 26. Devuelve un listado con el código y el nombre del fabricante, solamente 
de aquellos fabricantes que tienen productos asociados en la base de datos. */
SELECT Fabricante.CODIGO, Fabricante.NOMBRE
FROM Fabricante, Producto
WHERE Producto.CODIGO_FABRICANTE = Fabricante.CODIGO;
+--------+-----------------+
| CODIGO | NOMBRE          |
+--------+-----------------+
|      2 | Lenovo          |
|      2 | Lenovo          |
|      3 | Hewlett-Packard |
|      3 | Hewlett-Packard |
|      4 | Samsung         |
|      5 | Seagate         |
|      6 | Crucial         |
|      6 | Crucial         |
|      7 | Gigabyte        |
+--------+-----------------+

/******** CONSULTAS MULTITABLA - COMPOSICIÓN EXTERNA (LEFT/RIGHT/INNER JOIN) ********/

/* 27. Devuelve un listado de todos los fabricantes que existen en la base 
de datos, junto con los productos que tiene cada uno de ellos. El listado 
deberá mostrar también aquellos fabricantes que no tienen productos asociados. */
SELECT Fabricante.NOMBRE, Producto.NOMBRE 
FROM Fabricante LEFT JOIN Producto
ON Producto.CODIGO_FABRICANTE = Fabricante.CODIGO;
+-----------------+---------------------------------+
| NOMBRE          | NOMBRE                          |
+-----------------+---------------------------------+
| Asus            | NULL                            |
| Lenovo          | Port?til Yoga 520               |
| Lenovo          | Port?til Ideap 320              |
| Hewlett-Packard | Impresora HP Deskjet 3720       |
| Hewlett-Packard | Impresora HP Laserjet Pro M26nw |
| Samsung         | Disco SSD 1 TB                  |
| Seagate         | Disco Duro                      |
| Crucial         | Memoria Ram DDR4 8GB            |
| Crucial         | GeForce GTX 1080 Xtreme         |
| Gigabyte        | GeForce GTX 1050Ti              |
| Huawei          | NULL                            |
| Xianmi          | NULL                            |
+-----------------+---------------------------------+
/* 28. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no 
tienen producto asociados. */
SELECT Fabricante.NOMBRE
FROM Fabricante LEFT JOIN Producto
ON Producto.CODIGO_FABRICANTE = Fabricante.CODIGO
WHERE Producto.NOMBRE IS NULL;
+--------+
| NOMBRE |
+--------+
| Asus   |
| Huawei |
| Xianmi |
+--------+

/* 29. ¿Pueden existir productos que no estén relacionados con un fabricante? 
Justifique su respuesta. */ -- SÍ

/************* CONSULTAS RESUMEN ************/
-- Las consultas resumen hacen referencia a las consultas de cálculo dependiendo de la situación:
-- sin son simples, o si son compuestas (join o producto cartesiano).
/* 30. Calcula el número total de productos que hay en la tabla de productos. */
SELECT COUNT(Producto.CODIGO) FROM Producto;
+------------------------+
| COUNT(Producto.CODIGO) |
+------------------------+
|                      9 |
+------------------------+
/* 31. Calcula el número total de fabricantes que hay en la tabla fabricante. */
SELECT
/* 32. Calcula el número de valores distintos de código de fabricante aparecen 
en la tabla productos. */
SELECT COUNT(DISTINCT Producto.CODIGO_FABRICANTE) FROM Producto;

/* 33.*/
/* 34.*/
/* 35.*/
/* 36.*/
/* 37.*/
/* 38.*/
/* 39.*/
/* 40.*/
/* 41.*/
/* 42.*/
/* 43.*/
/* 44.*/
/* 45.*/
/* 46.*/
/* 47.*/
/* 48.*/
/* 49.*/
/* 50.*/
/* 51.*/
/* 52.*/
/* 53.*/
/* 54.*/
/* 55.*/
/* 56.*/
/* 57.*/
/* 58.*/
/* 59.*/
/* 60.*/


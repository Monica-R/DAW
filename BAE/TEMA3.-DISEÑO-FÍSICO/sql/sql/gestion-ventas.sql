/******* CREAMOS BASE DE DATOS *******/
DROP DATABASE IF EXISTS Ventas;
CREATE DATABASE Ventas CHARACTER SET utf8mb4;
USE Ventas;

/***** CREAMOS LAS TABLAS *****/

CREATE TABLE Cliente(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    APELLIDO1 VARCHAR(100) NOT NULL,
    APELLIDO2 VARCHAR(100),
    CIUDAD VARCHAR(10),
    CATEGORIA INT UNSIGNED
);

CREATE TABLE Comercial(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    APELLIDO1 VARCHAR(100) NOT NULL,
    APELLIDO2 VARCHAR(100),
    COMISION FLOAT
);

CREATE TABLE Pedido(
    ID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TOTAL DOUBLE NOT NULL,
    FECHA DATE,
    ID_CLIENTE INT UNSIGNED NOT NULL,
    ID_COMERCIAL INT UNSIGNED NOT NULL,
    FOREIGN KEY (ID_CLIENTE) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_COMERCIAL) REFERENCES Comercial(ID)
);

/****** INSERTAMOS LOS VALORES ******/

INSERT INTO Cliente (NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, CATEGORIA) VALUES
    ('Aaron','Rivero','Gomez','Almeria',100),
    ('Adela','Salas','Diaz','Granada',200),
    ('Adolfo','Rubio','Flores','Sevilla',Null),
    ('Adrian','Suarez',Null,'Jaen',300),
    ('Marcos','Loyola','Mendez','Almeria',200),
    ('Maria','Santana','Moreno','Cadiz',100),
    ('Pilar','Ruiz',Null,'Sevilla',300),
    ('Pepe','Ruiz','Santana','Huelva',200),
    ('Guillermo','Lopez','Gomez','Granada',225),
    ('Daniel','Santana','Loyola','Sevilla',125);

INSERT INTO Comercial (NOMBRE, APELLIDO1, APELLIDO2, COMISION) VALUES
    ('Daniel','Saez','Vega',0.15),
    ('Juan','Gomez','Lopez',0.13),
    ('Diego','Gomez','Salas',0.11),
    ('Marta','Herrera','Gil',0.14),
    ('Antonio','Carretero','Ortega',0.12),
    ('Manuel','Dominguez','Hernandez',0.13),
    ('Antonio','Vega','Hernandez',0.11),
    ('Alfredo','Ruiz','Flores',0.05);

INSERT INTO Pedido (TOTAL, FECHA, ID_CLIENTE, ID_COMERCIAL) VALUES
    (150.5,'2017-10-05',5,2),
    (270.65,'2016-09-10',1,5),
    (65.26,'2017-10-05',2,1),
    (110.5,'2016-08-17',8,3),
    (948.5,'2017-09-10',5,2),
    (2400.6,'2016-07-27',7,1),
    (5760,'2015-09-10',2,1),
    (1983.43,'2017-10-10',4,6),
    (2480.4,'2016-10-10',8,3),
    (250.45,'2015-06-27',8,2),
    (75.29,'2016-08-17',3,7),
    (3045.6,'2017-04-25',2,1),
    (545.75,'2019-01-25',6,1),
    (145.82,'2017-02-02',6,1),
    (370.85,'2019-03-11',1,5),
    (2389.23,'2019-03-11',1,5);


/******* CONSULTAS *******/

/* 1. Devuelve un listado con todos los pedidos que se ha realizado. Los pedidos deben estar ordenados 
por la fecha de realización, mostrando en primer lugar los pedidos más recientes */
SELECT * FROM Pedido ORDER BY FECHA DESC;
+----+---------+------------+------------+--------------+
| ID | TOTAL   | FECHA      | ID_CLIENTE | ID_COMERCIAL |
+----+---------+------------+------------+--------------+
| 16 | 2389.23 | 2019-03-11 |          1 |            5 |
| 15 |  370.85 | 2019-03-11 |          1 |            5 |
| 13 |  545.75 | 2019-01-25 |          6 |            1 |
|  8 | 1983.43 | 2017-10-10 |          4 |            6 |
|  1 |   150.5 | 2017-10-05 |          5 |            2 |
|  3 |   65.26 | 2017-10-05 |          2 |            1 |
|  5 |   948.5 | 2017-09-10 |          5 |            2 |
| 12 |  3045.6 | 2017-04-25 |          2 |            1 |
| 14 |  145.82 | 2017-02-02 |          6 |            1 |
|  9 |  2480.4 | 2016-10-10 |          8 |            3 |
|  2 |  270.65 | 2016-09-10 |          1 |            5 |
| 11 |   75.29 | 2016-08-17 |          3 |            7 |
|  4 |   110.5 | 2016-08-17 |          8 |            3 |
|  6 |  2400.6 | 2016-07-27 |          7 |            1 |
|  7 |    5760 | 2015-09-10 |          2 |            1 |
| 10 |  250.45 | 2015-06-27 |          8 |            2 |
+----+---------+------------+------------+--------------+
/* 2. Devuelve todos los datos de los dos pedidos de mayor valor. */
SELECT * FROM Pedido ORDER BY TOTAL DESC LIMIT 2;
+----+--------+------------+------------+--------------+
| ID | TOTAL  | FECHA      | ID_CLIENTE | ID_COMERCIAL |
+----+--------+------------+------------+--------------+
|  7 |   5760 | 2015-09-10 |          2 |            1 |
| 12 | 3045.6 | 2017-04-25 |          2 |            1 |
+----+--------+------------+------------+--------------+
/* 3. Devuelve un listado con los identificadores de los clientes que han 
realizado algún pedido. Tenga en cuenta que no se debe mostrar identificadores 
que estén repetidos. */
SELECT DISTINCT ID_CLIENTE FROM Pedido;
+------------+
| ID_CLIENTE |
+------------+
|          1 |
|          2 |
|          3 |
|          4 |
|          5 |
|          6 |
|          7 |
|          8 |
+------------+
/* 4. Devuelve un listado de todos los pedidos que se realizaron durante el 
año 2017, cuya cantidad sea superior a 500€. */
SELECT * FROM Pedido WHERE (FECHA BETWEEN "2017-01-01" AND "2017-12-01") AND (TOTAL > 500);
+----+---------+------------+------------+--------------+
| ID | TOTAL   | FECHA      | ID_CLIENTE | ID_COMERCIAL |
+----+---------+------------+------------+--------------+
|  5 |   948.5 | 2017-09-10 |          5 |            2 |
|  8 | 1983.43 | 2017-10-10 |          4 |            6 |
| 12 |  3045.6 | 2017-04-25 |          2 |            1 |
+----+---------+------------+------------+--------------+
/* 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11. */
SELECT NOMBRE, APELLIDO1, APELLIDO2 FROM Comercial WHERE COMISION BETWEEN 0.05 AND 0.11;
+---------+-----------+-----------+
| NOMBRE  | APELLIDO1 | APELLIDO2 |
+---------+-----------+-----------+
| Diego   | Gomez     | Salas     |
| Antonio | Vega      | Hernandez |
| Alfredo | Ruiz      | Flores    |
+---------+-----------+-----------+
/* 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial. */
SELECT MAX(COMISION) AS VALOR_MAXIMO_COMISION FROM Comercial;
+-----------------------+
| VALOR_MAXIMO_COMISION |
+-----------------------+
|                  0.15 |
+-----------------------+
/* 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes 
cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente 
por apellidos y nombre. */
SELECT ID, NOMBRE, APELLIDO1 FROM Cliente WHERE APELLIDO2 IS NOT NULL ORDER BY APELLIDO1, APELLIDO2, NOMBRE;
+----+-----------+-----------+
| ID | NOMBRE    | APELLIDO1 |
+----+-----------+-----------+
|  9 | Guillermo | Lopez     |
|  5 | Marcos    | Loyola    |
|  1 | Aaron     | Rivero    |
|  3 | Adolfo    | Rubio     |
|  8 | Pepe      | Ruiz      |
|  2 | Adela     | Salas     |
| 10 | Daniel    | Santana   |
|  6 | Maria     | Santana   |
+----+-----------+-----------+
/* 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan 
por n y también los nombres que empiezan por p. El listado deberá estar ordenado alfabéticamente. */
SELECT NOMBRE FROM Cliente WHERE NOMBRE LIKE "A%n" OR NOMBRE LIKE "P%" ORDER BY NOMBRE;
+--------+
| NOMBRE |
+--------+
| Aaron  |
| Adrian |
| Pepe   |
| Pilar  |
+--------+
/* 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. 
El listado deberá estar ordenado alfabéticamente. */
SELECT NOMBRE FROM Cliente WHERE NOMBRE NOT LIKE "A%" ORDER BY NOMBRE;
+-----------+
| NOMBRE    |
+-----------+
| Daniel    |
| Guillermo |
| Marcos    |
| Maria     |
| Pepe      |
| Pilar     |
+-----------+

/**** consultas multitabla ****/

/* 10. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han 
realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los 
elementos repetidos. */
SELECT DISTINCT NOMBRE.Cliente, APELLIDO1.Cliente, APELLIDO2.Cliente 
FROM Cliente, Pedido WHERE ID.Cliente = ID_CLIENTE.Pedido; 

SELECT DISTINCT Cliente.NOMBRE, Cliente.APELLIDO1, Cliente.APELLIDO2 
FROM Pedido INNER JOIN Cliente
ON Cliente.ID = Pedido.ID_CLIENTE
ORDER BY Cliente.NOMBRE;
+--------+-----------+-----------+
| NOMBRE | APELLIDO1 | APELLIDO2 |
+--------+-----------+-----------+
| Aaron  | Rivero    | Gomez     |
| Adela  | Salas     | Diaz      |
| Adolfo | Rubio     | Flores    |
| Adrian | Suarez    | NULL      |
| Marcos | Loyola    | Mendez    |
| Maria  | Santana   | Moreno    |
| Pepe   | Ruiz      | Santana   |
| Pilar  | Ruiz      | NULL      |
+--------+-----------+-----------+

/* 11. Devuelve un listado que muestre todos los pedidos que ha realizado cada 
cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. 
El listado debe mostrar los datos de los clientes ordenados alfabéticamente.*/
SELECT Cliente.NOMBRE, Cliente.APELLIDO1, Pedido.* -- AQUÍ
FROM Pedido INNER JOIN Cliente
ON Pedido.ID_CLIENTE = Cliente.ID
ORDER BY Cliente.NOMBRE;
+--------+-----------+----+---------+------------+------------+--------------+
| NOMBRE | APELLIDO1 | ID | TOTAL   | FECHA      | ID_CLIENTE | ID_COMERCIAL |
+--------+-----------+----+---------+------------+------------+--------------+
| Aaron  | Rivero    |  2 |  270.65 | 2016-09-10 |          1 |            5 |
| Aaron  | Rivero    | 15 |  370.85 | 2019-03-11 |          1 |            5 |
| Aaron  | Rivero    | 16 | 2389.23 | 2019-03-11 |          1 |            5 |
| Adela  | Salas     |  3 |   65.26 | 2017-10-05 |          2 |            1 |
| Adela  | Salas     |  7 |    5760 | 2015-09-10 |          2 |            1 |
| Adela  | Salas     | 12 |  3045.6 | 2017-04-25 |          2 |            1 |
| Adolfo | Rubio     | 11 |   75.29 | 2016-08-17 |          3 |            7 |
| Adrian | Suarez    |  8 | 1983.43 | 2017-10-10 |          4 |            6 |
| Marcos | Loyola    |  1 |   150.5 | 2017-10-05 |          5 |            2 |
| Marcos | Loyola    |  5 |   948.5 | 2017-09-10 |          5 |            2 |
| Maria  | Santana   | 13 |  545.75 | 2019-01-25 |          6 |            1 |
| Maria  | Santana   | 14 |  145.82 | 2017-02-02 |          6 |            1 |
| Pepe   | Ruiz      |  4 |   110.5 | 2016-08-17 |          8 |            3 |
| Pepe   | Ruiz      |  9 |  2480.4 | 2016-10-10 |          8 |            3 |
| Pepe   | Ruiz      | 10 |  250.45 | 2015-06-27 |          8 |            2 |
| Pilar  | Ruiz      |  6 |  2400.6 | 2016-07-27 |          7 |            1 |
+--------+-----------+----+---------+------------+------------+--------------+

/* 12. Devuelve un listado que muestre todos los clientes, con todos los pedidos 
que han realizado y con los datos de los comerciales asociados a cada pedido. */
SELECT Cliente.*, Pedido.TOTAL, Pedido.FECHA, Comercial.*
FROM Pedido INNER JOIN Cliente
ON Cliente.ID = Pedido.ID_CLIENTE

/* 13. */
SELECT Cliente.NOMBRE
FROM Pedido INNER JOIN Cliente
ON Cliente.ID = Pedido.ID_CLIENTE
WHERE YEAR(Pedido.FECHA) = 2017 AND Pedido.TOTAL BETWEEN 300 AND 1000;

/* 14. */
SELECT DISTINCT Comercial.NOMBRE, Comercial.APELLIDO1, Comercial.APELLIDO2
FROM 

/* 18. */
SELECT Comercial.*
FROM Comercial
WHERE Comercial.ID NOT IN (
    SELECT Pedido.ID_COMERCIAL
    FROM Pedido
);
+----+---------+-----------+-----------+----------+
| ID | NOMBRE  | APELLIDO1 | APELLIDO2 | COMISION |
+----+---------+-----------+-----------+----------+
|  4 | Marta   | Herrera   | Gil       |     0.14 |
|  8 | Alfredo | Ruiz      | Flores    |     0.05 |
+----+---------+-----------+-----------+----------+

/* 19. */
SELECT ROUND(SUM(Pedido.TOTAL))
FROM Pedido;
+--------------------------+
| ROUND(SUM(Pedido.TOTAL)) |
+--------------------------+
|                    20993 |
+--------------------------+

SELECT TRUNCATE(SUM(Pedido.TOTAL))
FROM Pedido;

/* 20. */
SELECT ROUND(AVG(Pedido.TOTAL), 1)
FROM Pedido;
+-----------------------------+
| ROUND(AVG(Pedido.TOTAL), 1) |
+-----------------------------+
|                      1312.1 |
+-----------------------------+

/* 21. */

/* 25. */
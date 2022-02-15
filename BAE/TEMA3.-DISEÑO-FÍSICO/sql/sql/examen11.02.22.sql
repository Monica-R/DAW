DROP DATABASE IF EXISTS Academia;
CREATE DATABASE Academia CHARACTER SET utf8mb4;
USE Academia;

CREATE TABLE Oposiciones(
    CODIGO INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    FECHA_EXAM DATE,
    ORGANISMO VARCHAR(50),
    PLAZAS INT UNSIGNED,
    CATEGORIA INT
);

CREATE TABLE Profesores(
    DNI VARCHAR(9) PRIMARY KEY,
    NOMBRE VARCHAR(30),
    DIRECCION VARCHAR(30),
    TITULO VARCHAR(30),
    SUELDO INT
);

CREATE TABLE Cursos(
    CODIGO_CURSO INT PRIMARY KEY,
    NOMBRE_CURSO VARCHAR(50),
    DNI_PROFESOR VARCHAR(9),
    MAX_ALUMNOS INT(2),
    FECHA_INI DATE,
    NUM_HORAS INT(2),
    COD_OPOSICION INT,
    FOREIGN KEY (DNI_PROFESOR) REFERENCES Profesores(DNI),
    FOREIGN KEY (COD_OPOSICION) REFERENCES Oposiciones(CODIGO)
);

/*Las tablas completas*/
+--------+--------------------------------+------------+---------------------------------+--------+-----------+
| CODIGO | NOMBRE                         | FECHA_EXAM | ORGANISMO                       | PLAZAS | CATEGORIA |
+--------+--------------------------------+------------+---------------------------------+--------+-----------+
|     10 | Atencion al publico            | 2015-10-10 | Ayuntamiento de Las Palmas      |      5 |         5 |
|     12 | Limpiador                      | 2015-12-20 | Ayuntamiento de Las Palmas      |      8 |         6 |
|     22 | Mantenimiento de instalaciones | 2015-07-03 | Cabildo Insular de Gran Canaria |      3 |         4 |
|     33 | Desarrollador Web              | 2015-08-05 | Ayuntamiento de Telde           |      8 |         4 |
|     35 | Monitor                        | 2015-09-15 | Ayuntamiento de Las Palmas      |      4 |        14 |
+--------+--------------------------------+------------+---------------------------------+--------+-----------+

+-----------+----------------+------------+----------------+--------+
| DNI       | NOMBRE         | DIRECCION  | TITULO         | SUELDO |
+-----------+----------------+------------+----------------+--------+
| 12345678A | Juan Santana   | Las Palmas | CFGS Electrico |   2100 |
| 12345678B | Pedro Moreno   | Las Palmas | CFGS Mecanica  |   2100 |
| 12345678C | Ana Garcia     | Telde      | CFGS DAW       |   3100 |
| 12345678D | Sonia Valderon | Telde      | CFGS Madera    |   2200 |
+-----------+----------------+------------+----------------+--------+

+--------------+-----------------------------+--------------+-------------+------------+-----------+---------------+
| CODIGO_CURSO | NOMBRE_CURSO                | DNI_PROFESOR | MAX_ALUMNOS | FECHA_INI  | NUM_HORAS | COD_OPOSICION |
+--------------+-----------------------------+--------------+-------------+------------+-----------+---------------+
|            1 | La jardineria del municipio | 12345678B    |          20 | 2015-06-15 |        30 |            12 |
|            2 | Electricidad                | 12345678A    |          20 | 2015-12-06 |        25 |            22 |
|            3 | Desarrollo Web              | 12345678C    |          20 | 2015-08-02 |        30 |            33 |
|            4 | Atencion telefonica         | 12345678D    |          20 | 2015-09-05 |        15 |            10 |
|            5 | Desarrollo Web II           | 12345678C    |          20 | 2015-08-02 |        30 |            33 |
+--------------+-----------------------------+--------------+-------------+------------+-----------+---------------+

/* INSERTAMOS LOS REGISTROS */

INSERT INTO Oposiciones VALUES
    (10,'Atencion al publico','2015-10-10','Ayuntamiento de Las Palmas',5,5),
    (12,'Limpiador','2015-12-20','Ayuntamiento de Las Palmas',8,6),
    (22,'Mantenimiento de instalaciones','2015-07-03','Cabildo Insular de Gran Canaria',3,4),
    (33,'Desarrollador Web','2015-08-05','Ayuntamiento de Telde',8,4),
    (35,'Monitor','2015-09-15','Ayuntamiento de Las Palmas',4,14);

INSERT INTO Profesores VALUES
    ('12345678A','Juan Santana','Las Palmas','CFGS Electrico', 2100),
    ('12345678B','Pedro Moreno','Las Palmas','CFGS Mecanica', 2100),
    ('12345678C','Ana Garcia','Telde','CFGS DAW', 3100),
    ('12345678D','Sonia Valderon','Telde','CFGS Madera', 2200);

INSERT INTO Cursos VALUES
    (1,'La jardineria del municipio','12345678B',20,'2015-06-15',30,12),
    (2,'Electricidad','12345678A',20,'2015-12-06',25,22),
    (3,'Desarrollo Web','12345678C',20,'2015-08-02',30,33),
    (4,'Atencion telefonica','12345678D',20,'2015-09-05',15,10),
    (5,'Desarrollo Web II','12345678C',20,'2015-08-02',30,33);


/* CONSULTAS */

/* 1. Muestra cuantos cursos son impartidos por profesores cuya formación es CFGS DAW.*/
SELECT COUNT(Cursos.CODIGO_CURSO) AS "Numero de cursos del CFGS" 
FROM Cursos, Profesores
WHERE Cursos.DNI_PROFESOR = Profesores.DNI
AND Profesores.TITULO LIKE "CFGS DAW";
+---------------------------+
| Numero de cursos del CFGS |
+---------------------------+
|                         2 |
+---------------------------+

/* 2. Lista el nombre del organismo, número de plazas que convoca y fecha de la primera
oposición que convoca de aquellos organismos que oferten más de 3 plazas. */
SELECT NOMBRE, ORGANISMO, FECHA_EXAM, PLAZAS 
FROM Oposiciones
WHERE PLAZAS > 3
GROUP BY NOMBRE;
+---------------------+----------------------------+------------+--------+
| NOMBRE              | ORGANISMO                  | FECHA_EXAM | PLAZAS |
+---------------------+----------------------------+------------+--------+
| Atencion al publico | Ayuntamiento de Las Palmas | 2015-10-10 |      5 |
| Desarrollador Web   | Ayuntamiento de Telde      | 2015-08-05 |      8 |
| Limpiador           | Ayuntamiento de Las Palmas | 2015-12-20 |      8 |
| Monitor             | Ayuntamiento de Las Palmas | 2015-09-15 |      4 |
+---------------------+----------------------------+------------+--------+

/* 3.  Lista la oposición, curso que lo prepara y su fecha de impartición y numero de plazas. */
SELECT Oposiciones.CODIGO, Oposiciones.NOMBRE, Oposiciones.ORGANISMO, Cursos.NOMBRE_CURSO, Oposiciones.FECHA_EXAM, Oposiciones.PLAZAS
FROM Oposiciones
INNER JOIN Cursos
ON  Oposiciones.CODIGO = Cursos.COD_OPOSICION;
+--------+--------------------------------+---------------------------------+-----------------------------+------------+--------+
| CODIGO | NOMBRE                         | ORGANISMO                       | NOMBRE_CURSO                | FECHA_EXAM | PLAZAS |
+--------+--------------------------------+---------------------------------+-----------------------------+------------+--------+
|     12 | Limpiador                      | Ayuntamiento de Las Palmas      | La jardineria del municipio | 2015-12-20 |      8 |
|     22 | Mantenimiento de instalaciones | Cabildo Insular de Gran Canaria | Electricidad                | 2015-07-03 |      3 |
|     33 | Desarrollador Web              | Ayuntamiento de Telde           | Desarrollo Web              | 2015-08-05 |      8 |
|     10 | Atencion al publico            | Ayuntamiento de Las Palmas      | Atencion telefonica         | 2015-10-10 |      5 |
|     33 | Desarrollador Web              | Ayuntamiento de Telde           | Desarrollo Web II           | 2015-08-05 |      8 |
+--------+--------------------------------+---------------------------------+-----------------------------+------------+--------+

/* 4. Indica cada oposición su curso y el nombre del profesor */
SELECT Oposiciones.NOMBRE AS "Nombre de la oposicion", Cursos.NOMBRE_CURSO AS "Nombre del curso preparatorio", Profesores.NOMBRE AS "Nombre del profesor"
FROM Oposiciones
    INNER JOIN Profesores ON Profesores.DNI = Cursos.DNI_PROFESOR
    INNER JOIN Cursos ON Cursos.COD_OPOSICION = Oposiciones.CODIGO;

SELECT Oposiciones.NOMBRE AS "Nombre de la oposicion", Cursos.NOMBRE_CURSO AS "Nombre del curso preparatorio", Profesores.NOMBRE AS "Nombre del profesor"
FROM Oposiciones, Profesores, Cursos
WHERE Profesores.DNI = Cursos.DNI_PROFESOR
AND Cursos.COD_OPOSICION = Oposiciones.CODIGO;

+--------------------------------+-------------------------------+---------------------+
| Nombre de la oposicion         | Nombre del curso preparatorio | Nombre del profesor |
+--------------------------------+-------------------------------+---------------------+
| Mantenimiento de instalaciones | Electricidad                  | Juan Santana        |
| Limpiador                      | La jardineria del municipio   | Pedro Moreno        |
| Desarrollador Web              | Desarrollo Web                | Ana Garcia          |
| Desarrollador Web              | Desarrollo Web II             | Ana Garcia          |
| Atencion al publico            | Atencion telefonica           | Sonia Valderon      |
+--------------------------------+-------------------------------+---------------------+

/* 5. Lista el curso de mayor número de horas, su profesor y número máximo de max de alumnos.*/
SELECT Cursos.NOMBRE_CURSO AS "Nombre del curso", MAX(Cursos.NUM_HORAS) AS "Numero maximo de horas", Cursos.MAX_ALUMNOS AS "Numero maximo de alumnos", Profesores.NOMBRE AS "Nombre del profesor"
FROM Cursos, Profesores
WHERE Cursos.DNI_PROFESOR = Profesores.DNI;

/* 6. Lista los datos de los profesores que no tienen asignado ningún curso. */

/* 7. Saca un listado de cursos cuyo profesor gane igual o más que la media de sueldo de todos los profesores*/
SELECT Cursos.CODIGO_CURSO, Cursos.NOMBRE_CURSO, Profesores.DNI, Profesores.NOMBRE
FROM Cursos, Profesores
WHERE Cursos.DNI_PROFESOR = Profesores.DNI
AND Profesores.SUELDO > (SELECT AVG(SUELDO) FROM Profesores);

SELECT Cursos.CODIGO_CURSO, Cursos.NOMBRE_CURSO, Profesores.DNI, Profesores.NOMBRE
FROM Cursos
LEFT JOIN Profesores
ON Cursos.DNI_PROFESOR = Profesores.DNI
WHERE Profesores.SUELDO > (SELECT AVG(Profesores.SUELDO) FROM Profesores);
+--------------+-------------------+-----------+------------+
| CODIGO_CURSO | NOMBRE_CURSO      | DNI       | NOMBRE     |
+--------------+-------------------+-----------+------------+
|            3 | Desarrollo Web    | 12345678C | Ana Garcia |
|            5 | Desarrollo Web II | 12345678C | Ana Garcia |
+--------------+-------------------+-----------+------------+

/* 8.  Obtén los datos de las oposiciones convocadas entre los días 10 y 20. */
SELECT CODIGO, NOMBRE, ORGANISMO, FECHA_EXAM FROM Oposiciones
WHERE DAY(FECHA_EXAM) BETWEEN 10 AND 20;
+--------+---------------------+----------------------------+------------+
| CODIGO | NOMBRE              | ORGANISMO                  | FECHA_EXAM |
+--------+---------------------+----------------------------+------------+
|     10 | Atencion al publico | Ayuntamiento de Las Palmas | 2015-10-10 |
|     12 | Limpiador           | Ayuntamiento de Las Palmas | 2015-12-20 |
|     35 | Monitor             | Ayuntamiento de Las Palmas | 2015-09-15 |
+--------+---------------------+----------------------------+------------+

/* 9. Indica el usuario y fecha de conexión. */
SELECT USER() AS "Usuario", CURRENT_DATE() AS "Fecha de conexion";
+----------------+-------------------+
| Usuario        | Fecha de conexion |
+----------------+-------------------+
| root@localhost | 2022-02-15        |
+----------------+-------------------+
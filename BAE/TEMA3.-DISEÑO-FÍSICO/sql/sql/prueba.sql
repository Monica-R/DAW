-- CONSULTAS SQL - Y EJERCICIOS

DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
use instituto;
CREATE TABLE alumno(
    id int c auto_increment primary key,
    nombre varchar(100) not null,
    apellido1 varchar(100) not null,
    apellido2 varchar(100),
    fecha_nacimiento date not null,
    es_repetidor enum('si','no') not null,
    telefono varchar(9)
);

INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Maria', 'Sanchez','Perez','1990/12/01','no',NULL);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Juan', 'Saez','Vega','1998/04/02','no',618253876);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Pepa', 'Ramirez','Gea','1988/01/02','no',NUll);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Lucia', 'Sanchez','Ortega','1993/06/13','si',678516294);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Paco', 'Martinez','Lopez','1995/11/24','no',692735409);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Irene', 'Gutierrez','Sanchez','1991/03/28','si',NULL);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Cristina', 'Fernandez','Ramirez','1996/09/17','no',628349590);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Antonio', 'Carretero','Ortega','1999/07/08','no',612345633);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Manuel', 'Domínguez','Hernandez','1998/02/03','no',NULL);
INSERT INTO alumno (nombre,apellido1,apellido2,fecha_nacimiento,es_repetidor,telefono) VALUES ('Daniel', 'Moreno','Ruiz','1998/02/03','no',NULL);

-- as → refiriéndose a nombrar una tabla hecha con consultas --

SELECT * FROM alumno WHERE apellido1 = 'Martinez';
SELECT * FROM alumno WHERE id = 9;
SELECT nombre, fecha_nacimiento FROM alumno WHERE fecha_nacimiento > "1997-01-01";
SELECT * FROM alumno WHERE telefono = 692735409;
SELECT * FROM alumno WHERE es_repetidor = 'si';
SELECT * FROM alumno WHERE es_repetidor = 'no';
SELECT nombre, fecha_nacimiento FROM alumno WHERE fecha_nacimiento < "1997-01-01";
SELECT nombre, fecha_nacimiento FROM alumno WHERE fecha_nacimiento = 1998;
SELECT nombre, fecha_nacimiento FROM alumno WHERE year(fecha_nacimiento) = 1998; -- otra forma --

SELECT nombre, fecha_nacimiento FROM alumno WHERE year(fecha_nacimiento) != 1998;
SELECT MONTHNAME(fecha_nacimiento) FROM alumno WHERE fecha_nacimiento='1990-12-01';

SELECT nombre, REVERSE (apellido1) FROM alumno;
SELECT CONCAT(nombre, apellido1, apellido2), REVERSE (CONCAT(nombre, apellido1, apellido2)) FROM alumno; 
SELECT UPPER(CONCAT_WS(" ", nombre, apellido1)), REVERSE (LOWER(CONCAT_WS(" ", nombre, apellido1))) FROM alumno;

SELECT fecha_nacimiento, DATEDIFF(NOW(), fecha_nacimiento) AS "Días pasados" FROM alumno;
SELECT fecha_nacimiento, TRUNCATE(DATEDIFF(NOW(), fecha_nacimiento) / 365.25 , 0) AS "EDAD" FROM alumno;
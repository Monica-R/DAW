drop database if exists cines;
create database if not exists cines;
use cines;
create table peliculas(
    codigo_pelicula int auto_increment primary key,
    titulo_pelicula varchar(50),
    calificacion int
);

create table salas(
    codigo_sala int primary key,
    nombre_sala varchar(50) not null,
    codigo_pelicula int,
    foreign key (codigo_pelicula) references peliculas(codigo_pelicula) on update cascade on delete cascade
);
create table directores(
    dni varchar(10),
    nombre_director varchar(100) not null,
    ciudad varchar(20),
    sueldo int default 2000,
    codigo_pelicula int,
    primary key(dni,codigo_pelicula)
 );
alter table directores add foreign key (codigo_pelicula) references peliculas(codigo_pelicula);
insert into peliculas (titulo_pelicula,calificacion) values 
('Shreck',0),
('Los Otros',7),
('Aterriza como puedas',7),
('Una habitación con vistas',18),
('El Cielo Protector',18);
insert into salas (codigo_sala,nombre_sala,codigo_pelicula) values
(1,'El Muelle 1',1),
(2,'El Muelle 3',2),
(3,'Vecindario',5),
(4,'El Muelle 2',3);
insert into salas(codigo_sala,nombre_sala) values(5,'Vecindario 2');
insert into salas (codigo_sala,nombre_sala,codigo_pelicula) values(6,'Las Arenas 1',4),(7,'Las Arenas 2',2);
insert into salas (codigo_sala,nombre_sala) values(8,'Las Arenas 3');

insert into directores values
('11111111A','Luis Rodriguez','Madrid',6000,2),
('22222222B','Jorge Vega','Barcelona',9000,1),
('11111111A','Luis Rodriguez','Madrid',9000,5),
('33333444A','Ana Rodriguez','Las Palmas',9000,3),
('44444444A','Maria Santana','Las Palmas',6000,4);


/*************** PROCEDIMIENTOS, FUNCIONES Y TRIGGERS ****************/


-- 1.

DELIMITER ??
DROP PROCEDURE IF EXISTS remuneracion ??
CREATE PROCEDURE IF NOT EXISTS remuneracion(IN nom_dir VARCHAR(100))
BEGIN

    DECLARE fin BOOLEAN DEFAULT false;
    DECLARE resultado INT DEFAULT 0;
    DECLARE aux INT;
    DECLARE cursor_remun CURSOR FOR 
    SELECT directores.sueldo FROM directores
    WHERE directores.nombre_director = nom_dir;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;

    OPEN cursor_remun;
    FETCH cursor_remun INTO aux;
    WHILE (!fin) DO
        SET resultado = resultado + aux;
        FETCH cursor_remun INTO aux;
    END WHILE;
    CLOSE cursor_remun;
    SELECT resultado AS "Resultado";

END ??
DELIMITER ;


CALL remuneracion("Luis Rodriguez");
+-----------+
| Resultado |
+-----------+
|     15000 |
+-----------+
1 row in set (0.001 sec)

Query OK, 0 rows affected (0.003 sec)

CALL remuneracion("Jorge Vega");
+-----------+
| Resultado |
+-----------+
|      9000 |
+-----------+
1 row in set (0.000 sec)

Query OK, 0 rows affected (0.002 sec)

CALL remuneracion("Maria Santana");

+-----------+
| Resultado |
+-----------+
|      6000 |
+-----------+
1 row in set (0.000 sec)

Query OK, 0 rows affected (0.003 sec)

-- 2. 
DELIMITER ??
DROP FUNCTION IF EXISTS sumar ??
CREATE FUNCTION sumar (n INT,m INT)
RETURNS INT
BEGIN
    DECLARE i INT;
    DECLARE res INT;
    DECLARE aux INT;
    SET i = 1;
    SET res = 0;
    SET aux = 0;
    WHILE (i <= n) DO
        SET aux = aux + i;
        SET i = i + 1;
    END WHILE;
    SET res = aux + m;
RETURN res;
END ??
DELIMITER ;

SELECT sumar(6,4) AS Total;

+-------+
| Total |
+-------+
|    25 |
+-------+
1 row in set (0.001 sec)


SELECT sumar(2,4) AS Total;

+-------+
| Total |
+-------+
|     7 |
+-------+
1 row in set (0.001 sec)

-- 3. 

DELIMITER ??
DROP TRIGGER IF EXISTS trigger_pelicula ??
CREATE TRIGGER trigger_pelicula
BEFORE INSERT
ON salas
FOR EACH ROW
BEGIN
    DECLARE mensaje_error CONDITION FOR SQLSTATE '45000';
    IF salas.codigo_pelicula FROM salas != NULL THEN
        SIGNAL mensaje_error SET MESSAGE_TEXT = "En esta sala ya se esta proyectando una pelicula";
    END IF;
END ??
DELIMITER ;


-- 4. 


DELIMITER ??
DROP PROCEDURE IF EXISTS films ??
CREATE PROCEDURE films(IN nom_peli VARCHAR(50))
BEGIN

    DECLARE fin BOOLEAN DEFAULT false;
    DECLARE aux VARCHAR (50);
    DECLARE resultado VARCHAR(200);
    DECLARE cursor_films CURSOR FOR 
    SELECT peliculas.titulo_pelicula, directores.nombre_director
    FROM peliculas
    LEFT JOIN directores
    ON peliculas.codigo_pelicula = directores.codigo_pelicula
    WHERE peliculas.titulo_pelicula = nom_peli;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;
    OPEN cursor_films;

    FETCH cursor_films INTO aux;
    WHILE (!fin) DO
        IF aux = nom_peli THEN
            SET resultado = resultado + aux;
        END IF;
        FETCH cursor_films INTO aux;
    END WHILE;
    CLOSE cursor_films;
    SELECT resultado;
END ??
DELIMITER ;

CALL films("Shreck");

/*
 DECLARE nombre_peli VARCHAR(50);
    SELECT peliculas.titulo_pelicula INTO nombre_peli FROM peliculas
    WHERE ;
    IF  THEN
        SELECT peliculas.titulo_pelicula, directores.nombre_director
        FROM peliculas as informacion
        LEFT JOIN directores
        ON peliculas.codigo_pelicula = directores.codigo_pelicula
        WHERE peliculas.titulo_pelicula = nom_peli;
    ELSE
        SELECT "la pelicula no existe en la cartelera" AS "Informacion";
    END IF;

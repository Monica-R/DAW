-- PRÁCTICA LIGA
DROP DATABASE IF EXISTS Liga;
CREATE DATABASE IF NOT EXISTS Liga CHARACTER SET utf8mb4;
USE Liga;

CREATE TABLE Equipos (
    CodEquipo CHAR(4) PRIMARY KEY,
    Nombre VARCHAR(30) NOT NULL,
    Localidad VARCHAR (30) DEFAULT "Las Palmas de GC"
);

CREATE TABLE Partidos (
    CodPartido CHAR(4) PRIMARY KEY,
    CodEquipoLocal CHAR(4),
    CodEquipoVisitante CHAR(4),
    Fecha DATE,
    Jornada VARCHAR (20),
    Gol_Local INT,
    Gol_Visitante INT,
    FOREIGN KEY (CodEquipoLocal) REFERENCES Equipos (CodEquipo),
    FOREIGN KEY (CodEquipoVisitante) REFERENCES Equipos (CodEquipo),
    CHECK (MONTH(Fecha) != 7 OR MONTH(Fecha) != 8)
);

INSERT INTO Equipos VALUES 
    ("EQ01","Union Deportiva Las Palmas","Las Palmas de GC"),
    ("EQ02","Club Deportivo Tenerife","Santa Cruz de Tenerife"),
    ("EQ03","Club Molina Sport","Las Palmas de GC"),
    ("EQ04","Kamikazes","Tres Cantos (Madrid)");

INSERT INTO Partidos VALUES
    ("P001","EQ01","EQ02","2022-06-01","Tarde",0,1),
    ("P002","EQ03","EQ04","2022-05-21","Tarde",6,5);


-- Tabla Equipos
+-----------+----------------------------+------------------------+
| CodEquipo | Nombre                     | Localidad              |
+-----------+----------------------------+------------------------+
| EQ01      | Union Deportiva Las Palmas | Las Palmas de GC       |
| EQ02      | Club Deportivo Tenerife    | Santa Cruz de Tenerife |
| EQ03      | Club Molina Sport          | Las Palmas de GC       |
| EQ04      | Kamikazes                  | Tres Cantos (Madrid)   |
+-----------+----------------------------+------------------------+

-- Tabla Partidos
+------------+----------------+--------------------+------------+---------+-----------+---------------+
| CodPartido | CodEquipoLocal | CodEquipoVisitante | Fecha      | Jornada | Gol_Local | Gol_Visitante |
+------------+----------------+--------------------+------------+---------+-----------+---------------+
| P001       | EQ01           | EQ02               | 2022-06-01 | Tarde   |         0 |             1 |
| P002       | EQ03           | EQ04               | 2022-05-21 | Tarde   |         6 |             5 |
+------------+----------------+--------------------+------------+---------+-----------+---------------+

-- Crea un procedimiento almacenado DevolverNombreEquipo que reciba un código de equipo y
-- muestre el nombre del mismo.

DELIMITER ??
DROP PROCEDURE IF EXISTS DevolverNombreEquipo ??
CREATE PROCEDURE IF NOT EXISTS DevolverNombreEquipo (IN cod_eq CHAR(4))
BEGIN
    IF cod_eq IN (SELECT Equipos.CodEquipo FROM Equipos) THEN
        SELECT Equipos.Nombre FROM Equipos WHERE Equipos.CodEquipo = cod_eq;
    ELSE
        SELECT "No existe ese codigo en la base de datos.";
    END IF;
END ??
DELIMITER ;

CALL DevolverNombreEquipo("YH56");

+-------------------------------------------+
| No existe ese codigo en la base de datos. |
+-------------------------------------------+
| No existe ese codigo en la base de datos. | --NO SÉ POR QUÉ ME SALE DOBLE...
+-------------------------------------------+

CALL DevolverNombreEquipo("EQ04");
+-----------+
| Nombre    |
+-----------+
| Kamikazes |
+-----------+

-- Crear un procedimiento almacenado DatosPartido que, dado un código de partido, escribe todos
-- los datos del partido

DELIMITER ??
DROP PROCEDURE IF EXISTS DatosPartido ??
CREATE PROCEDURE IF NOT EXISTS DatosPartido (IN cod_p CHAR(4))
BEGIN
    SELECT * FROM Partidos WHERE CodPartido = cod_p;
END ??
DELIMITER ;

CALL DatosPartido("P001");
+------------+----------------+--------------------+------------+---------+-----------+---------------+
| CodPartido | CodEquipoLocal | CodEquipoVisitante | Fecha      | Jornada | Gol_Local | Gol_Visitante |
+------------+----------------+--------------------+------------+---------+-----------+---------------+
| P001       | EQ01           | EQ02               | 2022-06-01 | Tarde   |         0 |             1 |
+------------+----------------+--------------------+------------+---------+-----------+---------------+

-- Crear un procedimiento almacenado Ganador que, dado un código de partido escribe el código
-- del equipo ganador.

DELIMITER ??
DROP PROCEDURE IF EXISTS Ganador ??
CREATE PROCEDURE IF NOT EXISTS Ganador (IN cod_p CHAR (4))
BEGIN
    DECLARE e_local CHAR(4);
    DECLARE e_visitante CHAR(4);
    IF cod_p NOT IN (SELECT Partidos.CodPartido FROM Partidos) THEN
        SELECT "No existe el codigo introducido" as error;
    ELSE
        SELECT Partidos.Gol_Local, Partidos.Gol_Visitante INTO e_local, e_visitante 
        FROM Partidos WHERE Partidos.CodPartido = cod_p;
        IF e_local > e_visitante THEN
            SELECT Partidos.CodEquipoLocal FROM Partidos WHERE Partidos.CodPartido = cod_p;
        ELSE
            SELECT Partidos.CodEquipoVisitante FROM Partidos WHERE Partidos.CodPartido = cod_p;
        END IF;
    END IF;
    
END ??
DELIMITER ;

CALL Ganador("ES88");
+---------------------------------+
| error                           |
+---------------------------------+
| No existe el codigo introducido |
+---------------------------------+

CALL Ganador("P002");
+----------------+
| CodEquipoLocal |
+----------------+
| EQ03           |
+----------------+


-- ¿otra forma? - cursores
-- DELIMITER ??
-- DROP PROCEDURE IF EXISTS Ganador_2 ??
-- CREATE PROCEDURE IF NOT EXISTS Ganador_2()
-- BEGIN
--     DECLARE fin BOOLEAN DEFAULT false;
--     DECLARE cursor_ganador CURSOR FOR SELECT * FROM Partidos;
--     DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;
--     OPEN cursor_ganador;
--     FETCH cursor_ganador;
--     WHILE (!fin) DO
--         IF Partidos.Gol_Local > Partidos.Gol_Visitante THEN
--             SELECT Partidos.CodEquipoLocal FROM Partidos;
--         ELSE
--             SELECT Partidos.CodEquipoVisitante FROM Partidos;
--         END IF;
--         FETCH cursor_ganador;
--     END WHILE;
--     CLOSE cursor_ganador;
-- END ??
-- DELIMITER ;



-- Crear un procedimiento almacenado NombreGanador que, 
-- dado un código de partido escribe el nombre del equipo ganador. 
-- Puedes utilizar en este procedimiento el anterior.

DELIMITER ??
DROP PROCEDURE IF EXISTS Ganador_2 ??
CREATE PROCEDURE IF NOT EXISTS Ganador_2 (IN cod_p CHAR (4))
BEGIN
    DECLARE e_local CHAR(4);
    DECLARE e_visitante CHAR(4);
    IF cod_p NOT IN (SELECT Partidos.CodPartido FROM Partidos) THEN
        SELECT "No existe el codigo introducido" as error;
    ELSE
        SELECT Partidos.Gol_Local, Partidos.Gol_Visitante INTO e_local, e_visitante 
        FROM Partidos WHERE Partidos.CodPartido = cod_p;
        IF e_local > e_visitante THEN
            SELECT Partidos.CodEquipoLocal, Equipos.Nombre FROM Partidos
            LEFT JOIN Equipos
            ON Equipos.CodEquipo = Partidos.CodEquipoLocal
            WHERE Partidos.CodPartido = cod_p;
        ELSE
            SELECT Partidos.CodEquipoVisitante, Equipos.Nombre FROM Partidos 
            LEFT JOIN Equipos
            ON Equipos.CodEquipo = Partidos.CodEquipoVisitante
            WHERE Partidos.CodPartido = cod_p;
        END IF;
    END IF;
    
END ??
DELIMITER ;

CALL Ganador_2("P001");
+--------------------+-------------------------+
| CodEquipoVisitante | Nombre                  |
+--------------------+-------------------------+
| EQ02               | Club Deportivo Tenerife |
+--------------------+-------------------------+

CALL Ganador_2("P002");
+----------------+-------------------+
| CodEquipoLocal | Nombre            |
+----------------+-------------------+
| EQ03           | Club Molina Sport |
+----------------+-------------------+

CALL Ganador_2("FT89");
+---------------------------------+
| error                           |
+---------------------------------+
| No existe el codigo introducido |
+---------------------------------+

-- Crear un procedimiento almacenado DevolverGolesMarcados que devuelva 
-- el total de goles marcados por un equipo cuyo código pasaremos como parámetro.

DELIMITER ??
DROP PROCEDURE IF EXISTS DevolverGolesMarcados ??
CREATE PROCEDURE IF NOT EXISTS DevolverGolesMarcados (IN cod_p CHAR(4))
BEGIN
    DECLARE fin BOOLEAN DEFAULT false;
    DECLARE
END ??
DELIMITER ;



-- Crear un procedimiento almacenado NumeroEquiposyPartidos que devuelva 
-- el número de equipos y el número de partidos que hay en las tablas 
-- equipos y partidos.

DELIMITER ??
DROP PROCEDURE IF EXISTS NumeroEquiposyPartidos ??
CREATE PROCEDURE IF NOT EXISTS NumeroEquiposyPartidos()
BEGIN
    SELECT COUNT(*) AS "Numero de equipos" FROM Equipos;
    SELECT COUNT(*) AS "Numero de partidas" FROM Partidos;
END ??
DELIMITER ;

CALL NumeroEquiposyPartidos();
+-------------------+
| Numero de equipos |
+-------------------+
|                 4 |
+-------------------+
1 row in set (0.000 sec)

+--------------------+
| Numero de partidas |
+--------------------+
|                  2 |
+--------------------+
1 row in set (0.003 sec)

Query OK, 0 rows affected (0.007 sec)
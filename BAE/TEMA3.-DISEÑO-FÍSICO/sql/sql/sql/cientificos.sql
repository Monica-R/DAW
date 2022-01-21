CREATE DATABASE Ciencia;
USE Ciencia;

-- CREAMOS LAS TABLAS

CREATE TABLE Cientificos(
    DNI VARCHAR(9) PRIMARY KEY,
    NOM_APE VARCHAR(30)
);

CREATE TABLE Asignado(
    CIENTIFICO VARCHAR,
    PROYECTO VARCHAR
    PRIMARY KEY(CIENTIFICO, PROYECTO)
);

CREATE TABLE Proyectos(
    IDP INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(40),
    HORAS INT(4)
);

-- CLAVES FORÁNEAS

ALTER TABLE Asignado ADD FOREIGN KEY (CIENTIFICO) REFERENCES Cientificos(DNI);
ALTER TABLE Asignado ADD FOREIGN KEY (PROYECTO) REFERENCES Proyectos(IDP);

-- INSERTAMOS LOS VALORES

INSERT INTO Cientificos VALUES
    ("15279692J", "Javier Rodríguez"),
    ("42548796A", "Juan González"),
    ("4589639Q" "Angel Martínez"),
    ("75896326H" "Marta Huarte"),
    ("45789635G" "Nerea Armendáriz"),
    ("75963879R" "Asunción Gómez");

INSERT INTO Asignado VALUES
    ("42548796A",3),
    ("42548796A",5),
    ("75963879R",3),
    ("75963879R",1),
    ("75896326H",2),
    ("45789635G",1),
    ("45789635G",3),
    ("45789635G",5);

INSERT INTO Proyectos VALUES
    ("Gestión Calidad", 1300),
    ("Inteligencia Artificial", 2500),
    ("Desarrollo Software", 1400),
    ("Telecomunicaciones", 2000),
    ("Gestión procesos", 1100);

-- CONSULTAS

/* 1. Sacar una relación completa de los científicos asignados a cada proyecto. 
Mostrar DNI, Nombre del científico, identificador de proyecto y  nombre del proyecto.*/

/* 2. Sacar a todos los científicos y si colaboran en algún proyecto los datos de dicho proyecto.
*/

/* 3. Sacar los datos de todos los proyectos y si tienen científicos asignados los datos de los científicos.
*/

/* 4. Obtener el número de proyectos al que está asignado cada científico (Mostra DNI y nombre).
*/

/* 5. Obtener el número de proyectos de cada científico */

/* 6. Obtener el número de científicos asignados a cada proyecto (mostrar el identificador del proyecto 
y el nombre del proyecto).
*/

/* 7. Obtener el número de horas de dedicación de cada científico. */

/* 8. Obtener DNI y nombre de los científicos que se dedican a más de un proyecto. */

/* 9. Obtener DNI y nombre de los científicos cuya dedicación media por proyecto sea superior a las 1300 horas. */

/* 10. Obtener DNI y nombre de los científicos cuya dedicación media por proyecto sea superior a 1300 e indica 
e número de proyectos que lleva. */
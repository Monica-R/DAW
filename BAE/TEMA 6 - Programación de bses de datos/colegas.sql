-- Ejercicio de cursor

-- Crear una función llamada colegas a la que se le pase 
-- el nombre de un empleado y nos devuelva los nombres de 
-- todos los compañeros de departamento de ese empleado. 
-- Utilizar un cursor para realizar el ejercicio.

/**
SELECT colegas(‘Marcos’)->nos devolvería una cadena con la siguiente información:
“Marcos: Trabaja en < VENTAS >, colegas: PEDRO, LUIS, ANTONIO, …”
Nota:Se debe controlar la lectura del cursor a través de un handler
**/

DELIMITER ??
DROP FUNCTION IF EXISTS colegas ??
CREATE FUNCTION IF NOT EXISTS colegas(IN nom_emp VARCHAR(50))
RETURNS VARCHAR(200)
BEGIN
    DECLARE mensaje VARCHAR(200);
    DECLARE fin BOOLEAN DEFAULT false;
    DECLARE nombre VARCHAR(50) DEFAULT "";
    DECLARE cursor_colegas CURSOR FOR SELECT EMPLEADOS.ndep FROM EMPLEADOS WHERE EMPLEADOS.nombre = nom_emp;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;
    OPEN cursor_colegas;
    FETCH cursor_colegas INTO nombre;
    WHILE (!fin) DO
       FETCH cursor_colegas INTO nombre;
    END WHILE;
RETURN mensaje;
END ??
DELIMITER ;
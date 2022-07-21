-- para cursores:

DELIMITER ??
DROP PROCEDURE IF EXISTS prueba ??
CREATE PROCEDURE IF NOT EXISTS prueba ()
BEGIN
    DECLARE fin BOOLEAN DEFAULT false;
    DECLARE mensaje VARCHAR(333);
    DECLARE aux VARCHAR(20);
    DECLARE nombre_cursor CURSOR FOR SELECT -- CONSULTA;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = true;
    OPEN nombre_cursor;
    FETCH nombre_cursor INTO aux;
    WHILE(!fin) DO
        -- INSTRUCCIONES A CONTINUACION
        mensaje = mensaje + aux;
        FETCH nombre_cursor INTO aux;
    END WHILE;
    CLOSE nombre_cursor;

END ??
DELIMITER ;

-- PARA LOS TRIGGERS

DELIMITER ??
DROP TRIGGER IF EXISTS trigger_04 ??
CREATE TRIGGER IF NOT EXISTS trigger_04
BEFORE | AFTER
INSERT | DELETE | UPDATE
ON -- NOMBRE_TABLA
FOR EACH ROW
BEGIN
    -- PARA MENSAJE DE ERROR 'SOLO EN TRIGGERS'
    DECLARE mensaje_error CONDITION FOR SQLSTATE '45000';
    IF THEN
        SIGNAL mensaje_error SET MESSAGE_TEXT = "Error.";
    END IF;
END ??
DELIMITER ;
-- Diseñar un disparador que al modificar el salario de un 
-- empleado, automáticamente quede actualizado el presupuesto
-- total del departamento al que el empleado pertenece, en 
-- función del nuevo salario asignado al empleado, es decir, 
-- el presupuesto nuevo del departamento se verá incrementado 
-- en la diferencia entre el nuevo salario y el antiguo 
-- salario(el nuevo salario siempre será mayor que el anterior).

-- TABLA EMPLEADOS
+------+-----------+-----------+----------------------+------------+---------+---------+------+----------+
| nemp | nombre    | apellido  | empleo               | fechaIng   | supervs | salario | ndep | comision |
+------+-----------+-----------+----------------------+------------+---------+---------+------+----------+
|    1 | Laura     | Lopez     | contable             | 1998-12-01 |       2 | 2000.00 |   10 |   500.00 |
|    2 | Ana       | Vega      | directora            | 1997-12-01 |       2 | 5000.00 |   10 |   500.00 |
|    3 | Jose      | Rodriguez | analista de sistemas | 1997-06-01 |       2 | 5000.00 |   10 |   500.00 |
|    4 | Maria     | Garcia    | administrativo       | 1998-12-01 |       3 | 1500.00 |   20 |     0.00 |
|    5 | Ana       | Perez     | publicista           | 2000-01-01 |       2 | 1000.00 |   60 |   500.00 |
|    6 | Alejandro | Miguel    | comercial            | 1998-12-01 |       2 | 2000.00 |   30 |   500.00 |
|    7 | Pedro     | Ascanio   | comercial            | 1997-12-01 |       2 | 2000.00 |   30 |     NULL |
+------+-----------+-----------+----------------------+------------+---------+---------+------+----------+

--TABLA DEPARTAMENTOS
+------+---------------+-----------+-------------+
| ndep | nombdep       | ciudad    | presupuesto |
+------+---------------+-----------+-------------+
|   10 | CONTABILIDAD  | MADRID    |       10000 |
|   20 | INVESTIGACION | BARCELONA |       50000 |
|   30 | VENTAS        | SEVILLA   |      100000 |
|   40 | OPERACIONES   | HUELVA    |        7782 |
|   50 | MARKETING     | MADRID    |       20000 |
|   60 | PUBLICIDAD    | SEVILLA   |      300000 |
+------+---------------+-----------+-------------+


DELIMITER ??
DROP TRIGGER IF EXISTS presupuesto ??
CREATE TRIGGER IF NOT EXISTS presupuesto
BEFORE UPDATE ON empleados
FOR EACH ROW
BEGIN
    UPDATE departamentos SET departamentos.presupuesto = departamentos.presupuesto + 5000
    WHERE
    SELECT empleados.salario FROM empleados 
    LEFT JOIN departamentos 
    ON empleados.ndep = departamentos.ndep
    WHERE empleados.nombre LIKE "Ana";
END ??
DELIMITER ;

UPDATE empleados SET empleados.salario = 2500 WHERE empleados.nombre LIKE "Ana";

-- se pueden crear variables dentro de un trigger

-- color f0
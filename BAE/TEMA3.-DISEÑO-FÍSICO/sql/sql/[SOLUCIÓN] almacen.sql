create database if not exists almacen character set utf8mb4;
use almacen;
create table if not exists suministrador(
    Snum varchar(5) primary key,
    Snombre varchar(20) not null,
    Situacion int,
    ciudad varchar(20)
);
create table if not exists productos(
    pnum varchar(5) primary key,
    pnombre varchar(10),
    color varchar(10),
    peso int,
    ciudad varchar(10)
);
create table if not exists ventas(
    Snum varchar(5),
    Pnum varchar(5),
    cantidad int,
    primary key(Snum, Pnum)
);
alter table ventas add foreign key (Snum) references suministrador(Snum); 
alter table ventas add foreign key (Pnum) references productos(pnum);

insert into suministrador values
("S1","Salazar",20,"Londres"),
("S2","Jaime",10,"Paris"),
("S3","Bernal",30,"Paris"),
("S4","Corona",20,"Londres"),
("S5","Aldana",30,"Atenas");
insert into productos values
("P1","Tuerca","Rojo",12,"Londres"),
("P2","Perno","Verde",17,"Paris"),
("P3","Birlo","Azul",17,"Roma"),
("P4","Birlo","Rojo",14,"Londres"),
("P5","Leva","Azul",12,"Paris"),
("P6","Engrane","Rojo",19,"Londres");
insert into ventas values(
    "S1","P1",300),
    ("S1","P2",200),
    ("S1","P3",400),
    ("S1","P4",200),
    ("S1","P5",100),
    ("S1","P6",100),
    ("S2","P1",300),
    ("S2","P2",400),
    ("S3","P2",200),
    ("S4","P2",200),
    ("S4","P4",300),
    ("S4","P5",400);
1.- Devolver los datos de los proveedores de paris
select * from suministrador where ciudad="paris";
select * from suministrador where ciudad like "paris";

------+---------+-----------+--------+
| Snum | Snombre | Situacion | ciudad |
+------+---------+-----------+--------+
| S2   | Jaime   |        10 | Paris  |
| S3   | Bernal  |        30 | Paris  |
+------+---------+-----------+--------+
2 rows in set (0.012 sec)
2.- Devolver los productos de color azul o que tengan un peso mayor a 15 y estén situados en londres
select * from productos where (color="azul" or peso>15) and ciudad="londres";+------+---------+-------+------+---------+
| pnum | pnombre | color | peso | ciudad  |
+------+---------+-------+------+---------+
| P6   | Engrane | Rojo  |   19 | Londres |
+------+---------+-------+------+---------+
3.- Devolver el número de artículos de color rojo
select count(*) as "Numero de productos de color rojo" from productos where color="rojo";
+-----------------------------------+
| Numero de productos de color rojo |
+-----------------------------------+
|                                 3 |
+-----------------------------------+
1 row in set (0.012 sec)
4.- Devolver los nombres de las ciudades de los proveedores sin repetición
select distinct(ciudad) from suministrador;
+---------+
| ciudad  |
+---------+
| Londres |
| Paris   |
| Atenas  |
+---------+
5.-Devolver los nombres de los proveedores y el número de caracteres del nombre, ordenando la salida por orden descendente de la longitud del nombre 
select Snombre, length(Snombre) as longitud 
from suministrador 
order by longitud DESC;
+---------+----------+
| Snombre | longitud |
+---------+----------+
| Salazar |        7 |
| Bernal  |        6 |
| Corona  |        6 |
| Aldana  |        6 |
| Jaime   |        5 |
+---------+----------+
5 rows in set (0.012 sec)
6.- Devolver los nombres de los suministradores en forma inversa, ejemplo: salazarr por razaalas
select reverse(Snombre) from suministrador;
+------------------+
| reverse(Snombre) |
+------------------+
| razalaS          |
| emiaJ            |
| lanreB           |
| anoroC           |
| anadlA           |
+------------------+
5 rows in set (0.011 sec)
7.- Devolver los nombres de los proveedores que terminan en a
select snombre from suministrador where snombre like "%a";
+---------+
| snombre |
+---------+
| Corona  |
| Aldana  |
    8) Devolver los nombres de los artículos que tienen una 'e' como segundo carácter 
    select pnombre from productos where pnombre like '_e%';
    +---------+
| pnombre |
+---------+
| Perno   |
| Leva    |
+---------+
    9) Devolver el nombre del usuario con el que te has conectado y la fecha y hora
    select user() as usuario, now() as fecha_hora;
    +----------------+---------------------+
| usuario        | fecha_hora          |
+----------------+---------------------+
| root@localhost | 2022-01-21 09:25:09 |
+----------------+---------------------+
    10) Devolver el número total de ventas, la venta máxima, la venta mínima y la venta media 
    select count(*) as 'Numero de ventas',max(cantidad) as maxima_venta,min(cantidad) as minima_venta, avg(cantidad) as media_ventas
    from ventas;
    ------------------+--------------+--------------+--------------+
| Numero de ventas | maxima_venta | minima_venta | media_ventas |
+------------------+--------------+--------------+--------------+
|               12 |          400 |          100 |     258.3333 |
+------------------+--------------+--------------+--------------+
1 row in set (0.000 sec)

    11) Devolver todos los datos de los suministradores que no suministran nada
    select * from suministrador
    where snum not in(select distinct(snum) from ventas);
    +------+---------+-----------+--------+
| Snum | Snombre | Situacion | ciudad |
+------+---------+-----------+--------+
| S5   | Aldana  |        30 | Atenas |
+------+---------+-----------+--------+
    12) Devolver el código, nombre, color y cantidades vendidas de todos los productos de color rojo
    select productos.pnum,productos.pnombre,productos.color,ventas.cantidad
    from productos,ventas
    where productos.pnum=ventas.pnum and productos.color="rojo";
    +------+---------+-------+----------+
| pnum | pnombre | color | cantidad |
+------+---------+-------+----------+
| P1   | Tuerca  | Rojo  |      300 |
| P1   | Tuerca  | Rojo  |      300 |
| P4   | Birlo   | Rojo  |      200 |
| P4   | Birlo   | Rojo  |      300 |
| P6   | Engrane | Rojo  |      100 |
+------+---------+-------+----------+
    13) Devolver la cantidad total suministrada de productos de color azul
    select sum(ventas.cantidad) as "cantidad total vendida"
    from productos,ventas
    where productos.pnum=ventas.pnum and productos.color="azul";
    +------------------------+
| cantidad total vendida |
+------------------------+
|                    900 |
+------------------------+
    14) Devolver el número de ventas de 'Salazar'
    select count(*) as 'Numero de ventas'from ventas,suministrador
    where suministrador.snombre="Salazar" and ventas.snum=suministrador.snum;
    select count(*) as 'Numero de ventas'from ventas where snum=(
    select snum from suministrador where snombre="Salazar");
    ------------------+
| Numero de ventas |
+------------------+
|                6 |
+------------------+
    15) Devolver todos los artículos que pesen más que una tuerca
    select * from productos 
    where peso>(
    select peso from productos where pnombre="tuerca");
    +------+---------+-------+------+---------+
| pnum | pnombre | color | peso | ciudad  |
+------+---------+-------+------+---------+
| P2   | Perno   | Verde |   17 | Paris   |
| P3   | Birlo   | Azul  |   17 | Roma    |
| P4   | Birlo   | Rojo  |   14 | Londres |
| P6   | Engrane | Rojo  |   19 | Londres |
+------+---------+-------+------+---------+
    16) Si las tuercas valen 10 € ¿Cuál sería el importe total de todas las ventas de tuercas?
    select sum(cantidad)*10 as precio from ventas
    where pnum=(
    select pnum from productos
    where pnombre="tuerca");
    +--------+
| precio |
+--------+
|   6000 |
+--------+
    17) Devolver la cantidad máxima vendida y la cantidad mínima vendida de 'pernos'
     select max(cantidad) as maxima_venta,min(cantidad) as minima_venta
     from ventas
    where pnum=(
    select pnum from productos
    where pnombre="perno");
    +--------------+--------------+
| maxima_venta | minima_venta |
+--------------+--------------+
|          400 |          200 |
+--------------+--------------+
    18) Devolver el código, nombre y ciudad del suministrador, código y nombre del producto y cantidad vendida para todas las ventas ordenando la salida en orden descendente por el campo cantidad vendida
    select suministrador.snum, suministrador.snombre,suministrador.ciudad,productos.pnum,productos.pnombre,ventas.cantidad
    from suministrador,productos,ventas
    where suministrador.snum=ventas.snum and ventas.pnum=productos.pnum
    order by ventas.cantidad desc;
     snum | snombre | ciudad  | pnum | pnombre | cantidad |
+------+---------+---------+------+---------+----------+
| S1   | Salazar | Londres | P3   | Birlo   |      400 |
| S2   | Jaime   | Paris   | P2   | Perno   |      400 |
| S4   | Corona  | Londres | P5   | Leva    |      400 |
| S1   | Salazar | Londres | P1   | Tuerca  |      300 |
| S2   | Jaime   | Paris   | P1   | Tuerca  |      300 |
| S4   | Corona  | Londres | P4   | Birlo   |      300 |
| S1   | Salazar | Londres | P2   | Perno   |      200 |
| S1   | Salazar | Londres | P4   | Birlo   |      200 |
| S3   | Bernal  | Paris   | P2   | Perno   |      200 |
| S4   | Corona  | Londres | P2   | Perno   |      200 |
| S1   | Salazar | Londres | P5   | Leva    |      100 |
| S1   | Salazar | Londres | P6   | Engrane |      100 |
+------+---------+---------+------+---------+----------+
    19) Devolver las ciudades distintas de los suministradores
    select distinct(ciudad) from suministrador;
    +---------+
| ciudad  |
+---------+
| Londres |
| Paris   |
| Atenas  |
+---------+
    20) Devolver todos los datos de los productos vendidos por el suministrador 'Corona'
   select productos.pnum,productos.pnombre,productos.color,productos.peso,productos.ciudad
   from productos
   where productos.pnum= any(
    select pnum from ventas
    where ventas.snum=(
    select suministrador.snum from suministrador where suministrador.snombre="Corona"));

 select productos.pnum,productos.pnombre,productos.color,productos.peso,productos.ciudad
   from productos
   where productos.pnum in(
    select pnum from ventas
    where ventas.snum=(
    select suministrador.snum from suministrador where suministrador.snombre="Corona"));
  +------+---------+-------+------+---------+
| pnum | pnombre | color | peso | ciudad  |
+------+---------+-------+------+---------+
| P2   | Perno   | Verde |   17 | Paris   |
| P4   | Birlo   | Rojo  |   14 | Londres |
| P5   | Leva    | Azul  |   12 | Paris   |
+------+---------+-------+------+---------+


    21) Devolver el código del suministrador y la cantidad total vendida de cada uno, ordenando la salida en orden ascendente de ventas.
    select ventas.snum as suministrador, sum(cantidad) as ventas_totales
    from ventas
    group by ventas.snum
    +---------------+----------------+
| suministrador | ventas_totales |
+---------------+----------------+
| S1            |           1300 |
| S2            |            700 |
| S3            |            200 |
| S4            |            900 |
+---------------+----------------+

    22) Devolver el nombre del suministrador y la cantidad total vendida de cada uno.
    select suministrador.snombre,ventas.snum as suministrador, sum(cantidad) as ventas_totales
    from ventas,suministrador
    where suministrador.snum=ventas.snum
    group by ventas.snum;
    ---------+---------------+----------------+
| snombre | suministrador | ventas_totales |
+---------+---------------+----------------+
| Salazar | S1            |           1300 |
| Jaime   | S2            |            700 |
| Bernal  | S3            |            200 |
| Corona  | S4            |            900 |
+---------+---------------+----------------+
4 rows in set (0.001 sec)
    23)  Devolver las ventas totales de los suministradores de ‘paris’. (sol. 900)
    select sum(cantidad) as ventas_totales
    from ventas,suministrador
    where suministrador.snum=ventas.snum and suministrador.ciudad="Paris";
   +----------------+
| ventas_totales |
+----------------+
|            900 |
+----------------+
    24)  Devolver las ventas totales de artículos de color rojo. (sol. 1200).
     select sum(cantidad) as ventas_totales
    from ventas,productos
    where productos.pnum=ventas.pnum and productos.color="rojo";
    ----------------+
| ventas_totales |
+----------------+
|           1200 |
+----------------+
    25)  Devolver los códigos de los artículos suministrados por más de un suministrador.
    select ventas.pnum,count(ventas.pnum) as 'Numero de suministradores'
    from ventas
    group by ventas.pnum
    having count(ventas.pnum)>1;
    +------+---------------------------+
| pnum | Numero de suministradores |
+------+---------------------------+
| P1   |                         2 |
| P2   |                         4 |
| P4   |                         2 |
| P5   |                         2 |
+------+---------------------------+
    
    26)  Devolver los nombres de los suministradores que suministran el artículo P2.
    select distinct(suministrador.snombre)
    from suministrador,ventas
    where ventas.snum=suministrador.snum and ventas.pnum="p2";

    +---------+
| snombre |
+---------+
| Salazar |
| Jaime   |
| Bernal  |
| Corona  |
+---------+

select distinct(suministrador.snombre)
from suministrador inner join ventas
on suministrador.snum=ventas.snum 
where ventas.pnum="p2";
    27)  Devolver los nombres de los suministradores que suministran por lo menos un artículo de color rojo.
select suministrador.snombre from suministrador
where suministrador.snum =any(
select distinct(ventas.snum) from ventas where ventas.pnum in(
select productos.pnum
from productos
where color="rojo"));
+---------+
| snombre |
+---------+
| Salazar |
| Jaime   |
| Corona  |
+---------+
    28)  Devolver el código y nombre de los suministradores que suministran algo.
    select distinct(suministrador.snombre),suministrador.snombre 
    from suministrador,ventas
    where suministrador.snum=ventas.snum;
| snombre | snombre |
+---------+---------+
| Salazar | Salazar |
| Jaime   | Jaime   |
| Bernal  | Bernal  |
| Corona  | Corona  |
+---------+---------+
    29)  Devolver los nombres de los suministradores cuya situación 
    sea inferior a la del suministrador S1.
    select sum(ventas.cantidad) as total,ventas.snum
    from ventas
    group by ventas.snum
    having total<(
        select sum(cantidad)
         from ventas
        group by ventas.snum
         having ventas.snum="S1");
         +-------+------+
| total | snum |
+-------+------+
|   700 | S2   |
|   200 | S3   |
|   900 | S4   |
+-------+------+
select suministrador.snombre from suministrador,
(select sum(ventas.cantidad) as total,ventas.snum
    from ventas
    group by ventas.snum
    having total<(
        select sum(cantidad)
         from ventas
        group by ventas.snum
         having ventas.snum="S1")) as tabla
where tabla.snum=suministrador.snum ;
+---------+
| snombre |
+---------+
| Jaime   |
| Bernal  |
| Corona  |
+---------+
    30) Devolver los nombres de los suministradores situados en la misma ciudad que el suministrador S1. 

select suministrador.snombre 
from suministrador
where ciudad=(
    select suministrador.ciudad
    from suministrador
    where suministrador.snum="S1");
    +---------+
| snombre |
+---------+
| Salazar |
| Corona  |
+---------+
    31) Devolver el código y nombre de los suministradores cuya situación sea menor que la media de todos los suministradores.
       

select avg(cantidad)
         from ventas;
---------------+
| avg(cantidad) |
+---------------+
|      258.3333 |
+---------------+


 select sum(ventas.cantidad) as total,ventas.snum
    from ventas
    group by ventas.snum;
    +-------+------+
| total | snum |
+-------+------+
|  1300 | S1   |
|   700 | S2   |
|   200 | S3   |
|   900 | S4   |
+-------+------+
 select sum(ventas.cantidad) as total,ventas.snum
from ventas
group by ventas.snum
   having total<(
        select avg(cantidad)
         from ventas);
        
       total | snum |
+-------+------+
|   200 | S3   |
+-------+------+  
select suministrador.snum,suministrador.snombre
from suministrador,
 (select sum(ventas.cantidad) as total,ventas.snum
from ventas
group by ventas.snum
   having total<(
        select avg(cantidad)
         from ventas)) as tabla
where suministrador.snum=tabla.snum;
+------+---------+
| snum | snombre |
+------+---------+
| S3   | Bernal  |
+------+---------+s




Respuesta correcta:
select suministrador.snum,suministrador.snombre
from suministrador
where suministrador.situacion<(
    select avg(suministrador.situacion)
    from suministrador);

    +------+---------+
| snum | snombre |
+------+---------+
| S1   | Salazar |
| S2   | Jaime   |
| S4   | Corona  |
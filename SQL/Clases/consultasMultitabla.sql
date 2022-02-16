--*Creamos las tabla
CREATE TABLE empleado (
  codigo INT NOT NULL,
  nif VARCHAR(10),
  nombre VARCHAR(20),
  apellido1 VARCHAR(20),
  apellido2 VARCHAR(20),
  codigo_departamento INT,
  ---*foreing key
  PRIMARY KEY (codigo)
);
--*INSERT
insert into
  empleado
VALUES(
    1,
    "53944920F",
    "Michael",
    "Paliz",
    "Morales",
    "1"
  );
insert into
  empleado
VALUES(2, "46546546C", "Juan", "Paliz", "Morales", "1");
--*Create table
  CREATE TABLE departamento(
    codigo INT NOT NULL,
    nombre VARCHAR(20),
    presupuesto FLOAT,
    PRIMARY KEY (codigo)
  );
--*Insert
  --*Selects
Select
  *
from
  empleado E,
  departamento D
where
  E.codigo_departamento = D.codigo;
--*Sacamte todas las select dond en aparezca cada departamento;
Select
  *
from
  empleado E,
  departamento D
where
  E.codigo_departamento = D.codigo
  or E.codigo_departamento is null;
--* Las selects donde no hay ningun departamento
Select
  *
from
  empleado
where
  codigo_departamento is null;
--*
  (
    Select
      *,
      null,
      null,
      null
    from
      empleado
    where
      codigo_departamento is null
  )
union
  (
    Select
      *
    from
      empleado E,
      departamento D
    where
      E.codigo_departamento = D.codigo
  );
--* que me aparezcan todo los departamentos y empleados
  (
    Select
      *,
      null,
      null,
      null
    from
      empleado
    where
      codigo_departamento is null
  )
union
  (
    Select
      *
    from
      empleado E,
      departamento D
    where
      E.codigo_departamento = D.codigo
  )
UNION(
    Select
      null,
      null,
      null,
      null,
      null,
      null,
      D.codigo,
      D.nombre,
      D.codigo_departamento
    from
      departamento D
    where
      d.codigo not in (
        Select
      )
  );
--* LA Q1 ES LA INTERSECCION DE EMPLADO Y DEPARTAMENTOS
  --~ SOLO APARECEN LOS QUE COINCIDEN
  (
    Select
      *
    from
      empleado E,
      departamento D
    WHERE
      e.codigo_departamento = D.CODIGO
  );
--* LA Q2 son los empleaod sin departamentos
  --~ Sacame los empleados que tengas el departamento vacio
  (
    Select
      *,
      null,
      null,
      null
    from
      empleado
    where
      codigo_departamento is null
  );
---*q3 solo estan los departamentos
  --~ son departamentos que no tiene asociado a ningun empleado
  --~como puedo averiguar los que no esten en la q2 que son los empleados que tienen departamentos
  --~CONSULTA CON TODOS LOS DEPARTAMENTOS Y EMPLEADOS QUE HAY EN ESOS DEPARTAMENTOS
  (
    SELECT
      *
    FROM
      empleado E,
      departamento D
    WHERE
      E.codigo_departamento = D.codigo
  )
UNION
  (
    SELECT
      *,
      NULL,
      NULL,
      null
    FROM
      empleado E
    where
      E.codigo_departamento IS NULL
  )
union
  (
    SELECT
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      D.*
    FROM
      departamento D
    WHERE
      codigo NOT IN (
        SELECT
          distinct codigo_departamento
        FROM
          empleado
        WHERE
          codigo_departamento IS NOT NULL
      )
  );
--*VAMOS A METER A UN NUEVO EMPLEADO con el departamento numero 1
  --*cross join
Select
  *
from
  empleado
  cross join departamento;
--~es equivalente a este
Select
  *
from
  empleado,
  departamento;
--*CREATE TABLE
  Create table equipos(id int not null, nombre varchar(20));
INSERT INTO
  equipos
VALUES(1, "Valencia");
INSERT INTO
  equipos
VALUES(2, "Sevilla");
INSERT INTO
  equipos
VALUES(3, "Madrid");
INSERT INTO
  equipos
VALUES(4, "Barcelona");
--* hacer una query de todos contra todos
  --! primer intento
Select
  CONCAT(nombre, "-", nombre) as partido
from
  equipos;
--!segundo intento
Select
  L.NOMBRE,
  V.NOMBRE
from
  equipos L,
  EQUIPOS V;
--! Tercer intento
Select
  L.NOMBRE,
  V.NOMBRE
from
  equipos L,
  EQUIPOS V
where
  L.ID != V.ID;
--! con cross joint
Select
  L.nombre,
  v.nombre
from
  equipos L
  Cross Join equipos V
where
  L.id != v.id;
--> FECHA 2/4/2022
  --*Creamos las tabla
  CREATE TABLE empleado (
    codigo INT NOT NULL,
    nif VARCHAR(10),
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    codigo_departamento INT,
    ---*foreing key
    PRIMARY KEY (codigo)
  );
--*INSERT
insert into
  empleado
VALUES(
    1,
    "53944920F",
    "Michael",
    "Paliz",
    "Morales",
    "1"
  );
insert into
  empleado
VALUES(2, "46546546C", "Juan", "Paliz", "Morales", "1");
--*Create table
  CREATE TABLE departamento(
    codigo INT NOT NULL,
    nombre VARCHAR(20),
    presupuesto FLOAT,
    PRIMARY KEY (codigo)
  );
--*Insert
  --*Selects
Select
  *
from
  empleado E,
  departamento D
where
  E.codigo_departamento = D.codigo;
--*Sacamte todas las select dond en aparezca cada departamento;
Select
  *
from
  empleado E,
  departamento D
where
  E.codigo_departamento = D.codigo
  or E.codigo_departamento is null;
--* Las selects donde no hay ningun departamento
Select
  *
from
  empleado
where
  codigo_departamento is null;
--*
  (
    Select
      *,
      null,
      null,
      null
    from
      empleado
    where
      codigo_departamento is null
  )
union
  (
    Select
      *
    from
      empleado E,
      departamento D
    where
      E.codigo_departamento = D.codigo
  );
--* que me aparezcan todo los departamentos y empleados
  (
    Select
      *,
      null,
      null,
      null
    from
      empleado
    where
      codigo_departamento is null
  )
union
  (
    Select
      *
    from
      empleado E,
      departamento D
    where
      E.codigo_departamento = D.codigo
  )
UNION(
    Select
      null,
      null,
      null,
      null,
      null,
      null,
      *
    from
      departamento
    where
      codigo = 4
  );
--*2/7/2022
Select
  L.NOMBRE local,
  V.NOMBRE VISITANTE
FROM
  equipos L,
  equipos V
where
  L.id != V.id;
Select
  L.nombre local,
  V.nombre visitante
FROM
  equipos L
  cross join equipos v
where
  L.id != V.id;
create table t1(id_t1 int, c1_t1 varchar(20), id_t2 int);
create table t2(id_t2 int, c1_t2 varchar(20));
insert into
  t1
values
  (1, "A", 1);
insert into
  t1
values
  (2, "E", 1);
insert into
  t1
values
  (3, "I", 1);
insert into
  t1
values
  (4, "O", 1);
insert into
  t1
values
  (5, "U", 1);
insert into
  t1
values
  (6, "B", 1);
insert into
  t1
values
  (7, "C", 1);
insert into
  t1
values
  (8, "D", 1);
insert into
  t1
values
  (9, "F", 1);
insert into
  t2
values
  (1, "CONSONANTE");
insert into
  t2
values
  (2, "VOCALES");
--~Como sacamos las letras y el tipo de letra que es si consonante o vocal;
UPDATE
  T2
SET
  id_t2 = 2
where
  c1_t2 = "CONSONANTES";
select
  t1.*,
  t2.*
from
  t1,
  t2
where
  t1.id_t2 = t2.id_t2;
select
  t1.c1_t1,
  t2.c1_t2
from
  t1,
  t2
where
  t1.id_t2 = t2.id_t2;
Select
  t1.c1_t1,
  t2.c1_t2
from
  t1
  inner join t2 on t1.id_t2 = t2.ID_T2;
Select
  t1.c1_t1,
  t2.c1_t2
from
  t1
  inner join t2 on t1.id_t2 = t2.ID_T2;
Select
  t1.c1_t1,
  T2.C1_T2
from
  t1 natural
  join t2;
--*Sacar todos los empledos y departamentos al que pertenecen, si no tuviera tendria que aparecer el NULL
Select
  e.nombre,
  e.apellido1,
  d.nombre
from
  empleado e
  join departamento d on e.codigo_departamento = d.codigo;
Select
  e.nombre,
  e.apellido1,
  d.nombre
from
  empleado e
  left join departamento d on e.codigo_departamento = d.codigo;
--*quiero todo los departamentos y empleados que estan dentro
Select
  e.nombre,
  e.apellido1,
  d.nombre
from
  empleado e
  right join departamento d on e.codigo_departamento = d.codigo;
--*tienen que salir todos los empleados y los departamentos
  (
    Select
      e.nombre,
      e.apellido1,
      d.nombre
    from
      empleado e
      left join departamento d on e.codigo_departamento = d.codigo
  )
UNION
  (
    Select
      e.nombre,
      e.apellido1,
      d.nombre
    from
      empleado e
      right join departamento d on e.codigo_departamento = d.codigo
  );
--*
  (
    Select
      e.nombre,
      e.apellido1,
      d.nombre
    from
      empleado e
      left join departamento d on e.codigo_departamento = d.codigo
    where
      e.codigo_departamento is null
  )
UNION
  (
    Select
      e.nombre,
      e.apellido1,
      d.nombre
    from
      empleado e
      right join departamento d on e.codigo_departamento = d.codigo
    where
      e.codigo_departamento is null
      or d.codigo is null
  );
Select
  *
from
  emp_dep
where
  codigo_departamento is NULL;
--*2/8/2022
  ROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
  );
CREATE TABLE producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
  );
INSERT INTO
  fabricante
VALUES(1, 'Asus');
INSERT INTO
  fabricante
VALUES(2, 'Lenovo');
INSERT INTO
  fabricante
VALUES(3, 'Hewlett-Packard');
INSERT INTO
  fabricante
VALUES(4, 'Samsung');
INSERT INTO
  fabricante
VALUES(5, 'Seagate');
INSERT INTO
  fabricante
VALUES(6, 'Crucial');
INSERT INTO
  fabricante
VALUES(7, 'Gigabyte');
INSERT INTO
  fabricante
VALUES(8, 'Huawei');
INSERT INTO
  fabricante
VALUES(9, 'Xiaomi');
INSERT INTO
  producto
VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO
  producto
VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO
  producto
VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO
  producto
VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO
  producto
VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO
  producto
VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO
  producto
VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO
  producto
VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO
  producto
VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO
  producto
VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO
  producto
VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
--*Ejercicios
  -- Lista el nombre de los productos,
  -- el precio en euros y el precio en d ó lares estadounidenses (USD).Utiliza los siguientes alias para las columnas: nombre de producto,
  -- euros,
  -- d ó lares.
select
  p.nombre,
  p.precio €,
  round(p.precio / 0.88, 3)
from
  producto p;
--~con variable
set
  @dolar = 0.88;
select
  p.nombre,
  p.precio €,
  round (p.precio / @dolar, 3) $
from
  producto p;
-- *Lista el nombre de todos los fabricantes en una columna,
  --   y en otra columna obtenga en may ú sculas los dos primeros caracteres del nombre del fabricante.
select
  f.nombre,
  upper(substr(f.nombre, 1, 2)) cod
from
  fabricante f,;
-- *Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
set
  @dolar: = 1.5;
select
  p.nombre,
  round(p.precio, 0) $,
  round(p.precio / @dolar, 3) $
from
  producto;
--* Lista el código de los fabricantes que tienen productos en la tabla producto
select
  distinct f.codigo
from
  fabricante f,
  producto p
where
  p.codigo_fabricante = f.codigo;
--*2/10/2022
  --~Nombre del los 5 primeros fabricantes
select
  nombre
from
  fabricante
limit
  5;
--~ Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
Select
  nombre
from
  fabricante
limit
  2 offset 3;
--~ Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select
  nombre,
  precio
from
  producto
ORDER BY
  precio ASC
limit
  1;
--~ Lista el nombre de los productos que no tienen un precio mayor o igual a 400€
select
  nombre,
  precio
from
  producto
where
  precio < 400;
select
  nombre,
  precio < 400
from
  producto
where
  (precio < 400) = 0;
--group by
  --~ Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select
  nombre,
  precio
from
  producto
where
  (
    precio <= 80
    and precio <= 300
  );
--~ Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select
  nombre,
  precio
from
  producto
where
  precio BETWEEN 60
  and 200;
--~ Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select
  nombre,
  codigo_fabricante
from
  producto
where
  codigo in(1, 3, 5);
select
  nombre,
  codigo_fabricante
from
  producto
where
  codigo_fabricante = 1
  OR codigo_fabricante = 3
  or codigo_fabricante = 5;
--no funciona
  --~Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select
  codigo,
  nombre
from
  fabricante
where
  nombre like "%w%";
--~ Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select
  nombre,
  codigo
from
  fabricante
where
  nombre like "____";
select
  nombre,
  codigo
from
  fabricante
where
  char_length (nombre) = 4;
select
  nombre,
  codigo
from
  fabricante
where
  char_length (nombre = 4);
--*Devuelve una lista con el n ombre de todos los productos que contienen la cadena portatil en el nombre;
Select
  nombre
from
  producto p
where
  nombre like "%Portatil%";
--* UTF NO DISTINGE TILDE --- UTF BINARIO SI DISTINGE
  --*CONSULTA SOBRE VARIAS TABLAS.
  --!Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
  --version sql1
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  p.codigo_fabricante = f.codigo;
--me faltan los que no tienen codigo de fabricante mostrar ahora
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  p.codigo_fabricante = f.codigo
UNION
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  p.codigo_fabricante is null
  or p.codigo_fabricante = "";
-- version easy con join
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  LEFT --*sacame todo los registro dela tabla de la izquierda y lo que conincida con la dercha
  JOIN fabricante f on
where
  p.codigo_fabricante = f.codigo;
--*Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  LEFT --*sacame todo los registro dela tabla de la izquierda y lo que conincida con la dercha
  JOIN producto p on fabricante F
ORDER BY
  f.nombre;
--*Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
Select
  p.nombre,
  p.precio,
  f.nombre,
  f.codigo
from
  producto p LEFT --*sacame todo los registro dela tabla de la izquierda y lo que conincida con la dercha
  JOIN fabricante f on p.codigo_fabricante = f.codigo
ORDER BY
  f.nombre;
---*FECHA 2/14/2022
  --* Saca un listado donde aparezcan el producto o productos mas baratos;
  --el on hace que una las dos tablas
set
  @minimo: = (
    Select
      MIN(PP.precio)
    from
      producto PP
  );
set
  @maximo: =(
    Select
      MAX(PP.precio)
    from
      producto pp
  );
Select
  p.nombre,
  p.precio,
  f.nombre,
  f.codigo
from
  producto p
  left join fabricante f on p.codigo_fabricante = f.codigo
where
  p.precio = @minimo;
--ahora con el In
Select
  p.nombre,
  p.precio,
  f.nombre,
  f.codigo
from
  producto p
  left join fabricante f on p.codigo_fabricante = f.codigo
where
  p.precio in(@minimo);
set
  @minomo2: = (
    Select
      ppp.precio
    from
      ppp.producto
    order by
      1 asc by
    limit
      1
  );
--* Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
  ---*Devuelve una lista de todos los productos del fabricante Lenovo
Select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p
  inner join fabricante f on p.codigo_fabricante = f.codigo;
Select
  p.nombre,
  p.precio
from
  producto p
  inner join fabricante f on p.codigo_fabricante = f.codigo
where
  f.nombre = "Lenovo";
Select
  p.nombre,
  p.precio
from
  producto p
  inner join fabricante f on p.codigo_fabricante = f.codigo
where
  f.nombre in ("Lenovo");
--sin join
  -- Select
  --   p.nombre,
  --   p.precio
  -- from
  --   producto p,
  --   fabricante f p.codigo_fabricante = f.codigo
  --   and f.nombre()
  --*  Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
Select
  p.nombre,
  p.precio
from
  producto p,
  fabricante f
where
  p.codigo_fabricante = f.codigo
  and f.nombre in ("crucial")
  and p.precio > 200;
--con join
Select
  p.nombre,
  p.precio
from
  producto p
  inner join fabricante F on p.codigo_fabricante = f.codigo;
--no hace falta poner el where de antes where f.nombre in (crucial)  and p.precion > 200;
  --* Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN
select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  P.codigo_fabricante = F.codigo
  and f.nombre = "ASUS"
  or f.nombre = "Hewlett-Packardy "
  or f.nombre = "Seagate"
order by
  f.nombre;
--ahora con el numero 3 que significa columna 3 que es lo mismo
select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  P.codigo_fabricante = F.codigo
  and (
    f.nombre = "ASUS"
    or f.nombre = "Hewlett-Packardy "
    or f.nombre = "Seagate"
  )
order by
  3;
--ahora sin join
select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p,
  fabricante f
where
  P.codigo_fabricante = F.codigo
  and(
    f.nombre = "ASUS"
    or f.nombre = "Hewlett-Packardy "
    or f.nombre = "Seagate"
  )
order by
  3;
--* Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
select
  --columnas
  p.nombre,
  p.precio,
  f.nombre
from
  producto p --tabla
  inner join fabricante f on p.codigo_fabricante = f.codigo
where
  f.nombre like "%e";
--* Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre
select
  --columnas
  p.nombre,
  p.precio,
  f.nombre
from
  producto p --tabla
  inner join fabricante f on p.codigo_fabricante = f.codigo
where
  f.nombre like "%w%";
--*Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
select
  p.nombre,
  p.precio,
  f.nombre
from
  producto p
  inner join fabricante f ON p.codigo_fabricante = f.codigo
where
  p.precio >= 180
order by
  2 desc,
  1 asc;
--* Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos
select
  distinct f.nombre --solo quiero el nombre del fabricante
from
  producto p
  inner join fabricante f on p.codigo_fabricante = f.codigo;
--otra manera sin el distinct
select
  distinct f.nombre
from
  producto p
  inner join fabricante f on p.codigo_fabricante = f.codigo
group by
  f.nombre;
--* RESUELVA TODAS LAS CONSULTAS UTILIZANDO LAS CLÁUSULAS LEFT JOIN Y RIGHT JOIN
  --*  Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
Select
  distinct f.nombre
from
  producto p
  right join fabricante f on p.codigo_fabricante = f.codigo;
-- *Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado
SELECT
  DISTINCT f.nombre,
  p.nombre
FROM
  producto p
  right join fabricante f ON p.codigo_fabricante = f.codigo
WHERE
  p.codigo_fabricante IS null;
-- *¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta:
  -- NO ! ! ! ! TIENE UNA CONSTRAINT EL CAMPO "CODIGO_FABRICANTE" Y TAMPOCO PUEDE SER NULO.
  --*CREACION DE TABLA EMPLEADOS
  DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;
CREATE TABLE departamento (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DOUBLE UNSIGNED NOT NULL,
    gastos DOUBLE UNSIGNED NOT NULL
  );
CREATE TABLE empleado (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    codigo_departamento INT UNSIGNED,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
  );
INSERT INTO
  departamento
VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO
  departamento
VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO
  departamento
VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO
  departamento
VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO
  departamento
VALUES(5, 'I+D', 375000, 380000);
INSERT INTO
  departamento
VALUES(6, 'Proyectos', 0, 0);
INSERT INTO
  departamento
VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO
  empleado
VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO
  empleado
VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO
  empleado
VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO
  empleado
VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO
  empleado
VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO
  empleado
VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO
  empleado
VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO
  empleado
VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO
  empleado
VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO
  empleado
VALUES(10, '46384486H', 'Diego', 'Flores', 'Salas', 5);
INSERT INTO
  empleado
VALUES(11, '67389283A', 'Marta', 'Herrera', 'Gil', 1);
INSERT INTO
  empleado
VALUES(
    12,
    '41234836R',
    'Irene',
    'Salas',
    'Flores',
    NULL
  );
INSERT INTO
  empleado
VALUES(
    13,
    '82635162B',
    'Juan Antonio',
    'Sáez',
    'Guerrero',
    NULL
  );
--*Fecha 2/15/2022
select
  *
from
  alumno;
--quiero que me cuentes los telefonos
select
  count(tel é fono)
from
  alumno;
-- queiro contar si es repetidos
select
  count (es_repetidor)
from
  alumno;
select
  count(id)
from
  alumno;
--cuenta los que telefonos que hay, y aparece el primer nombre, no tiene sentido
select
  count(tel é fono),
  nombre
from
  alumno;
-- cuentame los repetidores, esto esta bien
  --*Explicacion del group by
select
  count (id),
  es_repetidor,
  nombre
from
  alumno
group by
  es_repetidor,
  nombre;
--cuenta los si y los no
select
  count(es_repetidor)
from
  alumno;
--cuantos campos distintos hay en la columna es_repetidor
select
  count(distinct es_repetidor) -- ponemos el distinct para que solo sace los valores posibles, en este caso si o no
from
  alumno;
--sale un dos porque hay un si y un no;
  --ahora mas claro `
select
  count(*),
  es_repetidor
from
  alumno
group by
  es_repetidor;
--quiero contar el numero de localidades que hay en cada una de las regiones
select
  count(*)
from
  localidades;
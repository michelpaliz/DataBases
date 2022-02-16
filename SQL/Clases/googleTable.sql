CREATE TABLE [name](
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  create_time DATETIME COMMENT 'Create Time',
  update_time DATETIME COMMENT 'Update Time',
  [column] VARCHAR(255) COMMENT ''
) DEFAULT CHARSET UTF8 COMMENT '';
-- DROP DATABASE IF EXISTS google;
-- CREATE DATABASE google CHARACTER SET utf8mb4;
-- USE google;
CREATE TABLE resultado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  url VARCHAR(512) NOT NULL
);
INSERT INTO
  resultado
VALUES
  (1, 'Resultado 1', 'Descripción 1', 'http://....');
INSERT INTO
  resultado
VALUES
  (2, 'Resultado 2', 'Descripción 2', 'http://....');
INSERT INTO
  resultado
VALUES
  (3, 'Resultado 3', 'Descripción 3', 'http://....');
INSERT INTO
  resultado
VALUES
  (4, 'Resultado 4', 'Descripción 4', 'http://....');
INSERT INTO
  resultado
VALUES
  (5, 'Resultado 5', 'Descripción 5', 'http://....');
INSERT INTO
  resultado
VALUES
  (6, 'Resultado 6', 'Descripción 6', 'http://....');
INSERT INTO
  resultado
VALUES
  (7, 'Resultado 7', 'Descripción 7', 'http://....');
INSERT INTO
  resultado
VALUES
  (8, 'Resultado 8', 'Descripción 8', 'http://....');
INSERT INTO
  resultado
VALUES
  (9, 'Resultado 9', 'Descripción 9', 'http://....');
INSERT INTO
  resultado
VALUES
  (
    10,
    'Resultado 10',
    'Descripción 10',
    'http://....'
  );
INSERT INTO
  resultado
VALUES
  (
    11,
    'Resultado 11',
    'Descripción 11',
    'http://....'
  );
INSERT INTO
  resultado
VALUES
  (
    12,
    'Resultado 12',
    'Descripción 12',
    'http://....'
  );
INSERT INTO
  resultado
VALUES
  (
    13,
    'Resultado 13',
    'Descripción 13',
    'http://....'
  );
INSERT INTO
  resultado
VALUES
  (
    14,
    'Resultado 14',
    'Descripción 14',
    'http://....'
  );
INSERT INTO
  resultado
VALUES
  (
    15,
    'Resultado 15',
    'Descripción 15',
    'http://....'
  );
--** Qué consulta SQL necesitamos realizar para incluir los primeros 5 resultados de la primera página?
SELECT
  *
from
  resultado
order by
  id ASC
limit
  5;
--**Qué consulta necesitaríamos para mostrar resultados de la segunda página?
  --  los cinco primeros me los saltos y muestro los siguientes 5
SELECT
  *
from
  resultado
order by
  id ASC
limit
  5 offset 5;
-- **Crear un variable para utilizarla en la propia query
  -- una variable set que son 5 registros
  -- y otra p que son el numero de paginas que quiero mostrar
  -- t = tamano de pagina
  -- p = numero de paina
set
  @t: = 5;
set
  @p: = 3;
SELECT
  *,
  @p * @t
from
  resultado
order by
  id ASC
limit
  @t offset (@p - * 1) * @t;
SELECT
  *,
  @p * @t
from
  resultado
where
  id between (@p -1) * @t
  and (@p -1) * @t + @t;
--*TABLA ALUMNO
  CREATE TABLE alumno (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido1 VARCHAR(100) NOT NULL,
    apellido2 VARCHAR(100),
    fecha_nacimiento DATE NOT NULL,
    es_repetidor ENUM('sí', 'no') NOT NULL,
    tel é fono VARCHAR(9)
  );
INSERT INTO
  alumno
VALUES(
    1,
    'María',
    'Sánchez',
    'Pérez',
    '1990/12/01',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    2,
    'Juan',
    'Sáez',
    'Vega',
    '1998/04/02',
    'no',
    618253876
  );
INSERT INTO
  alumno
VALUES(
    3,
    'Pepe',
    'Ramírez',
    'Gea',
    '1988/01/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    4,
    'Lucía',
    'Sánchez',
    'Ortega',
    '1993/06/13',
    'sí',
    678516294
  );
INSERT INTO
  alumno
VALUES(
    5,
    'Paco',
    'Martínez',
    'López',
    '1995/11/24',
    'no',
    692735409
  );
INSERT INTO
  alumno
VALUES(
    6,
    'Irene',
    'Gutiérrez',
    'Sánchez',
    '1991/03/28',
    'sí',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    7,
    'Cristina',
    'Fernández',
    'Ramírez',
    '1996/09/17',
    'no',
    628349590
  );
INSERT INTO
  alumno
VALUES(
    8,
    'Antonio',
    'Carretero',
    'Ortega',
    '1994/05/20',
    'sí',
    612345633
  );
INSERT INTO
  alumno
VALUES(
    9,
    'Manuel',
    'Domínguez',
    'Hernández',
    '1999/07/08',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    10,
    'Daniel',
    'Moreno',
    'Ruiz',
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    11,
    'Juanjo',
    'Pedraza',
    null,
    '1969/03/27',
    'no',
    666666666
  );
INSERT INTO
  alumno
VALUES(
    12,
    'Perico',
    'Palotes',
    "",
    '1969/03/27',
    'si',
    666666666
  );
INSERT INTO
  alumno
VALUES(
    13,
    'Paco',
    'Martinez',
    'Ruiz',
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    14,
    'Daniel',
    'Martinez',
    'Ruiz',
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    15,
    'Cristina',
    'Pedraza',
    'Ruiz',
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    16,
    'SA\%BC',
    'ET',
    NULL,
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno
VALUES(
    17,
    'SA\%BC',
    'ET',
    NULL,
    '1998/02/03',
    'no',
    NULL
  );
INSERT INTO
  alumno (NOMBRE, tel é fono)
values
  ("pedrito", "");
ALTER
FROM
  ALUMNO
WHERE
  ID = 16
ADD
  -- *Obtener el nombre y los apellidos de todos los alumnos en una única columna en minúscula
Select
  CONCAT_WS(" - / ", nombre, apellido1, apellido2) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
from
  alumno;
--* Buscar los que tiene NULL
  (
    Select
      upper(CONCAT_WS(" - / ", nombre, apellido1, apellido2)) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
    from
      alumno
    WHERE
      nombre is null
      or apellido1 is null
      or apellido2 is null
  );
--~lo contrario
  (
    Select
      upper(CONCAT_WS(" - / ", nombre, apellido1, apellido2)) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
    from
      alumno
    WHERE
      nombre is not null
      or apellido1 is not null
      or apellido2 is not null
  );
--~ahora todo unido
  (
    Select
      upper(CONCAT_WS(" - / ", nombre, apellido1, apellido2)) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
    from
      alumno
    WHERE
      nombre is null
      or apellido1 is null
      or apellido2 is null
  )
UNION
  (
    Select
      (CONCAT_WS(" - / ", nombre, apellido1, apellido2)) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
    from
      alumno
    WHERE
      nombre is not null
      or apellido1 is not null
      or apellido2 is not null
  );
--~otra forma
  (
    Select
      upper(CONCAT_WS(" ", nombre, apellido1, apellido2)) as alumnos -- CONCAT_WS -- ANADE UN ESPACIO
    from
      alumno
    WHERE
      concat(nombre, apellido1, apellido2) is null
  )
union
  (
    Select
      (CONCAT_WS(" ", nombre, apellido1, apellido2)) as alumnos -- concat_ws funciona como checkear si es void
    from
      alumno
  );;
--~ con if
Select
  if (
    CONCAT(nombre, apellido1, apellido2) is null,
    upper(CONCAT_WS(" ", nombre, apellido1, apellido2)),
    CONCAT_WS(" ", nombre, apellido1, apellido2)
  ) as alumnos
from
  alumno;
--!dsaflkjslakfj  --!>dasfjkl
  --#FDASDF
  -- *Obtener el nombre y los apellidos de todos los alumnos en una única columna en mayúscula.
  --*Obtener los que son hermanos y que las cuente
  -- where apellido like "matinez" and "lopez"
  -- having quedate con solo esto
select
  apellido1,
  apellido2,
  COUNT(CONCAT_ws("", apellido1, apellido2)) total
from
  alumno
GROUP BY
  apellido1,
  apellido2
having
  total > 1;
select
  distinct apellido1,
  apellido2
from
  alumno
where
  apellido1 like "Pe%";
select
  apellido1,
  apellido2
from
  alumno
where
  apellido1 like "Pe%";
--> ORDEN BY
  -- orden alfabetio por el campo apellido 1 es equivalente a poner asc
Select
  *
from
  alumno
order by
  apellido1 ASC;
Select
  *
from
  alumno
order by
  apellido1 DESC;
--* como ordenar con multiples columnas
Select
  *
from
  alumno
order by
  apellido1,
  apellido2;
--se refiere a la select de arriba
Select
  *
from
  alumno
order by
  3,
  4;
Select
  *
from
  alumno
order by
  2,
  3;
select
  nombre,
  apellido1,
  apellido2,
  ID
from
  alumno
order by
  apellido1,
  apellido2,
  nombre;
--> LIMIT
  --~ VAMOS A USAR LA TABLA DE GOOGLE
  --* modificar la tabla para que la url aparezca http .com
  --* replace para eliminar el espacio en blanco
  --nombre tiene un espacio en blanco que hay que eliminar y en minuscula
update
  resultado
set
  url = lower(
    CONCAT("http://", replace(nombre, " ", ""), ".com")
  );
--* ¿Qué consulta SQL necesitamos realizar para incluir los primeros 5 resultados de la primera página?
select
  *
from
  resultado
limit
  5;
--* ¿Qué consulta necesitaríamos para mostrar resultados de la segunda página?
  -- *¿Y cualquier página?
SET
  @limite = 5;
SET
  @p = 3;
-- 5 registros pero los id mayor que 10
SELECT
  *
FROM
  resultado
WHERE
  id > @a *(@p -1)
  AND id <= @limite *(@p -1) + @limite;
-- BETWEEN es igual a >=
select
  *
from
  resultado
where
  id BETWEEN @limite *(@p -1) + 1
  and @limite *(@p -1) + @limite;
--> WHERE
  -- *Obtener el nombre de todos los alumnos que su primer apellido sea Martínez.
Select
  *
from
  alumno A
where
  A.apellido1 = "Martinez";
Select
  *
from
  alumno
where
  apellido1 = "Martinez";
Select
  *
from
  alumno
where
  apellido1 like "Martinez";
-- *Obtener todos los datos del alumno que tiene un id igual a 9.
SELECT
  *
FROM
  alumno
WHERE
  id = 9;
--* Obtener el nombre y la fecha de nacimiento de todos los alumnos nacieron después del 1 de enero de 1997
select
  nombre,
  fecha_nacimiento
from
  alumno
where
  fecha_nacimiento >= "1997/01/01";
-- *Devuelve los datos del alumno cuyo id es igual a 1.
select
  *
from
  alumno
where
  id = 1;
-- *Devuelve los datos del alumno cuyo teléfono es igual a 692735409
select
  nombre,
  tel é fono
from
  alumno
where
  tel é fono = 692735409;
-- *Devuelve un listado de todos los alumnos que son repetidores
select
  *
from
  alumno
where
  es_repetidor = "si";
select
  *
from
  alumno a
where
  a.es_repetidor in ("no", "desconido", "", null);
-- *Devuelve un listado de todos los alumnos que no son repetidores
select
  *
from
  alumno
where
  es_repetidor = "no";
select
  *
from
  alumno a
where
  a.es_repetidor not in ("no", null, "");
-- *Devuelve el listado de los alumnos que han nacido antes del 1 de enero de 1993
select
  nombre,
  fecha_nacimiento
from
  alumno
where
  fecha_nacimiento <= "1993/01/01";
-- *Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994
select
  nombre,
  fecha_nacimiento
from
  alumno
where
  fecha_nacimiento <= "1994/01/01";
select
  *
from
  alumno A
where
  A.es_repetidor in ("no", null, "")
  and A.fecha_nacimiento >= "1994";
-- *Devuelve el listado de los alumnos que han nacido después del 1 de enero de 1994 y no son repetidores.
select
  *
from
  alumno
where
  fecha_nacimiento >= "1994/01/01"
  and es_repetidor = "no";
select
  *
from
  alumno A
where
  A.es_repetidor not in ("no", null, "")
  and A.fecha_nacimiento >= "1994";
-- *Devuelve el listado de todos los alumnos que no nacieron en 1998.
select
  *
from
  alumno
where
  fecha_nacimiento like "1998%";
select
  *
from
  alumno
where
  fecha_nacimiento BETWEEN "1998/01/01"
  and "1998/12/31";
select
  *
from
  alumno a
where
  a.fecha_nacimiento BETWEEN "1998/01/01"
  and "1998/12/31";
select
  *
from
  alumno a
where
  year(a.fecha_nacimiento) = 1998;
select
  *
from
  alumno a
where
  year(a.fecha_nacimiento) != 1998;
-- *Devuelve los datos de los alumnos que hayan nacido entre el 1 de enero de 1998 y el 31 de mayo de 1998
select
  *
from
  alumno
where
  fecha_nacimiento BETWEEN "1998/01/01"
  and "1998/05/31";
--> IN
  -- *Obtener todos los datos de los alumnos que tengan como primer apellido Sánchez, Martínez o Domínguez.
SELECT
  *
FROM
  alumno
WHERE
  apellido1 IN ("Sánchez", "Martínez", "Domínguez");
--> LIKE
  -- *Devuelva un listado de todos los alumnos que su primer apellido empiece por la letra S
SELECT
  *
FROM
  alumno
WHERE
  apellido1 LIKE 'S%';
-- *Devuelva un listado de todos los alumnos que su primer apellido termine por la letra z.
SELECT
  *
FROM
  alumno
WHERE
  apellido1 LIKE '%z';
-- *Devuelva un listado de todos los alumnos que su nombre tenga el carácter a.
SELECT
  *
FROM
  alumno
WHERE
  nombre LIKE '%a%';
-- *Devuelva un listado de todos los alumnos que tengan un nombre de cuatro caracteres.
SELECT
  *
FROM
  alumno
WHERE
  nombre LIKE '____';
SELECT
  *
FROM
  alumno
WHERE
  LENGTH(nombre) = 4;
SELECT
  *
FROM
  alumno
WHERE
  CHAR_LENGTH(nombre) = 4;
-- *Devuelve un listado de todos los productos cuyo nombre empieza con estas cuatro letras «A%BC».
SELECT
  *
FROM
  alumno
WHERE
  nombre LIKE 'A$%BC%' ESCAPE '$';
SELECT
  *
FROM
  alumno
WHERE
  nombre LIKE '%A\%BC%';
SELECT
  *
FROM
  alumno
where
  tel é fono is null
  or tel é fono = "";
SELECT
  *
FROM
  alumno
where
  tel é fono in ("");
-- cadena vacia != nulo
  -- *Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre de los alumnos y en la segunda, el nombre con todos los caracteres invertidos
Select
  alumno,
  reverse (nombre) alreves
from
  alumno;
-- *Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los apellidos de los alumnos y en la segunda, el nombre y los apellidos con todos los caracteres invertidos.
Select
  CONCAT_ws(" ", nombre, apellido1),
  reverse(
    CONCAT_ws(" ", Reverse(nombre), Reverse(apellido1))
  )
from
  alumno;
-- *Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y
  --* los apellidos de los alumnos en mayúscula y en la segunda, el nombre y los apellidos con todos los caracteres invertidos en minúscula.
Select
  upper (CONCAT_ws(" ", nombre, apellido1)) mayus,
  reverse(
    CONCAT_ws(" ", Reverse(nombre), Reverse(apellido1))
  )
from
  alumno;
-- *Devuelve un listado con tres columnas, donde aparezca en la primera columna el nombre y los apellidos de los alumnos,
  -- *en la segunda, el número de caracteres que tiene en total el nombre y los apellidos y en la tercera el número de bytes que ocupa en total.
Select
  upper (CONCAT_ws(" ", nombre, apellido1)) nom,
  CHAR_LENGTH(concat_ws("", nombre, apellido1, apellido2)) num_car,
  LENGTH((CONCAT_ws(" ", nombre, apellido1, apellido2))) num_bytes
from
  alumno;
-- *Devuelve un listado con dos columnas, donde aparezca en la primera columna el nombre y los dos apellidos
  --  *de los alumnos. En la segunda columna se mostrará una dirección de correo electrónico que vamosa calcular para cada alumno.
  -- * La dirección de correo estará formada por el nombre y el primer apellido, separados por el carácter . y seguidos por el dominio @ieslamar.org. Tenga en cuenta que la dirección de correo electrónico debe estar en minúscula. Utilice un alias apropiado para cada columna.
Select
  CONCAT_ws(" ", nombre, apellido1, apellido2) nom,
  lower(
    concat(
      CONCAT_ws(".", nombre, apellido1),
      "@ieslamar.org"
    )
  ) email
from
  alumno;
--~ pedrito sale con punto porque no tiene apellido 1 vamos a repetir el nombre con el apellido
select
  *
from
  alumno;
Select
  CONCAT_ws(" ", nombre, apellido1, apellido2) nom,
  lower(
    concat(
      CONCAT_ws(
        ".",
        nombre,
        if(
          apellido1 is null
          or apellido1 = "",
          nombre,
          apellido1
        )
      ),
      "@ieslamar.org"
    )
  ) email
from
  alumno;
Select
  CONCAT_ws(" ", nombre, apellido1, apellido2) nom,
  lower(
    concat(
      CONCAT_ws(
        ".",
        nombre,
        if(CHAR_LENGTH(apellido1) = 0, nombre, apellido1)
      ),
      "@ieslamar.org"
    )
  ) email
from
  alumno;
-- *hacer que si no tienen apellidos solo aparezcan el nombre
Select
  CONCAT_ws(" ", nombre, apellido1, apellido2) nom,
  concat (
    if (
      char_lenght (apellido1) = 0,
      REPLACE (concat_ws()) replace
      from
        alumno;
--> SISTEMA
        --~ a la fecha de hoy sumale 56 dias.
      Select
        adddate (now(), interval 56 day);
      Select
        adddate (now(), 56 d);
      Select
        date_format(now(), "%a lo que quiera%W") d;;
      select
        date_format(now(), "%a lo que quiera%W");
show variables;
show session variables;
--~ toda la base de datos
        show global variables;
      select
        date - format;
--~Chekear que hora hay
      SELECT
        @ @GLOBAL.time_zone,
        @ @SESSION.time_zone;
--~en mi sesion vas a trabajar con el mediriano +1
      SET
        time_zone = '+1:00';
--~devuelve la fecha actual
      SELECT
        NOW();
-- *Devuelva un listado con cuatro columnas, donde aparezca en la primera columna la fecha de nacimiento completa de los alumnos,
        --*en la segunda columna el día, en la tercera el mes y en la cuarta el año. Utilice las funciones DAY, MONTH y YEAR.
      Select
        A.fecha_nacimiento,
        Day (A.fecha_nacimiento) d,
        month(A.fecha_nacimiento) m,
        Year(A.fecha_nacimiento) aa,
      from
        alumno A;
--~ Saca o averigua el dia de nacimiento
      Select
        A.fecha_nacimiento,
        Day (A.fecha_nacimiento) d,
        month(A.fecha_nacimiento) m,
        Year(A.fecha_nacimiento) aa,
        date_format (a.fecha_nacimiento, "%W") aaa
      from
        alumno A;
--~ Querido@ nombre apellido, su cumpleanos fue le dia 27 (jueves) de marzo de 1969
        --~ Vamos a hacer una carta programada, genera una query para que genera todas las cabeceras de una carta
      SELECT
        CONCAT_WS(
          " ",
          "Querid@",
          nombre,
          CONCAT(apellido1, ","),
          "su cumpleaños fue el día",
          DATE_FORMAT(A.fecha_nacimiento, "%e"),
          CONCAT(
            "(",
            DATE_FORMAT(A.fecha_nacimiento, "%W"),
            ") de"
          ),
          DATE_FORMAT(A.fecha_nacimiento, "%M"),
          "de",
          DATE_FORMAT(A.fecha_nacimiento, "%Y")
        ) aaa
      FROM
        alumno A;
      Select
        CONCAT_WS(
          " ",
          "Querid@",
          nombre,
          Concat(apellido1, ","),
          "tienes",
          DATEdiff(NOW(), A.fecha_nacimiento),
          "dias"
        ) aaa
      from
        alumno A;
-- *Calcular los dias que me quedan
      Select
        CONCAT_WS(
          " ",
          "Querid@",
          nombre,
          Concat(apellido1, ","),
          "te quedan",
          82 * 365 - DATEdiff(NOW(), A.fecha_nacimiento),
          "dias"
        ) aaa
      from
        alumno A;
--* Devuelva un listado con dos columnas, donde aparezca en la primera columna la fecha de nacimiento de los alumnos y
        --* en la segunda columna la edad de cada alumno/a. La edad (aproximada) la podemos calcular realizando las siguientes operaciones:
        --*  1• Calcula el número de días que han pasado desde la fecha actual hasta la fecha de nacimiento. Utilice las funciones DATEDIFF y NOW:
        --*  3• Divida entre 365.25 el resultado que ha obtenido en el paso anterior.
        -- * (El 0.25 es para compensar los años bisiestos que han podido existir entre la fecha de nacimiento y la fecha actual).
        -- *3• Trunca las cifras decimales del número obtenido
      SELECT
        CONCAT_WS(
          " ",
          "Querid@",
          nombre,
          CONCAT(apellido1, ","),
          "tienes",
          truncate(DATEDIFF(NOW(), A.fecha_nacimiento) / 365.25, 2),
          "años"
        ) anyo
      FROM
        alumno A;
-->TABLA
        Create table productos(
          nombre VARCHAR (200),
          descripcion varchar(5000)
        );
      insert into
        productos
      values("calcetines", "rojos de algodon de las talla 43");
      insert into
        productos
      values("calcetines", "verdes de lino  de la talla  41");
      insert into
        productos
      values(
          "calcetines",
          "amarillo  de lino  de la talla  38"
        );
      insert into
        productos
      values(
          "calzoncillos",
          "rosa  de algodon  de la talla  41"
        );
      insert into
        productos
      values(
          "calzoncillos",
          "rojo  de algodon  de la talla  38"
        );
      insert into
        productos
      values(
          "calzoncillos",
          "violeta  de algodon  de la talla  38"
        );
      select
        *
      from
        productos;
      select
        *
      from
        productos
      where
        nombre like "%Calcetines%"
        and descripcion like "%lino%";
-- *crear un indice sobre dos campos a la vez
        Create fulltext index idx_nom_desc on productos(nombre, descripcion);
-- cualquier campo sea nombre o descripcion  necesito el indice fulltext para que funciones esto
      Select
        *
      from
        productos
      where
        match(nombre, descripcion) against("calcetines lino ");
--* FULL TEXT
        --against es como el like (funciona como google lo que mas se aprox)
      select
        *
      from
        productos
      where
        match(nombre, descripcion) against('Cal');
--* CREAMOS UNA TABLA COCHES
        CREATE TABLE coches (
          idprod INT(11) NOT NULL AUTO_INCREMENT,
          nombre VARCHAR(120),
          descripcion VARCHAR(255),
          PRIMARY KEY (idprod)
        );
--!VAMOS A INSERTAR VALORES EN LA TABLA COCHE
      Insert into
        coches (nombre, descripcion)
      values
        (
          "Audi A3",
          "Motor 1.800 negro abs  llantas aleacion"
        );
      Insert into
        coches (nombre, descripcion)
      values
        ("Audi A3", "Motor 1.500 blanco  abs  freno");
      Insert into
        coches (nombre, descripcion)
      values
        ("Citroen", "Motor 1.200  rojo  frenos de disco");
      Insert into
        coches (nombre, descripcion)
      values
        ("Seat Leon", "Motor 2000 marron electrico");
      Insert into
        coches (nombre, descripcion)
      values
        ("Nissan", "Motor 1.800 verde full equip");
      Insert into
        coches (nombre, descripcion)
      values
        (
          "Mercedes",
          "ya voy 2.500 "
        );
--~SELECTS DE LA TABLA COCHE
      select
        *
      from
        coches
      where
        nombre like "Seat"
        and descripcion like "%blanco%";
      select
        *
      from
        coches
      where
        nombre like "Seat"
        or descripcion like "%blanco%";
--! ARRGLARLO PARA QUE PUEDA HACER UNA BUSQUEDA FULL TEXT;
        CREATE FULLTEXT INDEX idx_coche_descripcion ON coches (nombre, descripcion);
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("mercedes");
--! es una forma desordenada
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("Seat blanco " in boolean mode);
--!
        --! por narices tiene que salir +ven
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("Seat blanco +ven " in boolean mode);
--!
        --! quiero que salga todo pero que no salga el ven
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("Seat +blanco" in boolean mode);
--! si yo quiero que los que tengan el ven me los ordene como los primeros
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("Seat >blanco" in boolean mode);
--!y ahora con menos importancia
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("Seat <blanco" in boolean mode);
--! mi prioridades tiene que tener 4 habitaciones
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("+blanco " in boolean mode);
--!  el * que tenga la letra blan
      Select
        *
      from
        coches
      where
        match(nombre, descripcion) against("audi blan* -negro " in boolean mode);
--! mezaclamos el match con el select al principio de la seleccion;
        -- Select
        --   *,`
        --   match(nombre, descripcion) against("audi <blanco >freno" in boolean mode) as puntos
        -- from
        --   coches
        -- where
        --   match(nombre, descripcion) against("audi <negro" in boolean mode);
        --*ERRORES MYSQL
      Select
        *
      from
        alumno
      where
        telefono is null;
--Nunca se puede usar un =con un %
      Select
        *
      from
        alumno
      where
        apellido = "S%";
--MAL
      select
        *
      from
        alumno
      where
        apellido1 != "S%";
--BIEN SOLO QUE TENGA SOLO UNA S
      select
        *
      from
        alumno
      where
        apellido1 not like "S%";
      select
        *
      from
        alumno
      where
        apellido1 not like "%S%";
      select
        *
      from
        alumno
      where
        apellido1 like "%a%";
      Select
        substring(apellido1, 1, 5) as extracString
      From
        alumno;
---!como un DISTINCT
      Select
        *
      from
        alumno
      where
        left(apellido1, 1) != "D"
        and right (apellido1, 1) != "d";
--!recoge infr
      select
        *
      from
        alumno
      where
        fecha_nacimiento >= "1999/01/01"
        and fecha_nacimiento <= "1999/12/31";
--!between ------ and --------
      select
        *
      FROM
        alumno
      where
        fecha_nacimiento BETWEEN "1999/01/01"
        and "1999/12/31";
      select
        *
      FROM
        alumno
      where
        fecha_nacimiento not BETWEEN "1999/01/01"
        and "1999/12/31";
      Select
        left (apellido1, 1)
      from
        alumno;
      Select
        right (apellido1, 1)
      from
        alumno;
--!Dos columnas creadas que son L Y R
      Select
        left (apellido1, 1) L,
        RIGHT(apellido1, 1) R,
        apellido1
      from
        alumno;
--!Todo menos la letra d
      Select
        left (apellido1, 1) L,
        RIGHT(apellido1, 1) R,
        apellido1
      from
        alumno
      WHERE
        left(apellido1, 1) != "D"
        or RIGHT(apellido1, 1) != 0;
      Select
        1 + "-2";
      Select
        CONCAT("1", "1");
--!sacamos el 11
      select
        "2021-01-31" - "2021-02-01";
      select
        datediff(NOW() - "2021-32-01");
--!me convierte la fecha en int
      select
        CAST("2021-01-31" as date) - CAST("2021-02-01" as date);
      select
        datediff("2021-01-31", "2021-02-01");
--!Return the absolute value of a number:
      select
        abs(datediff("2021-01-31", "2021-02-01"));
CREATE TABLE log(
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  fecha DATETIME not NULL,
  Descripcion VARCHAR(255) not null,
  usuario VARCHAR(50) not null,
  anterior VARCHAR(255) not null,
  nuevo VARCHAR(254) NOT null
);

CREATE TABLE log(
  id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
  fecha DATETIME not NULL,
  Descripcion VARCHAR(255) not null,
  usuario VARCHAR(50) not null,
  anterior VARCHAR(255) not null,
  nuevo VARCHAR(254) NOT null
);

drop table if exists personas_copy;

alter table
  personas
add
  id int(6) UNSIGNED primary key AUTO_INCREMENT;

alter table
  personas
MODIFY
  COLUMN id BIGINT first;

rename table base de datos - personas y productos to db_personas;

select
  *
from
  personas p
where
  id = 1;

show databases;

CREATE TABLE personas_copy LIKE personas;

-- this code below duplicates the table                                     
Create table personas_copy as
select
  *
from
  personas;

--**Functions
CREATE FUNCTION sumatory(a INT, b int) RETURNS INT BEGIN declare result int;

set
  result = a + b;

RETURN result;

END;

--call the function
SELECT
  sumatory(5, 10);

set
  @start := 1,
  @finish := 10;

Select
  sumatory(@start, @finish);

DROP FUNCTION sumatory;

--
--hay que chekear la papelera por mas de 30 dias, 
--
SELECT
  plazos
FROM
  factura
WHERE
  factura_id = NEW.factura.id;

---------
CREATE DEFINER = `root` @`localhost` PROCEDURE `actualiza_importe_pagos`(
  IN `pid` INT,
  IN `pimporte` FLOAT,
  IN `pplazos` INT
) LANGUAGE SQL NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER COMMENT '' BEGIN DECLARE idpago INT;

--para obtener los pagos de la factura cogiendo el id que aparezcan
DECLARE cont INT DEFAULT 0;

DECLARE a INT;

-- pago
DECLARE t FLOAT;

-- total de la factura
--*to loop over a predetermined number of rows one at a time. 
DECLARE cur CURSOR FOR
SELECT
  id
FROM
  pagos
WHERE
  fk_factura = pid;

--- el parametro que estoy pasando en el procedimiento
OPEN cur;

--* hacemos una operacion que cuota le corresponde los pagos
SET
  a = ROUND(pimporte / pplazos, 0);

SET
  t = pimporte;

---
--*Empezamos el bucle 
WHILE cont < pplazos DO fetch cur INTO idpago;

if cont = pplazos -1 then -- para saber si estoy en el ultimo registro
set
  a = t;

-- pago = el resto por lo que me queda por pagar
END if;

---*actuliza la tabla
UPDATE
  pagos
SET
  importe = a
WHERE
  id = idpago;

--*contador para q el bucle no sea infinito
SET
  cont = cont + 1;

--* para que me quede el resto 
SET
  t = t - a;

END WHILE;

CLOSE cur;

END ----------
CREATE DEFINER = `root` @`localhost` PROCEDURE `actualiza_fecha_pagos`(IN `pid` INT, IN `pfecha` FLOAT) LANGUAGE SQL NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER COMMENT '' BEGIN DECLARE idpago INT;

--para obtener los pagos de la factura cogiendo el id que aparezcan
DECLARE cont INT DEFAULT 0;

--*to loop over a predetermined number of rows one at a time. 
DECLARE cur CURSOR FOR
SELECT
  id
FROM
  pagos
WHERE
  fk_factura = pid;

--- el parametro que estoy pasando en el procedimiento
OPEN cur;

WHILE cont < pplazos DO fetch cur INTO idpago;

-- el id me lo guardo en la variable idpago con el fetch idpago = 101
UPDATE
  pagos
SET
  fecha_pago = DATE_ADD(pfecha, interval cont month) -- el cont empieza con 0 
WHERE
  id = idpago;

SET
  cont = cont + 1;

END WHILE;

CLOSE cur;

END --! hacer una funcion comprobar clave pasada como minimo 8 char, que tiene un simbolo, si esta bien me devuelve el mismo si no pues me devuelve otra aleatoriamente.
DROP FUNCTION IF EXISTS `generaPassword`;

CREATE FUNCTION `checkPassword` (
  'pLongitud' varchar,
  'pNumeros' varchar,
  'pSimbolos' varchar,
  'pLetras' varchar
) returns varchar BEGIN declare cont int default 0;

declare newpass varchar(50) default "";

declare p1 int default if longitud < 3 then
set
  newpass = "longitud_no_permitida";

else
set
  newpass = "";

end if;

return newpass;

END;

select
  round(rand() * 10, 0);

select
  round CREATE FUNCTION `function_name`(`arg_name` INT) RETURNS INT BEGIN
END;

---Fecha 24-05-2022
Select
  generaalgo("aeiou", "$&!", "1234", 6);

---*CREATE TABLES
--Tabla actividades 
CREATE TABLE IF NOT EXISTS `tabla_tareas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255),
  `duracion` int,
  `fecha_inicio` DATE,
  `horas_dia` int,
  PRIMARY KEY `pk_id`(`id`)
);

CREATE TABLE IF NOT EXISTS `tabla_calendario` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fk_tarea` int,
  `fecha` DATE,
  `hora` int,
  PRIMARY KEY `pk_id`(`id`)
);

CREATE TABLE IF NOT EXISTS `registro_movimientos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_usuario` int,
  `fecha_actualizacion` DATE,
  `operation` varchar(100),
  PRIMARY KEY `pk_id`(`id`)
);

DROP TABLE IF EXISTS `registro_movimientos`;

--*CREATE TRIGGERS
CREATE TRIGGER `tareas`
AFTER
INSERT
  ON `tabla_tareas` FOR EACH ROW BEGIN -- Use NEW and OLD constants for access to row
  declare @login_name varchar(120)
insert into
  tabla_calendario (null,, sysdate(),);

END;

CREATE TRIGGER `registro`
AFTER
INSERT
  ON `tabla_tareas` FOR EACH ROW for
insert
,
update
,
  delete BEGIN as declare @login_name varchar(100)
SELECT
  @login_name = mysql.user
from
END;

--!Trigger created
CREATE TRIGGER `insert_data`
AFTER
INSERT
  ON `tabla_tareas` FOR EACH ROW BEGIN
INSERT INTO
  registro_movimientos
values
  (null, @ms, sysdate(), 'Insert_after');

END;

--!
DROP TRIGGER IF EXISTS `delete_date`;

CREATE TRIGGER `delete_date`
AFTER
  DELETE ON `tabla_tareas` FOR EACH ROW BEGIN -- Use NEW and OLD constants for access to row
delete from
  tabla_calendario
where
  old.id = fk_tarea;

END;

--*SELECTS TABLES
SELECT
  *
FROM
  mysql.user m
where
  m.User like '%root';

SELECT
  *
FROM
  registro_movimientos;

--*DROP TABLES OR ROWS;
s --- Delete rows from table 'tabla_calendario'
DELETE FROM
  tabla_calendario as t
WHERE
  t.id = 1;

DROP TRIGGER IF EXISTS `update_data`;

--*INSERTS VALUES NOW
INSERT INTO
  tabla_tareas
VALUES
  (
    -- first row: values for the columns in the list above
    default,
    'Jhoan',
    48,
    now(),
    6
  );

--*TESTING
set
  @message = CONCAT("SQL ", "Tutorial ", "is ", "fun!");

set
  @ms = CONCAT("Usuario ", user());

select
  @ms;

select
  @message;

SELECT
  CONCAT("SQL ", "Tutorial ", "is ", "fun!") AS ConcatenatedString;
--Fecha 31-03-2022
--Apartir de esta criptacion no se puede desencriptar
Select
  MD5 ("12345678");
DELIMITER;
--Se crea la funcion y se guarda en la db
  Create Function md55 (clave VARCHAR (50)) returns varchar(50) begin return "aaa";
end $ $;
--Seleccionar la funcion creada
Select
  MD5 ("12345678");
--eliminar funcion
  --
  Drop Function if exists md55 $ $;
--*CREACION DE LA FUNCION
  DELIMITER $ $ DROP FUNCTION if EXISTS MD55 $ $ CREATE FUNCTION MD55 (clave VARCHAR(50)) RETURN VARCHAR(50) BEGIN RETURN MD5(MD5(clave));
END $ $ DELIMITER;
---Creacion de otra FUNCTIOn
--primero creamo la funcion llamada md555
Select
  MD555 ("12345678");
--Primera funcion va hacer una criptacion ()
  --Segunda funcion llamada escorrecto pasar la original y la encripatada, devolvera -1 si esta mal o 1 si esta bien;
select
  encripta("1234");
select
  es_correcto("1234", "clave");
-- ENCRIPTAMOS TODOS LOS NOMBRES DE LA TABLA ACTOR
Select
  *,
  MD555(NOMBRE)
FROM
  ACTOR;
--Fecha  01/03/2022
  DROP FUNCTION if EXISTS es_correcto;
Create Function es_correcto (clave VARCHAR (50), encriptado VARCHAR(50)) returns int BEGINS declare ok int
set
  ok = -1;
if(MD5(clave) = encriptado) then
set
  ok = 0;
end if return ok
end;
--Corregido
DELIMITER $ $ DROP function IF EXISTS es_correcto $ $ CREATE FUNCTION es_correcto(clave VARCHAR(50), encriptado VARCHAR(50)) RETURNS int BEGIN DECLARE ok INT;
SET
  ok = -1;
if (encripta(clave) = encriptado) then
set
  ok = 0;
END if;
RETURN ok;
END $ $ DELIMITER;
Select
  myFunction ("12345678");
DROP FUNCTION if EXISTS MD55 $ $ CREATE FUNCTION MD55 (clave VARCHAR(50)) RETURN VARCHAR(50) BEGIN RETURN MD5(MD5(clave));
--Pasar base, iva , otro iva neto o el iva correspondiente
  --calcular_iva(base,tipo,modo)
  --- el modo Tipo T es base + base * tipo
  --- modo Tipo I base * tipo;

Drop Function if exists `calcula_IVA`;

-- fecha 04 - 04 - 2022 

START TRANSACTION;
SELECT @sueldo:=SUM(total) 
FROM pago p
WHERE p.id_empleado = 1;
UPDATE empleado e SET e.password = @sueldo
WHERE e.id_empleado = 1;
COMMIT;


SET autocommit = 0;
INSERT INTO clientes VALUES (2,'maria');
INSERT INTO clientes VALUE (20,'juan');
DELETE FROM clientes WHERE nombre = 'pepe';

---- Fecha 05-04-2022

CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE
);
INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');
SELECT * FROM producto;

CREATE TABLE if not exists post (
id INT UNSIGNED PRIMARY KEY,
tittle VARCHAR(100) NOT NULL
);
insert into post(id,tittle) values (1,"Transaction");
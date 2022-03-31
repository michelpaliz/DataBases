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
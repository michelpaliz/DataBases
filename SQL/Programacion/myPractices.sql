CREATE TABLE log(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    fecha DATETIME not NULL,
    Descripcion  VARCHAR(255)  not null,
    usuario VARCHAR(50) not null,
    anterior VARCHAR(255) not null,
    nuevo VARCHAR(254)NOT null
);

CREATE TABLE log(  
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    fecha DATETIME not NULL,
    Descripcion  VARCHAR(255)  not null,
    usuario VARCHAR(50) not null,
    anterior VARCHAR(255) not null,
    nuevo VARCHAR(254)NOT null
);




drop table if exists personas_copy;

alter table personas
add  id int(6)  UNSIGNED primary key AUTO_INCREMENT;

alter table personas MODIFY COLUMN id BIGINT first; 

rename table base de datos - personas y productos to db_personas;

select 
    *
from personas p
where id = 1;

show databases;

CREATE TABLE personas_copy
LIKE personas;

-- this code below duplicates the table                                     
Create table personas_copy as select * from personas;

--**Functions

CREATE FUNCTION sumatory( a  INT, b int ) RETURNS INT
BEGIN
    declare result int;
    set result = a + b; 
  RETURN result;
END;

--call the function
SELECT  sumatory(5,10);

set @start := 1, @finish := 10;
Select sumatory(@start, @finish);

DROP FUNCTION sumatory;

--
--hay que chekear la papelera por mas de 30 dias, 
--
SELECT plazos FROM factura WHERE factura_id = NEW.factura.id;
---------
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_importe_pagos`(
   IN `pid` INT,
   IN `pimporte` FLOAT,
   IN `pplazos` INT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
  DECLARE idpago INT; --para obtener los pagos de la factura cogiendo el id que aparezcan
  DECLARE cont INT DEFAULT 0;
  DECLARE a INT; -- pago
  DECLARE t FLOAT; -- total de la factura
  --*to loop over a predetermined number of rows one at a time. 
  DECLARE cur CURSOR FOR 
     SELECT id FROM pagos
     WHERE fk_factura = pid; --- el parametro que estoy pasando en el procedimiento
  OPEN cur;
  --* hacemos una operacion que cuota le corresponde los pagos
  SET a = ROUND(pimporte/pplazos,0);
  SET t = pimporte;---
  --*Empezamos el bucle 
  WHILE cont < pplazos DO
    fetch cur INTO idpago;
    if cont = pplazos-1 then -- para saber si estoy en el ultimo registro
      set a = t; -- pago = el resto por lo que me queda por pagar
    END if;  
    ---*actuliza la tabla
    UPDATE pagos 
      SET importe = a 
      WHERE id = idpago;
      --*contador para q el bucle no sea infinito
    SET cont = cont +1;
    --* para que me quede el resto 
    SET t = t - a;
  END WHILE;
  CLOSE cur; 
END

----------
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualiza_fecha_pagos`(
   IN `pid` INT,
   IN `pfecha` FLOAT
)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
  DECLARE idpago INT; --para obtener los pagos de la factura cogiendo el id que aparezcan
  DECLARE cont INT DEFAULT 0;
  --*to loop over a predetermined number of rows one at a time. 
  DECLARE cur CURSOR FOR 
     SELECT id FROM pagos 
     WHERE fk_factura = pid; --- el parametro que estoy pasando en el procedimiento
  OPEN cur;
   WHILE cont < pplazos DO
    fetch cur INTO idpago; -- el id me lo guardo en la variable idpago con el fetch idpago = 101
    UPDATE pagos 
      SET fecha_pago = DATE_ADD(pfecha, interval cont month) -- el cont empieza con 0 
      WHERE id = idpago;
    SET cont = cont +1;
     END WHILE;
  CLOSE cur; 
END

--! hacer una funcion comprobar clave pasada como minimo 8 char, que tiene un simbolo, si esta bien me devuelve el mismo si no pues me devuelve otra aleatoriamente.

DROP FUNCTION IF EXISTS `function_name`;
CREATE FUNCTION `checkPassword`(`password` varchar(50)) RETURNS varchar

BEGIN
  
END;

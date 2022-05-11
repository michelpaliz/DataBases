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

---Fecha 17-04-2022

CREATE TABLE Employee (
    ID int AUTO_INCREMENT,
    LastName varchar(255) ,
    FirstName varchar(255),
    Age int,
    Salary double,
    PRIMARY KEY(ID)
);

Drop table if exists employee;

insert into employee (`FirstName`,`LastName`,`Age`,`Salary`)
VALUES ("Michael", "Paliz", 21,900);
insert into employee (`FirstName`,`LastName`,`Age`,`Salary`)
VALUES ("Jhoan", "Paliz", 19,900);

insert into employee (`FirstName`,`LastName`,`Age`,`Salary`)
VALUES ("Selena", "Paliz", 3,900);




Begin tran;
update Employee
set 
  Salary = Salary + 100
where ID = 1;
WaitFor delay '00:00:10'
Rollback tran;
SELECT *
FROM employee;



SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

Begin tran;
SELECT *
FROM employee;

COMMIT TRAN;


Begin Transaction;
Select salary from employee where Id = 1;

-- Do Some work
waitfor delay '00:00:10';
Select salary from employee where Id = 1;
Commit Transaction;

update employee set Salary = 500
where ID = 1;


---

Begin transaction;
select * from employee
where ID BETWEEN 1 AND 3;
waitfor delay  '00:00:10'
select * from employee
where ID BETWEEN 1 and 3;
--

insert into employee (`FirstName`,`LastName`,`Age`,`Salary`)
VALUES ("Bobby", "Paliz", 47,900);

--Fecha  26-05-2022

CREATE FUNCTION Sex  ( person  char )
RETURNS INT

BEGIN

   DECLARE sex  VARCHAR(20);
   SET sex = "not known";
   if(person = "H") then
    set sex = "Male";
    elseif(person="F");
    sext sex = "Female";
    END if;

   RETURN sex;

END; //

DELIMITER ;

-- fecha 06/05/2022
--using triggers
-- INSERT INTO LOG VALUES (NULL,SYSDATE(),"he metido a perico",vuser());
--fecha 09-05-2022

-- Trigger created sucessfully
DELIMITER//
 CREATE TRIGGER `my_log_trigger` AFTER INSERT ON `usuarios` FOR EACH ROW
 BEGIN
    insert into log (descripcion) value ('new register');
      -- Use NEW and OLD constants for access to row
 END;
 DELIMITER ;
 
Drop trigger my_log_trigger;

--Los correos que tengan mas de 30 dias;
DELIMITER //
CREATE TRIGGER `limpia_email` AFTER INSERT ON `email` FOR EACH ROW
BEGIN
     delete from email e 
     where e.papelera = 1 and
     Datediff(Sysdate(),e.fecha) > 30;
END;
DELIMITER;


select datediff(sysdate(),e)
from email e;

---Fecha 10-05-2022

CREATE TABLE t1 (
  id INT UNSIGNED PRIMARY KEY,
    data VARCHAR(16)
);

CREATE TABLE t2 (
  i INT UNSIGNED
);
CREATE TABLE t3 (
  data VARCHAR(16),
    i INT UNSIGNED
);

INSERT INTO t1 VALUES (1, 'A');
INSERT INTO t1 VALUES (2, 'B');
INSERT INTO t2 VALUES (10);
INSERT INTO t2 VALUES (20);

call curdemo();


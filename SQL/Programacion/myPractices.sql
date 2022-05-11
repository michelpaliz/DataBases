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
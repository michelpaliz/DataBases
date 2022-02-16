Insert into persons(FirstName) value ("María");

DELETE FROM persons  WHERE FirstName='%Pedro';

CREATE TABLE Persons (
    PersonID int,
    FirstName varchar(255)
);

-- entre porcenatjes \%
Select * from persons 
WHERE FirstName like "%\%%";

-- Sacar registro de longitud un caracter
Select * from persons
where FirstName like "_";

-- solo obligo que tenga un caracter con un solo guion
Select * from persons
where FirstName like "%_%";

-- Sacar cualquier caracter que tenga el gion.
Select * from persons
where FirstName like "%\_%";

--Sacar solo la barra invertida.
Select * from persons
where FirstName like "%\\%";

-- Lo mismo pero con ~ y escape
Select * from persons
where FirstName like "%\%" ESCAPE  "~";

Select * from persons
where FirstName like "%%_%" ESCAPE  "~";

-- empieza en la posicion uno y cuenta 5 caracteres
Select substring (nombre,1,5) from localidades
where nombre like "Madrid";

Select right (nombre,5) from localidades
where nombre like "Madrid";
Select left (nombre,5) from localidades
where nombre like "Madrid";
-- nos da el tamano del campo en bytes
select LENGTH( firstName) bytes, FirstName from persons;

Select length(firstName) bytes,
char_length(firstName)car, firstName from persons;

Select length(firstName) bytes,
char_length(firstName)car, 
reverse(firstName) from persons;


Select firstName a , 
CHAR_LENGTH(firstName)b, ltrim(firstName) c , 
CHAR_LENGTH(ltrim(firstName))d 
from persons;

 
Select firstName a , CHAR_LENGTH(firstName)
 b, trim(firstName) c , CHAR_LENGTH(trim(firstName))
 d from persons;


Select replace ("\","<escape>",firstName) a from persons;

-- Asci
Select replace (firstName, char(92),"<escape>") from persons p;

Select replace (firstName,"pedro", "hola") from persons;

Select replace (replace(firstName,"á","a"),"é","e") from persons;

-- hacer un query que saque las 10 primeras localidades y el municipio al lado
-- crea un query que me genere un html donde las localidades esten en mayuscuals y los municipios y minusculas

Select concat(REPLACE) ("$A",id,"$M",firstName,"%C"),"$A","<tr><td>") from persons;


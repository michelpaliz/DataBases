--*Fecha 2-26-2022
--! Seleccionar los alumnos de menores de 18  años
Select
  a.dni,
  a.nombres,
  a.apellidos
from
  alumno a
where
  a.edad <= 18;
--! Muestra los alumnos que vivien en ventanas y guayaquil
select
  a.dni,
  a.nombres,
  a.apellidos,
  a.ciudad
from
  alumno a
where
  a.ciudad in ("Ventanas", "guayaquil");
--!Muestra los alumnos que tienen 25 - 31
select
  a.dni,
  a.nombres,
  a.APELLIDOS
from
  alumno a
where
  a.EDAD BETWEEN 25
  and 31;
--!Muestra y cuenta los alumnos que son mayores de 18
select
  a.dni,
  a.nombres,
  a.APELLIDOS
from
  alumno a
UNION
select
  a.edad >= 18,
  a.nombres,
  a.APELLIDOS
from
  alumno a;
--!Cuenta el total de los alumnos que viven en Quito
select
  a.dni,
  --0
  a.nombres,
  --1
  a.APELLIDOS,
  ---2
  a.CIUDAD --3
from
  alumno a
union
select
  count(a.Ciudad like "Quito") as total,
  --0
  a.nombres,
  -- 1
  a.APELLIDOS,
  --2
  a.CIUDAD --3
from
  alumno a;
--! no tiene sentido poner mas campos ya que solo me cuenta el total de la seleccion
select
  count(a.edad) as total
from
  alumno a
where
  a.ciudad like "Quito";
--! calcular la media de las edades de los alumnos
select
  avg(a.edad) as media
from
  alumno a;
--!Mostrar los alumnos que de cada ciudad  se muestren ordenados de mayor a menor y solo incluye las ciudades que tengas mas 3 alumnos
select
  a.CIUDAD
from
  alumno a
group by
  a.CIUDAD
HAVING
  count (a.dni) > 2
ORDER BY
  count(a.dni) desc;
--! Contar el numero de  alumnos que tengan el campo como "NULL" en la columna de EMPLEO
  -->TODO
select
  count(a.empleo) as totalNull
from
  alumno a
where
  a.empleo like "";
--!Muestrame los alumnos que contengan empleo y los que no
select
  count(a.empleo) as trabajando
from
  alumno a
where
  a.empleo = "si"
UNION
select
  count(a.empleo) as notrabajando
from
  alumno a
where
  a.EMPLEO = "no";
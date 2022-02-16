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
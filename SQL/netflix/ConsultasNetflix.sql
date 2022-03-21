-- Fecha 21-03-2022
--Buscar todas las peliculas de angela hudson id = 65
select
  *
from
  pelicula_actor;
select
  *
from
  actor a
where
  a.id_actor = 65;
--mi opcion
select
  *
from
  actor a
  right join pelicula_actor p on a.id_actor = p.id_actor;
--ahora vamos a contar las peliculas que tiene esta actora
  --No hace poner un group by porque solo hay un actor
Select
  count(p.id_pelicula)
from
  pelicula p
  join pelicula_actor pa on p.id_pelicula = pa.id_pelicula
  join actor a on pa.id_pelicula = a.id_actor
where
  a.nombre = "ANGELA"
  and a.apellidos = "HUDSON";
--Quiero un listado de todos los actores que salgan de mayor a menor por el numero de peliculas que han echo cada uno de ellos.
Select
  Concat("", A.nombre, A.apellidos) as nombre_actor,
  count(p.id_pelicula)
from
  pelicula p
  join pelicula_actor pa on p.id_pelicula = pa.id_pelicula
  right join actor a on pa.id_pelicula = a.id_actor --para sacar todoslos actores
GROUP BY
  a.id_actor
ORDER BY
  2 desc;
----
Select
  count(a.id_actor) as NumeroActor
from
  pelicula p
  join pelicula_actor pa on p.id_pelicula = pa.id_pelicula
  right join actor a on pa.id_pelicula = a.id_actor --para sacar todoslos actores
GROUP BY
  p.id_actor
ORDER BY
  2 desc;
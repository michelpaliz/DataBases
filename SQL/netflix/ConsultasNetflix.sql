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
-- Fecha 24/03/2022
  --contar el numero de pelicuals que hay por categorias
select
  c.nombre nombrePelicula,
  count(pc.id_categoria) contador
from
  categoria c
  left join pelicula_categoria pc on c.id_categoria = pc.id_categoria
group by
  c.id_categoria
order by
  contador asc;
--Sacar un listado con todos los empleados y las ventas por ejercicio(ventas del 2005 y 2006)
SELECT
  year((p.fecha_pago)) ejercicio,
  e.nombre Persona,
  sum(p.total) sumaTotal
from
  empleado e
  left join pago p on e.id_empleado = p.id_empleado
group by
  e.id_empleado,
  ejercicio
ORDER BY
  ejercicio;
--El numero de ventas por paises (lista todas las ventas (pagos)por paises)
SELECT
  pa.nombre nombrePais,
  sum(p.total) pagoTotal
from
  pago p
  join cliente c on p.id_cliente = c.id_cliente
  join direccion d on d.id_direccion = c.id_direccion
  join ciudad cd on cd.id_ciudad = d.id_ciudad
  RIGHT join pais pa on cd.id_pais = pa.id_pais
GROUP BY
  pa.id_pais
ORDER BY
  pagoTotal DESC;
-- Fecha 25-03-2022
  --Crear una tabla pelicula, categoria, y actores, hay que conseguir
  -- *pelicula p, pelicula_categoria pc, categoria c, pelicula_actor pa, actor a
select
  *
from
  pelicula_actor;
-- Fecha 28/03/2022
  ---- Creacion de tabla
  DROP TABLE if exists google;
CREATE table if not exists google(
    id INT AUTO_INCREMENT primary KEY,
    titulo VARCHAR(255),
    descripcion TEXT,
    clasificacion VARCHAR(5),
    nombre VARCHAR(45),
    apellidos VARCHAR(45),
    categoria VARCHAR(25),
    FULLTEXT KEY (
      titulo,
      descripcion,
      nombre,
      apellidos,
      categoria
    )
  ) engine = MYISAM;
TRUNCATE TABLE google;
INSERT INTO
  google(
    titulo,
    descripcion,
    clasificacion,
    nombre,
    apellidos,
    categoria
  )
SELECT
  CONCAT_WS(
    " ",
    P.titulo,
    CONCAT("(", P.anyo_lanzamiento, ")")
  ) tit,
  P.descripcion,
  P.clasificacion,
  A.nombre,
  A.apellidos,
  C.nombre
FROM
  pelicula P,
  pelicula_categoria PC,
  categoria C,
  pelicula_actor PA,
  actor A
WHERE
  P.id_pelicula = PC.id_pelicula
  AND PC.id_categoria = C.id_categoria
  AND P.id_pelicula = PA.id_pelicula
  AND PA.id_actor = A.id_actor;
----  sacar todas las peliculas que contengas la pelicula shark
Select
  *
from
  google;
-----
SELECT
  distinct titulo,
  descripcion,
  clasificacion,
  categoria,
  MATCH(
    titulo,
    descripcion,
    nombre,
    apellidos
  ) AGAINST (
    "-Classics >ALICE drama +shark >emotion <action" IN BOOLEAN MODE
  ) puntos
FROM
  google
WHERE
  MATCH(
    titulo,
    descripcion,
    nombre,
    apellidos
  ) AGAINST (
    ">ALICE drama +shark >emotion <action" IN BOOLEAN MODE
  )
ORDER BY
  puntos desc;
--sacar los registros que son mayor de 1 punto
SELECT
  distinct titulo,
  descripcion,
  clasificacion,
  categoria,
  MATCH(titulo, descripcion) AGAINST (
    "-Classics >ALICE drama +shark >emotion <action" IN BOOLEAN MODE
  ) puntos
FROM
  google
WHERE
  MATCH(titulo, descripcion) AGAINST (
    "-Classics >ALICE drama +shark >emotion <action" IN BOOLEAN MODE
  )
having
  puntos > 1
ORDER BY
  puntos desc;
--tambien
SELECT
  distinct titulo,
  descripcion,
  clasificacion,
  categoria,
  MATCH(titulo, descripcion) AGAINST (
    "-Classics >ALICE drama +shark >emotion <action" IN BOOLEAN MODE
  ) puntos
FROM
  google
WHERE
  (
    MATCH(titulo, descripcion) AGAINST (
      "-Classics >ALICE drama +shark >emotion <action" IN BOOLEAN MODE
    )
  ) > 1
having
  puntos > 1
ORDER BY
  puntos desc;






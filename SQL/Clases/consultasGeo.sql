--*Fecha 02/21/2022
select
  R.nombre,
  p.nombre
from
  regiones r
  inner join provincias p on r.id = p.fk_region;
--Comarcas
select
  R.nombre,
  p.nombre,
  c.nombre
from
  regiones r
  join provincias p on r.id = p.fk_region
  join prov_comarcas pc on p.id = pc.fk_provincia
  join comarcas c on pc.fk_comarca = c.id;
--- 479 comarcas --480 con right join lo que quiere decir qu no hay un registro que no tiene comarca me saca los null tambien
  --si quiero saber cual comarca es (deberia apracer nulo)
select
  R.nombre,
  p.nombre,
  c.nombre
from
  regiones r
  join provincias p on r.id = p.fk_region
  join prov_comarcas pc on p.id = pc.fk_provincia
  RIGHT join comarcas c on pc.fk_comarca = c.id
WHERE
  p.nombre is null;
---Sacar el registro vacio
select
  *
from
  comarcas c
where
  c.nombre = "";
--eliminar el registro
delete from
  comarcas
where
  comarcas.nombre = "";
-- ahora esta vacio
select
  *
from
  comarcas c
where
  c.nombre;
--ahora llegar a municipios
select
  R.nombre,
  p.nombre,
  c.nombre
from
  regiones r
  join provincias p on r.id = p.fk_region
  join prov_comarcas pc on p.id = pc.fk_provincia
  join comarcas c on pc.fk_comarca = c.id
  join municipios m on m.fk_prov = p.id
  and m.fk_comarca = c.id;
select
  R.nombre,
  p.nombre,
  c.nombre,
  l.nombre
from
  regiones r
  join provincias p on r.id = p.fk_region
  join prov_comarcas pc on p.id = pc.fk_provincia
  join comarcas c on pc.fk_comarca = c.id
  join municipios m on m.fk_prov = p.id
  and m.fk_comarca = c.id
  join localidades l on m.id = l.fk_municipio;
-- saca un listado con las regiones que tengan mas de 8000 localidades
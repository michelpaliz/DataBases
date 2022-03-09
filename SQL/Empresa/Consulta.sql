select
  *
from
  llx_facture;
select
  *
from
  llx_societe;
-- Crear un listado agrupado por proveedored y por trimestres
Select
  s.nom nombreSociedad,
  f.total_tva totalIVA
from
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc;
--Crear un listado donde que ya no salgan repetidos dos veces los provedores
SELECT
  s.nom nombreSociedad,
  sum(f.total_tva) totalIVA
FROM
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc
group by
  s.nom;
--Calcular el total de los ejercicios en este caso solo existe uno que es el 2021
select
  year(f.datef),
  SUM(f.total_tva)
from
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc;
--Calcular total de iva de cada comunidad
select
  year(f.datef),
  s.nom,
  SUM(f.total_tva)
from
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc
GROUP BY
  s.nom;
-- Ahora sacar el iva trimestralmente y con su total de cada trimestre
Select
  year(f.datef) AliasEjercicio,
  CONCAT(Quarter(f.datef), "  Trimestre") AliasTrimestres,
  sum(f.total_tva) AliastotalVA,
  s.nom AliastNombre
from
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc
group by
  AliasEjercicio,
  AliasTrimestres,
  s.nom with rollup;
--Vamos a sacar las compras que hemos efectuado trimestralmente con su total
SELECT
  CONCAT(quarter(f.datef), " Trimestre") AliasTrimestres,
  -1 * sum(f.total_tva) AliasTotalIVA,
  s.nom AliasNombreSociedad
from
  llx_societe s
  join llx_facture_fourn f on s.rowid = f.fk_soc
GROUP BY
  AliasTrimestres,
  AliasNombreSociedad with rollup;
--Creamos un vista que nos da las compras totales por trimestre
  CREATE VIEW TotalDeComprasPorTrimestres as
SELECT
  CONCAT(quarter(f.datef), " Trimestre") AliasTrimestres,
  -1 * sum(f.total_tva) AliasTotalIVA,
  s.nom AliasNombreSociedad
from
  llx_societe s
  join llx_facture_fourn f on s.rowid = f.fk_soc
GROUP BY
  AliasTrimestres,
  AliasNombreSociedad with rollup;
select
  *
from
  TotalDeComprasPorTrimestres;
--Unimos las tablas mediante un UNION con una vista creada.
Select
  CONCAT(Quarter(f.datef), " Trimestre") AliasTrimestres,
  s.nom AliasNombreComunidad,
  sum(f.total_tva) AliasSumaTotal
from
  llx_societe s
  join llx_facture f on s.rowid = f.fk_soc
GROUP BY
  AliasTrimestres,
  AliasNombreComunidad --dese cuenta que aqui no utilizo with rollup solo lo utilizon en la vista.
UNION
Select
  *
from
  TotalDeComprasPorTrimestres;
--Informe de ventas por tipo de iva y sus conceptos tambien
select
  -- cabecera.total_tva
  *
from
  llx_facture_fourn_det cabecera;
--Este es de ventas
  CREATE VIEW informeDetalleVenta as
select
  "V",
  d.tva_tx AliasTipoIva,
  sum(d.total_tva) AliasTotal,
  c.total_tva CabeceraTotal
from
  llx_facture c
  join llx_facturedet d on c.rowid = d.fk_facture
group by
  AliasTipoIva,
  CabeceraTotal;
--informe de compras por tipo de iva
  Create view informeDetalleCompra as
SELECT
  "C",
  d1.tva_tx TiposDeIVA,
  sum(d1.tva) TotalIVA,
  p.total_tva ComprobarConCabecera
from
  llx_facture_fourn p
  join llx_facture_fourn_det d1 on p.rowid = d1.fk_facture_fourn
GROUP BY
  TiposDeIVA,
  ComprobarConCabecera;
--elimnar view
  Drop view informeDetalleCompra;
--ver view
SELECT
  *
FROM
  informeDetalleCompra;
--AHORA unimos los dos querys
Select
  *
from
  (
    (
      Select
        *
      from
        informeDetalleVenta
      UNION
      Select
        *
      from
        informeDetalleCompra
    ) tabla
  );
-- Sacame  los tipos de iva que se puede usar en el pais es
  --Estos son los distintos tipos de iva que hay en un pais
  create view esIVA as
Select
  iva.*
from
  llx_c_country p
  join llx_c_tva iva on p.rowid = iva.fk_pays
where
  p.code = "Es";
drop view esIVA;
--Que campos hay en la tabla productos que enlazan con el tipo de iva del pais es
Select
  impuestosEs.esIVA,
  COUNT(producto.rowid)
from
  (
    select
      *
    from
      esIVA
  ) impuestosEs
  join llx_product producto on impuestosEs.rowid = producto.tva_tx
GROUP by
  impuestosEs.iva;
--Seleccionar el nombre de la sociedad contando las ventas y compras por cada una de ellas
  create view ventas as
select
  v.rowid,
  "Venta" AliasTipo,
  v.fk_soc
from
  llx_facture v;
create view compras as
select
  c.rowid,
  "Compra" AliasTipo,
  c.fk_soc
from
  llx_facture_fourn c;
--ahora unimos las querys de compras y ventas para reflejar que sociedad hemos vendido  y que proveedores hemos comprado
  --Entonce uniremos las ventas y compras con la de sociedad
Select
  s.nom,
  count(compraventa.rowid)
from(
    select
      *
    from
      ventas
    UNION
    SELECT
      *
    from
      compras
  ) compraventa
  left join llx_societe s on compraventa.fk_soc = s.rowid
GROUP BY
  compraventa.fk_soc;
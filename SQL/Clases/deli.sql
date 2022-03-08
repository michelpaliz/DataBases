-- -- fecha 2/28/2022
-- select * from doli.llx_user;
-- select * from doli.llx_societe;
select
  *
from
  llx_societe;
SELECT
  *
FROM
  llx_facture;
--* Fecha 3-1-2022
  --Crear un listado agrupado por proveedores  y por trismestres donde aparezcan el total;
  --Sacar las ventas de cada trimestre de cada cliente para saber cuanto he vendido, despues calcular lo que he vendido cada anyo
  -- hay que unir las tablas primero, corte ingles ---> 8000$
  --group by
  --primer paso unir las dos tablas y  sacar las facturas (salen duplicadas) no queremos eso
SELECT
  s.nom,
  f.total_ttc
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc;
--segundo paso ya no salen repetidos
SELECT
  s.nom,
  sum(f.total_ttc)
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  s.nom;
--tercer paso arreglarlo para que las ventas aparezcan por anyos y despues por trimestres
SELECT
  YEAR(F.datef) ejercicio,
  s.nom,
  sum(f.total_ttc)
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  s.nom;
--ahora trimestralmente
SELECT
  YEAR(F.datef) ejercicio,
  CONCAT(QUARTER(f.datef), "Trimestre") tri,
  s.nom,
  sum(f.total_ttc) total
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  ejercicio,
  tri,
  S.nom;
--ahora con el rollup que va quitando nivels d e agrupacion
SELECT
  YEAR(F.datef) ejercicio,
  CONCAT(QUARTER(f.datef), "Trimestre") tri,
  s.nom,
  sum(f.total_ttc) total
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  ejercicio,
  tri,
  S.nom WITH ROLLUP;
-- FECHA 03/03/22
Select
  *
from
  llx_facture_fourn;
--ver cuales son las compras y las ventas
SELECT
  "Ventas",
  YEAR(F.datef) ejercicio,
  CONCAT(QUARTER(f.datef), "Trimestre") tri,
  s.nom,
  sum(f.total_ttc) total
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  ejercicio,
  tri,
  S.nom
UNION
SELECT
  "Compras",
  YEAR(F.datef) ejercicio,
  CONCAT(QUARTER(f.datef), "Trimestre") tri,
  s.nom,
  sum(f.total_ttc) total
FROM
  llx_societe s
  JOIN llx_facture_fourn f ON s.rowid = f.fk_soc
GROUP BY
  ejercicio,
  tri,
  S.nom WITH ROLLUP;
--informe por ventas de tipo de iva
  -- y que la factura sea mayor que mil le meteriamos un having
select
  sum(detalle.total_tva) suma_total_iva,
  cabecera.total_tva suma_total_iva_por_defecto,
  detalle.tva_tx tipodeIva
from
  llx_facture cabecera
  join llx_facturedet detalle on cabecera.rowid = detalle.fk_facture
group by
  cabecera.rowid;
-- FECHA 3/4/22
  -- vamos a sacar un listado de todos los importes como ventas y compras agrupados por el tipo de iva
SELECT
  YEAR(C.datef) ejer,
  D.tva_tx tipoIva,
  SUM(d.total_tva) tot_iva
FROM
  llx_facture c
  JOIN llx_facturedet d ON c.rowid = d.fk_facture
GROUP BY
  ejer,
  tipoIva;
--SEleccionar las compras y las ventas de la tabla
SELECT
  *
FROM
  (
    (
      SELECT
        "V",
        YEAR(C.datef) ejer,
        D.tva_tx tipo,
        SUM(D.total_tva) tot_iva
      FROM
        llx_facture C
        join llx_facturedet D ON C.rowid = D.fk_facture
      GROUP BY
        ejer,
        tipo
    )
    UNION
      (
        SELECT
          "C",
          YEAR(C2.datef) ejer,
          D2.tva_tx tipo,
          -1 * SUM(D2.tva) tot_iva
        FROM
          llx_facture_fourn C2
          join llx_facture_fourn_det D2 ON C2.rowid = D2.fk_facture_fourn
        GROUP BY
          ejer,
          tipo
      )
  ) mitabla;
---RESUMEN TOTAL IVA
SELECT
  ejer,
  SUM (tot_iva)
FROM
  (
    (
      SELECT
        "V",
        YEAR(C.datef) ejer,
        D.tva_tx tipo,
        SUM(D.total_tva) tot_iva
      FROM
        llx_facture C
        join llx_facturedet D ON C.rowid = D.fk_facture
      GROUP BY
        ejer,
        tipo
    )
    UNION
      (
        SELECT
          "C",
          YEAR(C2.datef) ejer,
          D2.tva_tx tipo,
          -1 * SUM(D2.tva) tot_iva
        FROM
          llx_facture_fourn C2
          join llx_facture_fourn_det D2 ON C2.rowid = D2.fk_facture_fourn
        GROUP BY
          ejer,
          tipo
      )
  ) mitabla
GROUP BY
  ejer;
-- *Fecha 7/3/2022
Select
  *
from
  llx_product;
Select
  *
from
  llx_c_tva;
Select
  *
from
  llx_c_tva
where
  taux in(21, 10, 4);
Select
  *
from
  llx_c_tva
where
  note like "%IVA%";
select
  *
from
  llx_c_country;
-- Sacar todos los tipos de iva y contador cuantos productos hay por cada iva, sabiendo que el codigo del pais es ESP
SELECT
  IVA.*
from
  llx_c_country Pais
  JOIN llx_c_tva IVA ON Pais.rowid = Iva.fk_pays
WHERE
  Pais.code = "ES";
-- Ahora solo saca los tipos de ivas
SELECT
  IVA.Taux iva
from
  llx_c_country Pais
  JOIN llx_c_tva IVA ON Pais.rowid = Iva.fk_pays
WHERE
  Pais.code = "ES";
-- que campos hay en la tabla productos que enlazan con el tipo de iva
SELECT
  impuestos.iva,
  COUNT(producto.rowid)
FROM
  (
    SELECT
      IVA.taux iva
    FROM
      llx_c_country Pais
      JOIN llx_c_tva IVA ON Pais.rowid = IVA.fk_pays
    WHERE
      Pais.code = "Es"
  ) impuestos
  JOIN llx_product producto ON impuestos.iva = producto.tva_tx
GROUP BY
  impuestos.iva;
-- quiero que me saques todos los tipos de iva
SELECT
  impuestos.iva,
  COUNT(producto.rowid)
FROM
  (
    SELECT
      IVA.taux iva
    FROM
      llx_c_country Pais
      JOIN llx_c_tva IVA ON Pais.rowid = IVA.fk_pays
    WHERE
      Pais.code = "Es"
  ) impuestos
  left jOIN llx_product producto ON impuestos.iva = producto.tva_tx
GROUP BY
  impuestos.iva;
-- saca un listado de todos los prov y cuenta el num de facturas de compras y de ventas que hemos echo con cada uno de ellos
SELECT
  *
FROM
  llx_societe;
Select
  *
FROM
  llx_facture;
SELECT
  v.rowid,
  "venta",
  v.fk_soc
FROM
  llx_facture v
UNION
SELECT
  c.rowid,
  "compra",
  c.fk_soc
FROM
  llx_facture_fourn c -- segundo paso
SELECT
  COUNT(*)
FROM
  (
    SELECT
      v.rowid,
      "venta" as tipo,
      v.fk_soc
    FROM
      llx_facture v
    UNION
    SELECT
      c.rowid,
      "compra" AS tipo,
      c.fk_soc
    FROM
      llx_facture_fourn c
  ) CompraVenta;
--Ultimo paso
SELECT
  sociedad.nom,
  COUNT(compraventa.rowid)
FROM
  (
    SELECT
      v.rowid,
      "venta" AS tipo,
      v.fk_soc
    FROM
      llx_facture v
    UNION
    SELECT
      c.rowid,
      "compra" AS tipo,
      c.fk_soc
    FROM
      llx_facture_fourn c
  ) compraventa
  RIGHT JOIN llx_societe sociedad ON compraventa.fk_soc = sociedad.rowid
GROUP BY
  compraventa.fk_soc;
--ahora dividir las compras y con las ventas
SELECT
  sociedad.nom,
  compraventa.tipo,
  COUNT(compraventa.rowid)
FROM
  (
    SELECT
      v.rowid,
      "venta" AS tipo,
      v.fk_soc
    FROM
      llx_facture v
    UNION
    SELECT
      c.rowid,
      "compra" AS tipo,
      c.fk_soc
    FROM
      llx_facture_fourn c
  ) compraventa
  RIGHT JOIN llx_societe sociedad ON compraventa.fk_soc = sociedad.rowid
GROUP BY
  compraventa.fk_soc;
--quiero que aparezcan el total de cada factura
SELECT
  sociedad.nom,
  compraventa.tipo,
  COUNT(compraventa.rowid)
FROM
  (
    SELECT
      v.rowid,
      "venta" AS tipo,
      v.fk_soc
    FROM
      llx_facture v
    UNION
    SELECT
      c.rowid,
      "compra" AS tipo,
      c.fk_soc
    FROM
      llx_facture_fourn c
  ) compraventa
  RIGHT JOIN llx_societe sociedad ON compraventa.fk_soc = sociedad.rowid
GROUP BY
  compraventa.fk_soc,
  compraventa.tipo WITH ROLLUP;
-- cuentamelo que tenga mayor de 3000 se utilizara el having que es el where de los group by



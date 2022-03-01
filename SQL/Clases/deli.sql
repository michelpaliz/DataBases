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
  s.rowid;
--tercer paso arreglarlo para que las ventas aparezcan por anyos y despues por trimestres
SELECT
  YEAR(F.datef) ejercicio,
  s.nom,
  sum(f.total_ttc)
FROM
  llx_societe s
  JOIN llx_facture f ON s.rowid = f.fk_soc
GROUP BY
  s.rowid;
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
  S.rowid;
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
  S.rowid WITH ROLLUP;
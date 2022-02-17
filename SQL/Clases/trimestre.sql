--* fecha 2/17/2022
--Having  + funciones, el where no puede ir seguido con funciones
create TABLE terceros(
  cif VARCHAR (9) PRIMARY KEY NOT null,
  nombre VARCHAR(20) NOT null,
  telefono VARCHAR(15)
);
CREATE TABLE compras_ventas(
  id INT AUTO_INCREMENT PRIMARY KEY NOT null,
  fk_tercero VARCHAR (9),
  comp_venta VARCHAR(1),
  fecha DATE,
  base FLOAT,
  iva FLOAT,
  total FLOAT,
  FOREIGN KEY (fk_tercero) REFERENCES terceros(cif)
);
--!NSERCCION DE DATOS EN LA TABLA TERCEROS
INSERT INTO
  terceros
VALUES
  ("11111111A", "Tercero1", "961111111");
INSERT INTO
  terceros
VALUES
  ("22222222A", "Tercero2", "962222222");
INSERT INTO
  terceros
VALUES
  ("33333333A", "Tercero3", "963333333");
INSERT INTO
  terceros
VALUES
  ("44444444A", "Tercero4", "964444444");
--!NSERCCION DE DATOS EN LA TABLA TERCEROS
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "11111111A", "C", "2021/01/01", 100);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "11111111A", "C", "2021/03/27", 2900);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "11111111A", "C", "2021/11/27", 700);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "11111111A", "V", "2021/12/27", 6000);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "22222222A", "C", "2021/02/27", 200);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "22222222A", "C", "2021/04/27", 800);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "22222222A", "C", "2021/08/27", 700);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "22222222A", "V", "2021/02/27", 1500);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "33333333A", "C", "2021/01/27", 1800);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "33333333A", "C", "2021/07/27", 1900);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "33333333A", "V", "2021/10/27", 2500);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "44444444A", "v", "2021/01/27", 1600);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "44444444A", "v", "2021/04/27", 1600);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "44444444A", "v", "2021/05/27", 1600);
INSERT INTO
  compras_ventas(id, fk_tercero, comp_venta, fecha, base)
VALUES
  (DEFAULT, "44444444A", "v", "2021/10/27", 1600);
update
  compras_ventas
set
  iva = 0.21;
update
  compras_ventas
set
  iva = null;
delete from
  compras_ventas c
where
  c.iva = 0.21;
--no funciona
select
  c.iva
from
  compras_ventas c;
--!calcular el iva de cada uno
  --este de abajo es de prueba
select
  c.fk_tercero as nombre
FROM
  compras_ventas c;
--ejercicio
Select
  c.id as dni c.fk_tercero as nombre c.trimestre as trimestre c.comp_venta,
  c.base as base,
  c.iva = (0.21 * c.base) as iva
from
  compras_ventas c;
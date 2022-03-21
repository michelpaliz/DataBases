CREATE SCHEMA IF NOT EXISTS eva2 DEFAULT CHARACTER SET utf8;
USE eva2;
CREATE TABLE IF NOT EXISTS eva2.sociedad (
  sociedad_id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NULL,
  cif VARCHAR(45) NULL,
  cliente TINYINT NULL,
  proveedor TINYINT NULL,
  PRIMARY KEY (sociedad_id),
  UNIQUE INDEX cif_UNIQUE (cif ASC)
);
CREATE TABLE IF NOT EXISTS eva2.cargos (
  id INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS eva2.contactos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  sociedad_sociedad_id INT NOT NULL,
  cargos_id INT NOT NULL,
  sexo CHAR(1) NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX movil_UNIQUE (telefono ASC),
  INDEX fk_contactos_sociedad1_idx (sociedad_sociedad_id ASC),
  INDEX fk_contactos_cargos1_idx (cargos_id ASC),
  CONSTRAINT fk_contactos_sociedad1 FOREIGN KEY (sociedad_sociedad_id) REFERENCES eva2.sociedad (sociedad_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_contactos_cargos1 FOREIGN KEY (cargos_id) REFERENCES eva2.cargos (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.estados (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS eva2.proyecto (
  id INT NOT NULL AUTO_INCREMENT,
  fecha_inicio DATE NULL,
  fecha_fin DATE NULL,
  titulo VARCHAR(45) NULL,
  descripcion LONGTEXT NULL,
  sociedad_sociedad_id INT NOT NULL,
  estados_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_proyecto_sociedad_idx (sociedad_sociedad_id ASC),
  INDEX fk_proyecto_estados1_idx (estados_id ASC),
  CONSTRAINT fk_proyecto_sociedad FOREIGN KEY (sociedad_sociedad_id) REFERENCES eva2.sociedad (sociedad_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_proyecto_estados1 FOREIGN KEY (estados_id) REFERENCES eva2.estados (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.fra_compra (
  id INT NOT NULL AUTO_INCREMENT,
  referencia VARCHAR(45) NULL,
  fecha DATE NULL,
  trimestre TINYINT(1) NULL,
  ejercicio SMALLINT(4) NULL,
  base DECIMAL NULL,
  impuestos DECIMAL NULL,
  proyecto_id INT NOT NULL,
  sociedad_sociedad_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_fra_compra_proyecto1_idx (proyecto_id ASC),
  INDEX fk_fra_compra_sociedad1_idx (sociedad_sociedad_id ASC),
  CONSTRAINT fk_fra_compra_proyecto1 FOREIGN KEY (proyecto_id) REFERENCES eva2.proyecto (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_fra_compra_sociedad1 FOREIGN KEY (sociedad_sociedad_id) REFERENCES eva2.sociedad (sociedad_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.fra_venta (
  id INT NOT NULL AUTO_INCREMENT,
  codigo_factura VARCHAR(45) NULL,
  fecha DATE NULL,
  trimestre TINYINT(1) NULL,
  ejercicio SMALLINT(4) NULL,
  base DECIMAL NULL,
  impuestos DECIMAL NULL,
  proyecto_id INT NOT NULL,
  sociedad_sociedad_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_fra_venta_proyecto1_idx (proyecto_id ASC),
  INDEX fk_fra_venta_sociedad1_idx (sociedad_sociedad_id ASC),
  CONSTRAINT fk_fra_venta_proyecto1 FOREIGN KEY (proyecto_id) REFERENCES eva2.proyecto (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_fra_venta_sociedad1 FOREIGN KEY (sociedad_sociedad_id) REFERENCES eva2.sociedad (sociedad_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.iva (
  iva_id INT NOT NULL,
  tipo DECIMAL NOT NULL,
  PRIMARY KEY (iva_id)
);
CREATE TABLE IF NOT EXISTS eva2.producto (
  id INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(45) NOT NULL,
  precio_compra DECIMAL NULL,
  precio_venta DECIMAL NULL,
  iva_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_producto_iva1_idx (iva_id ASC),
  CONSTRAINT fk_producto_iva1 FOREIGN KEY (iva_id) REFERENCES eva2.iva (iva_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.fra_compra_det (
  id INT NOT NULL AUTO_INCREMENT,
  cantidad FLOAT NULL,
  precio FLOAT NULL,
  observaciones VARCHAR(1000) NULL,
  fra_compra_id INT NOT NULL,
  producto_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_fra_compra_det_fra_compra1_idx (fra_compra_id ASC),
  INDEX fk_fra_compra_det_producto1_idx (producto_id ASC),
  CONSTRAINT fk_fra_compra_det_fra_compra1 FOREIGN KEY (fra_compra_id) REFERENCES eva2.fra_compra (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_fra_compra_det_producto1 FOREIGN KEY (producto_id) REFERENCES eva2.producto (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE IF NOT EXISTS eva2.fra_venta_det (
  id INT NOT NULL AUTO_INCREMENT,
  cantidad FLOAT NULL,
  precio FLOAT NULL,
  descuento FLOAT NULL,
  observaciones VARCHAR(1000) NULL,
  fra_venta_id INT NOT NULL,
  producto_id INT NOT NULL,
  PRIMARY KEY (id),
  INDEX fk_fra_venta_det_fra_venta1_idx (fra_venta_id ASC),
  INDEX fk_fra_venta_det_producto1_idx (producto_id ASC),
  CONSTRAINT fk_fra_venta_det_fra_venta1 FOREIGN KEY (fra_venta_id) REFERENCES eva2.fra_venta (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_fra_venta_det_producto1 FOREIGN KEY (producto_id) REFERENCES eva2.producto (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
INSERT INTO
  sociedad
VALUES
  (DEFAULT, "Tercero1", "111111A", TRUE, TRUE),
  (DEFAULT, "Tercero2", "222222A", TRUE, TRUE),
  (DEFAULT, "Tercero3", "333333A", false, TRUE),
  (DEFAULT, "Tercero4", "444444A", TRUE, TRUE);
INSERT INTO
  contactos
VALUES
  (
    DEFAULT,
    "Pedrito",
    "666 666 666",
    "pedrito@gmail.com",
    1,
    1,
    "V"
  ),
  (
    DEFAULT,
    "Juan",
    "555 555 555",
    "juan@gmail.com",
    1,
    2,
    "V"
  ),
  (
    DEFAULT,
    "María",
    "444 444 444",
    "maria@gmail.com",
    2,
    3,
    "M"
  ),
  (
    DEFAULT,
    "Ana",
    "777 777 777",
    "ana@gmail.com",
    3,
    2,
    "M"
  ),
  (
    DEFAULT,
    "Luisa",
    "888 888 888",
    "luisa@gmail.com",
    4,
    1,
    "M"
  ),
  (
    DEFAULT,
    "Rosa",
    "333 333 333",
    "rosa@gmail.com",
    4,
    4,
    "M"
  );
--+EJERCICIOS
  --*Ejercicio 1
  -- 1.- Realiza una consulta SQL que inserte los cargos GERENTE, COMERCIAL, ADMINISTRATIVO y FINANCIERO; y otra que inserte los estados INTERESADO, ACEPTADO, DESARROLLANDO, ABANDONADO, TERMINADO en la tabla estados. Utiliza para ambas consultas una única instrucción INSERT por cada una. (0.5 pto)
insert into
  cargos (id, nombre)
VALUES
  (1, "GERENTE"),(2, "COMERCIAL"),
  (3, "ADMINISTRATIVO"),
  (4, "FINANCIERO");
insert into
  estados (nombre)
VALUES
  ("INTERESADO"),
  ("ACEPTADO"),
  ("DESARROLLANDO"),
  ("ABANDONADO"),
  ("TERMINADO");
select
  *
from
  cargos,
  contactos,
  estados,
  iva,
  producto,
  proyecto,
  sociedad;
select
  *
from
  sociedad;
select
  *
from
  proyecto;
TRUNCATE contactos;
--* Fecha 14-03-2022
  --Vamos a meter los campos del iva
insert into
  iva
values
  (1, 0),(2, 0.04),(2, 0.07),(3, 0.10),(4, 0.21);
--!Ejercicio 2
  -- 2.- Realiza una consulta SQL que genere los encabezados de una carta comercial para los 5 primeros contactos de la base de datos. La cabecera tendrá el siguiente formato (1.5 pto):
  -- Estimado (o Estimada según sexo) Sr. (o Sra según sexo) Nombre (Asegurarse que la primera letra sea mayúsculas), CARGO (asegurarse que sea todo en mayúsculas) de Nombre de la empresa (asegurarse de eliminar los espacios en blanco al principio y al final).
  -- Ejemplo:
SELECT
  CONCAT(
    "Estimad",
    if(sexo = "V", "o Sr.", "a Sra."),
    " ",
    UPPER(SUBSTR(C.nombre, 1, 1)),
    LOWER(SUBSTR(C.nombre, 2)),
    ", ",
    G.nombre,
    " de ",
    trim(S.nombre)
  ) encabezado
FROM
  contactos C
  LEFT JOIN cargos G ON C.cargos_id = C.id
  LEFT JOIN sociedad S ON S.sociedad_id = C.sociedad_sociedad_id
LIMIT
  5;
-- 3.- Realiza una consulta SQL que muestre un listado con el precio medio del TOTAL que sea mayor a 3000€ de las facturas de VENTA por cada EJERCICIO FISCAL teniendo en cuenta la fecha de la factura (1 pto).
SELECT
  year(fecha) ejer,
  AVG(base + impuestos) media
FROM
  fra_venta
GROUP BY
  ejer
HAVING
  media > 3000;
-- 4. Realiza una consulta SQL que muestre todos los ESTADOS posibles de un PROYECTO y cuente cuantos proyectos hay en ese estado (1 pto).
SELECT
  e.nombre nombre,
  COUNT(p.id) hay
FROM
  estados e
  Left JOIN proyecto p ON e.id = p.estados_id
GROUP BY
  nombre;
-- 5. Realiza una consulta SQL que muestre TODOS los productos que NO han sido ni comprados, ni vendidos durante el ejercicio 2022, utiliza una variable para almacenar el año del ejercicio (2 pto).
  --TERCER TRIMESTRE
  -- **Fecha 17/03/2022
  Create index idx_nombre on estados(nombre);
--Creamos un indice
  Create unique index idx_nombre ON cargos(nombre);
DROP INDEX idx_nombre ON cargos;
select
  *
from
  cargos;
--* Fecha - 18 -03-2022
  Create index varios on producto (descripcion, precio_compra, precio_venta);
--Crear una tabla contactos2
  --ENGINE
  CREATE TABLE IF NOT EXISTS eva2.contactos2 (
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(45) NULL,
    email VARCHAR(45) NULL,
    sociedad_sociedad_id INT NOT NULL,
    cargos_id INT NOT NULL,
    sexo CHAR(1) NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX movil_UNIQUE (telefono ASC),
    INDEX fk_contactos_sociedad1_idx (sociedad_sociedad_id ASC),
    INDEX fk_contactos_cargos1_idx (cargos_id ASC),
    CONSTRAINT fk_contactos_sociedad1 FOREIGN KEY (sociedad_sociedad_id) REFERENCES eva2.sociedad (sociedad_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_contactos_cargos1 FOREIGN KEY (cargos_id) REFERENCES eva2.cargos (id) ON DELETE NO ACTION ON UPDATE NO ACTION
  ) Engine = myISAM;
--crear un fulltext sobre el campo de ocntacto con el nmbre y el relefono y el email.
  create fulltext index idx_full on contactos(nombre, telefono, email);
create fulltext index idx_full on contactos2(nombre, telefono, email);
--Queries
select
  *
from
  contactos
where
  match(nombre, telefono, email) against ("gmail");
--
select
  *
from
  contactos2
where
  match(nombre, telefono, email) against ("gmail");
-- Fecha  21/03/2021;


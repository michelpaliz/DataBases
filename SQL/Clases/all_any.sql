--*FECHA 2/24/2022
CREATE TABLE if not exists elementos (
  id INT AUTO_INCREMENT PRIMARY key,
  nombre VARCHAR(20),
  precio FLOAT
);
INSERT INTO
  elementos
values
  (DEFAULT, "silla", 18);
INSERT INTO
  elementos
VALUES
  (DEFAULT, "mesa", 19);
INSERT INTO
  elementos
VALUES
  (DEFAULT, "lampara", 15);
INSERT INTO
  elementos
VALUES
  (DEFAULT, "sofa", 20);
CREATE TABLE if not exists venta_elementos (
    id INT AUTO_INCREMENT PRIMARY key,
    num_factura int,
    fk_elemento INT,
    catidad int
  );
INSERT INTO
  venta_elementos
values
  (DEFAULT, 1, 1, 30);
INSERT INTO
  venta_elementos
values
  (DEFAULT, 1, 2, 5);
INSERT INTO
  venta_elementos
values
  (DEFAULT, 2, 3, 40);
INSERT INTO
  venta_elementos
values
  (DEFAULT, 2, 4, 7);
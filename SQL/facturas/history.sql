/* 2022-06-05 22:33:57 [128 ms] */ 
CREATE DATABASE facturas;


/* 2022-06-05 23:03:59 [133 ms] */ 
CREATE DATABASE facturas;


DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;
/* 2022-06-05 23:51:22 [863 ms] */ 
DROP TABLE IF EXISTS `facturas`;
CREATE TABLE `facturas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

INSERT INTO facturas (name)
VALUES ('factura1'); /* 2022-06-05 23:54:37 [76 ms] */ 
INSERT INTO facturas (name)
VALUES ('factura1');

select * from facturas;/* 2022-06-05 23:55:20 [5 ms] */ 
select * from facturas;

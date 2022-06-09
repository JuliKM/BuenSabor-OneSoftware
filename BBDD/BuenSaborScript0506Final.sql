-- MySQL Script generated by MySQL Workbench
-- Sun Jun  5 16:14:50 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema elbuensabor
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `elbuensabor` ;

-- -----------------------------------------------------
-- Schema elbuensabor
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `elbuensabor` DEFAULT CHARACTER SET utf8 ;
USE `elbuensabor` ;

-- -----------------------------------------------------
-- Table `elbuensabor`.`RubroArticulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`RubroArticulo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`RubroArticulo` (
  `idRubroArticulo` INT NOT NULL,
  `denominacion` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idRubroArticulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`ArticuloInsumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`ArticuloInsumo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`ArticuloInsumo` (
  `idArticuloInsumo` INT NOT NULL,
  `idRubroArticulo` INT NOT NULL,
  `denominacion` VARCHAR(100) NOT NULL,
  `stockActual` DOUBLE NOT NULL,
  `stockMinimo` DOUBLE NOT NULL DEFAULT 0,
  `unidadDeMedida` VARCHAR(45) NOT NULL,
  `esInsumo` TINYINT NOT NULL,
  PRIMARY KEY (`idArticuloInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`CompraInsumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`CompraInsumo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`CompraInsumo` (
  `idCompraInsumo` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `precio` DOUBLE NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` DOUBLE NOT NULL,
  PRIMARY KEY (`idCompraInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaRubroArticulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaRubroArticulo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaRubroArticulo` (
  `idBajaRubroArticulo` INT NOT NULL,
  `idRubroArticulo` INT NOT NULL,
  `fechaBaja` DATE NOT NULL,
  PRIMARY KEY (`idBajaRubroArticulo`, `idRubroArticulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`PrecioArticuloInsumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`PrecioArticuloInsumo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`PrecioArticuloInsumo` (
  `idPrecioArticuloInsumo` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `precioArticuloInsumo` DOUBLE NOT NULL,
  `fechaPrecioArticuloInsumo` DATE NOT NULL,
  PRIMARY KEY (`idPrecioArticuloInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Imagen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Imagen` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Imagen` (
  `idImagen` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `imagen` TEXT(21000) NULL,
  PRIMARY KEY (`idImagen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`RubroGeneral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`RubroGeneral` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`RubroGeneral` (
  `idRubroGeneral` INT NOT NULL,
  `denominacion` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`idRubroGeneral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`ProductoManufacturado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`ProductoManufacturado` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`ProductoManufacturado` (
  `idProductoManufacturado` INT NOT NULL,
  `idRubroGeneral` INT NOT NULL,
  `denominacion` VARCHAR(255) NOT NULL,
  `imagen` TEXT(21000) NOT NULL,
  `tiempoCocina` INT NOT NULL,
  `receta` TEXT(21000) NULL,
  `descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`idProductoManufacturado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`ProductoManufacturadoDetalle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`ProductoManufacturadoDetalle` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`ProductoManufacturadoDetalle` (
  `idProductoManufacturadoDetalle` INT NOT NULL,
  `idProductoManufacturado` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `cantidad` DOUBLE NULL,
  PRIMARY KEY (`idProductoManufacturadoDetalle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaProductoManufacturado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaProductoManufacturado` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaProductoManufacturado` (
  `idBajaProductoManufacturado` INT NOT NULL,
  `idProductoManufacturado` INT NOT NULL,
  `fechaBaja` DATE NOT NULL,
  PRIMARY KEY (`idBajaProductoManufacturado`, `idProductoManufacturado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaRubroGeneral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaRubroGeneral` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaRubroGeneral` (
  `idBajaRubroGeneral` INT NOT NULL,
  `idRubroGeneral` INT NOT NULL,
  `fechaBaja` DATE NOT NULL,
  PRIMARY KEY (`idBajaRubroGeneral`, `idRubroGeneral`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`PrecioProductoManufacturado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`PrecioProductoManufacturado` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`PrecioProductoManufacturado` (
  `idPrecioProductoManufacturado` INT NOT NULL,
  `idProductoManufacturado` INT NOT NULL,
  `precioProductoManufacturado` DOUBLE NOT NULL,
  `fechaPrecioProductoManufacturado` DATE NOT NULL,
  PRIMARY KEY (`idPrecioProductoManufacturado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Rol` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Rol` (
  `idRol` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Usuario` (
  `IdUsuario` INT NOT NULL,
  `idRol` INT NOT NULL,
  `nombres` VARCHAR(95) NOT NULL,
  `apellidos` VARCHAR(95) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(95) NOT NULL,
  `clave` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`IdUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Pedido` (
  `idPedido` INT NOT NULL,
  `IdUsuario` INT NOT NULL,
  `fechaPedido` DATE NOT NULL,
  `tipoEnvio` VARCHAR(45) NOT NULL,
  `descuento` DOUBLE NOT NULL DEFAULT 0,
  `aclaraciones` VARCHAR(255) NULL,
  PRIMARY KEY (`idPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`DetallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`DetallePedido` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`DetallePedido` (
  `idDetallePedido` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idDetallePedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`ProductoManufacturado_DetallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`ProductoManufacturado_DetallePedido` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`ProductoManufacturado_DetallePedido` (
  `idProductoManufacturado_DetallePedido` INT NOT NULL,
  `idProductoManufacturado` INT NOT NULL,
  `idDetallePedido` INT NOT NULL,
  PRIMARY KEY (`idProductoManufacturado_DetallePedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Pago` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Pago` (
  `idPago` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  `fecha` DATE NULL,
  PRIMARY KEY (`idPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`MercadoPago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`MercadoPago` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`MercadoPago` (
  `idMercadoPago` INT NOT NULL,
  `idPago` INT NOT NULL,
  `AgregarCampos` VARCHAR(45) NULL,
  PRIMARY KEY (`idMercadoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Efectivo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Efectivo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Efectivo` (
  `idEfectivo` INT NOT NULL,
  `idPago` INT NOT NULL,
  PRIMARY KEY (`idEfectivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Factura` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Factura` (
  `idFactura` INT NOT NULL,
  `idPago` INT NOT NULL,
  `fechaFactura` DATE NOT NULL,
  `descuento` DOUBLE NOT NULL,
  `nroFactura` INT NOT NULL,
  PRIMARY KEY (`idFactura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaPedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaPedido` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaPedido` (
  `idBajaPedido` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `fechaBaja` DATE NOT NULL,
  PRIMARY KEY (`idBajaPedido`, `idPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Estado` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Estado` (
  `idEstado` INT NOT NULL,
  `descripcionEstado` VARCHAR(95) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Pedido_Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Pedido_Estado` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Pedido_Estado` (
  `idPedido_Estado` INT NOT NULL,
  `idEstado` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `horaraInicioEstado` TIMESTAMP NOT NULL,
  `horaFinEstado` TIMESTAMP NULL,
  PRIMARY KEY (`idPedido_Estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaUsuario` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaUsuario` (
  `IdBajaUsuario` INT NOT NULL,
  `IdUsuario` INT NOT NULL,
  `fechaBaja` DATE NOT NULL,
  PRIMARY KEY (`IdBajaUsuario`, `IdUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`Domicilio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`Domicilio` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`Domicilio` (
  `idDomicilio` INT NOT NULL,
  `IdUsuario` INT NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDomicilio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`DetalleFactura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`DetalleFactura` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`DetalleFactura` (
  `idDetalleFactura` INT NOT NULL,
  `idFactura` INT NOT NULL,
  PRIMARY KEY (`idDetalleFactura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`BajaArticuloInsumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`BajaArticuloInsumo` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`BajaArticuloInsumo` (
  `idBajaArticuloInsumo` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `FechaBaja` DATE NOT NULL,
  PRIMARY KEY (`idBajaArticuloInsumo`, `idArticuloInsumo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elbuensabor`.`ArticuloInsumo_DetallePedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `elbuensabor`.`ArticuloInsumo_DetallePedido` ;

CREATE TABLE IF NOT EXISTS `elbuensabor`.`ArticuloInsumo_DetallePedido` (
  `idArticuloInsumo_DetallePedido` INT NOT NULL,
  `idArticuloInsumo` INT NOT NULL,
  `idDetallePedido` INT NOT NULL,
  PRIMARY KEY (`idArticuloInsumo_DetallePedido`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

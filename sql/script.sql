-- --------------------------------------------------------
-- Host:                         2daw.esvirgua.com
-- Versión del servidor:         5.7.42 - MySQL Community Server (GPL)
-- SO del servidor:              Linux
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para user2daw_BD2-06
DROP DATABASE IF EXISTS `user2daw_BD2-06`;
CREATE DATABASE IF NOT EXISTS `user2daw_BD2-06` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `user2daw_BD2-06`;

-- Volcando estructura para tabla user2daw_BD2-06.syc_ciudades
DROP TABLE IF EXISTS `syc_ciudades`;
CREATE TABLE IF NOT EXISTS `syc_ciudades` (
  `idCiudad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idEstructuraPartida` int(10) unsigned NOT NULL,
  `fechaInicioPartida` datetime NOT NULL,
  `publicado` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `finalizado` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `dineroInicial` decimal(7,2) NOT NULL,
  `reputacionInicial` int(11) NOT NULL,
  `cantidadCochesInicial` int(11) NOT NULL,
  `puntuacionVenta` int(11) NOT NULL,
  `puntuacionCompra` int(11) NOT NULL,
  PRIMARY KEY (`idCiudad`) USING BTREE,
  KEY `FK_syc_partidas_activas_syc_config_partidas` (`idEstructuraPartida`) USING BTREE,
  CONSTRAINT `FK_syc_partidas_activas_syc_config_partidas` FOREIGN KEY (`idEstructuraPartida`) REFERENCES `syc_estructura_partidas` (`idEstructuraPartida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_ciudades: ~6 rows (aproximadamente)
INSERT INTO `syc_ciudades` (`idCiudad`, `nombreCiudad`, `idEstructuraPartida`, `fechaInicioPartida`, `publicado`, `finalizado`, `dineroInicial`, `reputacionInicial`, `cantidadCochesInicial`, `puntuacionVenta`, `puntuacionCompra`) VALUES
	(1, 'CIUDAD 1', 1, '2023-04-01 12:00:00', 'SI', 'NO', 30000.00, 70, 5, 200, 100),
	(2, 'CIUDAD 2', 1, '2023-04-13 10:00:00', 'SI', 'NO', 30000.00, 70, 5, 200, 100),
	(3, 'CIUDAD 3', 2, '2023-04-04 23:27:27', 'SI', 'NO', 30000.00, 70, 5, 200, 100),
	(4, 'CIUDAD 4', 2, '2023-04-03 23:27:27', 'SI', 'NO', 30000.00, 70, 5, 200, 100),
	(5, 'CIUDAD 5', 3, '2023-04-03 23:27:27', 'SI', 'NO', 30000.00, 70, 5, 200, 100),
	(6, 'CIUDAD 6', 3, '2023-04-08 23:27:27', 'SI', 'NO', 30000.00, 70, 5, 200, 100);

-- Volcando estructura para tabla user2daw_BD2-06.syc_compras
DROP TABLE IF EXISTS `syc_compras`;
CREATE TABLE IF NOT EXISTS `syc_compras` (
  `idVenta` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idGanvam` int(10) unsigned NOT NULL,
  `idJugador` int(10) unsigned NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `FK_syc_compras_syc_ganvam` (`idGanvam`),
  KEY `FK_syc_compras_syc_jugadores` (`idJugador`),
  CONSTRAINT `FK_syc_compras_syc_ganvam` FOREIGN KEY (`idGanvam`) REFERENCES `syc_ganvam` (`idGanvam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_syc_compras_syc_jugadores` FOREIGN KEY (`idJugador`) REFERENCES `syc_jugadores` (`idJugador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_compras: ~8 rows (aproximadamente)
INSERT INTO `syc_compras` (`idVenta`, `idGanvam`, `idJugador`, `precio`) VALUES
	(1, 3, 4, 15000.00),
	(2, 2, 4, 5000.00),
	(3, 1, 4, 8000.00),
	(4, 5, 4, 10000.00),
	(5, 2, 3, 6000.00),
	(6, 1, 3, 7000.00),
	(7, 5, 3, 9000.00),
	(8, 6, 3, 7000.00);

-- Volcando estructura para tabla user2daw_BD2-06.syc_concesionarios
DROP TABLE IF EXISTS `syc_concesionarios`;
CREATE TABLE IF NOT EXISTS `syc_concesionarios` (
  `idConcesionario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `plazas` tinyint(4) NOT NULL,
  `cantOperaciones` tinyint(4) NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idConcesionario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_concesionarios: ~7 rows (aproximadamente)
INSERT INTO `syc_concesionarios` (`idConcesionario`, `nombre`, `plazas`, `cantOperaciones`, `precio`) VALUES
	(1, 'Concesionario 1', 10, 3, 50000.00),
	(2, 'Concesionario 2', 15, 5, 70000.00),
	(3, 'Concesionario 3', 20, 6, 100000.00),
	(4, 'Concesionario 4', 25, 8, 120000.00),
	(5, 'Concesionario 5', 30, 10, 150000.00),
	(6, 'Concesionario 6', 35, 12, 180000.00),
	(7, 'Concesionario 7', 40, 14, 200000.00);

-- Volcando estructura para tabla user2daw_BD2-06.syc_estados
DROP TABLE IF EXISTS `syc_estados`;
CREATE TABLE IF NOT EXISTS `syc_estados` (
  `idEstado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idJugador` int(10) unsigned NOT NULL,
  `idPartida` int(10) unsigned NOT NULL,
  `idConcesionario` int(10) unsigned NOT NULL,
  `dinero` int(10) NOT NULL,
  `reputacion` tinyint(3) unsigned NOT NULL,
  `puntuacion` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEstado`) USING BTREE,
  KEY `FK_syc_estados_syc_jugadores` (`idJugador`),
  KEY `FK_syc_estados_syc_partidas` (`idPartida`),
  KEY `FK_syc_estados_syc_concesionarios` (`idConcesionario`),
  CONSTRAINT `FK_syc_estados_syc_concesionarios` FOREIGN KEY (`idConcesionario`) REFERENCES `syc_concesionarios` (`idConcesionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_syc_estados_syc_jugadores` FOREIGN KEY (`idJugador`) REFERENCES `syc_jugadores` (`idJugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_syc_estados_syc_partidas` FOREIGN KEY (`idPartida`) REFERENCES `syc_ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_estados: ~4 rows (aproximadamente)
INSERT INTO `syc_estados` (`idEstado`, `idJugador`, `idPartida`, `idConcesionario`, `dinero`, `reputacion`, `puntuacion`) VALUES
	(1, 3, 1, 1, 50000, 70, 0),
	(2, 4, 1, 1, 50000, 70, 0),
	(3, 3, 2, 1, 30000, 70, 0),
	(4, 3, 3, 1, 30000, 70, 0);

-- Volcando estructura para tabla user2daw_BD2-06.syc_estructura_partidas
DROP TABLE IF EXISTS `syc_estructura_partidas`;
CREATE TABLE IF NOT EXISTS `syc_estructura_partidas` (
  `idEstructuraPartida` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombrePartida` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `duracionPartida` int(11) NOT NULL,
  `numIniciarDias` tinyint(3) unsigned NOT NULL,
  `numJugadores` int(10) unsigned NOT NULL,
  `premioUno` int(10) unsigned NOT NULL,
  `premioDos` int(10) unsigned NOT NULL,
  `premioTres` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEstructuraPartida`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_estructura_partidas: ~3 rows (aproximadamente)
INSERT INTO `syc_estructura_partidas` (`idEstructuraPartida`, `nombrePartida`, `duracionPartida`, `numIniciarDias`, `numJugadores`, `premioUno`, `premioDos`, `premioTres`) VALUES
	(1, 'Modalidad Uno', 100, 10, 200, 1000, 500, 200),
	(2, 'Modalidad Dos', 200, 10, 150, 1000, 500, 200),
	(3, 'Modalidad Tres', 50, 10, 300, 1000, 500, 200);

-- Volcando estructura para tabla user2daw_BD2-06.syc_ganvam
DROP TABLE IF EXISTS `syc_ganvam`;
CREATE TABLE IF NOT EXISTS `syc_ganvam` (
  `idGanvam` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `modelo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechaFabricacion` date NOT NULL,
  `precio` decimal(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idGanvam`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_ganvam: ~16 rows (aproximadamente)
INSERT INTO `syc_ganvam` (`idGanvam`, `marca`, `modelo`, `fechaFabricacion`, `precio`) VALUES
	(1, 'Audi', 'A1', '2017-04-03', 17500.00),
	(2, 'Audi', 'A3', '2005-05-08', 5000.00),
	(3, 'Audi', 'A4', '2004-11-01', 5500.00),
	(4, 'Audi', 'A5', '2010-08-08', 12500.00),
	(5, 'Audi', 'A6', '2012-04-03', 19500.00),
	(6, 'Audi', 'A7', '2013-12-03', 21500.00),
	(7, 'Audi', 'A1', '2019-04-03', 22500.00),
	(8, 'Seat', 'Leon', '2002-05-08', 3500.00),
	(9, 'Seat', 'Ibiza', '2009-04-07', 5500.00),
	(10, 'Seat', 'Arona', '2015-12-08', 15000.00),
	(11, 'Volkswagen', 'Golf', '2005-05-08', 5000.00),
	(12, 'Volkswagen', 'Passat', '2009-07-22', 7500.00),
	(13, 'Volkswagen', 'Arteon', '2020-01-06', 32000.00),
	(14, 'Citroen', 'C4', '2009-03-13', 4600.00),
	(15, 'Citroen', 'C3', '2007-06-06', 3900.00),
	(16, 'Citroen', 'C5', '2001-04-19', 2500.00);

-- Volcando estructura para tabla user2daw_BD2-06.syc_jugadores
DROP TABLE IF EXISTS `syc_jugadores`;
CREATE TABLE IF NOT EXISTS `syc_jugadores` (
  `idJugador` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nick` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `rol` char(3) COLLATE utf8_spanish_ci NOT NULL,
  `fechaCreacion` datetime NOT NULL,
  `gemas` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idJugador`) USING BTREE,
  UNIQUE KEY `nick` (`nick`) USING BTREE,
  UNIQUE KEY `mail` (`correo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_jugadores: ~4 rows (aproximadamente)
INSERT INTO `syc_jugadores` (`idJugador`, `nick`, `correo`, `pass`, `rol`, `fechaCreacion`, `gemas`) VALUES
	(1, 'admin', 'adminsyc@gmail.com', '1234', 'ADM', '2023-04-03 13:00:00', 0),
	(2, 'helper1', 'helpersyc@gmail.com', '1234', 'HLP', '2023-04-03 13:01:00', 0),
	(3, 'miguel', 'lyto199120@gmail.com', '1234', 'PLY', '2023-04-03 13:05:00', 0),
	(4, 'mario', 'mperezg30@gmail.com', '1234', 'PLY', '2023-04-03 13:06:00', 0);

-- Volcando estructura para tabla user2daw_BD2-06.syc_ofertas
DROP TABLE IF EXISTS `syc_ofertas`;
CREATE TABLE IF NOT EXISTS `syc_ofertas` (
  `idOferta` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idVehiculo` bigint(20) unsigned NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`idOferta`),
  KEY `FK_syc_ofertas_syc_vehiculos` (`idVehiculo`),
  CONSTRAINT `FK_syc_ofertas_syc_vehiculos` FOREIGN KEY (`idVehiculo`) REFERENCES `syc_vehiculos` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_ofertas: ~9 rows (aproximadamente)
INSERT INTO `syc_ofertas` (`idOferta`, `idVehiculo`, `precio`) VALUES
	(1, 1, 15000.00),
	(2, 2, 18000.00),
	(3, 3, 15000.00),
	(5, 4, 21000.00),
	(6, 5, 5000.00),
	(7, 6, 6000.00),
	(8, 7, 9000.00),
	(9, 8, 7000.00),
	(10, 9, 7500.00);

-- Volcando estructura para tabla user2daw_BD2-06.syc_vehiculos
DROP TABLE IF EXISTS `syc_vehiculos`;
CREATE TABLE IF NOT EXISTS `syc_vehiculos` (
  `idVehiculo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `idGanvam` int(10) unsigned NOT NULL,
  `idJugador` int(10) unsigned NOT NULL,
  `idPartida` int(10) unsigned NOT NULL,
  `precio` decimal(11,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`idVehiculo`) USING BTREE,
  KEY `FK_syc_vehiculos_syc_ganvam` (`idGanvam`),
  KEY `FK_syc_vehiculos_syc_jugadores` (`idJugador`),
  KEY `FK_syc_vehiculos_syc_partidas` (`idPartida`),
  CONSTRAINT `FK_syc_vehiculos_syc_ganvam` FOREIGN KEY (`idGanvam`) REFERENCES `syc_ganvam` (`idGanvam`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_syc_vehiculos_syc_jugadores` FOREIGN KEY (`idJugador`) REFERENCES `syc_jugadores` (`idJugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_syc_vehiculos_syc_partidas` FOREIGN KEY (`idPartida`) REFERENCES `syc_ciudades` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla user2daw_BD2-06.syc_vehiculos: ~10 rows (aproximadamente)
INSERT INTO `syc_vehiculos` (`idVehiculo`, `idGanvam`, `idJugador`, `idPartida`, `precio`) VALUES
	(1, 9, 3, 1, 15000.00),
	(2, 9, 4, 1, 14500.00),
	(3, 9, 3, 1, 15000.00),
	(4, 8, 3, 1, 7500.00),
	(5, 2, 3, 1, 5500.00),
	(6, 5, 3, 1, 10500.00),
	(7, 9, 4, 1, 15000.00),
	(8, 8, 4, 1, 7500.00),
	(9, 2, 4, 1, 5500.00),
	(10, 5, 4, 1, 10500.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

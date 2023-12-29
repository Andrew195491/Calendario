-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.2.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para apps
CREATE DATABASE IF NOT EXISTS `apps` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `apps`;

-- Volcando estructura para tabla apps.eventos
CREATE TABLE IF NOT EXISTS `eventos` (
  `idgrupo` int(11) DEFAULT NULL,
  `creadoPor` int(11) DEFAULT NULL,
  `mensaje` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  KEY `FK_eventos_grupo` (`idgrupo`),
  KEY `FK_eventos_usuarios` (`creadoPor`),
  CONSTRAINT `FK_eventos_grupo` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_eventos_usuarios` FOREIGN KEY (`creadoPor`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla apps.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla apps.rangosgrupos
CREATE TABLE IF NOT EXISTS `rangosgrupos` (
  `idGrupo` int(11) DEFAULT NULL,
  `idAlumno` int(11) DEFAULT NULL,
  `poder` int(11) DEFAULT NULL,
  KEY `FK_rangosgrupos_grupo` (`idGrupo`),
  KEY `FK_rangosgrupos_usuarios` (`idAlumno`),
  CONSTRAINT `FK_rangosgrupos_grupo` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_rangosgrupos_usuarios` FOREIGN KEY (`idAlumno`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla apps.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

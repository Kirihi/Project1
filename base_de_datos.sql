-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6336
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nequeplay
CREATE DATABASE IF NOT EXISTS `nequeplay` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `nequeplay`;

-- Dumping structure for procedure nequeplay.actualizar_episodio
DELIMITER //
CREATE PROCEDURE `actualizar_episodio`(
	IN `n` VARCHAR(50),
	IN `dur` INT,
	IN `ids` INT
)
BEGIN
	UPDATE episodios
	SET episodios.nombre = n,
	episodios.duracion = dur
	WHERE episodios.id_episodio = ids;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.actualizar_serie
DELIMITER //
CREATE PROCEDURE `actualizar_serie`(
	IN `n` VARCHAR(50),
	IN `d` VARCHAR(300),
	IN `f` TEXT,
	IN `fo` TEXT,
	IN `idd` INT
)
BEGIN
	UPDATE series
	SET nombre = n,
		descripcion = d,
		imagen = f,
		fondo = fo
	WHERE series.id = idd;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.agregar_contacto
DELIMITER //
CREATE PROCEDURE `agregar_contacto`(
	IN `n` VARCHAR(50),
	IN `c` VARCHAR(50),
	IN `t` VARCHAR(50),
	IN `a` VARCHAR(100),
	IN `m` TEXT
)
BEGIN
	INSERT INTO contactos(contactos.nombre, contactos.correo, contactos.tipo, contactos.asunto, contactos.mensaje)
	VALUES(n, c, t, a, m);
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.agregar_episodio
DELIMITER //
CREATE PROCEDURE `agregar_episodio`(
	IN `t` INT,
	IN `n` VARCHAR(50),
	IN `dur` INT,
	IN `idSe` INT
)
BEGIN
	SET @capitulo = 0;
	SELECT COUNT(*) + 1 INTO @capitulo FROM episodios WHERE idSerie=idSe AND temporada=t;
	
	INSERT INTO episodios (episodios.episodio, episodios.temporada, episodios.nombre, episodios.duracion, episodios.idSerie)
	VALUES (@capitulo,t,n,dur,idSe);
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.agregar_episodios
DELIMITER //
CREATE PROCEDURE `agregar_episodios`(
	IN `e` INT,
	IN `n` VARCHAR(50),
	IN `dur` INT,
	IN `id` INT
)
BEGIN
	INSERT INTO episodios (episodio, nombre, duracion ,idSerie)
	VALUES (e,n,dur,id);
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.agregar_temporada
DELIMITER //
CREATE PROCEDURE `agregar_temporada`(
	IN `e` INT,
	IN `t` INT,
	IN `n` VARCHAR(50),
	IN `dur` INT,
	IN `idSe` INT
)
BEGIN
	INSERT INTO episodios(episodios.episodio, episodios.temporada, episodios.nombre, episodios.duracion, episodios.idSerie)
	VALUES(e,t,n,dur,idSe);
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.borrar_episodio
DELIMITER //
CREATE PROCEDURE `borrar_episodio`(
	IN `id` INT
)
BEGIN
	DELETE FROM episodios
	WHERE episodios.id_episodio=id;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.borrar_serie
DELIMITER //
CREATE PROCEDURE `borrar_serie`(
	IN `idd` INT
)
BEGIN
	DELETE FROM series
	WHERE series.id = idd;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.borrar_temporada
DELIMITER //
CREATE PROCEDURE `borrar_temporada`(
	IN `t` INT,
	IN `i` INT
)
BEGIN
	DELETE FROM episodios
	WHERE episodios.temporada=t AND episodios.idSerie=i;
END//
DELIMITER ;

-- Dumping structure for table nequeplay.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.categorias: ~19 rows (approximately)
DELETE FROM `categorias`;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
	(1, 'Acción'),
	(2, 'Drama'),
	(8, 'Fantasía'),
	(9, 'Shounen'),
	(10, 'Superpoderes'),
	(11, 'Sobrenatural'),
	(12, 'Histórico'),
	(13, 'Gore'),
	(14, 'Aventuras'),
	(15, 'Comedia'),
	(16, 'Artes Marciales'),
	(17, 'Infantil'),
	(18, 'Ecchi'),
	(19, 'Ciencia Ficción'),
	(20, 'Misterio'),
	(21, 'Terror'),
	(22, 'Psicológico'),
	(23, 'Recuentos de la vida'),
	(24, 'Escolares');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Dumping structure for table nequeplay.categorias_series
CREATE TABLE IF NOT EXISTS `categorias_series` (
  `id_series` int(11) DEFAULT NULL,
  `id_categorias` int(11) DEFAULT NULL,
  KEY `FK_id_categorias_categorias` (`id_categorias`),
  KEY `FK_id_series_series` (`id_series`),
  CONSTRAINT `FK_id_categorias_categorias` FOREIGN KEY (`id_categorias`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_id_series_series` FOREIGN KEY (`id_series`) REFERENCES `series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.categorias_series: ~92 rows (approximately)
DELETE FROM `categorias_series`;
/*!40000 ALTER TABLE `categorias_series` DISABLE KEYS */;
INSERT INTO `categorias_series` (`id_series`, `id_categorias`) VALUES
	(8, 2),
	(8, 22),
	(8, 23),
	(8, 9),
	(19, 1),
	(19, 15),
	(19, 13),
	(19, 8),
	(19, 9),
	(19, 12),
	(19, 11),
	(9, 1),
	(9, 15),
	(9, 24),
	(9, 9),
	(9, 10),
	(10, 14),
	(10, 2),
	(10, 9),
	(10, 11),
	(11, 1),
	(11, 13),
	(11, 24),
	(11, 9),
	(11, 11),
	(11, 21),
	(20, 1),
	(20, 15),
	(20, 20),
	(20, 11),
	(18, 2),
	(18, 24),
	(18, 20),
	(18, 22),
	(17, 1),
	(17, 2),
	(17, 20),
	(17, 22),
	(17, 11),
	(17, 21),
	(16, 20),
	(16, 22),
	(16, 11),
	(15, 1),
	(12, 8),
	(14, 1),
	(14, 2),
	(14, 24),
	(14, 9),
	(13, 2),
	(13, 8),
	(13, 22),
	(12, 1),
	(12, 14),
	(12, 15),
	(12, 2),
	(15, 8),
	(12, 9),
	(12, 10),
	(7, 19),
	(7, 9),
	(7, 20),
	(7, 21),
	(6, 1),
	(6, 14),
	(6, 18),
	(6, 8),
	(6, 9),
	(6, 11),
	(5, 1),
	(5, 14),
	(5, 15),
	(5, 8),
	(5, 17),
	(4, 1),
	(4, 16),
	(4, 15),
	(4, 9),
	(4, 10),
	(3, 1),
	(3, 14),
	(3, 9),
	(2, 1),
	(2, 13),
	(2, 12),
	(2, 9),
	(2, 11),
	(1, 1),
	(1, 2),
	(1, 8),
	(1, 9),
	(1, 10);
/*!40000 ALTER TABLE `categorias_series` ENABLE KEYS */;

-- Dumping structure for table nequeplay.contactos
CREATE TABLE IF NOT EXISTS `contactos` (
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `mensaje` text DEFAULT NULL,
  `id_contacto` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.contactos: ~1 rows (approximately)
DELETE FROM `contactos`;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` (`nombre`, `correo`, `tipo`, `asunto`, `mensaje`, `id_contacto`) VALUES
	('Huachimingo', 'huachimingo@aaaa.com', 'queja', 'No hay suficiente cartelera', 'AGREGUEN MAS CONTENIDO.\r\nPor favor.', 1);
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;

-- Dumping structure for procedure nequeplay.crear_serie
DELIMITER //
CREATE PROCEDURE `crear_serie`(
	IN `n` VARCHAR(50),
	IN `d` VARCHAR(300),
	IN `i` TEXT,
	IN `f` TEXT
)
BEGIN
	INSERT INTO series(nombre, descripcion, imagen, fondo)
	VALUES (n, d, i,f);
END//
DELIMITER ;

-- Dumping structure for table nequeplay.episodios
CREATE TABLE IF NOT EXISTS `episodios` (
  `id_episodio` int(11) NOT NULL AUTO_INCREMENT,
  `episodio` int(11) DEFAULT NULL,
  `temporada` int(11) NOT NULL DEFAULT 1,
  `nombre` varchar(50) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `idSerie` int(11) NOT NULL,
  PRIMARY KEY (`id_episodio`),
  KEY `FK_id_serie` (`idSerie`),
  CONSTRAINT `FK_id_serie` FOREIGN KEY (`idSerie`) REFERENCES `series` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.episodios: ~319 rows (approximately)
DELETE FROM `episodios`;
/*!40000 ALTER TABLE `episodios` DISABLE KEYS */;
INSERT INTO `episodios` (`id_episodio`, `episodio`, `temporada`, `nombre`, `duracion`, `idSerie`) VALUES
	(19, NULL, 1, 'Shingeki No Kyojin | Capitulo 1', 20, 1),
	(20, NULL, 1, 'Shingeki No Kyojin | Capitulo 2', 21, 1),
	(21, NULL, 1, 'Shingeki No Kyojin | Capitulo 3', 20, 1),
	(22, NULL, 1, 'Shingeki No Kyojin | Capitulo 4', 20, 1),
	(23, NULL, 1, 'Shingeki No Kyojin | Capitulo 5', 23, 1),
	(24, NULL, 2, 'Shingeki No Kyojin | Capitulo 1', 25, 1),
	(25, NULL, 2, 'Shingeki No Kyojin | Capitulo 2', 25, 1),
	(26, NULL, 2, 'Shingeki No Kyojin | Capitulo 3', 25, 1),
	(27, NULL, 2, 'Shingeki No Kyojin | Capitulo 4', 24, 1),
	(28, NULL, 2, 'Shingeki No Kyojin | Capitulo 5', 25, 1),
	(29, NULL, 3, 'Shingeki No Kyojin | Capitulo 1', 20, 1),
	(30, NULL, 3, 'Shingeki No Kyojin | Capitulo 2', 25, 1),
	(31, NULL, 3, 'Shingeki No Kyojin | Capitulo 3', 20, 1),
	(32, NULL, 3, 'Shingeki No Kyojin | Capitulo 4', 20, 1),
	(33, NULL, 3, 'Shingeki No Kyojin | Capitulo 5', 25, 1),
	(34, NULL, 1, 'Kimetsu No Yaiba | Capitulo 1', 22, 2),
	(35, NULL, 1, 'Kimetsu No Yaiba | Capitulo 2', 20, 2),
	(36, NULL, 1, 'Kimetsu No Yaiba | Capitulo 3', 20, 2),
	(37, NULL, 1, 'Kimetsu No Yaiba | Capitulo 4', 20, 2),
	(38, NULL, 1, 'Kimetsu No Yaiba | Capitulo 5', 20, 2),
	(39, NULL, 1, 'Kimetsu No Yaiba | Capitulo 6', 25, 2),
	(40, NULL, 1, 'Kimetsu No Yaiba | Capitulo 7', 20, 2),
	(41, NULL, 1, 'Kimetsu No Yaiba | Capitulo 8', 20, 2),
	(42, NULL, 1, 'Kimetsu No Yaiba | Capitulo 9', 20, 2),
	(43, NULL, 1, 'Kimetsu No Yaiba | Capitulo 10', 20, 2),
	(44, NULL, 1, 'Kimetsu No Yaiba | Capitulo 11', 20, 2),
	(45, NULL, 1, 'Kimetsu No Yaiba | Capitulo 12', 25, 2),
	(46, NULL, 2, 'Kimetsu No Yaiba | Capitulo 1', 20, 2),
	(47, NULL, 2, 'Kimetsu No Yaiba | Capitulo 2', 20, 2),
	(48, NULL, 2, 'Kimetsu No Yaiba | Capitulo 3', 20, 2),
	(49, NULL, 2, 'Kimetsu No Yaiba | Capitulo 4', 20, 2),
	(50, NULL, 2, 'Kimetsu No Yaiba | Capitulo 5', 20, 2),
	(51, NULL, 2, 'Kimetsu No Yaiba | Capitulo 6', 25, 2),
	(52, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 1', 25, 3),
	(53, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 2', 25, 3),
	(54, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 3', 25, 3),
	(55, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 4', 25, 3),
	(56, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 5', 25, 3),
	(57, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 6', 25, 3),
	(58, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 7', 25, 3),
	(59, NULL, 1, 'JoJo No Kimyou Na Bouken | Capitulo 8', 25, 3),
	(60, NULL, 2, 'JoJo No Kimyou Na Bouken | Capitulo 1', 20, 3),
	(61, NULL, 2, 'JoJo No Kimyou Na Bouken | Capitulo 2', 20, 3),
	(62, NULL, 2, 'JoJo No Kimyou Na Bouken | Capitulo 3', 20, 3),
	(63, NULL, 2, 'JoJo No Kimyou Na Bouken | Capitulo 4', 20, 3),
	(64, NULL, 2, 'JoJo No Kimyou Na Bouken | Capitulo 5', 20, 3),
	(65, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 1', 25, 3),
	(66, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 2', 25, 3),
	(67, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 3', 25, 3),
	(68, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 4', 25, 3),
	(69, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 5', 25, 3),
	(70, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 6', 25, 3),
	(71, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 7', 25, 3),
	(72, NULL, 3, 'JoJo No Kimyou Na Bouken | Capitulo 8', 25, 3),
	(73, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 1', 20, 3),
	(74, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 2', 20, 3),
	(75, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 3', 20, 3),
	(76, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 4', 20, 3),
	(77, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 5', 20, 3),
	(78, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 6', 20, 3),
	(79, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 7', 20, 3),
	(80, NULL, 4, 'JoJo No Kimyou Na Bouken | Capitulo 8', 20, 3),
	(81, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 1', 25, 3),
	(82, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 2', 25, 3),
	(83, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 3', 25, 3),
	(84, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 4', 25, 3),
	(85, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 5', 25, 3),
	(86, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 6', 25, 3),
	(87, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 7', 25, 3),
	(88, NULL, 5, 'JoJo No Kimyou Na Bouken | Capitulo 8', 25, 3),
	(89, NULL, 1, 'Naruto | Capitulo 1', 30, 4),
	(90, NULL, 1, 'Naruto | Capitulo 2', 30, 4),
	(91, NULL, 1, 'Naruto | Capitulo 3', 30, 4),
	(92, NULL, 1, 'Naruto | Capitulo 4', 30, 4),
	(93, NULL, 1, 'Naruto | Capitulo 5', 30, 4),
	(94, NULL, 2, 'Naruto | Capitulo 1', 30, 4),
	(95, NULL, 2, 'Naruto | Capitulo 2', 30, 4),
	(96, NULL, 2, 'Naruto | Capitulo 3', 30, 4),
	(97, NULL, 2, 'Naruto | Capitulo 4', 30, 4),
	(98, NULL, 2, 'Naruto | Capitulo 5', 30, 4),
	(99, NULL, 3, 'Naruto | Capitulo 1', 30, 4),
	(100, NULL, 3, 'Naruto | Capitulo 2', 30, 4),
	(101, NULL, 3, 'Naruto | Capitulo 3', 30, 4),
	(102, NULL, 3, 'Naruto | Capitulo 4', 30, 4),
	(103, NULL, 3, 'Naruto | Capitulo 5', 30, 4),
	(104, NULL, 4, 'Naruto | Capitulo 1', 30, 4),
	(105, NULL, 4, 'Naruto | Capitulo 2', 30, 4),
	(106, NULL, 4, 'Naruto | Capitulo 3', 30, 4),
	(107, NULL, 4, 'Naruto | Capitulo 4', 30, 4),
	(108, NULL, 4, 'Naruto | Capitulo 5', 30, 4),
	(109, NULL, 5, 'Naruto | Capitulo 1', 30, 4),
	(110, NULL, 5, 'Naruto | Capitulo 2', 30, 4),
	(111, NULL, 5, 'Naruto | Capitulo 3', 30, 4),
	(112, NULL, 5, 'Naruto | Capitulo 4', 30, 4),
	(113, NULL, 5, 'Naruto | Capitulo 5', 30, 4),
	(114, NULL, 1, 'Pokemon | Capitulo 1', 30, 5),
	(115, NULL, 1, 'Pokemon | Capitulo 2', 30, 5),
	(116, NULL, 1, 'Pokemon | Capitulo 3', 30, 5),
	(117, NULL, 1, 'Pokemon | Capitulo 4', 30, 5),
	(118, NULL, 1, 'Pokemon | Capitulo 5', 30, 5),
	(119, NULL, 2, 'Pokemon | Capitulo 1', 30, 5),
	(120, NULL, 2, 'Pokemon | Capitulo 2', 30, 5),
	(121, NULL, 2, 'Pokemon | Capitulo 3', 30, 5),
	(122, NULL, 2, 'Pokemon | Capitulo 4', 30, 5),
	(123, NULL, 2, 'Pokemon | Capitulo 5', 30, 5),
	(124, NULL, 3, 'Pokemon | Capitulo 1', 30, 5),
	(125, NULL, 3, 'Pokemon | Capitulo 2', 30, 5),
	(126, NULL, 3, 'Pokemon | Capitulo 3', 30, 5),
	(127, NULL, 3, 'Pokemon | Capitulo 4', 30, 5),
	(128, NULL, 3, 'Pokemon | Capitulo 5', 30, 5),
	(129, NULL, 4, 'Pokemon | Capitulo 1', 30, 5),
	(130, NULL, 4, 'Pokemon | Capitulo 2', 30, 5),
	(131, NULL, 4, 'Pokemon | Capitulo 3', 30, 5),
	(132, NULL, 4, 'Pokemon | Capitulo 4', 30, 5),
	(133, NULL, 4, 'Pokemon | Capitulo 5', 30, 5),
	(134, NULL, 5, 'Pokemon | Capitulo 1', 30, 5),
	(135, NULL, 5, 'Pokemon | Capitulo 2', 30, 5),
	(136, NULL, 5, 'Pokemon | Capitulo 3', 30, 5),
	(137, NULL, 5, 'Pokemon | Capitulo 4', 30, 5),
	(138, NULL, 5, 'Pokemon | Capitulo 5', 30, 5),
	(139, NULL, 1, 'Nanatsu No Taizai | Capitulo 1', 20, 6),
	(140, NULL, 1, 'Nanatsu No Taizai | Capitulo 2', 20, 6),
	(141, NULL, 1, 'Nanatsu No Taizai | Capitulo 3', 20, 6),
	(142, NULL, 1, 'Nanatsu No Taizai | Capitulo 4', 20, 6),
	(143, NULL, 1, 'Nanatsu No Taizai | Capitulo 5', 20, 6),
	(144, NULL, 1, 'Nanatsu No Taizai | Capitulo 6', 20, 6),
	(145, NULL, 2, 'Nanatsu No Taizai | Capitulo 1', 20, 6),
	(146, NULL, 2, 'Nanatsu No Taizai | Capitulo 2', 20, 6),
	(147, NULL, 2, 'Nanatsu No Taizai | Capitulo 3', 20, 6),
	(148, NULL, 2, 'Nanatsu No Taizai | Capitulo 4', 20, 6),
	(149, NULL, 2, 'Nanatsu No Taizai | Capitulo 5', 20, 6),
	(150, NULL, 1, 'Yakusoku No Neverland | Capitulo 1', 20, 7),
	(151, NULL, 1, 'Yakusoku No Neverland | Capitulo 2', 20, 7),
	(152, NULL, 1, 'Yakusoku No Neverland | Capitulo 3', 20, 7),
	(153, NULL, 1, 'Yakusoku No Neverland | Capitulo 4', 20, 7),
	(154, NULL, 1, 'Yakusoku No Neverland | Capitulo 5', 20, 7),
	(155, NULL, 1, 'Yakusoku No Neverland | Capitulo 6', 20, 7),
	(156, NULL, 1, 'Yakusoku No Neverland | Capitulo 7', 20, 7),
	(157, NULL, 1, 'Yakusoku No Neverland | Capitulo 8', 20, 7),
	(158, NULL, 2, 'Yakusoku No Neverland | Capitulo 1', 20, 7),
	(159, NULL, 2, 'Yakusoku No Neverland | Capitulo 2', 20, 7),
	(160, NULL, 2, 'Yakusoku No Neverland | Capitulo 3', 20, 7),
	(161, NULL, 2, 'Yakusoku No Neverland | Capitulo 4', 20, 7),
	(162, NULL, 2, 'Yakusoku No Neverland | Capitulo 5', 20, 7),
	(163, NULL, 2, 'Yakusoku No Neverland | Capitulo 6', 20, 7),
	(164, NULL, 2, 'Yakusoku No Neverland | Capitulo 7', 20, 7),
	(165, NULL, 2, 'Yakusoku No Neverland | Capitulo 8', 20, 7),
	(166, NULL, 2, 'Yakusoku No Neverland | Capitulo 9', 20, 7),
	(167, NULL, 2, 'Yakusoku No Neverland | Capitulo 10', 20, 7),
	(168, NULL, 2, 'Yakusoku No Neverland | Capitulo 11', 20, 7),
	(169, NULL, 2, 'Yakusoku No Neverland | Capitulo 12', 20, 7),
	(170, NULL, 1, 'Beastars | Capitulo 1', 25, 8),
	(171, NULL, 1, 'Beastars | Capitulo 2', 25, 8),
	(172, NULL, 1, 'Beastars | Capitulo 3', 25, 8),
	(173, NULL, 1, 'Beastars | Capitulo 4', 25, 8),
	(174, NULL, 1, 'Beastars | Capitulo 5', 25, 8),
	(175, NULL, 1, 'Beastars | Capitulo 6', 25, 8),
	(176, NULL, 1, 'Beastars | Capitulo 7', 25, 8),
	(177, NULL, 1, 'Beastars | Capitulo 8', 25, 8),
	(178, NULL, 1, 'Beastars | Capitulo 9', 25, 8),
	(179, NULL, 1, 'Beastars | Capitulo 10', 25, 8),
	(180, NULL, 1, 'Boku No Hero Academia | Capitulo 1', 25, 9),
	(181, NULL, 1, 'Boku No Hero Academia | Capitulo 2', 25, 9),
	(182, NULL, 1, 'Boku No Hero Academia | Capitulo 3', 25, 9),
	(183, NULL, 1, 'Boku No Hero Academia | Capitulo 4', 25, 9),
	(184, NULL, 1, 'Boku No Hero Academia | Capitulo 5', 25, 9),
	(185, NULL, 2, 'Boku No Hero Academia | Capitulo 1', 20, 9),
	(186, NULL, 2, 'Boku No Hero Academia | Capitulo 2', 20, 9),
	(187, NULL, 2, 'Boku No Hero Academia | Capitulo 3', 20, 9),
	(188, NULL, 2, 'Boku No Hero Academia | Capitulo 4', 20, 9),
	(189, NULL, 2, 'Boku No Hero Academia | Capitulo 5', 20, 9),
	(190, NULL, 2, 'Boku No Hero Academia | Capitulo 6', 20, 9),
	(191, NULL, 2, 'Boku No Hero Academia | Capitulo 7', 20, 9),
	(192, NULL, 1, 'Fumetsu No Anata e | Capitulo 1', 25, 10),
	(193, NULL, 1, 'Fumetsu No Anata e | Capitulo 2', 25, 10),
	(194, NULL, 1, 'Fumetsu No Anata e | Capitulo 3', 25, 10),
	(195, NULL, 1, 'Fumetsu No Anata e | Capitulo 4', 25, 10),
	(196, NULL, 1, 'Fumetsu No Anata e | Capitulo 5', 25, 10),
	(197, NULL, 1, 'Fumetsu No Anata e | Capitulo 6', 25, 10),
	(198, NULL, 1, 'Fumetsu No Anata e | Capitulo 7', 25, 10),
	(199, NULL, 1, 'Fumetsu No Anata e | Capitulo 8', 25, 10),
	(200, NULL, 1, 'Fumetsu No Anata e | Capitulo 9', 25, 10),
	(201, NULL, 1, 'Fumetsu No Anata e | Capitulo 10', 25, 10),
	(202, NULL, 1, 'Jujutsu Kaisen | Capitulo 1', 23, 11),
	(203, NULL, 1, 'Jujutsu Kaisen | Capitulo 2', 23, 11),
	(204, NULL, 1, 'Jujutsu Kaisen | Capitulo 3', 23, 11),
	(205, NULL, 1, 'Jujutsu Kaisen | Capitulo 4', 23, 11),
	(206, NULL, 1, 'Jujutsu Kaisen | Capitulo 5', 23, 11),
	(207, NULL, 1, 'Jujutsu Kaisen | Capitulo 6', 23, 11),
	(208, NULL, 1, 'Jujutsu Kaisen | Capitulo 7', 23, 11),
	(209, NULL, 1, 'Jujutsu Kaisen | Capitulo 8', 23, 11),
	(210, NULL, 1, 'Jujutsu Kaisen | Capitulo 9', 23, 11),
	(211, NULL, 1, 'Jujutsu Kaisen | Capitulo 10', 23, 11),
	(212, NULL, 1, 'Jujutsu Kaisen | Capitulo 11', 23, 11),
	(213, NULL, 1, 'Jujutsu Kaisen | Capitulo 12', 23, 11),
	(214, NULL, 1, 'One Piece | capitulo 1', 30, 12),
	(215, NULL, 1, 'One Piece | capitulo 2', 30, 12),
	(216, NULL, 1, 'One Piece | capitulo 3', 30, 12),
	(217, NULL, 1, 'One Piece | capitulo 4', 30, 12),
	(218, NULL, 1, 'One Piece | capitulo 5', 30, 12),
	(219, NULL, 1, 'One Piece | capitulo 6', 30, 12),
	(220, NULL, 1, 'One Piece | capitulo 7', 30, 12),
	(221, NULL, 1, 'One Piece | capitulo 8', 30, 12),
	(222, NULL, 1, 'One Piece | capitulo 9', 30, 12),
	(223, NULL, 1, 'One Piece | capitulo 10', 30, 12),
	(224, NULL, 2, 'One Piece | capitulo 1', 30, 12),
	(225, NULL, 2, 'One Piece | capitulo 2', 30, 12),
	(226, NULL, 2, 'One Piece | capitulo 3', 30, 12),
	(227, NULL, 2, 'One Piece | capitulo 4', 30, 12),
	(228, NULL, 2, 'One Piece | capitulo 5', 30, 12),
	(229, NULL, 2, 'One Piece | capitulo 6', 30, 12),
	(230, NULL, 2, 'One Piece | capitulo 7', 30, 12),
	(231, NULL, 2, 'One Piece | capitulo 8', 30, 12),
	(232, NULL, 2, 'One Piece | capitulo 9', 30, 12),
	(233, NULL, 2, 'One Piece | capitulo 10', 30, 12),
	(234, NULL, 2, 'One Piece | capitulo 11', 30, 12),
	(235, NULL, 2, 'One Piece | capitulo 12', 30, 12),
	(236, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 1', 25, 13),
	(237, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 2', 25, 13),
	(238, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 3', 25, 13),
	(239, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 4', 25, 13),
	(240, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 5', 25, 13),
	(241, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 6', 25, 13),
	(242, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 7', 25, 13),
	(243, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 8', 25, 13),
	(244, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 9', 25, 13),
	(245, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 10', 25, 13),
	(246, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 11', 25, 13),
	(247, NULL, 1, 'Re:Zero Kara Hajimeru | Capitulo 12', 27, 13),
	(248, NULL, 1, 'Tokyo Revengers | Capitulo 1', 25, 14),
	(249, NULL, 1, 'Tokyo Revengers | Capitulo 2', 25, 14),
	(250, NULL, 1, 'Tokyo Revengers | Capitulo 3', 25, 14),
	(251, NULL, 1, 'Tokyo Revengers | Capitulo 4', 25, 14),
	(252, NULL, 1, 'Tokyo Revengers | Capitulo 5', 25, 14),
	(253, NULL, 1, 'Tokyo Revengers | Capitulo 6', 25, 14),
	(254, NULL, 1, 'Tokyo Revengers | Capitulo 7', 25, 14),
	(255, NULL, 1, 'Tokyo Revengers | Capitulo 8', 25, 14),
	(256, NULL, 1, 'Tokyo Revengers | Capitulo 9', 25, 14),
	(257, NULL, 1, 'Tokyo Revengers | Capitulo 10', 25, 14),
	(258, NULL, 1, 'Tokyo Revengers | Capitulo 1', 25, 14),
	(259, NULL, 1, 'Record Of Ragnarok | Capitulo 1', 25, 15),
	(260, NULL, 1, 'Record Of Ragnarok | Capitulo 2', 25, 15),
	(261, NULL, 1, 'Record Of Ragnarok | Capitulo 3', 25, 15),
	(262, NULL, 1, 'Record Of Ragnarok | Capitulo 4', 25, 15),
	(263, NULL, 1, 'Record Of Ragnarok | Capitulo 5', 25, 15),
	(264, NULL, 1, 'Record Of Ragnarok | Capitulo 6', 25, 15),
	(265, NULL, 1, 'Record Of Ragnarok | Capitulo 7', 25, 15),
	(266, NULL, 1, 'Record Of Ragnarok | Capitulo 8', 25, 15),
	(267, NULL, 1, 'Record Of Ragnarok | Capitulo 9', 25, 15),
	(268, NULL, 1, 'Record Of Ragnarok | Capitulo 10', 25, 15),
	(269, NULL, 1, 'Record Of Ragnarok | Capitulo 11', 25, 15),
	(270, NULL, 1, 'Record Of Ragnarok | Capitulo 12', 25, 15),
	(271, NULL, 1, 'Death Note | Capitulo 1', 20, 16),
	(272, NULL, 1, 'Death Note | Capitulo 2', 20, 16),
	(273, NULL, 1, 'Death Note | Capitulo 3', 20, 16),
	(274, NULL, 1, 'Death Note | Capitulo 4', 20, 16),
	(275, NULL, 1, 'Death Note | Capitulo 5', 20, 16),
	(276, NULL, 1, 'Death Note | Capitulo 6', 20, 16),
	(277, NULL, 1, 'Death Note | Capitulo 7', 20, 16),
	(278, NULL, 1, 'Death Note | Capitulo 8', 20, 16),
	(279, NULL, 1, 'Death Note | Capitulo 9', 20, 16),
	(280, NULL, 1, 'Death Note | Capitulo 10', 20, 16),
	(281, NULL, 1, 'Death Note | Capitulo 11', 20, 16),
	(282, NULL, 1, 'Death Note | Capitulo 12', 20, 16),
	(283, NULL, 1, 'Death Note | Capitulo 13', 20, 16),
	(284, NULL, 1, 'Death Note | Capitulo 14', 20, 16),
	(285, NULL, 1, 'Death Note | Capitulo 15', 20, 16),
	(286, NULL, 1, 'Tokyo Ghoul | Capitulo 1', 25, 17),
	(287, NULL, 1, 'Tokyo Ghoul | Capitulo 2', 25, 17),
	(288, NULL, 1, 'Tokyo Ghoul | Capitulo 3', 25, 17),
	(289, NULL, 1, 'Tokyo Ghoul | Capitulo 4', 25, 17),
	(290, NULL, 1, 'Tokyo Ghoul | Capitulo 5', 25, 17),
	(291, NULL, 1, 'Tokyo Ghoul | Capitulo 6', 25, 17),
	(292, NULL, 1, 'Tokyo Ghoul | Capitulo 7', 25, 17),
	(293, NULL, 1, 'Tokyo Ghoul | Capitulo 8', 25, 17),
	(294, NULL, 1, 'Tokyo Ghoul | Capitulo 9', 25, 17),
	(295, NULL, 1, 'Tokyo Ghoul | Capitulo 10', 25, 17),
	(296, NULL, 2, 'Kakegurui | Capitulo 1', 20, 18),
	(297, NULL, 2, 'Kakegurui | Capitulo 2', 20, 18),
	(298, NULL, 2, 'Kakegurui | Capitulo 3', 20, 18),
	(299, NULL, 2, 'Kakegurui | Capitulo 4', 20, 18),
	(300, NULL, 2, 'Kakegurui | Capitulo 5', 20, 18),
	(301, NULL, 2, 'Kakegurui | Capitulo 6', 20, 18),
	(302, NULL, 2, 'Kakegurui | Capitulo 7', 20, 18),
	(303, NULL, 2, 'Kakegurui | Capitulo 8', 20, 18),
	(304, NULL, 2, 'Kakegurui | Capitulo 9', 20, 18),
	(305, NULL, 2, 'Kakegurui | Capitulo 10', 20, 18),
	(306, NULL, 2, 'Kakegurui | Capitulo 11', 20, 18),
	(307, NULL, 2, 'Kakegurui | Capitulo 12', 20, 18),
	(308, NULL, 1, 'Black Butler | Capitulo 1', 23, 19),
	(309, NULL, 1, 'Black Butler | Capitulo 2', 23, 19),
	(310, NULL, 1, 'Black Butler | Capitulo 3', 23, 19),
	(311, NULL, 1, 'Black Butler | Capitulo 4', 23, 19),
	(312, NULL, 1, 'Black Butler | Capitulo 5', 23, 19),
	(313, NULL, 1, 'Black Butler | Capitulo 6', 23, 19),
	(314, NULL, 1, 'Black Butler | Capitulo 7', 23, 19),
	(315, NULL, 1, 'Black Butler | Capitulo 8', 23, 19),
	(316, NULL, 1, 'Black Butler | Capitulo 9', 23, 19),
	(317, NULL, 1, 'Black Butler | Capitulo 10', 23, 19),
	(318, NULL, 1, 'Bungou Stray Dogs | Capitulo 1', 19, 20),
	(319, NULL, 1, 'Bungou Stray Dogs | Capitulo 2', 19, 20),
	(320, NULL, 1, 'Bungou Stray Dogs | Capitulo 3', 19, 20),
	(321, NULL, 1, 'Bungou Stray Dogs | Capitulo 4', 19, 20),
	(322, NULL, 1, 'Bungou Stray Dogs | Capitulo 5', 19, 20),
	(323, NULL, 1, 'Bungou Stray Dogs | Capitulo 6', 19, 20),
	(324, NULL, 1, 'Bungou Stray Dogs | Capitulo 7', 19, 20),
	(325, NULL, 1, 'Bungou Stray Dogs | Capitulo 8', 19, 20),
	(326, NULL, 1, 'Bungou Stray Dogs | Capitulo 9', 19, 20),
	(327, NULL, 1, 'Bungou Stray Dogs | Capitulo 10', 19, 20),
	(328, NULL, 2, 'Bungou Stray Dogs | Capitulo 1', 19, 20),
	(329, NULL, 2, 'Bungou Stray Dogs | Capitulo 2', 19, 20),
	(330, NULL, 2, 'Bungou Stray Dogs | Capitulo 3', 19, 20),
	(331, NULL, 2, 'Bungou Stray Dogs | Capitulo 4', 19, 20),
	(332, NULL, 2, 'Bungou Stray Dogs | Capitulo 5', 19, 20),
	(333, NULL, 2, 'Bungou Stray Dogs | Capitulo 6', 19, 20),
	(334, NULL, 2, 'Bungou Stray Dogs | Capitulo 7', 19, 20),
	(335, NULL, 2, 'Bungou Stray Dogs | Capitulo 8', 19, 20),
	(336, NULL, 2, 'Bungou Stray Dogs | Capitulo 9', 19, 20),
	(337, NULL, 2, 'Bungou Stray Dogs | Capitulo 10', 19, 20);
/*!40000 ALTER TABLE `episodios` ENABLE KEYS */;

-- Dumping structure for procedure nequeplay.listar_por_temporada
DELIMITER //
CREATE PROCEDURE `listar_por_temporada`(
	IN `s` INT,
	IN `t` INT
)
BEGIN
SELECT * FROM episodios WHERE idSerie = s AND temporada = t;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.obtener_categorias_series
DELIMITER //
CREATE PROCEDURE `obtener_categorias_series`(
	IN `i` INT
)
BEGIN
SELECT * FROM categorias INNER JOIN categorias_series ON categorias.id_categoria=categorias_series.id_categorias
WHERE categorias_series.id_series=i;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.obtener_coincidencia_categoria
DELIMITER //
CREATE PROCEDURE `obtener_coincidencia_categoria`(
	IN `i` INT
)
BEGIN
	SELECT * FROM categorias WHERE categorias.id_categoria=i;
END//
DELIMITER ;

-- Dumping structure for procedure nequeplay.obtener_por_id
DELIMITER //
CREATE PROCEDURE `obtener_por_id`(
	IN `i` INT
)
BEGIN
SELECT * FROM series INNER JOIN categorias_series ON series.id=categorias_series.id_series 
WHERE categorias_series.id_categorias=i;
END//
DELIMITER ;

-- Dumping structure for table nequeplay.series
CREATE TABLE IF NOT EXISTS `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` text DEFAULT NULL,
  `fondo` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.series: ~20 rows (approximately)
DELETE FROM `series`;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` (`id`, `nombre`, `descripcion`, `imagen`, `fondo`) VALUES
	(1, 'Shingeki no kyojin', 'La ciudad vive su vida tranquila, y hace más de 100 años que ningún gigante aparece por allí. Eren y su hermana adoptiva Mikasa son todavía unos adolescentes cuando ven algo horroroso. No pasa mucho tiempo hasta que los gigantes entran por el hueco abierto en el muro y comienzan a devorar a la gente.', 'https://monoschinos2.com/assets/img/serie/imagen/110531.jpg', 'https://monoschinos2.com/assets/img/serie/portada/5151.jpg'),
	(2, 'Kimetsu No Yaiba', 'Desde la muerte de su padre, Tanjirou se ha comprometido a mantener a su familia. Aunque sus vidas pueden ser endurecidas por la tragedia, han encontrado la felicidad. Para su sorpresa, sin embargo, Nezuko todavía muestra signos de emoción humana y pensamiento.', 'https://monoschinos2.com/assets/img/serie/imagen/kimetsu-no-yaiba.jpg', 'https://monoschinos2.com/assets/img/serie/portada/kimetsu-no-yaiba-movie-mugen-ressha-hen.jpg'),
	(3, 'JoJo No Kimyou Na Bouken', 'JoJo No Kimyou Na Bouken\', \'Joseph viaja a Japón en busca de la ayuda de su nieto Jotaro Kujo, dado que ambos han desarrollado un misterioso poder conocido como Stand en el momento en el que Dio vuelve a la vida, ahora usando el cuerpo de su ancestro Jonathan Joestar a su voluntad.', 'https://monoschinos2.com/assets/img/serie/imagen/jojo-no-kimyou-na-bouken-stardust-crusaders.jpg', 'https://monoschinos2.com/assets/img/serie/imagen/jojo-no-kimyou-na-bouken-part-3-stardust-crusaders-castellano.jpg'),
	(4, 'Naruto', 'Naruto, un aprendiz de ninja de la Aldea Oculta de Konoha es un chico travieso que desea llegar a ser el Hokage de la aldea para demostrar a todos lo que vale.', 'https://monoschinos2.com/assets/img/serie/imagen/naruto.jpg', 'https://monoschinos2.com/assets/img/serie/portada/naruto.jpg'),
	(5, 'Pokemon', 'La historia del anime esta centrada en un chico de 10 años llamado Ash Ketchum. En este pueblo también vive una autoridad del mundo Pokémon, el Profesor Oak, quien le entrega a todos los nuevos entrenadores su primer Pokémon y una herramienta llamada Pokedex.', 'https://monoschinos2.com/assets/img/serie/imagen/pokemon-advanced-generation-pokemon-generacion-avanzada-latino.jpg', 'https://monoschinos2.com/assets/img/serie/portada/pokemon-latino.jpg'),
	(6, 'Nanatsu No Taizai', 'La princesa decide escapar e ira en busca de los Pecados para que le ayuden a recuperar el reino, pero el primero de los guerreros que conoce, Meliodas, es un joven cuyas únicas preocupaciones consisten en atender su taberna junto a Hork, un cerdo que habla.', 'https://monoschinos2.com/assets/img/serie/imagen/nanatsu-no-taizai.jpg', 'https://monoschinos2.com/assets/img/serie/portada/nanatsu-no-taizai-ova.jpg'),
	(7, 'Yakusoku No Neverland', 'Grace Field es un hogar irreemplazable al que son enviados los niños que no tienen padres. allí viven felices su día a día, como si fueran hermanos. Al menos así era hasta que cierto descubrimiento cambió sus vidas por completo.', 'https://monoschinos2.com/assets/img/serie/imagen/yakusoku-no-neverland-2.jpg', 'https://monoschinos2.com/assets/img/serie/portada/yakusoku-no-neverland-2.jpg'),
	(8, 'Beastars', 'En un mundo poblado por animales antropomórficos, conviven herbívoros y carnívoros. Para los adolescentes de la Academia Cherryton, la vida escolar está llena de esperanza, romance, desconfianza e inquietud.', 'https://monoschinos2.com/assets/img/serie/imagen/beastars.png', 'https://monoschinos2.com/assets/img/serie/portada/beastars-2.jpg'),
	(9, 'Boku No Hero Academia', 'Las personas no nacen igual. El protagonista de esta historia es uno de esos casos raros que nacen sin superpoderes, pero esto no le impedirá perseguir su sueño: ser un gran héroe como el legendario All-Might', 'https://monoschinos2.com/assets/img/serie/imagen/boku-no-hero-academia.jpg', 'https://monoschinos2.com/assets/img/serie/portada/boku-no-hero-academia.jpg'),
	(10, 'Fumetsu No Anata e', '“Aquello”, una misteriosa forma de vida inmortal, es enviado a la Tierra sin emociones ni identidad. Sin embargo, “aquello” es capaz de tomar la forma de aquellos a su alrededor siempre y cuando hagan contacto por lo menos una vez.', 'https://monoschinos2.com/assets/img/serie/imagen/Fumetsu-no-Anata-e-Poster-2.jpg', 'https://monoschinos2.com/assets/img/serie/portada/Fumetsu-no-Anata-e-TV-Anime-Adaptation-Announced-for-October.jpg'),
	(11, 'Jujutsu Kaisen', 'En un mundo donde los demonios se alimentan de humanos desprevenidos, fragmentos del legendario y temido demonio Ryoumen Sukuna se perdieron y se dispersaron. Si algún demonio consume partes del cuerpo de Sukuna, el poder que obtienen podría destruir el mundo tal como lo conocemos.', 'https://monoschinos2.com/assets/img/serie/imagen/jujutsu-kaisen.jpg', 'https://monoschinos2.com/assets/img/serie/portada/jujutsu-kaisen.jpg'),
	(12, 'One Piece', 'Esta noticia desató la gran era de los piratas lanzando a incontables piratas a ese lugar, en busca del "One Piece" el tesoro perdido. Diez años después, Luffy inspirado en "Gol D. Roger" y un pirata de nombre Akagami no Shanks.', 'https://monoschinos2.com/assets/img/serie/imagen/juanitowano.jpg', 'https://monoschinos2.com/assets/img/serie/portada/juanitowanoportada.jpg'),
	(13, 'Re:Zero Kara Hajimeru', 'Subaru Natsuki es un estudiante de instituto normal y corriente que se pierde en un mundo alternativo hasta ser rescatado por una preciosa chica de pelo gris. Para devolverle el favor, él se queda a su lado, aunque no es consciente del destino de la chica.', 'https://monoschinos2.com/assets/img/serie/imagen/rezero-kara-hajimeru-isekai-seikatsu-2nd-season.png', 'https://monoschinos2.com/assets/img/serie/portada/rezero-kara-hajimeru-isekai-seikatsu-2nd-season.png'),
	(14, 'Tokyo Revengers', 'En la cúspide de la miseria de su vida, de repente vuelve en el tiempo doce años a sus días de secundaria. Para salvar a Hinata y cambiar el curso del tiempo, ¡el alguna vez inútil trabajador de medio tiempo Takemichi deberá buscar volverse el líder de la banda criminal más tenebrosa de Tokio!', 'https://monoschinos2.com/assets/img/serie/imagen/tokyo-revengers.webp', 'https://monoschinos2.com/assets/img/serie/portada/tokyo-revengers.jpg'),
	(15, 'Record Of Ragnarok', 'Se ambienta en un mundo donde los humanos deben vencer a los dioses todopoderosos en siete rondas. Si no lo consiguen, su existencia terminará para siempre. Esta es la premisa de las batallas de Ragnarok.', 'https://ramenparados.com/wp-content/uploads/2021/05/shuumatsu-no-valkyrie-new-poster.jpg', 'https://cloudfront-us-east-1.images.arcpublishing.com/elcomercio/YIVCS7Q5N5FA7KFJK5MIOZJIZQ.jpg'),
	(16, 'Death Note', 'Light Yagami es un excelente estudiante japonés que ha tenido una vida aburrida. Esto cambia radicalmente cuando encuentra tirado en el suelo un cuaderno conocido como Death Note, un cuaderno perdido por Ryuk, un Shinigami.', 'https://monoschinos2.com/assets/img/serie/imagen/death-note.jpg', 'https://monoschinos2.com/assets/img/serie/portada/death-note.jpg'),
	(17, 'Tokyo Ghoul', 'La ciudad de Tokyo vive atemorizada por los atroces de crímenes cometidos por los Ghouls, Kaneki Ken, un joven y tímido universitario sobrevive a una operación de trasplante de órganos tras ser atacado y casi devorado por uno de ellos.', 'https://monoschinos2.com/assets/img/serie/imagen/tokyo-ghoul.jpg', 'https://monoschinos2.com/assets/img/serie/portada/tokyo-ghoulre-2.jpg'),
	(18, 'Kakegurui', 'Por el día, es una escuela normal, que educa a sus alumnos. Pero por la noche, se convierte en una sala de juego, educándolos en el arte de tratar con el dinero y manipular a las personas. Dinero es poder; los que salen en la cima de los juegos están en la parte superior de la escuela.', 'https://monoschinos2.com/assets/img/serie/imagen/kakegurui.jpg', 'https://monoschinos2.com/assets/img/serie/portada/kakegurui.jpg'),
	(19, 'Black Butler', 'Apesar de su corta edad, Ciel Phantomhive cuenta con la confianza total de la Reina Victoria para hacerse cargo de ciertos "casos" de índole extraña. A su lado siempre está Sebastian, el perfecto mayordomo', 'https://monoschinos2.com/assets/img/serie/imagen/kuroshitsuji-book-of-murder.jpg', 'https://monoschinos2.com/assets/img/serie/portada/kuroshitsuji-book-of-murder.jpg'),
	(20, 'Bungou Stray Dogs', 'Atsushi Nakajima es un adolescente que fue expulsado de su orfanato y en consecuencia, se ve obligado a vivir en las calles. Mientras se encuentra de pie junto a un río en el borde de la hambruna, rescata a un hombre que intentaba suicidarse en el mismo.', 'https://monoschinos2.com/assets/img/serie/imagen/bungou-stray-dogs.jpg', 'https://monoschinos2.com/assets/img/serie/portada/bungou-stray-dogs-latino.png');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;

-- Dumping structure for table nequeplay.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `admin` char(50) DEFAULT 'n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table nequeplay.usuarios: ~4 rows (approximately)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `contrasena`, `correo`, `admin`) VALUES
	(2, '12345678', 'huachimingo@aaaa.com', 'n'),
	(5, '12', 'q@q.com', 'n'),
	(6, '123', 'mama@kma.com', 'n'),
	(7, '123', 'qq@q.q', 's');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: tripgripschema
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anuncio`
--

DROP TABLE IF EXISTS `anuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anuncio` (
  `idanuncio` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `idTipoAlojamiento` int(11) NOT NULL,
  `idTipoCobro` int(11) NOT NULL,
  `idTipoHabitacion` int(11) NOT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `idIdioma` int(11) NOT NULL DEFAULT '1',
  `idCiudad` int(11) NOT NULL,
  `idUsuarioResponsable` int(11) NOT NULL,
  `precioXPersona` DECIMAL(20,4) NOT NULL,
  `precioXNoche` DECIMAL(20,4) NOT NULL,
  PRIMARY KEY (`idanuncio`),
  KEY `idFkTipoAlojamiento_idx` (`idTipoAlojamiento`),
  KEY `idTipoHabitacionAnuncio_idx` (`idTipoHabitacion`),
  KEY `idTipoCostoAnuncio_idx` (`idTipoCobro`),
  KEY `idIdiomaAnuncio_idx` (`idIdioma`),
  KEY `fk_idUsuario` (`idUsuarioResponsable`),
  KEY `fk_idCiudadAnuncio` (`idCiudad`),
  CONSTRAINT `fk_idCiudadAnuncio` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idIdiomaAnuncio` FOREIGN KEY (`idIdioma`) REFERENCES `idioma` (`ididioma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoAlojamientoAnuncio` FOREIGN KEY (`idTipoAlojamiento`) REFERENCES `tipoalojamiento` (`idtipoAlojamiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoCobroAnuncio` FOREIGN KEY (`idTipoCobro`) REFERENCES `tipocobro` (`idtipocobro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoHabitacionAnuncio` FOREIGN KEY (`idTipoHabitacion`) REFERENCES `tipohabitacion` (`idtipohabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario` FOREIGN KEY (`idUsuarioResponsable`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncio`
--

LOCK TABLES `anuncio` WRITE;
/*!40000 ALTER TABLE `anuncio` DISABLE KEYS */;
INSERT INTO `anuncio` VALUES (1,'viva comodo en chepe',10,100000,2,2,2,'pathd','',3,2,4),(2,'alquilo en cartago',2,13100,1,1,2,'pathd','',2,1,1);
/*!40000 ALTER TABLE `anuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Cartago'),(2,'San Jose');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversacion`
--

DROP TABLE IF EXISTS `conversacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversacion` (
  `idconversacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `anuncio_idanuncio` int(11) NOT NULL,
  PRIMARY KEY (`idconversacion`),
  KEY `fk_conversacion_anuncio1_idx` (`anuncio_idanuncio`),
  CONSTRAINT `fk_conversacion_anuncio1` FOREIGN KEY (`anuncio_idanuncio`) REFERENCES `anuncio` (`idanuncio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversacion`
--

LOCK TABLES `conversacion` WRITE;
/*!40000 ALTER TABLE `conversacion` DISABLE KEYS */;
INSERT INTO `conversacion` VALUES (1,'Consulta de Clima',2),(2,'Consulta de Clima',2),(3,'RE:Consulta de Clima',2),(4,'Precio',1);
/*!40000 ALTER TABLE `conversacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentafacebook`
--

DROP TABLE IF EXISTS `cuentafacebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentafacebook` (
  `idcuentaFacebook` int(11) NOT NULL AUTO_INCREMENT,
  `correoElectronico` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idcuentaFacebook`),
  UNIQUE KEY `idcuentaFacebook_UNIQUE` (`idcuentaFacebook`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentafacebook`
--

LOCK TABLES `cuentafacebook` WRITE;
/*!40000 ALTER TABLE `cuentafacebook` DISABLE KEYS */;
INSERT INTO `cuentafacebook` VALUES (3,'mario',''),(4,'elgaritas@gmail.com',''),(5,'pruebaquery@gmail.com',''),(11,'dittelriveram@gmail.com','');
/*!40000 ALTER TABLE `cuentafacebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `ididioma` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`ididioma`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Ingles'),(2,'Espanol'),(3,'Japones');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `idmensaje` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `texto` varchar(45) DEFAULT NULL,
  `idusuarioEnvia` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `conversacion_idconversacion` int(11) NOT NULL,
  `idusuarioRecibe` int(11) NOT NULL,
  PRIMARY KEY (`idmensaje`),
  KEY `fk_mensaje_conversacion1_idx` (`conversacion_idconversacion`),
  KEY `fk_usuario_idusuario` (`idusuarioEnvia`),
  KEY `fk_usuario_idusuario_recibe` (`idusuarioRecibe`),
  CONSTRAINT `fk_mensaje_conversacion1` FOREIGN KEY (`conversacion_idconversacion`) REFERENCES `conversacion` (`idconversacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_idusuario` FOREIGN KEY (`idusuarioEnvia`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_idusuario_recibe` FOREIGN KEY (`idusuarioRecibe`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (1,'2015-09-10 00:00:00','Que tan frio es el lugar?',3,'',1,4),(2,'2015-09-10 00:00:00','A cuantos grados especificamente?',3,'',2,4),(3,'2015-09-10 00:00:00','A 13 grados en invierno',4,'',3,3),(4,'2015-09-10 00:00:00','Porque tan caro?',1,'',4,4);
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `idpregunta` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(50) DEFAULT NULL,
  `FidUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idpregunta`),
  KEY `FidUsuario_idx` (`FidUsuario`),
  CONSTRAINT `FidUsuario` FOREIGN KEY (`FidUsuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
--	Table structure for table `respuesta`
--

CREATE TABLE IF NOT EXISTS `respuesta` (
  `idrespuesta` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idrespuesta`),
  UNIQUE INDEX `idrespuesta_UNIQUE` (`idrespuesta` ASC),
  CONSTRAINT `idPregunta`
    FOREIGN KEY (`idrespuesta`)
    REFERENCES `pregunta` (`idpregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



--
-- Table structure for table `tipoalojamiento`
--

DROP TABLE IF EXISTS `tipoalojamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoalojamiento` (
  `idtipoAlojamiento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoAlojamiento` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idtipoAlojamiento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoalojamiento`
--

LOCK TABLES `tipoalojamiento` WRITE;
/*!40000 ALTER TABLE `tipoalojamiento` DISABLE KEYS */;
INSERT INTO `tipoalojamiento` VALUES (1,'Casa',''),(2,'departamento','');
/*!40000 ALTER TABLE `tipoalojamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocobro`
--

DROP TABLE IF EXISTS `tipocobro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocobro` (
  `idtipocobro` int(11) NOT NULL AUTO_INCREMENT,
  `tipocobro` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idtipocobro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocobro`
--

LOCK TABLES `tipocobro` WRITE;
/*!40000 ALTER TABLE `tipocobro` DISABLE KEYS */;
INSERT INTO `tipocobro` VALUES (1,'Efectivo',''),(2,'deposito bancario a la cuenta 1-800-123','');
/*!40000 ALTER TABLE `tipocobro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipohabitacion`
--

DROP TABLE IF EXISTS `tipohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipohabitacion` (
  `idtipohabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `tipohabitacion` varchar(45) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idtipohabitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipohabitacion`
--

LOCK TABLES `tipohabitacion` WRITE;
/*!40000 ALTER TABLE `tipohabitacion` DISABLE KEYS */;
INSERT INTO `tipohabitacion` VALUES (1,'Habitacion Compartida',''),(2,'Habitacion Privada','');
/*!40000 ALTER TABLE `tipohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacion` (
  `idubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `ejeX` decimal(15,5) NOT NULL,
  `ejeY` decimal(15,5) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES (1,20.00000,30.00000,''),(2,55.00000,50.00000,'');
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacionxanuncio`
--

DROP TABLE IF EXISTS `ubicacionxanuncio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ubicacionxanuncio` (
  `idubicacionXAnuncio` int(11) NOT NULL AUTO_INCREMENT,
  `idUbicacion` int(11) NOT NULL,
  `idAnuncio` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`idubicacionXAnuncio`),
  KEY `idAnuncioAXU_idx` (`idAnuncio`),
  KEY `idUbicacion_idx` (`idUbicacion`),
  CONSTRAINT `idAnuncioAXU` FOREIGN KEY (`idAnuncio`) REFERENCES `anuncio` (`idanuncio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idUbicacion` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicacion` (`idubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacionxanuncio`
--

LOCK TABLES `ubicacionxanuncio` WRITE;
/*!40000 ALTER TABLE `ubicacionxanuncio` DISABLE KEYS */;
INSERT INTO `ubicacionxanuncio` VALUES (1,1,1,''),(2,2,2,'');
/*!40000 ALTER TABLE `ubicacionxanuncio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` varchar(45) NOT NULL,
  `apellidoUno` varchar(45) NOT NULL,
  `apellidoDos` varchar(45) DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  `cuentafacebook_idcuentaFacebook` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `cuentafacebook_idcuentaFacebook_UNIQUE` (`cuentafacebook_idcuentaFacebook`),
  KEY `fk_usuario_cuentafacebook1_idx` (`cuentafacebook_idcuentaFacebook`),
  CONSTRAINT `fk_usuario_cuentafacebook1` FOREIGN KEY (`cuentafacebook_idcuentaFacebook`) REFERENCES `cuentafacebook` (`idcuentaFacebook`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Mario','Quiros','Gutierrez','',3),(3,'Jose','garita','garita','',4),(4,'kevin','jimenez','mendez','',5);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-25 16:20:43

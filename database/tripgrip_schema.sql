-- MySQL Script generated by MySQL Workbench
-- 10/27/15 17:14:06
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema tripgripschema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tripgripschema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tripgripschema` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema tripgripfinal
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `tripgripschema`.`cuentafacebook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`cuentafacebook` (
  `idcuentaFacebook` INT(11) NOT NULL AUTO_INCREMENT,
  `correoElectronico` VARCHAR(45) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idcuentaFacebook`),
  UNIQUE INDEX `idcuentaFacebook_UNIQUE` (`idcuentaFacebook` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`usuario` (
  `idusuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCompleto` VARCHAR(45) NOT NULL,
  `apellidoUno` VARCHAR(45) NOT NULL,
  `apellidoDos` VARCHAR(45) NULL,
  `estado` BIT(1) NOT NULL,
  `cuentafacebook_idcuentaFacebook` INT(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC),
  INDEX `fk_usuario_cuentafacebook1_idx` (`cuentafacebook_idcuentaFacebook` ASC),
  UNIQUE INDEX `cuentafacebook_idcuentaFacebook_UNIQUE` (`cuentafacebook_idcuentaFacebook` ASC),
  CONSTRAINT `fk_usuario_cuentafacebook1`
    FOREIGN KEY (`cuentafacebook_idcuentaFacebook`)
    REFERENCES `tripgripschema`.`cuentafacebook` (`idcuentaFacebook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`pregunta` (
  `idpregunta` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(50) NULL,
  `FidUsuario` INT NOT NULL,
  PRIMARY KEY (`idpregunta`),
  INDEX `FidUsuario_idx` (`FidUsuario` ASC),
  CONSTRAINT `FidUsuario`
    FOREIGN KEY (`FidUsuario`)
    REFERENCES `tripgripschema`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`respuesta` (
  `idrespuesta` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`idrespuesta`),
  UNIQUE INDEX `idrespuesta_UNIQUE` (`idrespuesta` ASC),
  CONSTRAINT `idPregunta`
    FOREIGN KEY ()
    REFERENCES `tripgripschema`.`pregunta` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tripgripschema` ;

-- -----------------------------------------------------
-- Table `tripgripschema`.`tipoalojamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`tipoalojamiento` (
  `idtipoAlojamiento` INT(11) NOT NULL AUTO_INCREMENT,
  `tipoAlojamiento` VARCHAR(45) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idtipoAlojamiento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`tipocobro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`tipocobro` (
  `idtipocobro` INT(11) NOT NULL AUTO_INCREMENT,
  `tipocobro` VARCHAR(45) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idtipocobro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`tipohabitacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`tipohabitacion` (
  `idtipohabitacion` INT(11) NOT NULL AUTO_INCREMENT,
  `tipohabitacion` VARCHAR(45) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idtipohabitacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`idioma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`idioma` (
  `ididioma` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ididioma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripgripschema`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`ciudad` (
  `idciudad` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idciudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tripgripschema`.`anuncio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`anuncio` (
  `idanuncio` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `capacidad` INT(11) NOT NULL,
  `precio` INT(11) NOT NULL,
  `idTipoAlojamiento` INT(11) NOT NULL,
  `idTipoCobro` INT(11) NOT NULL,
  `idTipoHabitacion` INT(11) NOT NULL,
  `imagen` VARCHAR(45) NULL,
  `estado` BIT(1) NOT NULL,
  `idIdioma` INT(11) NOT NULL DEFAULT 1,
  `idCiudad` INT(11) NOT NULL,
  `idUsuarioResponsable` INT(11) NOT NULL,
  `precioXPersona` DECIMAL(20,4) NOT NULL,
  `precioXNoche` DECIMAL(20,4) NOT NULL,
  PRIMARY KEY (`idanuncio`),
  INDEX `idFkTipoAlojamiento_idx` (`idTipoAlojamiento` ASC),
  INDEX `idTipoHabitacionAnuncio_idx` (`idTipoHabitacion` ASC),
  INDEX `idTipoCostoAnuncio_idx` (`idTipoCobro` ASC),
  INDEX `idIdiomaAnuncio_idx` (`idIdioma` ASC),
  CONSTRAINT `fk_idTipoAlojamientoAnuncio`
    FOREIGN KEY (`idTipoAlojamiento`)
    REFERENCES `tripgripschema`.`tipoalojamiento` (`idtipoAlojamiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoCobroAnuncio`
    FOREIGN KEY (`idTipoCobro`)
    REFERENCES `tripgripschema`.`tipocobro` (`idtipocobro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idTipoHabitacionAnuncio`
    FOREIGN KEY (`idTipoHabitacion`)
    REFERENCES `tripgripschema`.`tipohabitacion` (`idtipohabitacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario`
    FOREIGN KEY (`idUsuarioResponsable`)
    REFERENCES `tripgripschema`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idIdiomaAnuncio`
    FOREIGN KEY (`idIdioma`)
    REFERENCES `tripgripschema`.`idioma` (`ididioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCiudadAnuncio`
    FOREIGN KEY (`idCiudad`)
    REFERENCES `tripgripschema`.`ciudad` (`idciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`conversacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`conversacion` (
  `idconversacion` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `anuncio_idanuncio` INT(11) NOT NULL,
  PRIMARY KEY (`idconversacion`),
  INDEX `fk_conversacion_anuncio1_idx` (`anuncio_idanuncio` ASC),
  CONSTRAINT `fk_conversacion_anuncio1`
    FOREIGN KEY (`anuncio_idanuncio`)
    REFERENCES `tripgripschema`.`anuncio` (`idanuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`mensaje` (
  `idmensaje` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  `texto` VARCHAR(45) NULL,
  `idusuarioEnvia` INT(11) NOT NULL,
  `estado` BIT(1) NOT NULL,
  `conversacion_idconversacion` INT(11) NOT NULL,
  `idusuarioRecibe` INT(11) NOT NULL,
  PRIMARY KEY (`idmensaje`),
  INDEX `fk_mensaje_conversacion1_idx` (`conversacion_idconversacion` ASC),
  CONSTRAINT `fk_mensaje_conversacion1`
    FOREIGN KEY (`conversacion_idconversacion`)
    REFERENCES `tripgripschema`.`conversacion` (`idconversacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_idusuario`
    FOREIGN KEY (`idusuarioEnvia`)
    REFERENCES `tripgripschema`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_idusuario_recibe`
    FOREIGN KEY (`idusuarioRecibe`)
    REFERENCES `tripgripschema`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`ubicacion` (
  `idubicacion` INT(11) NOT NULL AUTO_INCREMENT,
  `ejeX` DECIMAL(15,5) NOT NULL,
  `ejeY` DECIMAL(15,5) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idubicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tripgripschema`.`ubicacionxanuncio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tripgripschema`.`ubicacionxanuncio` (
  `idubicacionXAnuncio` INT(11) NOT NULL AUTO_INCREMENT,
  `idUbicacion` INT(11) NOT NULL,
  `idAnuncio` INT(11) NOT NULL,
  `estado` BIT(1) NOT NULL,
  PRIMARY KEY (`idubicacionXAnuncio`),
  INDEX `idAnuncioAXU_idx` (`idAnuncio` ASC),
  INDEX `idUbicacion_idx` (`idUbicacion` ASC),
  CONSTRAINT `idAnuncioAXU`
    FOREIGN KEY (`idAnuncio`)
    REFERENCES `tripgripschema`.`anuncio` (`idanuncio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idUbicacion`
    FOREIGN KEY (`idUbicacion`)
    REFERENCES `tripgripschema`.`ubicacion` (`idubicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `tripgripschema` ;

-- -----------------------------------------------------
-- procedure insertarCuentaFace
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarCuentaFace (IN pCorreo VARCHAR(45))
BEGIN
	INSERT INTO cuentafacebook(correoElectronico,estado) VALUES(pCorreo,1);
    
END	

$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarUsuario (IN pNombre VARCHAR(45), IN pApellido VARCHAR(45), IN pApellidoD VARCHAR(45), IN pCuentaFB INT(11))
BEGIN
	INSERT INTO usuario (nombreCompleto,apellidoUno,apellidoDos,estado,cuentafacebook_idcuentaFacebook) VALUES (pNombre,pApellido,pApellidoD,1,pCuentaFB);
	

END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarIdioma
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarIdioma (IN pDescripcion VARCHAR(45))
BEGIN
	INSERT INTO idioma(descripcion) VALUES(pDescripcion);
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarAlojamiento
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarAlojamiento (IN ptipoAlojamiento VARCHAR(45))
BEGIN
	INSERT INTO tipoalojamiento(tipoAlojamiento,estado) VALUES(ptipoAlojamiento,1);
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarTipocobro
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarTipocobro (IN pTipocobro VARCHAR(45))
BEGIN
	INSERT INTO tipocobro(tipocobro,estado) VALUES(pTipocobro,1);
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarCiudad
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarCiudad (IN pCiudad VARCHAR(45))
BEGIN
	INSERT INTO ciudad(nombre) VALUES(pCiudad);
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarTipohabitacion
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE insertarTipohabitacion (IN pTipohabitacion VARCHAR(45))
BEGIN
	INSERT INTO tipohabitacion(tipohabitacion,estado) VALUES(pTipohabitacion,1);
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarAnuncio
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE agregarAnuncio(IN pTitulo VARCHAR(45),IN pCapacidad INT(11),IN pPrecio INT(11),IN  pIdtipoalojamiento INT(11),IN pTipocobro INT(11),IN pTipohabitacion INT(11),IN pImagen VARCHAR(45),IN  pIdioma INT(11),IN pCiudad INT(11),IN pUsuario INT(11),IN pEjex DECIMAL(15,5),IN pEjey DECIMAL(15,5))
BEGIN
	DECLARE anunciox INT(11);
    DECLARE ubicacionx INT(11);
    
    INSERT INTO anuncio(titulo,capacidad,precio,idTipoAlojamiento,idTipoCobro,idTipoHabitacion,imagen,estado,idIdioma,idCiudad,idUsuarioResponsable) VALUES (pTitulo,pCapacidad,pPrecio,pIdtipoalojamiento,pTipocobro,pTipohabitacion,pImagen,1,pIdioma,pCiudad,pUsuario);
    SELECT MAX(idanuncio) INTO anunciox FROM anuncio;
    INSERT INTO ubicacion(ejex,ejey,estado) VALUES(pEjex,pEjey,1);
    SELECT MAX(idubicacion) INTO ubicacionx FROM ubicacion;
    
    INSERT INTO ubicacionxanuncio(idUbicacion,idAnuncio,estado) VALUES(ubicacionx,anunciox,1);
    
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure enviarMensaje
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE enviarMensaje (IN pidAnuncio INT(11),IN ptitulo VARCHAR(45),IN pTexto VARCHAR(45),IN pEnvia INT(11),IN pRecibe INT(11))
BEGIN
	DECLARE idconver INT(11);
    DECLARE pfecha DATETIME;
    SELECT CURDATE() INTO pfecha;
	INSERT INTO conversacion(titulo,anuncio_idanuncio)	VALUES(ptitulo,pidAnuncio);
    SELECT MAX(idconversacion) INTO idconver FROM conversacion;
    INSERT INTO mensaje(fecha,texto,idusuarioEnvia,estado,conversacion_idconversacion,idusuarioRecibe) VALUES(pfecha,pTexto,pEnvia,1,idconver,pRecibe);
    
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure recuperaFace
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE recuperaFace (IN pidFB INT(11))
BEGIN
	SELECT * FROM cuentafacebook c WHERE c.idcuentaFacebook = pidFB;
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure recuperaUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE recuperaUsuario (IN pidFB INT(11))
BEGIN
	SELECT * FROM usuario u WHERE u.cuentafacebook_idcuentaFacebook = pidFB;
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure recuperaAnuncios
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE recuperaAnuncios ()
BEGIN
	SELECT a.idanuncio,a.titulo,a.capacidad,a.precio,al.tipoAlojamiento,co.tipocobro,ha.tipohabitacion,a.imagen,a.estado,i.descripcion,ci.nombre,us.nombreCompleto,ub.ejeX,ub.ejeY
    FROM anuncio a,tipoalojamiento al,tipocobro co,tipohabitacion ha,idioma i,ciudad ci,usuario us,ubicacion ub,ubicacionxanuncio uban
    WHERE a.idTipoAlojamiento = al.idtipoAlojamiento 
    AND a.idTipoCobro=co.idtipocobro
    AND a.idTipoHabitacion=ha.idtipohabitacion
    AND a.idIdioma=i.ididioma
    AND a.idCiudad=ci.idciudad
    AND a.idUsuarioResponsable=us.idusuario
    AND uban.idAnuncio = a.idanuncio
    AND uban.idUbicacion = ub.idubicacion;
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure recuperaMensajesU
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE recuperaMensajesU (IN pId INT(11))
BEGIN
	SELECT * FROM mensaje m WHERE m.idusuarioEnvia=pId OR m.idusuarioRecibe=pId;
END
$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure recuperaMensajesA
-- -----------------------------------------------------

DELIMITER $$
USE `tripgripschema`$$
CREATE PROCEDURE recuperaMensajesA (IN pId INT(11))
BEGIN
	SELECT c.titulo,m.idmensaje,m.fecha,m.texto,us.nombreCompleto,m.estado FROM mensaje m,conversacion c,anuncio a,usuario us
    WHERE a.idanuncio = pId 
    AND c.anuncio_idanuncio = a.idanuncio
    AND c.idconversacion = m.conversacion_idconversacion
    AND m.idusuarioEnvia = us.idusuario;

END
$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

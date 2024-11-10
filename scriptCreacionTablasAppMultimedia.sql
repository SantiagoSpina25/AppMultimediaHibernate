-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aplicacionMultimedia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aplicacionMultimedia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aplicacionMultimedia` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema aplicacionmultimedia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aplicacionmultimedia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aplicacionmultimedia` DEFAULT CHARACTER SET utf8mb3 ;
USE `aplicacionMultimedia` ;

-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `tipo_suscripcion` ENUM('basica', 'premium') NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Pelicula` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT(4) NULL,
  `duracion` INT NOT NULL,
  `url_imagen` VARCHAR(300) NULL,
  PRIMARY KEY (`idPelicula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Serie` (
  `idSerie` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT(4) NULL,
  `num_temporadas` INT NOT NULL,
  `imagen_url` VARCHAR(100) NULL,
  PRIMARY KEY (`idSerie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Temporada` (
  `idTemporada` INT NOT NULL AUTO_INCREMENT,
  `numero_temporada` INT NOT NULL,
  `numero_episodios` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL,
  `IdSerie` INT NOT NULL,
  PRIMARY KEY (`idTemporada`),
  INDEX `fk_Temporada_Serie1_idx` (`IdSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Temporada_Serie1`
    FOREIGN KEY (`IdSerie`)
    REFERENCES `aplicacionMultimedia`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Episodio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Episodio` (
  `idEpisodio` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `duracion` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL,
  `idTemporada` INT NOT NULL,
  PRIMARY KEY (`idEpisodio`),
  INDEX `fk_Episodio_Temporada1_idx` (`idTemporada` ASC) VISIBLE,
  CONSTRAINT `fk_Episodio_Temporada1`
    FOREIGN KEY (`idTemporada`)
    REFERENCES `aplicacionMultimedia`.`Temporada` (`idTemporada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Genero` (
  `idGenero` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Lista_de_vistos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Lista_de_vistos` (
  `idCalificacion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `tipo_contenido` ENUM('pelicula', 'serie') NOT NULL,
  `fecha_agregado` DATE NOT NULL,
  `estado` ENUM('por ver', 'en progreso', 'visto') NOT NULL,
  `idUsuario` INT NOT NULL,
  `idPelicula` INT,
  `idSerie` INT,
  PRIMARY KEY (`idCalificacion`),
  INDEX `fk_Lista_de_vistos_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Lista_de_vistos_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  INDEX `fk_Lista_de_vistos_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_de_vistos_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `aplicacionMultimedia`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_de_vistos_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionMultimedia`.`Pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lista_de_vistos_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionMultimedia`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Actor` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `nacionalidad` VARCHAR(100) NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Pelicula_Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Pelicula_Genero` (
  `idPelicula` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idGenero`),
  INDEX `fk_Pelicula_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Genero_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Genero_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionMultimedia`.`Pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pelicula_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `aplicacionMultimedia`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Serie_Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Serie_Genero` (
  `idSerie` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idGenero`),
  INDEX `fk_Serie_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Serie_has_Genero_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Genero_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionMultimedia`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serie_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `aplicacionMultimedia`.`Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Serie_Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Serie_Actor` (
  `idSerie` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idActor`),
  INDEX `fk_Serie_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Serie_has_Actor_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Actor_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionMultimedia`.`Serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Serie_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `aplicacionMultimedia`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplicacionMultimedia`.`Pelicula_Actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionMultimedia`.`Pelicula_Actor` (
  `idPelicula` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idActor`),
  INDEX `fk_Pelicula_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Actor_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Actor_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionMultimedia`.`Pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pelicula_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `aplicacionMultimedia`.`Actor` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `aplicacionmultimedia` ;

-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`actor` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`serie` (
  `idSerie` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT NULL DEFAULT NULL,
  `num_temporadas` INT NOT NULL,
  `imagen_url` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idSerie`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`temporada` (
  `idTemporada` INT NOT NULL AUTO_INCREMENT,
  `numero_temporada` INT NOT NULL,
  `numero_episodios` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL DEFAULT NULL,
  `IdSerie` INT NOT NULL,
  PRIMARY KEY (`idTemporada`),
  INDEX `fk_Temporada_Serie1_idx` (`IdSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Temporada_Serie1`
    FOREIGN KEY (`IdSerie`)
    REFERENCES `aplicacionmultimedia`.`serie` (`idSerie`))
ENGINE = InnoDB
AUTO_INCREMENT = 117
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`episodio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`episodio` (
  `idEpisodio` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `duracion` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL DEFAULT NULL,
  `idTemporada` INT NOT NULL,
  PRIMARY KEY (`idEpisodio`),
  INDEX `fk_Episodio_Temporada1_idx` (`idTemporada` ASC) VISIBLE,
  CONSTRAINT `fk_Episodio_Temporada1`
    FOREIGN KEY (`idTemporada`)
    REFERENCES `aplicacionmultimedia`.`temporada` (`idTemporada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`genero` (
  `idGenero` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`pelicula` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT NULL DEFAULT NULL,
  `duracion` INT NOT NULL,
  `url_imagen` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`idPelicula`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `tipo_suscripcion` ENUM('basica', 'premium') NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`lista_de_vistos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`lista_de_vistos` (
  `idCalificacion` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `tipo_contenido` ENUM('pelicula', 'serie') NOT NULL,
  `fecha_agregado` DATE NOT NULL,
  `estado` ENUM('por ver', 'en progreso', 'visto') NOT NULL,
  `idUsuario` INT NOT NULL,
  `idPelicula` INT NULL DEFAULT NULL,
  `idSerie` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idCalificacion`),
  INDEX `fk_Lista_de_vistos_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  INDEX `fk_Lista_de_vistos_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  INDEX `fk_Lista_de_vistos_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_de_vistos_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionmultimedia`.`pelicula` (`idPelicula`),
  CONSTRAINT `fk_Lista_de_vistos_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionmultimedia`.`serie` (`idSerie`),
  CONSTRAINT `fk_Lista_de_vistos_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `aplicacionmultimedia`.`usuario` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`pelicula_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`pelicula_actor` (
  `idPelicula` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idActor`),
  INDEX `fk_Pelicula_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Actor_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `aplicacionmultimedia`.`actor` (`idActor`),
  CONSTRAINT `fk_Pelicula_has_Actor_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionmultimedia`.`pelicula` (`idPelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`pelicula_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`pelicula_genero` (
  `idPelicula` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idGenero`),
  INDEX `fk_Pelicula_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Genero_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `aplicacionmultimedia`.`genero` (`idGenero`),
  CONSTRAINT `fk_Pelicula_has_Genero_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `aplicacionmultimedia`.`pelicula` (`idPelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`serie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`serie_actor` (
  `idSerie` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idActor`),
  INDEX `fk_Serie_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Serie_has_Actor_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `aplicacionmultimedia`.`actor` (`idActor`),
  CONSTRAINT `fk_Serie_has_Actor_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionmultimedia`.`serie` (`idSerie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `aplicacionmultimedia`.`serie_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicacionmultimedia`.`serie_genero` (
  `idSerie` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idGenero`),
  INDEX `fk_Serie_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Serie_has_Genero_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `aplicacionmultimedia`.`genero` (`idGenero`),
  CONSTRAINT `fk_Serie_has_Genero_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `aplicacionmultimedia`.`serie` (`idSerie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

ALTER TABLE `aplicacionmultimedia`.`lista_de_vistos` 
CHANGE COLUMN `idCalificacion` `idLista` INT NOT NULL AUTO_INCREMENT ;

/*
CREATE TABLE registro_usuarios_creados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_cambio DATETIME NOT NULL
);
*/
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

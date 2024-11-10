-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AppMultimediaHibernate_v3
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema AppMultimediaHibernate_v3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AppMultimediaHibernate_v3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AppMultimediaHibernate_v3` DEFAULT CHARACTER SET utf8mb3 ;
USE `AppMultimediaHibernate_v3` ;

-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`actor` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`serie` (
  `idSerie` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT NULL DEFAULT NULL,
  `num_temporadas` INT NOT NULL,
  `imagen_url` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idSerie`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`temporada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`temporada` (
  `idTemporada` INT NOT NULL AUTO_INCREMENT,
  `numero_temporada` INT NOT NULL,
  `numero_episodios` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL DEFAULT NULL,
  `idSerie` INT NOT NULL,
  PRIMARY KEY (`idTemporada`),
  INDEX `fk_Temporada_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Temporada_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `AppMultimediaHibernate_v3`.`serie` (`idSerie`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`episodio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`episodio` (
  `idEpisodio` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `duracion` INT NOT NULL,
  `fecha_lanzamiento` DATE NULL DEFAULT NULL,
  `idTemporada` INT NOT NULL,
  PRIMARY KEY (`idEpisodio`),
  INDEX `fk_Episodio_Temporada1_idx` (`idTemporada` ASC) VISIBLE,
  CONSTRAINT `fk_Episodio_Temporada1`
    FOREIGN KEY (`idTemporada`)
    REFERENCES `AppMultimediaHibernate_v3`.`temporada` (`idTemporada`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`genero` (
  `idGenero` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idGenero`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contrasena` VARCHAR(100) NOT NULL,
  `tipo_suscripcion` ENUM('basica', 'premium') NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`lista_de_vistos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`lista_de_vistos` (
  `idLista` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `tipo_contenido` ENUM('pelicula', 'serie') NOT NULL,
  `fecha_agregado` DATE NOT NULL,
  `estado` ENUM('por ver', 'en progreso', 'visto') NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idLista`),
  INDEX `fk_Lista_de_vistos_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_de_vistos_Usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `AppMultimediaHibernate_v3`.`usuario` (`idUsuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`pelicula` (
  `idPelicula` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `anio_lanzamiento` INT NULL DEFAULT NULL,
  `duracion` INT NOT NULL,
  `url_imagen` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`idPelicula`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`pelicula_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`pelicula_actor` (
  `idPelicula` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idActor`),
  INDEX `fk_Pelicula_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Actor_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `AppMultimediaHibernate_v3`.`actor` (`idActor`),
  CONSTRAINT `fk_Pelicula_has_Actor_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `AppMultimediaHibernate_v3`.`pelicula` (`idPelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`pelicula_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`pelicula_genero` (
  `idPelicula` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idPelicula`, `idGenero`),
  INDEX `fk_Pelicula_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Pelicula_has_Genero_Pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  CONSTRAINT `fk_Pelicula_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `AppMultimediaHibernate_v3`.`genero` (`idGenero`),
  CONSTRAINT `fk_Pelicula_has_Genero_Pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `AppMultimediaHibernate_v3`.`pelicula` (`idPelicula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`registro_usuarios_creados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`registro_usuarios_creados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`serie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`serie_actor` (
  `idSerie` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idActor`),
  INDEX `fk_Serie_has_Actor_Actor1_idx` (`idActor` ASC) VISIBLE,
  INDEX `fk_Serie_has_Actor_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Actor_Actor1`
    FOREIGN KEY (`idActor`)
    REFERENCES `AppMultimediaHibernate_v3`.`actor` (`idActor`),
  CONSTRAINT `fk_Serie_has_Actor_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `AppMultimediaHibernate_v3`.`serie` (`idSerie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`serie_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`serie_genero` (
  `idSerie` INT NOT NULL,
  `idGenero` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idGenero`),
  INDEX `fk_Serie_has_Genero_Genero1_idx` (`idGenero` ASC) VISIBLE,
  INDEX `fk_Serie_has_Genero_Serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_Serie_has_Genero_Genero1`
    FOREIGN KEY (`idGenero`)
    REFERENCES `AppMultimediaHibernate_v3`.`genero` (`idGenero`),
  CONSTRAINT `fk_Serie_has_Genero_Serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `AppMultimediaHibernate_v3`.`serie` (`idSerie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`lista_serie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`lista_serie` (
  `idSerie` INT NOT NULL,
  `idLista` INT NOT NULL,
  PRIMARY KEY (`idSerie`, `idLista`),
  INDEX `fk_serie_has_lista_de_vistos_lista_de_vistos1_idx` (`idLista` ASC) VISIBLE,
  INDEX `fk_serie_has_lista_de_vistos_serie1_idx` (`idSerie` ASC) VISIBLE,
  CONSTRAINT `fk_serie_has_lista_de_vistos_serie1`
    FOREIGN KEY (`idSerie`)
    REFERENCES `AppMultimediaHibernate_v3`.`serie` (`idSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_serie_has_lista_de_vistos_lista_de_vistos1`
    FOREIGN KEY (`idLista`)
    REFERENCES `AppMultimediaHibernate_v3`.`lista_de_vistos` (`idLista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `AppMultimediaHibernate_v3`.`lista_pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AppMultimediaHibernate_v3`.`lista_pelicula` (
  `idLista` INT NOT NULL,
  `idPelicula` INT NOT NULL,
  PRIMARY KEY (`idLista`, `idPelicula`),
  INDEX `fk_lista_de_vistos_has_pelicula_pelicula1_idx` (`idPelicula` ASC) VISIBLE,
  INDEX `fk_lista_de_vistos_has_pelicula_lista_de_vistos1_idx` (`idLista` ASC) VISIBLE,
  CONSTRAINT `fk_lista_de_vistos_has_pelicula_lista_de_vistos1`
    FOREIGN KEY (`idLista`)
    REFERENCES `AppMultimediaHibernate_v3`.`lista_de_vistos` (`idLista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lista_de_vistos_has_pelicula_pelicula1`
    FOREIGN KEY (`idPelicula`)
    REFERENCES `AppMultimediaHibernate_v3`.`pelicula` (`idPelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `AppMultimediaHibernate_v3` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

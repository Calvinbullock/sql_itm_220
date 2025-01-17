-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`country` ;

CREATE TABLE IF NOT EXISTS `mydb`.`country` (
  `country_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NULL,
  `currency` VARCHAR(45) NULL,
  `gdp` VARCHAR(45) NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`manufactuer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`manufactuer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`manufactuer` (
  `manufactuer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mpg` VARCHAR(45) NULL,
  PRIMARY KEY (`manufactuer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`engine` ;

CREATE TABLE IF NOT EXISTS `mydb`.`engine` (
  `engine_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `engine_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`engine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`body_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`body_type` ;

CREATE TABLE IF NOT EXISTS `mydb`.`body_type` (
  `body_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `body_type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`body_type_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

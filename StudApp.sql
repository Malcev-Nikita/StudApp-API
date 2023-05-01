-- MySQL Script generated by MySQL Workbench
-- Tue Mar 14 11:48:17 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema default_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema default_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `default_db` DEFAULT CHARACTER SET utf8mb4 ;
USE `default_db` ;

-- -----------------------------------------------------
-- Table `default_db`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Role` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Users` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Full_Name` VARCHAR(128) NOT NULL,
  `Email` VARCHAR(128) NOT NULL,
  `Date_Of_Birth` DATE NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Avatar` VARCHAR(128) NULL,
  `Role_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC),
  UNIQUE INDEX `Phone_UNIQUE` (`Email` ASC),
  UNIQUE INDEX `Full_Name_UNIQUE` (`Full_Name` ASC),
  INDEX `fk_Users_Role1_idx` (`Role_Id` ASC),
  CONSTRAINT `fk_Users_Role1`
    FOREIGN KEY (`Role_Id`)
    REFERENCES `default_db`.`Role` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Сall_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Сall_Schedule` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Time` TIME NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Time_UNIQUE` (`Time` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Subject` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Group` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Teacher` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Users_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Teacher_Users1_idx` (`Users_Id` ASC),
  UNIQUE INDEX `Users_Id_UNIQUE` (`Users_Id` ASC),
  CONSTRAINT `fk_Teacher_Users1`
    FOREIGN KEY (`Users_Id`)
    REFERENCES `default_db`.`Users` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Day_Of_Week`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Day_Of_Week` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Schedule_Of_Items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Schedule_Of_Items` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_Subject` INT NOT NULL,
  `Id_Call_Schedule` INT NOT NULL,
  `Day_Of_Week_Id` INT NOT NULL,
  `Id_Group` INT NOT NULL,
  `Teacher_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Schedule_Of_Items_Subject_idx` (`Id_Subject` ASC),
  INDEX `fk_Schedule_Of_Items_Сall_Schedule1_idx` (`Id_Call_Schedule` ASC),
  INDEX `fk_Schedule_Of_Items_Group1_idx` (`Id_Group` ASC),
  INDEX `fk_Schedule_Of_Items_Teacher1_idx` (`Teacher_Id` ASC),
  INDEX `fk_Schedule_Of_Items_Day_Of_Week1_idx` (`Day_Of_Week_Id` ASC),
  CONSTRAINT `fk_Schedule_Of_Items_Subject`
    FOREIGN KEY (`Id_Subject`)
    REFERENCES `default_db`.`Subject` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Of_Items_Сall_Schedule1`
    FOREIGN KEY (`Id_Call_Schedule`)
    REFERENCES `default_db`.`Сall_Schedule` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Of_Items_Group1`
    FOREIGN KEY (`Id_Group`)
    REFERENCES `default_db`.`Group` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Of_Items_Teacher1`
    FOREIGN KEY (`Teacher_Id`)
    REFERENCES `default_db`.`Teacher` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Of_Items_Day_Of_Week1`
    FOREIGN KEY (`Day_Of_Week_Id`)
    REFERENCES `default_db`.`Day_Of_Week` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `default_db`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `default_db`.`Students` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Group_Id` INT NOT NULL,
  `Users_Id` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Students_Group1_idx` (`Group_Id` ASC),
  INDEX `fk_Students_Users1_idx` (`Users_Id` ASC),
  CONSTRAINT `fk_Students_Group1`
    FOREIGN KEY (`Group_Id`)
    REFERENCES `default_db`.`Group` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Users1`
    FOREIGN KEY (`Users_Id`)
    REFERENCES `default_db`.`Users` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
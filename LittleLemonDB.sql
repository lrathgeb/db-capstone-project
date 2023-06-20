-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MenuItems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Type` VARCHAR(45) NULL,
  `Price` INT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuID`, `ItemID`),
  CONSTRAINT `itemid`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`MenuItems` (`ItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL,
  `Role` VARCHAR(100) NOT NULL,
  `Address` VARCHAR(100) NULL,
  `ContactNumber` VARCHAR(100) NULL,
  `Email` VARCHAR(45) NULL,
  `AnnualSalary` DECIMAL NULL,
  PRIMARY KEY (`EmployeeID`, `Role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NULL,
  `BookingDate` DATE NULL,
  `GuestFirstName` VARCHAR(45) NOT NULL,
  `GuestLastName` VARCHAR(45) NOT NULL,
  `EmployeeID` INT NULL,
  `BookingSlot` DATE NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `employee_id_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `employee_id`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `mydb`.`Employees` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderID` INT NOT NULL,
  `TableNo` INT NULL,
  `MenuID` INT NULL,
  `BookingID` INT NULL,
  `TotalCost` DECIMAL NULL,
  `Quantity` INT NULL,
  `OrderDate` DATE NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_idx` (`BookingID` ASC) VISIBLE,
  INDEX `menu_id_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `booking_id`
    FOREIGN KEY (`BookingID`)
    REFERENCES `mydb`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu_id`
    FOREIGN KEY (`MenuID`)
    REFERENCES `mydb`.`Menu` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDeliveryStatus` (
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderID`),
  CONSTRAINT `order_id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `mydb`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `CustomerID` VARCHAR(45) NOT NULL,
  `BookingID` INT NOT NULL,
  `GuestFirstName` VARCHAR(45) NULL,
  `GuestLastName` VARCHAR(45) NULL,
  `ContactNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `booking_id`
    FOREIGN KEY (`BookingID`)
    REFERENCES `mydb`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

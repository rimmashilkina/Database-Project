-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema r_j_burgers
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema r_j_burgers
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `r_j_burgers` DEFAULT CHARACTER SET utf8 ;
USE `r_j_burgers` ;

-- -----------------------------------------------------
-- Table `r_j_burgers`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`customer` (
  `CustomerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerLastName` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerStreet1` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerStreet2` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerCity` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerState` VARCHAR(2) NULL DEFAULT NULL,
  `CustomerZip` VARCHAR(5) NULL DEFAULT NULL,
  `CustomerPhone` VARCHAR(10) NULL DEFAULT NULL,
  `CustomerEmail` VARCHAR(150) NULL DEFAULT NULL,
  `CustomerOrders` INT UNSIGNED NULL DEFAULT NULL,
  `CustomerCurrentDiscount` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  INDEX `CustomerPhone` (`CustomerPhone` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2229
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`deliveryaddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`deliveryaddress` (
  `DeliveryAddressID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DeliveryAddressStreet1` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryAddressStreet2` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryAddressCity` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryAddressState` VARCHAR(2) NULL DEFAULT NULL,
  `DeliveryAddressZip` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryAddressID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`deliveryarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`deliveryarea` (
  `DeliveryAreaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DeliveryAreaName` VARCHAR(45) NULL DEFAULT NULL,
  `DeliveryAreaZip` INT NULL DEFAULT NULL,
  PRIMARY KEY (`DeliveryAreaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`deliveryperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`deliveryperson` (
  `DeliveryPersonID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `DeliveryPersonFirstName` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPersonLastName` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPersonStreet1` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPersonStreet2` VARCHAR(45) NULL DEFAULT NULL,
  `DeliveryPersonCity` VARCHAR(150) NULL DEFAULT NULL,
  `DeliveryPersonState` VARCHAR(2) NULL DEFAULT NULL,
  `DeliveryPersonZip` VARCHAR(5) NULL DEFAULT NULL,
  `DeliveryPersonPhone` VARCHAR(10) NULL DEFAULT NULL,
  `DeliveryAreaID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`DeliveryPersonID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`DeliveryPersonID` ASC) VISIBLE,
  INDEX `DeliveryAreaID_idx` (`DeliveryAreaID` ASC) VISIBLE,
  CONSTRAINT `DeliveryAreaID`
    FOREIGN KEY (`DeliveryAreaID`)
    REFERENCES `r_j_burgers`.`deliveryarea` (`DeliveryAreaID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`employee` (
  `EmployeeID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EmployeeFirstName` VARCHAR(150) NULL DEFAULT NULL,
  `EmployeeLastName` VARCHAR(150) NULL DEFAULT NULL,
  `EmployeeStreet1` VARCHAR(150) NULL DEFAULT NULL,
  `EmployeeStreet2` VARCHAR(45) NULL DEFAULT NULL,
  `EmployeeCity` VARCHAR(150) NULL DEFAULT NULL,
  `EmployeeState` VARCHAR(2) NULL DEFAULT NULL,
  `EmployeeZip` VARCHAR(5) NULL DEFAULT NULL,
  `EmployeePhone` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE INDEX `EmployeeID_UNIQUE` (`EmployeeID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`menuitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`menuitem` (
  `MenuItemID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `MenuItemName` VARCHAR(150) NULL DEFAULT NULL,
  `MenuItemDescription` VARCHAR(300) NULL DEFAULT NULL,
  `MenuItemType` VARCHAR(45) NULL DEFAULT NULL,
  `MenuItemPrice` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`),
  UNIQUE INDEX `MenuItemID_UNIQUE` (`MenuItemID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`order` (
  `OrderID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EmployeeID` INT UNSIGNED NULL DEFAULT NULL,
  `DeliveryPersonID` INT UNSIGNED NULL DEFAULT NULL,
  `CustomerID` INT UNSIGNED NULL DEFAULT NULL,
  `OrderType` VARCHAR(45) NULL DEFAULT NULL,
  `OrderTotalCost` DECIMAL(6,2) NULL DEFAULT NULL,
  `DeliveryAddressID` INT UNSIGNED NULL DEFAULT NULL,
  `OrderDateTime` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `CustomerID_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `EmployeeID_idx` (`EmployeeID` ASC) VISIBLE,
  INDEX `DeliveryPersonID_idx` (`DeliveryPersonID` ASC) VISIBLE,
  INDEX `DeliveryAddressID_idx` (`DeliveryAddressID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `r_j_burgers`.`customer` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DeliveryAddressID`
    FOREIGN KEY (`DeliveryAddressID`)
    REFERENCES `r_j_burgers`.`deliveryaddress` (`DeliveryAddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `DeliveryPersonID`
    FOREIGN KEY (`DeliveryPersonID`)
    REFERENCES `r_j_burgers`.`deliveryperson` (`DeliveryPersonID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmployeeID`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `r_j_burgers`.`employee` (`EmployeeID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`orderdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`orderdetails` (
  `OrderID` INT UNSIGNED NOT NULL,
  `MenuItemID` INT UNSIGNED NOT NULL,
  `MenuItemQuantity` INT NULL DEFAULT NULL,
  `OrderDetailPrice` DECIMAL(6,2) NULL DEFAULT NULL,
  `OrderDetailsComments` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`OrderID`, `MenuItemID`),
  INDEX `MenuItemID_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `MenuItemID`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `r_j_burgers`.`menuitem` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderID`
    FOREIGN KEY (`OrderID`)
    REFERENCES `r_j_burgers`.`order` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `r_j_burgers`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `r_j_burgers`.`payment` (
  `PaymentID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PaymentType` VARCHAR(50) NULL DEFAULT NULL,
  `PaymentDate` DATETIME NULL DEFAULT NULL,
  `PaymentTotalPaid` DECIMAL(6,2) NULL DEFAULT NULL,
  `OrderID` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  UNIQUE INDEX `PaymentID_UNIQUE` (`PaymentID` ASC) VISIBLE,
  INDEX `OrderID_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `OrderIDPayment`
    FOREIGN KEY (`OrderID`)
    REFERENCES `r_j_burgers`.`order` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

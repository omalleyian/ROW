-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for practice
CREATE DATABASE IF NOT EXISTS `practice` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `practice`;

-- Dumping structure for table practice.ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `ING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ING_NAME` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table practice.recipe
CREATE TABLE IF NOT EXISTS `recipe` (
  `REC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REC_NAME` varchar(50) NOT NULL,
  `REC_IMG_PATH` varchar(50) NOT NULL DEFAULT 'default',
  `REC_DESCRIPTION` varchar(500) DEFAULT NULL,
  `REC_COOK_TIME` time DEFAULT NULL,
  `REC_PREP_TIME` time DEFAULT NULL,
  PRIMARY KEY (`REC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table practice.recipe_ingredient
CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `REC_ID` int(11) NOT NULL,
  `ING_ID` int(11) NOT NULL,
  PRIMARY KEY (`REC_ID`,`ING_ID`),
  KEY `FK__ingredient` (`ING_ID`),
  CONSTRAINT `FK__ingredient` FOREIGN KEY (`ING_ID`) REFERENCES `ingredient` (`ING_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK__recipe` FOREIGN KEY (`REC_ID`) REFERENCES `recipe` (`REC_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table practice.recipe_step
CREATE TABLE IF NOT EXISTS `recipe_step` (
  `REC_ID` int(11) NOT NULL,
  `STEP_ID` int(11) NOT NULL,
  `STEP_ORDINAL` int(11) NOT NULL,
  PRIMARY KEY (`REC_ID`,`STEP_ID`,`STEP_ORDINAL`),
  KEY `FK_recipe_step_step` (`STEP_ID`),
  CONSTRAINT `FK_recipe_step_recipe` FOREIGN KEY (`REC_ID`) REFERENCES `recipe` (`REC_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FK_recipe_step_step` FOREIGN KEY (`STEP_ID`) REFERENCES `step` (`STEP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
-- Dumping structure for table practice.step
CREATE TABLE IF NOT EXISTS `step` (
  `STEP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEP_TEXT` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`STEP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

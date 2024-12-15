/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for osx10.19 (x86_64)
--
-- Host: localhost    Database: FloorCoolingSystem
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Activities`
--

DROP TABLE IF EXISTS `Activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Activities` (
  `activity_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Activities`
--

LOCK TABLES `Activities` WRITE;
/*!40000 ALTER TABLE `Activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActivityLog`
--

DROP TABLE IF EXISTS `ActivityLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActivityLog` (
  `activity_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `activity_id` int(10) unsigned NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `location` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`activity_log_id`),
  KEY `user_id` (`user_id`),
  KEY `activity_id` (`activity_id`),
  CONSTRAINT `activitylog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `activitylog_ibfk_2` FOREIGN KEY (`activity_id`) REFERENCES `Activities` (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActivityLog`
--

LOCK TABLES `ActivityLog` WRITE;
/*!40000 ALTER TABLE `ActivityLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActivityLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temperaturelog`
--

DROP TABLE IF EXISTS `temperaturelog`;
CREATE TABLE `temperaturelog` (
  `temperature_log_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NOT NULL, -- Foreign key to Users table
  `activity_log_id` INT(10) UNSIGNED DEFAULT NULL, -- Optional link to ActivityLog
  `temperature` DECIMAL(5, 2) NOT NULL, -- Temperature value (e.g., in Celsius)
  `timestamp` DATETIME DEFAULT CURRENT_TIMESTAMP, -- When the temperature was logged
  `location` VARCHAR(191) DEFAULT NULL, -- Optional location of the measurement
  PRIMARY KEY (`temperature_log_id`),
  KEY `user_id` (`user_id`),
  KEY `activity_log_id` (`activity_log_id`),
  CONSTRAINT `temperaturelog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `temperaturelog_ibfk_2` FOREIGN KEY (`activity_log_id`) REFERENCES `ActivityLog` (`activity_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `temperaturelog`
--

LOCK TABLES `temperaturelog` WRITE;
/*!40000 ALTER TABLE `temperaturelog` DISABLE KEYS */;
INSERT INTO temperaturelog (user_id, activity_log_id, temperature, location)
VALUES (2, 53, 2.3, 'Viljandi');
/*!40000 ALTER TABLE `temperaturelog` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Add a `last_login` column to the `Users` table
ALTER TABLE Users
ADD COLUMN `last_login` DATETIME DEFAULT NULL;

-- Add unique indexes to ensure username and email are unique
CREATE UNIQUE INDEX idx_username ON Users(username);
CREATE UNIQUE INDEX idx_email ON Users(email);

-- Add indexes for better performance on frequently queried columns
CREATE INDEX idx_user_id_activitylog ON ActivityLog(user_id);
CREATE INDEX idx_timestamp_activitylog ON ActivityLog(timestamp);

-- Add a foreign key constraint to link activity_id in ActivityLog to Activities table
ALTER TABLE ActivityLog
ADD CONSTRAINT fk_activity_id FOREIGN KEY (activity_id) REFERENCES Activities(activity_id);

-- Restore previous database settings
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-11-14 16:23:53

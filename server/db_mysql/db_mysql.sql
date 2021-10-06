CREATE DATABASE  IF NOT EXISTS `db_mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_mysql`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_mysql
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_session`
--

DROP TABLE IF EXISTS `active_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_session` (
  `id` varchar(60) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `active_session_user_id_idx` (`user_id`),
  CONSTRAINT `active_session_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_session`
--

LOCK TABLES `active_session` WRITE;
/*!40000 ALTER TABLE `active_session` DISABLE KEYS */;
INSERT INTO `active_session` VALUES ('4DiULUfVwijoAuKlcAAslPEeZRhOKiwSWC2fR7VjdAZ4bUH7r2',1),('8PqyUfCv9f88PdGO2LHQBRIsxVePH7dJFXmxdiC0hmogRStdwI',1),('cYQJJ73vXQwF8OJHDLsZs5srIyt7iAs6SeFOTROTAPYJxN3bPn',1),('pst8SDsjJCqGhDHvWDdV65srrvnCi3PeqpFGmwl97cvu7LRPcz',1),('qG3VSJR6ntAFGhnH1JDypQ6cuVPfZWuRkdawedYYqX8XfCsUTA',1),('WcZAhIp637xluWR0xB23nXZLa8bQTCCNwmI9gSVWF2FrSbnLy1',1),('ZERtPwNqSYVJiywkpt9gzjDlCZ1J3Mn2kN1VrLDu5SWVOMxcAj',1),('zRLQsZS69vcPpg1dJCXQEZ0o5WaURYjsmEUt39ORuoUNchf1U4',1),('ubuJpDwN1yuc2tfUAKtaGhYtBZsqwvglfbZmKADVchPWgQow2A',4),('wbIgnzXku678tfJAya8ISoYhqkKmdU0a2efx0UojGefG0Rfwtx',8);
/*!40000 ALTER TABLE `active_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `zip_code` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Alexvägen','alex','Alexstad','ALEXANDER EKDAHL'),(2,'Polhemsvägen','2389','Andersstad','Liranu'),(3,'Jujustreet','91653SD3','Mern','Peru'),(4,'Broadway','3256','Kantania','Laurasia'),(6,'Lundavägen','8618','Malmö','Sweden'),(7,'Jersievejen','5678','Lille Skensved','Denmark'),(8,'Roadway','4567','Rearview','Holesville'),(9,'Boulevard','123','Broken','Dreams'),(10,'Greatroad','886','Best','Fantastic'),(11,'Quarterroad','78964','Jahanda','Gruar'),(13,'WorcesterSquare','98277','Hava','Ram'),(17,'Karlstorpsvägen','6432WE','Knutanstad','Sweden'),(19,'Klaratorpsvägen','SOS911','Elm Street','Fantasia'),(20,'Cuckoostreet','O54283','Easter','Norway'),(21,'Weststreet','SOS911','Greater','Fantasia'),(22,'Cuckoostreet','SOS911','Elm Street','Fantasia'),(23,'Karlstorpsvägen','6432WE','Knutanstad','Sweden'),(24,'Karlstorpsvägen','6432','Knutanstad','Sweden'),(25,'Anaroad','67891W','Bree','Finland'),(26,'Sorway','34T4V','Jawa','Moon'),(27,'Karlstorpsvägen','6432S','Knutanstad','Sweden'),(29,'Dreamstreet','7258WE','Lost','Isla'),(30,'Highway','24688','To','Hell'),(31,'Sidensvansgatan','6432WE','Kågeröd','Sweden'),(32,'Luxury','SECRET','City of Dreams','TOP-SECRET'),(33,'Xania','6432WE','Jarrona','Wanda'),(34,'On the street','No really','Anywhere','ANY.WHERE.'),(35,'Bommerstreet','96532b','Island','USA'),(36,'Skywalk','25793','Thesia','Wonderland'),(37,'Ignotusstreet 9','12345','Boomhill','Unearthly'),(38,'Banan street','1232','Monekeytown','Banna Country'),(39,'Quercusstreet','9763','Robus','Fagesia'),(40,'Viburnumstreet','3568','Bodnantense','Hydra'),(41,'Fagusstreet','8275','Sylvetica','Fagacea'),(42,'Karlstorpsvägen','6432WE','Knutanstad','Sweden'),(43,'Crataegusstreet','9652','Media','Rosacea'),(44,'Tiliastreet','345','Commutata','Planttown'),(45,'Pinusstreet','233DT','Sylvetica','Pinacea'),(46,'Magnoliastreet','652782','Stellatia','Magnaca'),(47,'Sorbusstreet','65378','Alba','Rosacea'),(48,'Betula','9876','Pendulia','Betulacea'),(49,'Cotinusstreet','8652','Coggygria','Wigtown'),(50,'Malusstreet','98726','Domesticia','Rosacea'),(51,'Rhuus','96235','Typhina','Globe'),(52,'Lobelia','6819','Erinua','Purpleland'),(55,'Sunner','92867','Lund','Sweden'),(57,'Leesestreet','89872','Kass','Moran'),(58,'Banana  road','0000','Monkeytown','Forest country'),(59,'Carpinus','9827','Betulusa','Betulacea'),(60,'Poshstreet','09352P','Rearview','Katalusia'),(61,'Karlstorpsvägen','6432WE','Knutanstad','Sverige'),(62,'Anderstorp','9967','Malby','Sverige');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_enum`
--

DROP TABLE IF EXISTS `amenity_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity_enum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_id` int NOT NULL,
  `amenity` enum('WIFI','KITCHEN','PARKING','BATH') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_enum_home_id_idx` (`home_id`),
  CONSTRAINT `amenity_enum_home_id` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_enum`
--

LOCK TABLES `amenity_enum` WRITE;
/*!40000 ALTER TABLE `amenity_enum` DISABLE KEYS */;
INSERT INTO `amenity_enum` VALUES (4,8,'WIFI'),(5,8,'KITCHEN'),(6,9,'WIFI'),(7,9,'KITCHEN'),(10,11,'WIFI'),(11,11,'KITCHEN'),(12,12,'WIFI'),(13,12,'KITCHEN'),(14,13,'WIFI'),(15,13,'KITCHEN'),(18,15,'WIFI'),(19,15,'KITCHEN'),(31,21,'WIFI'),(32,21,'KITCHEN'),(33,21,'BATH'),(34,22,'WIFI'),(35,22,'KITCHEN'),(36,22,'BATH'),(37,23,'WIFI'),(38,23,'KITCHEN'),(39,23,'BATH'),(40,24,'WIFI'),(41,24,'KITCHEN'),(42,24,'BATH'),(43,25,'BATH'),(44,26,'BATH'),(45,27,'KITCHEN'),(46,28,'KITCHEN'),(47,29,'WIFI'),(48,30,'BATH'),(49,31,'BATH'),(50,32,'WIFI'),(51,32,'KITCHEN'),(52,32,'BATH'),(53,33,'WIFI'),(54,34,'WIFI'),(55,34,'KITCHEN'),(56,36,'WIFI'),(57,36,'KITCHEN'),(58,37,'WIFI'),(59,37,'KITCHEN'),(60,38,'WIFI'),(61,38,'KITCHEN'),(62,38,'BATH'),(63,39,'WIFI'),(64,40,'WIFI'),(65,40,'BATH'),(66,41,'WIFI'),(67,41,'BATH'),(68,8,'WIFI'),(69,8,'BATH'),(70,25,'BATH'),(71,9,'BATH'),(72,9,'PARKING'),(73,9,'WIFI'),(74,9,'BATH'),(75,9,'PARKING'),(76,9,'WIFI'),(77,9,'PARKING'),(78,8,'WIFI'),(79,8,'PARKING'),(80,11,'BATH'),(81,8,'KITCHEN'),(82,8,'BATH'),(99,43,'WIFI'),(101,44,'BATH'),(102,45,'WIFI'),(104,46,'PARKING'),(105,10,'KITCHEN'),(106,10,'BATH'),(108,47,'BATH'),(109,48,'WIFI'),(110,48,'KITCHEN'),(111,48,'BATH'),(116,19,'WIFI');
/*!40000 ALTER TABLE `amenity_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity_enum_history_log`
--

DROP TABLE IF EXISTS `amenity_enum_history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity_enum_history_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_history_log_id` int NOT NULL,
  `amenity` enum('WIFI','KITCHEN','PARKING','BATH') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `amenity_history_home_history_idx` (`home_history_log_id`),
  CONSTRAINT `amenity_history_home_history` FOREIGN KEY (`home_history_log_id`) REFERENCES `home_history_log` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity_enum_history_log`
--

LOCK TABLES `amenity_enum_history_log` WRITE;
/*!40000 ALTER TABLE `amenity_enum_history_log` DISABLE KEYS */;
INSERT INTO `amenity_enum_history_log` VALUES (4,12,'WIFI'),(5,12,'KITCHEN'),(6,13,'WIFI'),(7,13,'KITCHEN'),(8,14,'WIFI'),(9,14,'KITCHEN'),(10,14,'WIFI'),(11,14,'BATH'),(12,15,'BATH'),(13,16,'BATH'),(14,16,'PARKING'),(15,17,'WIFI'),(16,18,'BATH'),(17,18,'PARKING'),(18,19,'WIFI'),(19,19,'PARKING'),(20,20,'WIFI'),(21,21,'PARKING'),(22,22,'BATH'),(23,23,'KITCHEN'),(24,23,'BATH'),(25,24,'WIFI'),(26,24,'PARKING'),(27,25,'KITCHEN'),(28,26,'WIFI'),(29,27,'WIFI'),(30,27,'KITCHEN'),(31,28,'WIFI'),(32,28,'KITCHEN'),(33,28,'BATH'),(34,30,'BATH'),(35,30,'PARKING'),(36,31,'WIFI'),(37,31,'KITCHEN'),(38,32,'WIFI'),(39,32,'KITCHEN'),(40,32,'PARKING'),(41,34,'KITCHEN'),(42,35,'KITCHEN'),(43,36,'WIFI'),(44,36,'KITCHEN'),(45,36,'WIFI'),(46,36,'PARKING'),(47,36,'KITCHEN'),(48,37,'KITCHEN'),(49,38,'WIFI'),(50,38,'BATH'),(51,38,'PARKING'),(52,39,'WIFI'),(53,39,'KITCHEN'),(54,40,'BATH'),(55,40,'PARKING'),(56,41,'WIFI'),(57,41,'BATH');
/*!40000 ALTER TABLE `amenity_enum_history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_detail`
--

DROP TABLE IF EXISTS `booking_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `renter_id` int NOT NULL,
  `home_id` int NOT NULL,
  `total_price` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `created_date` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_detail_renter_id_idx` (`renter_id`),
  KEY `booking_detail_home_id_idx` (`home_id`),
  CONSTRAINT `booking_detail_home_id` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`),
  CONSTRAINT `booking_detail_renter_id` FOREIGN KEY (`renter_id`) REFERENCES `renter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_detail`
--

LOCK TABLES `booking_detail` WRITE;
/*!40000 ALTER TABLE `booking_detail` DISABLE KEYS */;
INSERT INTO `booking_detail` VALUES (2,1,1,123,'2021-11-22 23:00:00','2021-11-22 23:00:00','2021-11-22 23:00:00'),(3,8,27,976,'2012-11-18 23:01:57','2012-11-18 23:01:57','2021-09-24 08:23:07'),(4,8,27,976,'2012-11-18 23:01:57','2012-11-18 23:01:57','2021-09-24 08:28:32'),(5,8,24,926,'2012-11-18 23:01:57','2012-11-18 23:01:57','2021-09-24 08:31:13'),(6,15,38,100,'2021-09-25 00:00:00','2021-09-26 00:00:00','2021-09-25 10:42:26'),(7,1,35,162,'2021-10-13 00:00:00','2021-10-16 00:00:00','2021-10-04 07:05:24'),(8,1,36,975,'2021-10-20 00:00:00','2021-10-21 00:00:00','2021-10-04 08:02:33'),(9,1,36,975,'2021-10-19 00:00:00','2021-10-20 00:00:00','2021-10-04 08:03:08'),(10,1,36,975,'2021-10-21 00:00:00','2021-10-22 00:00:00','2021-10-04 08:03:20'),(11,1,36,975,'2021-09-05 00:00:00','2021-09-06 00:00:00','2021-10-04 08:03:51'),(12,1,36,975,'2022-01-27 00:00:00','2022-01-28 00:00:00','2021-10-04 08:04:05'),(13,1,48,300,'2021-10-10 00:00:00','2021-10-11 00:00:00','2021-10-04 08:11:05'),(14,1,19,600,'2021-10-06 00:00:00','2021-10-07 00:00:00','2021-10-06 07:21:33');
/*!40000 ALTER TABLE `booking_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home`
--

DROP TABLE IF EXISTS `home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home` (
  `id` int NOT NULL AUTO_INCREMENT,
  `host_id` int NOT NULL,
  `address_id` int NOT NULL,
  `price_per_night` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `home_address_id_idx` (`address_id`),
  KEY `home_host_id_idx` (`host_id`),
  CONSTRAINT `home_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `home_host_id` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home`
--

LOCK TABLES `home` WRITE;
/*!40000 ALTER TABLE `home` DISABLE KEYS */;
INSERT INTO `home` VALUES (1,1,1,4445,'2021-11-24 00:00:00','2021-11-30 00:00:00',NULL,'2021-10-04 09:43:20'),(4,2,2,400,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-19 16:58:13'),(5,2,3,100,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-19 16:58:13'),(6,4,4,560,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-19 16:58:13'),(8,4,50,101,'2013-03-20 00:00:00','2013-08-01 00:00:00',NULL,'2021-09-26 15:01:14'),(9,4,46,9267,'2014-07-22 00:00:00','2015-12-25 00:00:00',NULL,'2021-09-26 14:42:49'),(10,4,52,333,'2021-12-18 00:00:00','2021-01-24 00:00:00',NULL,'2021-09-27 07:49:01'),(11,4,49,100,'2012-11-20 00:00:00','2012-11-23 00:00:00',NULL,'2021-09-26 14:53:44'),(12,4,10,240,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-23 18:16:20'),(13,4,11,312,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-23 18:24:36'),(15,4,13,567,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-23 18:46:47'),(19,4,17,600,'2021-08-10 00:00:00','2021-11-30 00:00:00',NULL,'2021-10-06 07:20:40'),(21,4,19,960,'2021-09-12 00:00:00','2021-10-28 00:00:00',NULL,'2021-09-23 22:18:36'),(22,4,20,720,'2021-09-12 00:00:00','2021-10-28 00:00:00',NULL,'2021-09-23 22:18:44'),(23,4,21,726,'2021-09-12 00:00:00','2021-10-28 00:00:00',NULL,'2021-09-23 22:18:53'),(24,4,22,223,'2021-09-12 00:00:00','2021-10-28 00:00:00',NULL,'2021-09-23 22:18:58'),(25,4,42,400,'2021-08-10 00:00:00','2021-10-29 00:00:00',NULL,'2021-09-26 14:24:11'),(26,4,24,544,'2021-08-10 00:00:00','2021-10-29 00:00:00',NULL,'2021-09-23 22:19:35'),(27,4,25,1243,'2021-09-04 00:00:00','2021-09-29 00:00:00',NULL,'2021-09-24 06:56:21'),(28,4,26,1243,'2021-09-04 00:00:00','2021-09-29 00:00:00',NULL,'2021-09-24 06:56:34'),(29,4,27,763,'2021-09-27 00:00:00','2021-10-30 00:00:00',NULL,'2021-09-24 07:17:19'),(30,4,29,123,'2021-09-09 00:00:00','2021-09-12 00:00:00',NULL,'2021-09-24 07:30:52'),(31,4,30,123,'2021-09-09 00:00:00','2021-09-12 00:00:00',NULL,'2021-09-24 07:30:55'),(32,4,31,564,'2021-09-21 00:00:00','2021-09-30 00:00:00',NULL,'2021-09-24 07:31:26'),(33,4,32,789,'2021-09-13 00:00:00','2021-09-30 00:00:00',NULL,'2021-09-24 07:33:23'),(34,4,33,981,'2021-09-28 00:00:00','2021-09-30 00:00:00',NULL,'2021-09-24 07:34:01'),(35,4,34,54,'2021-09-08 00:00:00','2021-11-30 00:00:00',NULL,'2021-09-24 07:34:55'),(36,11,35,975,'2021-09-05 00:00:00','2022-01-28 00:00:00',NULL,'2021-09-24 07:37:24'),(37,4,36,682,'2012-11-18 23:01:57','2012-11-18 23:01:57',NULL,'2021-09-24 08:42:32'),(38,11,37,100,'2021-09-13 00:00:00','2021-09-30 00:00:00',NULL,'2021-09-24 08:47:03'),(39,4,38,123,'2021-09-24 00:00:00','2021-09-26 00:00:00',NULL,'2021-09-24 08:58:43'),(40,4,39,111,'2012-11-03 00:00:00','2012-11-29 00:00:00',NULL,'2021-09-26 00:52:18'),(41,4,40,986,'2012-11-03 00:00:00','2012-11-29 00:00:00',NULL,'2021-09-26 00:52:49'),(43,18,57,19,'2021-10-21 00:00:00','2021-10-22 00:00:00',NULL,'2021-09-26 17:40:23'),(44,18,58,230,'2021-09-16 00:00:00','2021-09-28 00:00:00',NULL,'2021-09-26 17:48:29'),(45,18,59,99,'2021-09-14 00:00:00','2021-09-30 00:00:00',NULL,'2021-09-26 17:58:27'),(46,18,60,330,'2021-09-08 00:00:00','2021-12-04 00:00:00',NULL,'2021-09-26 18:08:16'),(47,19,61,200,'2021-08-31 00:00:00','2021-09-06 00:00:00',NULL,'2021-09-27 13:27:02'),(48,1,62,300,'2021-10-01 00:00:00','2021-12-30 00:00:00',NULL,'2021-10-04 08:10:37');
/*!40000 ALTER TABLE `home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_history_log`
--

DROP TABLE IF EXISTS `home_history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_history_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_id` int NOT NULL,
  `price_per_night` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `home_history_log_id_idx` (`home_id`),
  CONSTRAINT `home_history_log_id` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_history_log`
--

LOCK TABLES `home_history_log` WRITE;
/*!40000 ALTER TABLE `home_history_log` DISABLE KEYS */;
INSERT INTO `home_history_log` VALUES (1,1,927856,'2021-09-09 22:00:00','2021-09-29 22:00:00','2021-05-03 22:00:00'),(2,8,873,'2021-07-08 22:00:00','2021-08-11 22:00:00','2021-06-06 22:00:00'),(12,8,0,'2012-11-18 23:01:57','2012-11-18 23:01:57','2021-09-12 16:58:13'),(13,8,0,'2012-11-18 23:01:57','2012-11-18 23:01:57','2021-09-13 16:58:13'),(14,8,11111,'2012-11-03 00:00:00','2012-11-29 00:00:00','2021-09-14 16:58:13'),(15,25,400,'2021-08-10 00:00:00','2021-10-29 00:00:00','2021-09-15 16:58:13'),(16,9,222,'2014-07-19 00:00:00','2014-12-19 00:00:00','2021-09-15 16:58:13'),(17,9,300,'2014-07-29 00:00:00','2015-02-27 00:00:00','2021-09-17 16:58:13'),(18,9,302,'2014-07-16 00:00:00','2015-02-28 00:00:00','2021-09-18 16:58:13'),(19,9,9267,'2014-07-22 00:00:00','2015-12-25 00:00:00','2021-09-19 16:58:13'),(20,8,200,'2013-01-22 00:00:00','2013-02-27 00:00:00','2021-09-20 16:58:13'),(21,8,100,'2013-01-23 00:00:00','2013-02-26 00:00:00','2021-09-21 16:58:13'),(22,11,100,'2012-11-20 00:00:00','2012-11-23 00:00:00','2021-09-22 16:58:13'),(23,8,101,'2013-03-20 00:00:00','2013-08-01 00:00:00','2021-09-23 16:58:13'),(24,10,10,'2012-11-07 00:00:00','2012-11-30 00:00:00','2021-09-24 16:58:13'),(25,10,10,'2012-11-20 00:00:00','2012-12-02 00:00:00','2021-09-25 16:58:13'),(26,43,123,'2021-09-01 00:00:00','2021-09-30 00:00:00','2021-09-26 16:59:20'),(27,43,124,'2021-09-01 00:00:00','2021-09-02 00:00:00','2021-09-26 16:58:13'),(28,43,13,'2021-10-01 00:00:00','2021-10-02 00:00:00','2021-09-26 17:15:14'),(29,43,12,'2021-10-04 00:00:00','2021-10-10 00:00:00','2021-09-26 17:33:24'),(30,43,12,'2021-10-04 00:00:00','2021-10-10 00:00:00','2021-09-26 17:34:06'),(31,43,12,'2021-10-04 00:00:00','2021-10-10 00:00:00','2021-09-26 17:36:46'),(32,43,12,'2021-10-04 00:00:00','2021-10-10 00:00:00','2021-09-26 17:39:32'),(33,43,19,'2021-10-21 00:00:00','2021-10-22 00:00:00','2021-09-26 17:40:23'),(34,44,230,'2021-09-13 00:00:00','2021-09-30 00:00:00','2021-09-26 17:48:29'),(35,46,300,'2021-09-05 00:00:00','2021-11-30 00:00:00','2021-09-26 18:08:16'),(36,10,10,'2012-11-20 00:00:00','2012-12-02 00:00:00','2021-09-27 07:49:01'),(37,47,100,'2021-09-01 00:00:00','2021-09-05 00:00:00','2021-09-27 13:27:02'),(38,1,4441,'2021-11-22 23:00:00','2021-11-22 23:00:00','2021-10-04 09:15:17'),(39,1,4444,'2021-11-22 00:00:00','2021-11-28 00:00:00','2021-10-04 09:32:54'),(40,1,4445,'2021-11-23 00:00:00','2021-11-29 00:00:00','2021-10-04 09:43:20'),(41,19,546,'2021-08-17 00:00:00','2021-11-28 00:00:00','2021-10-06 07:20:40');
/*!40000 ALTER TABLE `home_history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_image`
--

DROP TABLE IF EXISTS `home_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_id` int NOT NULL,
  `image_url` varchar(600) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_home_id_idx` (`home_id`),
  CONSTRAINT `image_home_id` FOREIGN KEY (`home_id`) REFERENCES `home` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_image`
--

LOCK TABLES `home_image` WRITE;
/*!40000 ALTER TABLE `home_image` DISABLE KEYS */;
INSERT INTO `home_image` VALUES (7,21,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(8,21,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(9,21,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(10,22,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(11,22,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(12,22,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(13,23,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(14,23,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(15,23,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(16,24,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(17,24,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(18,24,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(19,25,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(20,25,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(21,25,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(22,26,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(23,26,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(24,26,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(31,29,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(32,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(33,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(34,30,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(35,30,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(36,30,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(37,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(38,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(39,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(40,32,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(41,32,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(42,32,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(43,33,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(44,33,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(45,33,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(46,34,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(47,34,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(48,34,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(49,35,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(50,35,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(51,35,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(52,36,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(53,36,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(54,36,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(57,38,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(58,38,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(59,38,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(60,39,'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fimages%2Fthings%2Fhouse&psig=AOvVaw0lfsl2iEONzC7q3goVQ64n&ust=1632551742354000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJiOrqf_lvMCFQAAAAAdAAAAABAD'),(61,39,''),(62,39,''),(63,40,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(64,40,''),(65,40,''),(66,41,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(67,41,''),(68,41,''),(69,8,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(70,8,''),(71,8,''),(72,25,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(73,25,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(74,25,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(75,9,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(76,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(77,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(78,9,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(79,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(80,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(81,9,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(82,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(83,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(84,9,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(85,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(86,9,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(87,8,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(88,8,''),(89,8,''),(90,8,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(91,8,''),(92,8,''),(93,11,'https://play-lh.googleusercontent.com/xGN0ZdgAMy0P583EdSZMjn0oshWQDNza3WWjFSJgo2BxQViLKkPIwsDz9bDRHHzJSOs6'),(94,11,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(95,11,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(96,8,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(97,8,''),(98,8,''),(129,43,'Image'),(130,43,'2'),(131,43,'3'),(135,44,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(136,44,''),(137,44,''),(138,45,'1'),(139,45,'2'),(140,45,'3'),(144,46,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/suburban-house-royalty-free-image-1584972559.jpg?crop=1.00xw:0.752xh;0,0.120xh&resize=1200:*'),(145,46,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dezeen.com%2F2020%2F02%2F06%2Fniko-architect-house-landscape-russia-architecture%2F&psig=AOvVaw0iyiH3II3Xeub1yvhIpHiB&ust=1632765796711000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjcvN2cnfMCFQAAAAAdAAAAABAJ'),(146,46,''),(147,10,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(148,10,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(149,10,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(153,47,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(154,47,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(155,47,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(156,48,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(157,48,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(158,48,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(165,1,'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.webp'),(166,1,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dezeen.com%2F2020%2F02%2F06%2Fniko-architect-house-landscape-russia-architecture%2F&psig=AOvVaw0iyiH3II3Xeub1yvhIpHiB&ust=1632765796711000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjcvN2cnfMCFQAAAAAdAAAAABAJ'),(167,1,''),(168,19,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(169,19,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(170,19,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
/*!40000 ALTER TABLE `home_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_image_history_log`
--

DROP TABLE IF EXISTS `home_image_history_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_image_history_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `home_history_log_id` int NOT NULL,
  `image_url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_history_home_history_id_idx` (`home_history_log_id`),
  CONSTRAINT `image_history_home_history_id` FOREIGN KEY (`home_history_log_id`) REFERENCES `home_history_log` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_image_history_log`
--

LOCK TABLES `home_image_history_log` WRITE;
/*!40000 ALTER TABLE `home_image_history_log` DISABLE KEYS */;
INSERT INTO `home_image_history_log` VALUES (3,14,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(4,14,''),(5,14,''),(6,15,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(7,15,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(8,15,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(9,16,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(10,16,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(11,16,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(12,17,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(13,17,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(14,17,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(15,18,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(16,18,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(17,18,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(18,19,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(19,19,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(20,19,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(21,20,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(22,20,''),(23,20,''),(24,21,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(25,21,''),(26,21,''),(27,22,'https://play-lh.googleusercontent.com/xGN0ZdgAMy0P583EdSZMjn0oshWQDNza3WWjFSJgo2BxQViLKkPIwsDz9bDRHHzJSOs6'),(28,22,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(29,22,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(30,23,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(31,23,''),(32,23,''),(33,24,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(34,24,''),(35,24,''),(36,25,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(37,25,''),(38,25,''),(39,26,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(40,26,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(41,26,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(42,27,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(43,27,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(44,27,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(45,28,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(46,28,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(47,28,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(48,28,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(49,28,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(50,28,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(51,29,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(52,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(53,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(54,29,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(55,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(56,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(57,29,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(58,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(59,29,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(60,30,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(61,30,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(62,30,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(63,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(64,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(65,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(66,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(67,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(68,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(69,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(70,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(71,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(72,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(73,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(74,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(75,31,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(76,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(77,31,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(78,32,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(79,32,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(80,32,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(81,33,'Image'),(82,33,'2'),(83,33,'3'),(84,34,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(85,34,''),(86,34,''),(87,35,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/suburban-house-royalty-free-image-1584972559.jpg?crop=1.00xw:0.752xh;0,0.120xh&resize=1200:*'),(88,35,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dezeen.com%2F2020%2F02%2F06%2Fniko-architect-house-landscape-russia-architecture%2F&psig=AOvVaw0iyiH3II3Xeub1yvhIpHiB&ust=1632765796711000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjcvN2cnfMCFQAAAAAdAAAAABAJ'),(89,35,''),(90,36,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(91,36,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(92,37,'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aG91c2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),(93,37,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(94,37,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(95,38,'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.webp'),(96,39,'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.webp'),(97,39,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dezeen.com%2F2020%2F02%2F06%2Fniko-architect-house-landscape-russia-architecture%2F&psig=AOvVaw0iyiH3II3Xeub1yvhIpHiB&ust=1632765796711000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjcvN2cnfMCFQAAAAAdAAAAABAJ'),(98,39,''),(99,40,'https://q4g9y5a8.rocketcdn.me/wp-content/uploads/2020/02/home-banner-2020-02-min.webp'),(100,40,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.dezeen.com%2F2020%2F02%2F06%2Fniko-architect-house-landscape-russia-architecture%2F&psig=AOvVaw0iyiH3II3Xeub1yvhIpHiB&ust=1632765796711000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjcvN2cnfMCFQAAAAAdAAAAABAJ'),(101,40,''),(102,41,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(103,41,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(104,41,'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500');
/*!40000 ALTER TABLE `home_image_history_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `homeview`
--

DROP TABLE IF EXISTS `homeview`;
/*!50001 DROP VIEW IF EXISTS `homeview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `homeview` AS SELECT 
 1 AS `id`,
 1 AS `pricePerNight`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `country`,
 1 AS `street`,
 1 AS `city`,
 1 AS `zipCode`,
 1 AS `amenity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `_idx` (`user_id`),
  CONSTRAINT `host_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (1,1),(3,2),(2,3),(4,4),(5,5),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(16,15),(17,16),(15,17),(18,18),(19,19);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host_review`
--

DROP TABLE IF EXISTS `host_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `host_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `host_review_review_id_idx` (`review_id`),
  KEY `host_review_host_id_idx` (`host_id`),
  CONSTRAINT `host_review_host_id` FOREIGN KEY (`host_id`) REFERENCES `host` (`id`),
  CONSTRAINT `host_review_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host_review`
--

LOCK TABLES `host_review` WRITE;
/*!40000 ALTER TABLE `host_review` DISABLE KEYS */;
INSERT INTO `host_review` VALUES (2,1,1),(3,5,1);
/*!40000 ALTER TABLE `host_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) DEFAULT NULL,
  `msg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Anders','asd'),(2,'Anders','sad'),(3,'Anders','sadasd'),(4,'Anders','sadasdasd'),(5,'Anders','HEJ HEJ HEJ HEJ'),(6,'NotLoggedIn','HEJ'),(7,'NotLoggedIn','HEJ'),(8,'NotLoggedIn','HEJ'),(9,'NotLoggedIn','HEJ'),(10,'NotLoggedIn','HEJ'),(11,'NotLoggedIn','HEJ'),(12,'NotLoggedIn','HEJ'),(13,'NotLoggedIn','HEJ'),(14,'NotLoggedIn','HEJ'),(15,'NotLoggedIn','HEJ'),(16,'Kamilla','STOP IT!!!'),(17,'Anders','Jag älskar att trolla haha'),(18,'Kamilla','Jag också haha'),(19,'Kamilla','Anders, är du kvar?');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_vadsadiew`
--

DROP TABLE IF EXISTS `new_vadsadiew`;
/*!50001 DROP VIEW IF EXISTS `new_vadsadiew`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_vadsadiew` AS SELECT 
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `id`,
 1 AS `pricePerNight`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `country`,
 1 AS `street`,
 1 AS `city`,
 1 AS `amenity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `newads_view`
--

DROP TABLE IF EXISTS `newads_view`;
/*!50001 DROP VIEW IF EXISTS `newads_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `newads_view` AS SELECT 
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `renter`
--

DROP TABLE IF EXISTS `renter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `renter_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter`
--

LOCK TABLES `renter` WRITE;
/*!40000 ALTER TABLE `renter` DISABLE KEYS */;
INSERT INTO `renter` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(16,15),(17,16),(15,17),(18,18),(19,19);
/*!40000 ALTER TABLE `renter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renter_review`
--

DROP TABLE IF EXISTS `renter_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renter_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review_id` int NOT NULL,
  `renter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `renter_review_renter_id_idx` (`renter_id`),
  KEY `renter_review_review_id_idx` (`review_id`),
  CONSTRAINT `renter_review_renter_id` FOREIGN KEY (`renter_id`) REFERENCES `renter` (`id`),
  CONSTRAINT `renter_review_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter_review`
--

LOCK TABLES `renter_review` WRITE;
/*!40000 ALTER TABLE `renter_review` DISABLE KEYS */;
INSERT INTO `renter_review` VALUES (4,3,4),(14,2,1),(15,28,1);
/*!40000 ALTER TABLE `renter_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creator_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` varchar(45) NOT NULL,
  `created_date` timestamp NOT NULL,
  `is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_booking_id_idx` (`booking_id`),
  KEY `review_creator_id_idx` (`creator_id`),
  CONSTRAINT `review_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking_detail` (`id`),
  CONSTRAINT `review_creator_id` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,4,2,3,'Okay I guess...','2021-09-15 10:16:18',0),(2,4,2,1,'Worst EVER!!!','2021-11-10 23:00:00',0),(3,1,2,5,'FUCKING AMAZING!!!!!!!!!!!!!!!!!!!!!!','2021-09-29 07:02:13',0),(4,1,2,4,'Decent renter...','2021-09-29 11:55:39',0),(5,1,2,5,'Great host!','2021-09-29 11:56:44',1),(26,1,2,5,'Fantastic','2021-10-04 12:44:49',0),(27,1,2,4,'Pretty good','2021-10-04 12:58:48',0),(28,1,2,4,'Best!','2021-10-04 13:06:54',0);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Kamilla','Johansson','kam@gmail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(2,'Andrew','Hamish','anha@gmail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(3,'Robert','Linder','rolling@gmail.com','09d8409dfa0ba399cf95c6510b579542aba7b6230c6354dfb7090e9a9c0fe3d1'),(4,'Anders','SJ','asj@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(5,'Wendy','Arnoldsson','wean@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(8,'Hamish','Washington','hawa@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(9,'Arnold','Arnoldsson','arn@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(10,'Joey','Quatryl','jq@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(11,'Karen','Boomer','iwanttotalktoyourmanager@me.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(12,'Katarina','Williams','katams@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(13,'John','Adams','ja@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(14,'Polly','Poppins','pop@mail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(15,'Alex','E','apa','67b176705b46206614219f47a05aee7ae6a3edbe850bbbe214c536b989aea4d2'),(16,'Manila','Reese','mr@mail.com','80084bf2fba02475726feb2cab2d8215eab14bc6bdd8bfb2c8151257032ecd8b'),(17,'Paul','Jones','pj@mail.com','b039179a8a4ce2c252aa6f2f25798251c19b75fc1508d9d511a191e0487d64a7'),(18,'Lauritz','Persson','banan','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67'),(19,'Theodor','Björnslätt','theodor.b.1995@gmail.com','a03ab19b866fc585b5cb1812a2f63ca861e7e7643ee5d43fd7106b623725fd67');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_AFTER_INSERT` AFTER INSERT ON `user` FOR EACH ROW BEGIN
INSERT INTO db_mysql.renter (user_id) values(NEW.id);
INSERT INTO db_mysql.host (user_id) values(NEW.id);
INSERT INTO db_mysql.wallet (user_id, token_amount) values(NEW.id, 10000); 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token_amount` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wallet_user_id_idx` (`user_id`),
  CONSTRAINT `wallet_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,17,9900),(2,18,10000),(3,19,10000),(4,1,9400),(5,4,10000);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `homeview`
--

/*!50001 DROP VIEW IF EXISTS `homeview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `homeview` AS select `home`.`id` AS `id`,`home`.`price_per_night` AS `pricePerNight`,`home`.`start_date` AS `startDate`,`home`.`end_date` AS `endDate`,`address`.`country` AS `country`,`address`.`street` AS `street`,`address`.`city` AS `city`,`address`.`zip_code` AS `zipCode`,`amenity_enum`.`amenity` AS `amenity` from ((`home` join `address` on((`home`.`id` = `address`.`id`))) join `amenity_enum` on((`home`.`id` = `amenity_enum`.`home_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_vadsadiew`
--

/*!50001 DROP VIEW IF EXISTS `new_vadsadiew`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_vadsadiew` AS select `home`.`id` AS `id` from ((`home` join `address` on((`home`.`id` = `address`.`id`))) join `amenity_enum` on((`amenity_enum`.`home_id` = `home`.`id`))) order by `home`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `home`.`id` AS `id`,`home`.`price_per_night` AS `pricePerNight`,`home`.`start_date` AS `startDate`,`home`.`end_date` AS `endDate`,`address`.`country` AS `country`,`address`.`street` AS `street`,`address`.`city` AS `city`,`amenity_enum`.`amenity` AS `amenity` from ((`home` join `address` on((`home`.`id` = `address`.`id`))) join `amenity_enum` on((`home`.`id` = `amenity_enum`.`home_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `newads_view`
--

/*!50001 DROP VIEW IF EXISTS `newads_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `newads_view` AS select `home`.`id` AS `id` from ((`home` join `address` on((`home`.`id` = `address`.`id`))) join `amenity_enum` on((`amenity_enum`.`home_id` = `home`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-06 11:27:40

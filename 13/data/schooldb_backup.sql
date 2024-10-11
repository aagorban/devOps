-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: SchoolDB
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Children`
--

DROP TABLE IF EXISTS `Children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Children` (
  `child_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `year_of_entry` year(4) NOT NULL,
  `age` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`child_id`),
  KEY `institution_id` (`institution_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `Children_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `Institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `Children_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`class_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Children`
--

LOCK TABLES `Children` WRITE;
/*!40000 ALTER TABLE `Children` DISABLE KEYS */;
INSERT INTO `Children` VALUES (1,'Іван','Петренко','2012-05-15',2019,12,1,1),(2,'Ольга','Шевченко','2015-07-20',2020,9,1,2),(3,'Марія','Коваленко','2018-03-10',2023,6,2,3),(4,'Андрій','Сидоренко','2011-01-25',2018,13,3,4),(5,'Анастасія','Іванова','2013-11-30',2019,10,3,5);
/*!40000 ALTER TABLE `Children` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classes`
--

DROP TABLE IF EXISTS `Classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution_id` int(11) NOT NULL,
  `direction` enum('Mathematics','Biology and Chemistry','Language Studies') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `institution_id` (`institution_id`),
  CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `Institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classes`
--

LOCK TABLES `Classes` WRITE;
/*!40000 ALTER TABLE `Classes` DISABLE KEYS */;
INSERT INTO `Classes` VALUES (1,'1-А клас',1,'Mathematics'),(2,'Біологія 9 клас',1,'Biology and Chemistry'),(3,'Група \"Малята\"',2,'Language Studies'),(4,'5-Б клас',3,'Mathematics'),(5,'Мовні студії',3,'Language Studies');
/*!40000 ALTER TABLE `Classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Institutions`
--

DROP TABLE IF EXISTS `Institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Institutions` (
  `institution_id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution_type` enum('School','Kindergarten') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`institution_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Institutions`
--

LOCK TABLES `Institutions` WRITE;
/*!40000 ALTER TABLE `Institutions` DISABLE KEYS */;
INSERT INTO `Institutions` VALUES (1,'Школа №1','School','вул. Шевченка, 10, Київ'),(2,'Дитячий садок \"Сонечко\"','Kindergarten','вул. Лесі Українки, 5, Львів'),(3,'Гімназія \"Обрій\"','School','вул. Франка, 12, Харків');
/*!40000 ALTER TABLE `Institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parents`
--

DROP TABLE IF EXISTS `Parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parents` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `child_id` int(11) NOT NULL,
  `tuition_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`parent_id`),
  KEY `child_id` (`child_id`),
  CONSTRAINT `Parents_ibfk_1` FOREIGN KEY (`child_id`) REFERENCES `Children` (`child_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parents`
--

LOCK TABLES `Parents` WRITE;
/*!40000 ALTER TABLE `Parents` DISABLE KEYS */;
INSERT INTO `Parents` VALUES (1,'Олександр','Петренко',1,1500.00),(2,'Наталія','Шевченко',2,1300.00),(3,'Людмила','Коваленко',3,1100.00),(4,'Василь','Сидоренко',4,1600.00),(5,'Оксана','Іванова',5,1200.00);
/*!40000 ALTER TABLE `Parents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 13:45:42

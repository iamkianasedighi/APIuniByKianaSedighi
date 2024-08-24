-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: uni
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLASSinfo`
--

DROP TABLE IF EXISTS `CLASSinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLASSinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `teacher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher` (`teacher`),
  CONSTRAINT `CLASSinfo_ibfk_1` FOREIGN KEY (`teacher`) REFERENCES `PROFinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLASSinfo`
--

LOCK TABLES `CLASSinfo` WRITE;
/*!40000 ALTER TABLE `CLASSinfo` DISABLE KEYS */;
INSERT INTO `CLASSinfo` VALUES (5,'sakhteman_dade',1),(6,'tarahi_algoritm',2),(7,'riazi1',4),(8,'riazi2',4);
/*!40000 ALTER TABLE `CLASSinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENROLLinfo`
--

DROP TABLE IF EXISTS `ENROLLinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENROLLinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STDid` int(11) DEFAULT NULL,
  `CLASSid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `STDid` (`STDid`),
  KEY `CLASSid` (`CLASSid`),
  CONSTRAINT `ENROLLinfo_ibfk_1` FOREIGN KEY (`STDid`) REFERENCES `STDinfo` (`id`),
  CONSTRAINT `ENROLLinfo_ibfk_2` FOREIGN KEY (`CLASSid`) REFERENCES `CLASSinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENROLLinfo`
--

LOCK TABLES `ENROLLinfo` WRITE;
/*!40000 ALTER TABLE `ENROLLinfo` DISABLE KEYS */;
INSERT INTO `ENROLLinfo` VALUES (1,1,5),(2,2,5),(3,3,6),(4,4,8);
/*!40000 ALTER TABLE `ENROLLinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROFinfo`
--

DROP TABLE IF EXISTS `PROFinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROFinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROFinfo`
--

LOCK TABLES `PROFinfo` WRITE;
/*!40000 ALTER TABLE `PROFinfo` DISABLE KEYS */;
INSERT INTO `PROFinfo` VALUES (1,'prof1'),(2,'prof2'),(3,'prof3'),(4,'prof4');
/*!40000 ALTER TABLE `PROFinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STDinfo`
--

DROP TABLE IF EXISTS `STDinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STDinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STDinfo`
--

LOCK TABLES `STDinfo` WRITE;
/*!40000 ALTER TABLE `STDinfo` DISABLE KEYS */;
INSERT INTO `STDinfo` VALUES (1,'kiana',901123),(2,'ali',912123),(3,'sara',912123),(4,'reza',901123),(5,'hhh\\',8888),(6,'hhhhhhhhh]kjjg',6666),(7,'hh',0),(8,'ali',912502222),(9,'ali2',22222),(10,'reza',22222),(11,'lila',99999),(12,'schmidt',9876543),(13,'paul',88888),(14,'sanaz',66666),(15,'olivia',333333),(16,'soontobeaprof',88888),(17,'jay',9999),(18,'samira',7777),(19,'zahra',8888),(20,'ura',8888),(21,'olia',333),(22,'jafar',88888),(23,'lili',9999);
/*!40000 ALTER TABLE `STDinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 12:40:01

-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: branch_and_checks
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id_Branch` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) NOT NULL,
  `house` varchar(45) NOT NULL,
  `City_id_City` int NOT NULL,
  `Tel` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Branch`,`City_id_City`),
  KEY `fk_Branch_City_idx` (`City_id_City`),
  CONSTRAINT `fk_Branch_City` FOREIGN KEY (`City_id_City`) REFERENCES `city` (`id_City`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Строителей','26А',1,'89024568565'),(2,'Пушкина','10',3,'89085479254'),(3,'Сурова','15Б',7,'89058896524'),(4,'Горького','220В',6,'89258476525'),(5,'Филатова','37',7,'89025658731');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checks`
--

DROP TABLE IF EXISTS `checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checks` (
  `idChecks` int NOT NULL AUTO_INCREMENT,
  `Products_id_Products` int NOT NULL,
  `Count` int NOT NULL,
  `Date` date NOT NULL,
  `Branch_id_Branch` int NOT NULL,
  PRIMARY KEY (`idChecks`,`Products_id_Products`,`Branch_id_Branch`),
  KEY `fk_Checks_Products1_idx` (`Products_id_Products`),
  KEY `fk_Checks_Branch1_idx` (`Branch_id_Branch`),
  CONSTRAINT `fk_Checks_Branch1` FOREIGN KEY (`Branch_id_Branch`) REFERENCES `branch` (`id_Branch`),
  CONSTRAINT `fk_Checks_Products1` FOREIGN KEY (`Products_id_Products`) REFERENCES `products` (`id_Products`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checks`
--

LOCK TABLES `checks` WRITE;
/*!40000 ALTER TABLE `checks` DISABLE KEYS */;
INSERT INTO `checks` VALUES (1,1,2,'2020-12-20',3),(2,7,1,'2020-12-20',3),(3,10,4,'2020-12-20',3),(4,3,1,'2020-12-20',3),(5,5,3,'2020-12-20',3),(6,3,2,'2020-12-20',1),(7,4,1,'2020-12-20',1),(8,5,3,'2020-12-20',1),(9,12,5,'2020-12-21',1),(10,5,2,'2020-12-21',1),(11,9,1,'2020-12-21',2),(12,11,4,'2020-12-21',2),(13,4,6,'2020-12-21',2),(14,6,1,'2020-12-21',2),(15,1,3,'2020-12-23',4),(16,1,3,'2020-12-23',4),(17,10,1,'2020-12-23',4),(18,11,3,'2020-12-23',5),(19,12,2,'2020-12-23',5),(20,5,4,'2020-12-23',5);
/*!40000 ALTER TABLE `checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id_City` int NOT NULL AUTO_INCREMENT,
  `City` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_City`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Абаза'),(2,'	Абакан'),(3,'Белый'),(4,'Болгар'),(5,'Владимир'),(6,'Москва'),(7,'Ульяновск');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_Products` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`id_Products`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Капучино',0),(2,'Латте',0),(3,'Эспрессо',0),(4,'Капуоранж',0),(5,'Американно',0),(6,'Кофе со льдом',0),(7,'Кофе с лимоном',0),(8,'Гляссе',0),(9,'Кофе с ромом',0),(10,'Кофе с коньяком',0),(11,'Кофе с ликером Бейлиз',0),(12,'Кофе с виски',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_Users` int NOT NULL AUTO_INCREMENT,
  `Login` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Users`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3'),(2,'user1','b144ef4a51d09eb8878c77bdc4ee8e6e'),(3,'user2','bfd59291e825b5f2bbf1eb76569f8fe7');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 11:00:50

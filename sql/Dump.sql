-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: baza
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm` (
  `IDalarm` int NOT NULL AUTO_INCREMENT,
  `vreme` datetime NOT NULL,
  `ponavljanje` int DEFAULT NULL,
  `pesma` int NOT NULL,
  `korisnik` int NOT NULL,
  PRIMARY KEY (`IDalarm`),
  KEY `FK_IDpesma_idx` (`pesma`),
  KEY `FK_IDkorisnik_idx` (`korisnik`),
  CONSTRAINT `FK_IDkorisnik_alarm` FOREIGN KEY (`korisnik`) REFERENCES `korisnik` (`IDkorisnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_IDpesma_alarm` FOREIGN KEY (`pesma`) REFERENCES `pesma` (`IDpesma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm`
--

LOCK TABLES `alarm` WRITE;
/*!40000 ALTER TABLE `alarm` DISABLE KEYS */;
INSERT INTO `alarm` VALUES (1,'2021-05-05 20:30:00',NULL,1,2),(3,'2021-11-07 10:30:25',NULL,11,1),(12,'2021-03-08 08:00:00',75,1,4),(14,'2021-04-04 11:07:18',NULL,11,1),(15,'2021-03-03 10:08:59',NULL,11,1),(16,'2021-03-03 10:04:06',NULL,11,1),(17,'2021-05-05 15:10:12',NULL,11,2),(29,'2021-02-24 16:01:20',NULL,11,2),(33,'2021-03-03 06:01:20',NULL,9,1),(35,'2021-04-04 07:52:17',NULL,9,1),(36,'2021-02-24 20:28:25',NULL,9,1),(37,'2021-02-24 20:50:53',NULL,1,1),(38,'2021-02-24 20:31:44',NULL,1,1),(39,'2021-02-24 21:01:54',NULL,1,1),(40,'2021-02-24 20:50:53',NULL,1,1),(41,'2021-02-24 20:53:00',2,1,1),(42,'2021-02-24 21:18:00',1,1,1),(43,'2021-02-24 21:26:00',1,1,1),(44,'2021-02-24 21:26:00',1,1,1),(45,'2021-02-24 21:29:00',1,1,1),(46,'2021-02-24 21:31:00',1,1,1),(47,'2021-02-24 21:35:00',1,1,1),(48,'2021-02-24 21:39:00',1,1,1),(49,'2021-02-24 22:09:13',NULL,9,1),(50,'2021-02-24 21:53:00',NULL,1,1);
/*!40000 ALTER TABLE `alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `IDkorisnik` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`IDkorisnik`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnik`
--

LOCK TABLES `korisnik` WRITE;
/*!40000 ALTER TABLE `korisnik` DISABLE KEYS */;
INSERT INTO `korisnik` VALUES (1,'julia','0710'),(2,'ana','0205'),(4,'bojan','0803');
/*!40000 ALTER TABLE `korisnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obaveza`
--

DROP TABLE IF EXISTS `obaveza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obaveza` (
  `IDobaveza` int NOT NULL AUTO_INCREMENT,
  `pocetak` datetime NOT NULL,
  `trajanje` datetime NOT NULL,
  `opis` varchar(100) NOT NULL,
  `lokacija` varchar(45) DEFAULT NULL,
  `korisnik` int NOT NULL,
  `alarm` int DEFAULT NULL,
  PRIMARY KEY (`IDobaveza`),
  KEY `FK_IDkorisnik_idx` (`korisnik`),
  KEY `FK_IDalarm_idx` (`alarm`),
  CONSTRAINT `FK_IDalarm_obaveza` FOREIGN KEY (`alarm`) REFERENCES `alarm` (`IDalarm`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_IDkorisnik_obaveza` FOREIGN KEY (`korisnik`) REFERENCES `korisnik` (`IDkorisnik`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obaveza`
--

LOCK TABLES `obaveza` WRITE;
/*!40000 ALTER TABLE `obaveza` DISABLE KEYS */;
INSERT INTO `obaveza` VALUES (1,'2021-05-05 21:30:00','2021-05-05 23:00:00','rucak','Bregalnicka 17',2,NULL),(2,'2021-03-03 14:30:00','2021-03-03 15:30:00','rodjendan','Molerova 20',1,NULL),(5,'2022-03-02 14:30:36','2022-03-02 18:30:36','neki opis','Milesevska 30',1,NULL),(23,'2021-02-24 22:10:59','2021-02-24 23:15:59','kkk','Molerova 35',1,49);
/*!40000 ALTER TABLE `obaveza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pesma`
--

DROP TABLE IF EXISTS `pesma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pesma` (
  `IDpesma` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  PRIMARY KEY (`IDpesma`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pesma`
--

LOCK TABLES `pesma` WRITE;
/*!40000 ALTER TABLE `pesma` DISABLE KEYS */;
INSERT INTO `pesma` VALUES (1,'ringtone iphone'),(2,'ringtone samsung'),(4,'padezi'),(5,'arabella'),(6,'andjele'),(8,'romale romali'),(9,'happy'),(10,'acdc'),(11,'harvey spector playlist'),(12,'r u mine'),(13,'himna srbije');
/*!40000 ALTER TABLE `pesma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reprodukcija`
--

DROP TABLE IF EXISTS `reprodukcija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reprodukcija` (
  `Br` int NOT NULL AUTO_INCREMENT,
  `pesma` int NOT NULL,
  `korisnik` int NOT NULL,
  PRIMARY KEY (`Br`),
  KEY `FK_pesma_reprodukcija_idx` (`pesma`),
  KEY `FK_korisnik_reprodukcija_idx` (`korisnik`),
  CONSTRAINT `FK_korisnik_reprodukcija` FOREIGN KEY (`korisnik`) REFERENCES `korisnik` (`IDkorisnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pesma_reprodukcija` FOREIGN KEY (`pesma`) REFERENCES `pesma` (`IDpesma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reprodukcija`
--

LOCK TABLES `reprodukcija` WRITE;
/*!40000 ALTER TABLE `reprodukcija` DISABLE KEYS */;
INSERT INTO `reprodukcija` VALUES (1,4,4),(2,5,2),(3,5,2),(4,6,1),(107,8,1),(108,9,1),(109,10,2),(110,11,1),(180,1,1),(181,1,1),(182,1,1),(183,1,1),(184,1,1),(185,12,1),(186,13,1),(187,1,1);
/*!40000 ALTER TABLE `reprodukcija` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-25 10:01:53

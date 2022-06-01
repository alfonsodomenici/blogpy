CREATE DATABASE  IF NOT EXISTS `db_post` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_post`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_post
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idpost` int NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,'che bello','2022-04-27 14:32:22'),(2,1,'ma neanche per sognoi','2022-04-27 14:32:22'),(3,2,'okok','2022-04-27 14:32:22'),(4,2,'ko ko ','2022-04-27 14:52:22'),(5,2,'nullaaaaa...','2022-04-27 14:12:22'),(6,4,'solo un commento','2022-04-27 14:32:22'),(7,5,'eh gia\'...','2022-04-27 14:31:22'),(8,5,'a beh...','2022-04-27 14:22:22'),(9,5,'ma si....','2022-04-27 14:12:22');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2022-04-20 13:28:31','esempio1 db_post','questo e\' il primo post scritto in workbench'),(2,'2022-04-20 13:28:31','buongiorno flask','contenuto di biuongriono flask weoi jskfvuh wsifu hrefosh fvoewrh oewgfh wour hgf3owf hwo9f hwo8e hfows'),(4,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(5,'2022-04-20 13:28:31','forse funziona!!! ma per carita\'','neanche morto che parte sto disgraziato!!!....'),(6,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(7,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(8,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(9,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(10,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(11,'2022-04-20 13:28:31','forse funziona!!!','neanche morto che parte sto disgraziato!!!....'),(13,'2022-04-22 08:55:13','qweqwe','werwer wr wer wer we r'),(14,'2022-04-27 13:11:43','niuovo post !!!!','quaesto inserito ora ,cds,movs vdijsv ');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-27 17:02:55

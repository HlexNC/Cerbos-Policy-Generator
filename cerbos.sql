use cerbos;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cerbos
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
-- Table structure for table `attr_schema_defs`
--

DROP TABLE IF EXISTS `attr_schema_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attr_schema_defs` (
  `id` varchar(255) NOT NULL,
  `definition` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attr_schema_defs`
--

LOCK TABLES `attr_schema_defs` WRITE;
/*!40000 ALTER TABLE `attr_schema_defs` DISABLE KEYS */;
/*!40000 ALTER TABLE `attr_schema_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` bigint NOT NULL,
  `kind` varchar(128) NOT NULL,
  `name` varchar(1024) NOT NULL,
  `version` varchar(128) NOT NULL,
  `scope` varchar(512) DEFAULT NULL,
  `description` text,
  `disabled` tinyint(1) DEFAULT '0',
  `definition` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (-8114387641986969117,'RESOURCE','country','1','','',0,_binary '\napi.cerbos.dev/v1\"7\Zÿø\á\ÞÜ‰\Ôõƒ\"resource.country.v1*resource.country.v1*\ncountry1\"T\nread\nlist\ZSTUDENT\ZADMIN_STAFF\ZFACULTY\ZUSER\"\n\"request.principal.id==\'989\'(\"\n*\Z	SYS_ADMIN\Z	DEVELOPER('),(-7314743556470024587,'RESOURCE','corporateLegalType','1','','',0,_binary '\napi.cerbos.dev/v1\"M\Z€ù\á\ÞÜ‰\Ôõƒ\"resource.corporateLegalType.v1*resource.corporateLegalType.v1*^\ncorporateLegalType1\"3\nread\nlist\ZSTUDENT\ZADMIN_STAFF\ZFACULTY\ZUSER(\"\n*\Z	SYS_ADMIN(');
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_ancestor`
--

DROP TABLE IF EXISTS `policy_ancestor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_ancestor` (
  `policy_id` bigint NOT NULL,
  `ancestor_id` bigint NOT NULL,
  PRIMARY KEY (`policy_id`,`ancestor_id`),
  CONSTRAINT `policy_ancestor_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_ancestor`
--

LOCK TABLES `policy_ancestor` WRITE;
/*!40000 ALTER TABLE `policy_ancestor` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_ancestor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_dependency`
--

DROP TABLE IF EXISTS `policy_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_dependency` (
  `policy_id` bigint NOT NULL,
  `dependency_id` bigint NOT NULL,
  PRIMARY KEY (`policy_id`,`dependency_id`),
  CONSTRAINT `policy_dependency_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `policy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_dependency`
--

LOCK TABLES `policy_dependency` WRITE;
/*!40000 ALTER TABLE `policy_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_revision`
--

DROP TABLE IF EXISTS `policy_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_revision` (
  `revision_id` int NOT NULL AUTO_INCREMENT,
  `action` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `id` bigint NOT NULL,
  `kind` varchar(128) DEFAULT NULL,
  `name` varchar(1024) DEFAULT NULL,
  `version` varchar(128) DEFAULT NULL,
  `scope` varchar(512) DEFAULT NULL,
  `description` text,
  `disabled` tinyint(1) DEFAULT NULL,
  `definition` blob,
  `update_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_revision`
--

LOCK TABLES `policy_revision` WRITE;
/*!40000 ALTER TABLE `policy_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_revision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 15:31:11

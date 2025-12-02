/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ej1
-- ------------------------------------------------------
-- Server version	11.4.7-MariaDB-0ubuntu0.25.04.1

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
-- Table structure for table `asunto`
--

DROP TABLE IF EXISTS `asunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asunto` (
  `num_exped` int(11) NOT NULL AUTO_INCREMENT,
  `f_inicio` date NOT NULL,
  `f_archivo` date DEFAULT NULL,
  `f_finalizacion` date DEFAULT NULL,
  `estado` varchar(100) NOT NULL,
  `dni_cliente` varchar(100) NOT NULL,
  PRIMARY KEY (`num_exped`),
  KEY `asunto_cliente_FK` (`dni_cliente`),
  CONSTRAINT `asunto_cliente_FK` FOREIGN KEY (`dni_cliente`) REFERENCES `cliente` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asunto`
--

LOCK TABLES `asunto` WRITE;
/*!40000 ALTER TABLE `asunto` DISABLE KEYS */;
INSERT INTO `asunto` VALUES
(1,'2025-11-28','2025-11-30','2026-11-28','bien','54602080b');
/*!40000 ALTER TABLE `asunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asunto_procurador`
--

DROP TABLE IF EXISTS `asunto_procurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `asunto_procurador` (
  `dni_procurador` varchar(100) NOT NULL,
  `num_expediente` int(11) NOT NULL,
  KEY `asunto_procurador_asunto_FK` (`num_expediente`),
  KEY `asunto_procurador_procurador_FK` (`dni_procurador`),
  CONSTRAINT `asunto_procurador_asunto_FK` FOREIGN KEY (`num_expediente`) REFERENCES `asunto` (`num_exped`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `asunto_procurador_procurador_FK` FOREIGN KEY (`dni_procurador`) REFERENCES `procurador` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asunto_procurador`
--

LOCK TABLES `asunto_procurador` WRITE;
/*!40000 ALTER TABLE `asunto_procurador` DISABLE KEYS */;
INSERT INTO `asunto_procurador` VALUES
('54402081n',1);
/*!40000 ALTER TABLE `asunto_procurador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `dni` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `movil` varchar(100) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `movil` (`movil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES
('54602080b','hec','tor','123456789');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procurador`
--

DROP TABLE IF EXISTS `procurador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `procurador` (
  `dni` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `movil` varchar(100) NOT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `movil` (`movil`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procurador`
--

LOCK TABLES `procurador` WRITE;
/*!40000 ALTER TABLE `procurador` DISABLE KEYS */;
INSERT INTO `procurador` VALUES
('54402081n','tor','zfgdxfhscfh','987654321');
/*!40000 ALTER TABLE `procurador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-12-02 12:43:38

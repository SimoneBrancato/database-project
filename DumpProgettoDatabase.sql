CREATE DATABASE  IF NOT EXISTS `compagniasoftware` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `compagniasoftware`;
-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: compagniasoftware
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `bug`
--

DROP TABLE IF EXISTS `bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bug` (
  `titolo` varchar(40) NOT NULL,
  `nomesoftware` varchar(20) NOT NULL,
  `versionesoftware` varchar(10) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `priorità` int NOT NULL,
  `stato` varchar(20) NOT NULL,
  PRIMARY KEY (`titolo`,`nomesoftware`,`versionesoftware`),
  KEY `nomesoftware` (`nomesoftware`,`versionesoftware`),
  CONSTRAINT `bug_ibfk_1` FOREIGN KEY (`nomesoftware`, `versionesoftware`) REFERENCES `versionesoftware` (`nomesoftware`, `versione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES ('Dati inconsistenti','InstaAnalysis','1.2','Il menù ha dati inconsistenti',2,'Risolto'),('Errori grafici','InstaAnalysis','1.5','La grafica presenta artefatti',2,'Aperto'),('Fatal error','InstaAnalysis','1.2','Se clicco execute ricevo fatal error',3,'Risolto'),('Runtime error','InstaAnalysis','1.2','Nel loading ho dei runtime error',2,'Risolto');
/*!40000 ALTER TABLE `bug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `partitaiva` bigint NOT NULL,
  `azienda` varchar(30) NOT NULL,
  `sede` varchar(50) NOT NULL,
  PRIMARY KEY (`partitaiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (12345678910,'Marconi S.r.l.','via Roma 21, Milano'),(32157383548,'Facebook Inc.','via Senigallia 44, Roma'),(47428823111,'Advanced Micro Devices','via Scotti 16, Paternò'),(49300320583,'Apple Inc.','via Garibaldi 99, Napoli'),(74535848493,'Ebay Company','via Einaudi 64, Roma'),(89694949332,'F.lli Falcone Auto','via Borgo 3, Catania');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emissionestipendio`
--

DROP TABLE IF EXISTS `emissionestipendio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emissionestipendio` (
  `impiegato` int NOT NULL,
  `dataemissione` date NOT NULL,
  `importo` int NOT NULL,
  PRIMARY KEY (`impiegato`,`dataemissione`),
  CONSTRAINT `emissionestipendio_ibfk_1` FOREIGN KEY (`impiegato`) REFERENCES `personale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emissionestipendio`
--

LOCK TABLES `emissionestipendio` WRITE;
/*!40000 ALTER TABLE `emissionestipendio` DISABLE KEYS */;
INSERT INTO `emissionestipendio` VALUES (2011,'2022-11-27',2540),(3458,'2022-11-27',2300),(6319,'2022-11-27',2400),(7532,'2022-11-27',1900),(7764,'2022-11-27',2330),(8988,'2022-11-27',2200);
/*!40000 ALTER TABLE `emissionestipendio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personale`
--

DROP TABLE IF EXISTS `personale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personale` (
  `id` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `ruolo` varchar(20) NOT NULL,
  `team` int NOT NULL,
  `stipendio` int NOT NULL,
  `tipologia` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `team` (`team`),
  CONSTRAINT `personale_ibfk_1` FOREIGN KEY (`team`) REFERENCES `team` (`codice`),
  CONSTRAINT `personale_chk_1` CHECK (((`tipologia` = _utf8mb4'Dipendente') or (`tipologia` = _utf8mb4'Consulente')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personale`
--

LOCK TABLES `personale` WRITE;
/*!40000 ALTER TABLE `personale` DISABLE KEYS */;
INSERT INTO `personale` VALUES (2011,'Lorenzo','Onesto','Software Engineer',444,1800,'Consulente'),(3458,'Marco','Forte','Product Manager',122,2000,'Dipendente'),(6319,'Simone','Brancato','Software Engineer',355,1800,'Dipendente'),(7532,'Enrico','Marchese','Team Lead',355,2500,'Dipendente'),(7764,'Giulia','Crisci','Software Engineer',122,1800,'Consulente'),(8988,'Elisa','Frattale','Tech Lead',444,2000,'Dipendente');
/*!40000 ALTER TABLE `personale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progetto`
--

DROP TABLE IF EXISTS `progetto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progetto` (
  `id` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(70) DEFAULT NULL,
  `stato` varchar(20) NOT NULL,
  `azienda` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `azienda` (`azienda`),
  CONSTRAINT `progetto_ibfk_1` FOREIGN KEY (`azienda`) REFERENCES `cliente` (`partitaiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progetto`
--

LOCK TABLES `progetto` WRITE;
/*!40000 ALTER TABLE `progetto` DISABLE KEYS */;
INSERT INTO `progetto` VALUES (101,'TurismNOW','App per il turismo internazionale','Sospeso',12345678910),(102,'AutoGO','App per noleggio automobili','In corso',12345678910),(103,'FlyOver','App per prenotazione di voli aerei','In corso',12345678910),(301,'Instagram Data','Si vogliono analizzare i dati di Instagram','In corso',32157383548),(302,'Whatsapp ADS','Si vogliono introdurre ADS su Whatsapp','In corso',32157383548),(401,'iPhone 16 UX/UI','Si vuole migliorare la UX/UI dei nuovi iPhone 16','Non avviato',49300320583),(501,'ECommerce Ebay','Modifiche all\'ecommerce di Ebay','In corso',74535848493),(701,'FalconeAuto','Sito per concessionaria F.lli Falcone','In corso',89694949332),(900,'Frontend AMD','Ridurre il debito tecnico lato frontend del sito di AMD','In corso',47428823111);
/*!40000 ALTER TABLE `progetto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `progettoteam`
--

DROP TABLE IF EXISTS `progettoteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `progettoteam` (
  `idprogetto` int NOT NULL,
  `codiceteam` int NOT NULL,
  PRIMARY KEY (`idprogetto`,`codiceteam`),
  KEY `codiceteam` (`codiceteam`),
  CONSTRAINT `progettoteam_ibfk_1` FOREIGN KEY (`idprogetto`) REFERENCES `progetto` (`id`),
  CONSTRAINT `progettoteam_ibfk_2` FOREIGN KEY (`codiceteam`) REFERENCES `team` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progettoteam`
--

LOCK TABLES `progettoteam` WRITE;
/*!40000 ALTER TABLE `progettoteam` DISABLE KEYS */;
INSERT INTO `progettoteam` VALUES (102,122),(301,122),(301,355),(101,444),(103,444),(302,444);
/*!40000 ALTER TABLE `progettoteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recapiti`
--

DROP TABLE IF EXISTS `recapiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recapiti` (
  `recapito` varchar(40) NOT NULL,
  `azienda` bigint NOT NULL,
  PRIMARY KEY (`recapito`),
  KEY `azienda` (`azienda`),
  CONSTRAINT `recapiti_ibfk_1` FOREIGN KEY (`azienda`) REFERENCES `cliente` (`partitaiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recapiti`
--

LOCK TABLES `recapiti` WRITE;
/*!40000 ALTER TABLE `recapiti` DISABLE KEYS */;
INSERT INTO `recapiti` VALUES ('contact@marconi.com',12345678910),('management@marconi.com',12345678910),('info@facebook.com',32157383548),('marketing@amd.com',47428823111),('assistant@apple.com',49300320583),('support@ebay.com',74535848493),('falconeauto@gmail.com',89694949332);
/*!40000 ALTER TABLE `recapiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software` (
  `nome` varchar(20) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `progetto` int NOT NULL,
  PRIMARY KEY (`nome`),
  KEY `progetto` (`progetto`),
  CONSTRAINT `software_ibfk_1` FOREIGN KEY (`progetto`) REFERENCES `progetto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES ('AMD-CORE','Core system AMD',900),('BackendTN','Backend per TourismNOW',101),('InstaAnalysis','Software di analisi dati per Instagram',301),('User Interface Ebay','Componente frontend Ebay',501),('WhatsAds','Software per aggiunta ADS su Whatsapp',302),('WhatsPick','Software per profilazione dati utenti',302);
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softwareteam`
--

DROP TABLE IF EXISTS `softwareteam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `softwareteam` (
  `nomesoftware` varchar(20) NOT NULL,
  `codiceteam` int NOT NULL,
  PRIMARY KEY (`nomesoftware`,`codiceteam`),
  KEY `codiceteam` (`codiceteam`),
  CONSTRAINT `softwareteam_ibfk_1` FOREIGN KEY (`nomesoftware`) REFERENCES `software` (`nome`),
  CONSTRAINT `softwareteam_ibfk_2` FOREIGN KEY (`codiceteam`) REFERENCES `team` (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softwareteam`
--

LOCK TABLES `softwareteam` WRITE;
/*!40000 ALTER TABLE `softwareteam` DISABLE KEYS */;
INSERT INTO `softwareteam` VALUES ('InstaAnalysis',122),('InstaAnalysis',355),('BackendTN',444),('WhatsAds',444),('WhatsPick',444);
/*!40000 ALTER TABLE `softwareteam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `codice` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `manager` int NOT NULL,
  `descrizione` varchar(70) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `manager` (`manager`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`manager`) REFERENCES `personale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (122,'Distribuited System',3458,'Specializzato nello sviluppo di sistemi distribuiti'),(355,'Data Analysis',7532,'Specialisti nell\'analisi dati'),(444,'Developers',8988,'Programmatori specializzati');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versionesoftware`
--

DROP TABLE IF EXISTS `versionesoftware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versionesoftware` (
  `nomesoftware` varchar(20) NOT NULL,
  `versione` varchar(10) NOT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `datarilascio` date NOT NULL,
  PRIMARY KEY (`nomesoftware`,`versione`),
  CONSTRAINT `versionesoftware_ibfk_1` FOREIGN KEY (`nomesoftware`) REFERENCES `software` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versionesoftware`
--

LOCK TABLES `versionesoftware` WRITE;
/*!40000 ALTER TABLE `versionesoftware` DISABLE KEYS */;
INSERT INTO `versionesoftware` VALUES ('BackendTN','5.7.5','Set up factory','2024-02-25'),('InstaAnalysis','1.2','Funzionalità di base','2023-04-18'),('InstaAnalysis','1.3','Migliorato il design','2023-05-15'),('InstaAnalysis','1.4','Frontend implementato','2023-07-28'),('InstaAnalysis','1.5','Backend ridisegnato','2023-11-20'),('WhatsAds','1.5','Refactoring','2024-02-20'),('WhatsPick','0.1','Scaffolding','2023-12-20'),('WhatsPick','0.2','Basic Design','2024-02-02');
/*!40000 ALTER TABLE `versionesoftware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'compagniasoftware'
--

--
-- Dumping routines for database 'compagniasoftware'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-26 15:36:59

-- MySQL dump 10.13  Distrib 8.2.0, for Linux (aarch64)
--
-- Host: localhost    Database: eduOps
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Avis`
--

DROP TABLE IF EXISTS `Avis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Avis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `selectedCourse` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `syllabusProvided` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectivesClear` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentAligned` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseMaterialProvided` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contentRespected` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduleRespected` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overallSatisfaction` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additionalSuggestions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avis`
--

LOCK TABLES `Avis` WRITE;
/*!40000 ALTER TABLE `Avis` DISABLE KEYS */;
INSERT INTO `Avis` VALUES (1,'Anglais Technique','oui','oui','conforme','oui','oui','oui','grande','Claire',NULL);
/*!40000 ALTER TABLE `Avis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CahierDeTexte`
--

DROP TABLE IF EXISTS `CahierDeTexte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CahierDeTexte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idClasse` int NOT NULL,
  `titre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CahierDeTexte_idClasse_fkey` (`idClasse`),
  CONSTRAINT `CahierDeTexte_idClasse_fkey` FOREIGN KEY (`idClasse`) REFERENCES `Classe` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CahierDeTexte`
--

LOCK TABLES `CahierDeTexte` WRITE;
/*!40000 ALTER TABLE `CahierDeTexte` DISABLE KEYS */;
INSERT INTO `CahierDeTexte` VALUES (1,1,'cahier de texte de la quatrieme');
/*!40000 ALTER TABLE `CahierDeTexte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classe`
--

DROP TABLE IF EXISTS `Classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomClasse` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classe`
--

LOCK TABLES `Classe` WRITE;
/*!40000 ALTER TABLE `Classe` DISABLE KEYS */;
INSERT INTO `Classe` VALUES (1,'quatriemeC');
/*!40000 ALTER TABLE `Classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CoursDansCahierDetexte`
--

DROP TABLE IF EXISTS `CoursDansCahierDetexte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CoursDansCahierDetexte` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCours` datetime(3) NOT NULL,
  `heureDebut` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heureFin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idCahierDeTexte` int NOT NULL,
  `selectedCourse` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enseignant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CoursDansCahierDetexte_idCahierDeTexte_fkey` (`idCahierDeTexte`),
  CONSTRAINT `CoursDansCahierDetexte_idCahierDeTexte_fkey` FOREIGN KEY (`idCahierDeTexte`) REFERENCES `CahierDeTexte` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CoursDansCahierDetexte`
--

LOCK TABLES `CoursDansCahierDetexte` WRITE;
/*!40000 ALTER TABLE `CoursDansCahierDetexte` DISABLE KEYS */;
INSERT INTO `CoursDansCahierDetexte` VALUES (1,'2024-04-01 00:00:00.000','20:52','20:52',1,'SE','chap1','diop');
/*!40000 ALTER TABLE `CoursDansCahierDetexte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Syllabus`
--

DROP TABLE IF EXISTS `Syllabus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Syllabus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `annee` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomCours` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreHeures` int NOT NULL,
  `nombreCredits` int NOT NULL,
  `objectifGeneral` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objectifsSpecifiques` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `professeur` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `evaluation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Syllabus`
--

LOCK TABLES `Syllabus` WRITE;
/*!40000 ALTER TABLE `Syllabus` DISABLE KEYS */;
INSERT INTO `Syllabus` VALUES (1,'2','SE',36,4,'sfd','sfdsf','sfsf','sfdsd','sfdsfd');
/*!40000 ALTER TABLE `Syllabus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('ETUDIANT','ETUDIANT_RESPONSABLE','ENSEIGNANT','RESPONSABLE_DEPARTEMENT') COLLATE utf8mb4_unicode_ci NOT NULL,
  `idClasse` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`),
  UNIQUE KEY `User_username_key` (`username`),
  KEY `User_idClasse_fkey` (`idClasse`),
  CONSTRAINT `User_idClasse_fkey` FOREIGN KEY (`idClasse`) REFERENCES `Classe` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'zcx','AminaProf','Aminata','DIAGNE','passer','ENSEIGNANT',NULL),(2,'asda','AminaEtu','Aminata',NULL,'passer','ETUDIANT',1),(3,'asds','AminaResponsable','Aminata','ad','passer','ETUDIANT_RESPONSABLE',1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-12  1:14:28
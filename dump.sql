-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cineresa
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `utilisateurId` char(36) NOT NULL,
  PRIMARY KEY (`utilisateurId`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`utilisateurId`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('a7793897-3a8e-11ee-8d31-9671e606a27d'),('a77938a6-3a8e-11ee-8d31-9671e606a27d');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinemas` (
  `id` char(36) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `adresse` varchar(250) NOT NULL,
  `nbSalles` int(10) NOT NULL,
  `superUtilisateurId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `superUtilisateurId` (`superUtilisateurId`),
  CONSTRAINT `cinemas_ibfk_1` FOREIGN KEY (`superUtilisateurId`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES ('fbbb87c2-3a8f-11ee-8d1b-9671e606a27d','Pathé Mulhouse','5 rue du poteau 68000 MULHOUSE',6,'a77935c5-3a8e-11ee-8d31-9671e606a27d'),('fbbb897c-3a8f-11ee-8d1b-9671e606a27d','UGC Toulouse','18 route du sel 31000 TOULOUSE',8,'a779380e-3a8e-11ee-8d31-9671e606a27d'),('fbbb89f3-3a8f-11ee-8d1b-9671e606a27d','CGR Caen','4 avenue de la galette 14000 CAEN',4,'a7793885-3a8e-11ee-8d31-9671e606a27d');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `films` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `realisateur` varchar(250) NOT NULL,
  `duree` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'La cité de la peur','L\'histoire se déroule dans les années 1990 durant le festival de Cannes, les projectionnistes d\'un mauvais film d\'horreur nommé Red Is Dead sont assassinés successivement par un mystérieux tueur armé d\'un marteau et une faucille comme dans le film. L\'attachée de presse du film, Odile Deray (Chantal Lauby), comprend rapidement l\'intérêt de ces meurtres pour la notoriété du film, elle fait venir l\'acteur principal, Simon Jérémi (Dominique Farrugia), et engage un garde du corps, Serge Karamazov (Alain Chabat). Le commissaire Bialès (Gérard Darmon) est chargé d\'enquêter sur ces meurtres.','Alain Berbérian',1.33),(2,'Avatar 2','Sur Pandora, plus d\'une décennie après la guerre entre le peuple autochtone des Na\'vi et les humains de la Ressource Development Administration (RDA), Jake Sully assume désormais son rôle de chef des Omaticaya. Avec sa compagne, Neytiri, ils s\'occupent de leur famille : Neteyam, leur fils aîné, Lo\'ak, son frère, Kiri, leur fille adoptive (mystérieusement née de l\'avatar inerte de la Dre Grace Augustine), Spider, un garçon humain abandonné sur la planète, et Tuk, leur fille cadette. C\'est alors que la RDA et ses troupes reviennent en force sur Pandora. Leur mission est de préparer la planète à devenir une nouvelle Terre et accueillir leur exode. Jake, Neytiri et les Omaticaya sont les premiers à s\'opposer à eux. Cependant, les humains ont également dans leurs rangs une escouade de « recombinés » : des avatars Na\'vi avec les souvenirs de soldats décédés. Leur chef n\'est autre que le colonel Quaritch, qui avait pris soin de faire une sauvegarde de sa mémoire et de sa personnalité avant la bataille où il perdit la vie.','James Cameron',3.12),(3,'Il était une fois dan l\'Ouest','Le film décrit deux conflits se déroulant à Flagstone, une ville fictive de l\'Ouest américain, d\'une part la lutte autour de l\'arrivée du chemin de fer dans la ville et d\'autre part la vengeance d\'un homme contre un tueur froid et sanguinaire.','Sergio Leone',2.45),(4,'Interstellar','Alors que la Terre se meurt, une équipe d\'astronautes franchit un trou de ver apparu près de Saturne et conduisant à une autre galaxie, afin d\'explorer un nouveau système stellaire dans l\'espoir de trouver une planète habitable et d\'y établir une colonie spatiale pour sauver l\'humanité.','Christopher Nolan',2.49),(5,'Matrix','Thomas A. Anderson18, un jeune informaticien connu dans le monde du hacking sous le pseudonyme de Neo19, est contacté via son ordinateur par ce qu\'il pense être un groupe de hackers. Ils lui font découvrir que le monde dans lequel il vit n\'est qu\'un monde virtuel appelé la Matrice, à l\'intérieur duquel les êtres humains sont gardés inconsciemment sous contrôle.','The Wachowski',2.16);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `utilisateurId` char(36) NOT NULL,
  `seanceId` int(10) NOT NULL,
  `typePaiement` set('Sur_place','En_ligne') DEFAULT 'Sur_place',
  PRIMARY KEY (`utilisateurId`,`seanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES ('a77935c5-3a8e-11ee-8d31-9671e606a27d',1,'Sur_place'),('a77935c5-3a8e-11ee-8d31-9671e606a27d',2,'Sur_place'),('a779380e-3a8e-11ee-8d31-9671e606a27d',3,'Sur_place'),('a7793885-3a8e-11ee-8d31-9671e606a27d',4,'Sur_place'),('a7793897-3a8e-11ee-8d31-9671e606a27d',6,'Sur_place');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `nbSieges` int(10) NOT NULL,
  `cinemaId` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cinemaId` (`cinemaId`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`cinemaId`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,'Salle 1',100,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(2,'Salle 2',100,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(3,'Salle 3',80,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(4,'Salle 4',80,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(5,'Salle 5',60,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(6,'Salle 6',60,'fbbb87c2-3a8f-11ee-8d1b-9671e606a27d'),(7,'Salle 7',150,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(8,'Salle 8',150,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(9,'Salle 1',150,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(10,'Salle 2',150,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(11,'Salle 3',120,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(12,'Salle 4',120,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(13,'Salle 5',80,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(14,'Salle 6',80,'fbbb897c-3a8f-11ee-8d1b-9671e606a27d'),(15,'Salle 1',100,'fbbb89f3-3a8f-11ee-8d1b-9671e606a27d'),(16,'Salle 2',80,'fbbb89f3-3a8f-11ee-8d1b-9671e606a27d'),(17,'Salle 3',80,'fbbb89f3-3a8f-11ee-8d1b-9671e606a27d'),(18,'Salle 4',60,'fbbb89f3-3a8f-11ee-8d1b-9671e606a27d');
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seances` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `salleId` int(10) NOT NULL,
  `filmId` int(10) NOT NULL,
  `dateHoraire` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `salleId` (`salleId`),
  KEY `filmId` (`filmId`),
  CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`salleId`) REFERENCES `salles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`filmId`) REFERENCES `films` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,1,1,'2023-08-25 19:30:00'),(2,2,2,'2023-08-25 11:20:00'),(3,3,3,'2023-08-26 18:00:00'),(4,4,4,'2023-08-29 17:30:00'),(5,5,5,'2023-08-22 10:30:00'),(6,6,1,'2023-08-24 20:30:00');
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifs`
--

DROP TABLE IF EXISTS `tarifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(250) NOT NULL,
  `prix` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifs`
--

LOCK TABLES `tarifs` WRITE;
/*!40000 ALTER TABLE `tarifs` DISABLE KEYS */;
INSERT INTO `tarifs` VALUES (1,'Plein tarif',9.20),(2,'Etudiant',7.60),(3,'Moins de 14 ans',5.90);
/*!40000 ALTER TABLE `tarifs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifutilisateurs`
--

DROP TABLE IF EXISTS `tarifutilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifutilisateurs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `utilisateurId` char(36) NOT NULL,
  `tarifId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateurId` (`utilisateurId`),
  KEY `tarifId` (`tarifId`),
  CONSTRAINT `tarifutilisateurs_ibfk_1` FOREIGN KEY (`utilisateurId`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `tarifutilisateurs_ibfk_2` FOREIGN KEY (`tarifId`) REFERENCES `tarifs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifutilisateurs`
--

LOCK TABLES `tarifutilisateurs` WRITE;
/*!40000 ALTER TABLE `tarifutilisateurs` DISABLE KEYS */;
INSERT INTO `tarifutilisateurs` VALUES (1,'a77935c5-3a8e-11ee-8d31-9671e606a27d',1),(2,'a779380e-3a8e-11ee-8d31-9671e606a27d',1),(3,'a7793885-3a8e-11ee-8d31-9671e606a27d',2),(4,'a7793897-3a8e-11ee-8d31-9671e606a27d',1),(5,'a7793897-3a8e-11ee-8d31-9671e606a27d',3);
/*!40000 ALTER TABLE `tarifutilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id` char(36) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES ('a77935c5-3a8e-11ee-8d31-9671e606a27d','Jean','Michel','jean.michel@test.com','$2y$10$chHZ49IW/3KT1rGIriXVpO.QeSLdcVsW1esir3kHaciXG3O1Ckt06'),('a779380e-3a8e-11ee-8d31-9671e606a27d','Lea','Dupont','lea.dupont@test.com','$2y$10$K1sUDcQN/GnF2Ob33vhOtu513kv0YCpZmbSrKFOIJr15aaDKO4r8O'),('a7793885-3a8e-11ee-8d31-9671e606a27d','Isabelle','Mono','isabelle.mono@test.com','$2y$10$UTFUxWFM1zcVL16gZwA3jeOWgaK4BmvrhwPrqX3bk0i8BH6Dl1gl.'),('a7793897-3a8e-11ee-8d31-9671e606a27d','Théo','Alvez','theo.alvez@test.com','$2y$10$fX.qrOaoUxMG7YwNOZbMquvAnDbEMorwh0ZFyEYsX0dl5FbiNrKua'),('a77938a6-3a8e-11ee-8d31-9671e606a27d','Franck','Dupuy','franck.dupuy@test.com','$2y$10$i4Uu47TP0YOQla22pckpyOvHIePQs.Z0EC4wo7BYWrmJ.G9uicl02');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-15 12:16:22

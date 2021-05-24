-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: concessionario
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `automobile`
--

DROP TABLE IF EXISTS `automobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automobile` (
  `CODICE` int(11) NOT NULL,
  `NUM_PORTE` int(11) DEFAULT NULL,
  `ANNO_LANCIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODICE`),
  KEY `IDX_COD` (`CODICE`),
  CONSTRAINT `automobile_ibfk_1` FOREIGN KEY (`CODICE`) REFERENCES `veicolo` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automobile`
--

LOCK TABLES `automobile` WRITE;
/*!40000 ALTER TABLE `automobile` DISABLE KEYS */;
INSERT INTO `automobile` VALUES (1,3,2020),(2,5,2015),(3,5,2019),(7,5,2009),(8,5,2012);
/*!40000 ALTER TABLE `automobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citta` (
  `CAP` int(11) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `NUM_SEDI` int(11) DEFAULT NULL,
  PRIMARY KEY (`CAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES (100,'ROMA',1),(20019,'MILANO',1),(80100,'NAPOLI',1),(95030,'CATANIA',2),(95032,'BELPASSO',1),(95047,'PATERNO\'',5);
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `CF` varchar(7) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `COGNOME` varchar(255) DEFAULT NULL,
  `ETA` int(11) DEFAULT NULL,
  `DATA_NASCITA` date DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('DF41YGR','Lorenzo','Tomaselo',21,'1999-05-23'),('EDD6434','Franco','Baresi',60,'1960-05-08'),('FDFT78','Salvo','Xahaka',23,'1999-06-08'),('FDYH76','Ciccio','Pazzo',22,'1999-03-16'),('GG56YUF','Riccardo','Patronaggio',21,'1999-06-16'),('HFGVG78','Pippo','Pazzo',22,'1998-09-09'),('HFGY6E','Matteo','Newearth',21,'1999-06-10'),('LOP98UJ','Giuseppe','Verdi',50,'1970-02-02'),('QWE453D','Michele','Rossi',70,'1950-05-11'),('STH876J','Stefano','Patronaggio',18,'2002-12-26'),('VGDFF7','Carlo','Sambataro',21,'1999-09-15'),('XHEP04U','Utente','DiProva',22,'1999-05-24');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compravendita`
--

DROP TABLE IF EXISTS `compravendita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compravendita` (
  `CLIENTE` varchar(7) NOT NULL,
  `CODICE_VENDITORE` int(11) NOT NULL,
  `CODICE_VEICOLO` int(11) NOT NULL,
  `PREZZO` float DEFAULT NULL,
  `DATA` date DEFAULT NULL,
  PRIMARY KEY (`CLIENTE`,`CODICE_VENDITORE`,`CODICE_VEICOLO`),
  KEY `IDX_CF` (`CLIENTE`),
  KEY `IDX_CODICE_VENDITORE` (`CODICE_VENDITORE`),
  KEY `IDX_CODICE_VEICOLO` (`CODICE_VEICOLO`),
  CONSTRAINT `compravendita_ibfk_1` FOREIGN KEY (`CLIENTE`) REFERENCES `cliente` (`CF`),
  CONSTRAINT `compravendita_ibfk_2` FOREIGN KEY (`CODICE_VEICOLO`) REFERENCES `veicolo` (`CODICE`),
  CONSTRAINT `compravendita_ibfk_3` FOREIGN KEY (`CODICE_VENDITORE`) REFERENCES `dipendente` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compravendita`
--

LOCK TABLES `compravendita` WRITE;
/*!40000 ALTER TABLE `compravendita` DISABLE KEYS */;
INSERT INTO `compravendita` VALUES ('DF41YGR',2,8,903.017,'2021-05-20'),('DF41YGR',5,2,137.301,'2019-12-26'),('DF41YGR',5,5,316.848,'2010-07-16'),('DF41YGR',6,1,1056.16,'2018-06-16'),('EDD6434',5,4,105000,'2019-05-08'),('GG56YUF',2,7,150000,'2021-05-21'),('GG56YUF',3,1,100000,'2021-05-21'),('GG56YUF',4,5,30000,'2021-05-20'),('GG56YUF',6,1,100000,'2021-05-20'),('LOP98UJ',9,5,30000,'2019-07-12'),('QWE453D',2,2,14000,'2020-06-12'),('QWE453D',6,3,24500,'2020-12-26'),('XHEP04U',1,4,63750,'2021-05-24'),('XHEP04U',3,2,11900,'2021-05-24');
/*!40000 ALTER TABLE `compravendita` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ALLIENA_QUANTITA
AFTER INSERT ON COMPRAVENDITA
FOR EACH ROW
BEGIN
	IF((SELECT QUANTITA_DISPONIBILI FROM VEICOLO WHERE NEW.CODICE_VEICOLO=CODICE)>0) THEN
		UPDATE VEICOLO SET QUANTITA_DISPONIBILI=QUANTITA_DISPONIBILI-1 
        WHERE NEW.CODICE_VEICOLO=CODICE;
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Al momento il modello non è disponibile";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `concessionario`
--

DROP TABLE IF EXISTS `concessionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concessionario` (
  `NOME` varchar(255) DEFAULT NULL,
  `CODICE` int(11) NOT NULL,
  `VIA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concessionario`
--

LOCK TABLES `concessionario` WRITE;
/*!40000 ALTER TABLE `concessionario` DISABLE KEYS */;
INSERT INTO `concessionario` VALUES ('ACAT',1,'VIA ROMA 14'),('PUGLISI',2,'VIA MONTI 56'),('ACAT',3,'VIA DELLE ROSE 12'),('PUGLISI',4,'VIA GRAZIA DELEDDA 98'),('OVERDRIVE MOTO',5,'VIA LIBERTA\' 155'),('PUGLISI',6,'VIA VITTORIO EMANUELE 187'),('SALONE MOTORI',7,'VIA ALCIDE DE GASPERI 38'),('OVERDRIVE MOTO',8,'VIA CORSICA 65'),('PUGLISI',9,'VIA GIOVANNI BOCCACCIO 32'),('OVERDRIVE MOTO',10,'VIA BOSCO 1'),('SALONE MOTORI',11,'VIA ALESSANDRO MANZONI 55'),('PUGLISI',12,'VIA DANTE 33');
/*!40000 ALTER TABLE `concessionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dati_conc`
--

DROP TABLE IF EXISTS `dati_conc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati_conc` (
  `nome` varchar(255) NOT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dati_conc`
--

LOCK TABLES `dati_conc` WRITE;
/*!40000 ALTER TABLE `dati_conc` DISABLE KEYS */;
INSERT INTO `dati_conc` VALUES ('ACAT','images/1536597788882_logo.jpg','I ragazzi di ACAT ti aspettano con le loro offerte non solo su veicoli nuovi, ma anche su auto e moto usate a km zero, che controllano scrupolosamente per garantirti condizioni perfette'),('OVERDRIVE MOTO','images/images.png','Override Moto offere una vasta scelta di auto e moto usate e nuove, con particolare attenzione ai servizi e alle agevolazioni per i clienti'),('PUGLISI','images/logo-puglisi.png','Puglisi assicura esperrienza e professionalità, con numerose sedi in Sicilia offre una vasta scelta di auto e moto a prezzi vantaggiosi'),('SALONE MOTORI','images/prova.jpg','Salone motori ha la particolarità di raccogliere una vasta collezione di macchine d\'epoca di unica bellezza e rarità. Passate a trovarli per ammirare i loro storici gioiellini');
/*!40000 ALTER TABLE `dati_conc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dati_login`
--

DROP TABLE IF EXISTS `dati_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dati_login` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `CF` varchar(7) DEFAULT NULL,
  `id_session` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_session`),
  UNIQUE KEY `CF` (`CF`),
  CONSTRAINT `dati_login_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `cliente` (`CF`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dati_login`
--

LOCK TABLES `dati_login` WRITE;
/*!40000 ALTER TABLE `dati_login` DISABLE KEYS */;
INSERT INTO `dati_login` VALUES ('rikipatro','$2y$10$eHaDNHO0wxc.LyHaJ4cGoOhWmPpPGzjvJRLtXI9V0cltg/dAKQsIq','Riccardo','Patronaggio','GG56YUF',1),('loremessi10','$2y$10$yY1O1UTdyKHNTTYPdDO2TeABFzfFMaUPT1EUusuPmqfuZGtQ.IbbC','Lorenzo','Tomasello','DF41YGR',2),('francopazzo','$2y$10$0abOuvq6BvzIKMDPzZnkpe2qH8qfOS79tXrmDujylM1kvIlzhYHo6','Franco','Baresi','EDD6434',3),('steve_26','$2y$10$rLLxPz1yqP9tEidAj2BFVeTDKzO9zQXRRHaxMHGk2UmjRlVcoexO2','Stefano','Patronaggio','STH876J',4),('pippoGreen','$2y$10$WbYxv.tHTRYMGZm.xhU6lObVATw5N8HCJ705K/uSbm/wNrAAMMLOq','Giuseppe','Verdi','LOP98UJ',5),('userDiprova','$2y$10$8DzeAmv9RnjnzOQJh6NvJOVkPpsRSzourQk3Iazq16x/ciZjHEtDu','Utente','DiProva','XHEP04U',6);
/*!40000 ALTER TABLE `dati_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dipendente` (
  `CODICE` int(11) NOT NULL,
  `CONCESSIONARIO` int(11) DEFAULT NULL,
  `CF` varchar(7) DEFAULT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `COGNOME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODICE`),
  KEY `IDX_CON` (`CONCESSIONARIO`),
  CONSTRAINT `dipendente_ibfk_1` FOREIGN KEY (`CONCESSIONARIO`) REFERENCES `concessionario` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES (1,9,'AXXE53G','MARIO','ROSSI'),(2,1,'BXXP7L9','GIUSEPPE','SIMONE'),(3,3,'LTT565V','LORENZO','TOMASELLO'),(4,2,'EFY67HG','DOMENICO','ROSSI'),(5,9,'DFC76YH','MARIO','CAVALIERI'),(6,6,'LMK97JH','STEFANO','PATRONAGGIO'),(7,7,'EWS9D8U','GIOVANNI','IMPALLOMENI'),(8,4,'XURG67W','ANGELO','DURO'),(9,5,'LPJB12A','ALFREDO','PEDULLA');
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direzione`
--

DROP TABLE IF EXISTS `direzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direzione` (
  `CODICE_DIPENDENTE` int(11) DEFAULT NULL,
  `CODICE_CONCESSIONARIO` int(11) NOT NULL,
  `DATA_INIZIO` date DEFAULT NULL,
  PRIMARY KEY (`CODICE_CONCESSIONARIO`),
  UNIQUE KEY `CODICE_DIPENDENTE` (`CODICE_DIPENDENTE`),
  KEY `cod_dip` (`CODICE_DIPENDENTE`),
  KEY `cod_conc` (`CODICE_CONCESSIONARIO`),
  CONSTRAINT `direzione_ibfk_1` FOREIGN KEY (`CODICE_DIPENDENTE`) REFERENCES `dipendente` (`CODICE`),
  CONSTRAINT `direzione_ibfk_2` FOREIGN KEY (`CODICE_CONCESSIONARIO`) REFERENCES `concessionario` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direzione`
--

LOCK TABLES `direzione` WRITE;
/*!40000 ALTER TABLE `direzione` DISABLE KEYS */;
INSERT INTO `direzione` VALUES (2,1,'2019-07-11'),(4,2,'2010-09-19'),(9,5,'2013-11-01'),(5,9,'2007-05-23');
/*!40000 ALTER TABLE `direzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibile`
--

DROP TABLE IF EXISTS `disponibile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disponibile` (
  `id_auto` int(11) NOT NULL,
  `concessionario` int(11) NOT NULL,
  PRIMARY KEY (`id_auto`,`concessionario`),
  KEY `concessionario` (`concessionario`),
  CONSTRAINT `disponibile_ibfk_1` FOREIGN KEY (`id_auto`) REFERENCES `veicolo` (`CODICE`),
  CONSTRAINT `disponibile_ibfk_2` FOREIGN KEY (`concessionario`) REFERENCES `concessionario` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibile`
--

LOCK TABLES `disponibile` WRITE;
/*!40000 ALTER TABLE `disponibile` DISABLE KEYS */;
INSERT INTO `disponibile` VALUES (1,1),(1,3),(1,8),(1,12),(2,1),(2,7),(2,8),(3,10),(4,3),(4,4),(4,5),(4,12),(5,2),(5,3),(5,5),(6,2),(6,5),(7,4),(7,6),(8,5),(8,6),(8,9),(9,2),(9,3),(9,9),(9,11),(10,1),(10,11);
/*!40000 ALTER TABLE `disponibile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moto`
--

DROP TABLE IF EXISTS `moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moto` (
  `CODICE` int(11) NOT NULL,
  `TIPO` varchar(30) DEFAULT NULL,
  `ANNO_LANCIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODICE`),
  KEY `IDX_COD` (`CODICE`),
  CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`CODICE`) REFERENCES `veicolo` (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moto`
--

LOCK TABLES `moto` WRITE;
/*!40000 ALTER TABLE `moto` DISABLE KEYS */;
INSERT INTO `moto` VALUES (4,'SUPER LEGGERA',2016),(5,'MOTO CROSS',2003),(6,'MOTORINO',2009),(9,'SPORT',2019),(10,'ENDURO STRADALE',2020);
/*!40000 ALTER TABLE `moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferiti`
--

DROP TABLE IF EXISTS `preferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferiti` (
  `id_session` int(11) NOT NULL,
  `id_pref` int(11) NOT NULL,
  `concessionario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_session`,`id_pref`,`concessionario`),
  CONSTRAINT `preferiti_ibfk_1` FOREIGN KEY (`id_session`) REFERENCES `dati_login` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferiti`
--

LOCK TABLES `preferiti` WRITE;
/*!40000 ALTER TABLE `preferiti` DISABLE KEYS */;
INSERT INTO `preferiti` VALUES (1,1,'PUGLISI'),(1,2,'SALONE MOTORI'),(1,5,'OVERDRIVE MOTO'),(1,9,'ACAT'),(2,1,'ACAT'),(2,6,'PUGLISI'),(2,7,'PUGLISI'),(6,1,'ACAT'),(6,3,'OVERDRIVE MOTO'),(6,10,'SALONE MOTORI');
/*!40000 ALTER TABLE `preferiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risiede`
--

DROP TABLE IF EXISTS `risiede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risiede` (
  `CONCESSIONARIO` int(11) NOT NULL,
  `CITTA` int(11) NOT NULL,
  PRIMARY KEY (`CONCESSIONARIO`,`CITTA`),
  KEY `IDX_CON` (`CONCESSIONARIO`),
  KEY `IDX_CITTA` (`CITTA`),
  CONSTRAINT `risiede_ibfk_1` FOREIGN KEY (`CONCESSIONARIO`) REFERENCES `concessionario` (`CODICE`),
  CONSTRAINT `risiede_ibfk_2` FOREIGN KEY (`CITTA`) REFERENCES `citta` (`CAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risiede`
--

LOCK TABLES `risiede` WRITE;
/*!40000 ALTER TABLE `risiede` DISABLE KEYS */;
INSERT INTO `risiede` VALUES (1,95047),(2,95047),(3,95030),(4,95047),(5,95032),(6,100),(7,20019),(8,95030),(9,80100),(10,95047),(11,95047);
/*!40000 ALTER TABLE `risiede` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER MAX_CONC_IN_CITTA
BEFORE INSERT ON RISIEDE
FOR EACH ROW
BEGIN
	IF(EXISTS(SELECT COUNT(*) AS NUM_CONC
			FROM RISIEDE
            WHERE CITTA=NEW.CITTA
            HAVING NUM_CONC>=5))
	THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Non si possono inserire piu' di 5 concessionari per citta'";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ALLINEA_NUM_SEDI
AFTER INSERT ON RISIEDE
FOR EACH ROW
BEGIN
	UPDATE CITTA SET NUM_SEDI=NUM_SEDI+1
    WHERE NEW.CITTA=CAP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `v1`
--

DROP TABLE IF EXISTS `v1`;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v1` (
  `concessionario` tinyint NOT NULL,
  `citta` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `veicolo`
--

DROP TABLE IF EXISTS `veicolo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veicolo` (
  `CODICE` int(11) NOT NULL,
  `NOME` varchar(255) DEFAULT NULL,
  `MODELLO` varchar(30) DEFAULT NULL,
  `prezzo` float DEFAULT NULL,
  `QUANTITA_DISPONIBILI` int(11) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODICE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veicolo`
--

LOCK TABLES `veicolo` WRITE;
/*!40000 ALTER TABLE `veicolo` DISABLE KEYS */;
INSERT INTO `veicolo` VALUES (1,'FERRARI','ROMA',100000,2,'images/auto/ferrari.jpeg','La Ferrari Roma è caratterizzata da un design senza tempo, una spiccata raffinatezza e da guidabilità e prestazioni di assoluta eccellenza'),(2,'FIAT','PANDA',14000,5,'images/auto/panda.jpg','Molto diffusa e apprezzata la Panda vanta uno stile compatto, disponibile in molti modelli adatti a ogni eseginza'),(3,'JEEP','Renegade',24500,3,'images/auto/jeep-renegade.jpg','SUV di medio-piccole dimensioni va a inserirsi come modello d\'ingresso per la gamma Jeep sia per quanto riguarda le dimensioni sia per i prezzi'),(4,'DUCATI','MONSTER',75000,2,'images/auto/1562585190noleggio-a-lungo-termine-ducati-monster-scooter-happyrent-it.png','Il nuovo Monster rappresenta tutta l’essenza Ducati nella forma più compatta, essenziale e leggera possibile. Lo si intuisce già dal nome: Monster, null’altro.'),(5,'SUZUKI','GSR',30000,0,'images/auto/suzuki.jpg','Motocicletta di media cilindrata appartenente alla categoria delle enduro stradali prodotta dalla casa nipponica. Molto apprezzata, seconda nelle vendite della categoria nel 2007'),(6,'PIAGGIO','Beverly',15000,3,'images/auto/piaggio-beverly-400-s-2021-03.jpg','Uno dei modelli che hanno scritto la storia della mobilità cittadina a due ruote diventa più potente con prestazioni di tutto rispetto'),(7,'LAMBORGHINI','URUS',150000,3,'images/auto/lamborghini-urus-graphite-capsule.jpg','La Lamborghini Urus è un SUV di lusso della casa automobilistica Lamborghini, dal design affilato e con prestazioni esagerate'),(8,'BMW','X7',85500,2,'images/auto/bmw-x7.jpg','Dalle inponenti dimensioni la X7 è un auto adatta alle esigenze di una famiglia, soprattutto per i lunghi viaggi'),(9,'KAWASAKI','NINJA 125',44550,1,'images/auto/ninja-125.jpg','Kawasaki Ninja 125: dici Akashi e pensi alle supersportive che hanno fatto la storia, magari alla Ninja 10, o meglio ZX-10RR, che domina la SBK da qualche stagione.'),(10,'BMW','F 750',60450,2,'images/auto/BMW-R-1200-GS-xDrive-Hybrid-1024x768.jpg','La prima moto ibrida di BMW Motorrad ed a trazione integrale. Forte di 170 CV, riesce ad essere la perfetta compagna da viaggio');
/*!40000 ALTER TABLE `veicolo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'concessionario'
--

--
-- Dumping routines for database 'concessionario'
--
/*!50003 DROP PROCEDURE IF EXISTS `P1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P1`(IN ANNO INTEGER)
BEGIN 
DROP TEMPORARY TABLE IF EXISTS ANNI;
CREATE TEMPORARY TABLE ANNI(ANNO integer);
WHILE ANNO<=(SELECT MAX(ANNO_LANCIO) FROM MOTO)
	DO
		INSERT INTO ANNI SELECT ANNO;
		SET ANNO=ANNO+1;
	END WHILE;
DROP TEMPORARY TABLE IF EXISTS TEMP;    
	CREATE TEMPORARY TABLE TEMP(
	ANNO INTEGER,
    TOT_MOTO INTEGER);
    INSERT INTO TEMP 
	SELECT A.ANNO AS ANNO,COUNT(ALL M.ANNO_LANCIO) AS TOT_MOTO
    FROM ANNI A LEFT JOIN MOTO M ON A.ANNO=M.ANNO_LANCIO
    GROUP BY A.ANNO;
	SELECT * FROM TEMP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P2`(in con integer)
BEGIN
	select C.*
	from DIPENDENTE D join COMPRAVENDITA C on D.codice=C.codice_venditore 
	where exists (select *
            from DIPENDENTE D1 join COMPRAVENDITA C on D1.codice=C.codice_venditore 
            where D1.nome=D.nome and D1.CODICE<>D.CODICE and con=D1.concessionario and con=D.concessionario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P3`(in cf_cliente varchar(7))
BEGIN
	update COMPRAVENDITA SET PREZZO= 
    CASE
        WHEN (select eta from cliente where cf_cliente=cf)<=30
			THEN prezzo-((prezzo/100)*15)
		WHEN (select eta from cliente where cf_cliente=cf)>=60
			THEN prezzo-((prezzo/100)*30)
		WHEN ((select eta from cliente where cf_cliente=cf)>=30 and (select eta from cliente where cf_cliente=cf)<=60)
			THEN prezzo
	END
    WHERE CLIENTE=cf_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P4`(IN CONCESSIONARIO varchar(30))
BEGIN
	SELECT COUNT(*) as Num_sedi,v.citta as Città
    FROM V1 v JOIN concessionario CO ON CO.CODICE=v.concessionario
    WHERE concessionario=CO.NOME
    GROUP BY v.citta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc`(in soglia integer,in bonus integer)
begin
drop temporary table if exists temp;
create temporary table temp(
num_vendite integer,
codice integer,
bonus_vendite integer
);
if(soglia<=(select count(c.CODICE_VENDITORE) as numero_vendite
	from compravendita c join dipendente d on c.codice_venditore=d.codice)) then
	insert into temp
    select count(c.CODICE_VENDITORE) as numero_vendite, d.codice as venditore,((10/100)*sum(c.prezzo)) as totale_vendite
	from compravendita c join dipendente d on c.codice_venditore=d.codice 
	group by venditore;
end if;
select * from temp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v1`
--

/*!50001 DROP TABLE IF EXISTS `v1`*/;
/*!50001 DROP VIEW IF EXISTS `v1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v1` AS select `r`.`CONCESSIONARIO` AS `concessionario`,`c`.`NOME` AS `citta` from (`risiede` `r` join `citta` `c` on(`r`.`CITTA` = `c`.`CAP`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24 17:56:20

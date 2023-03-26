-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: seduc
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `escolas`
--

DROP TABLE IF EXISTS `escolas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escolas` (
  `escola_id` int(11) NOT NULL AUTO_INCREMENT,
  `escola_nome` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`escola_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolas`
--

LOCK TABLES `escolas` WRITE;
/*!40000 ALTER TABLE `escolas` DISABLE KEYS */;
INSERT INTO `escolas` VALUES (1,'Colégio São João');
/*!40000 ALTER TABLE `escolas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudantes`
--

DROP TABLE IF EXISTS `estudantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudantes` (
  `estudante_id` int(11) NOT NULL AUTO_INCREMENT,
  `estudante_nome` varchar(150) DEFAULT NULL,
  `estudante_idade` int(11) DEFAULT NULL,
  `escola_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`estudante_id`),
  KEY `fkescola` (`escola_id`),
  CONSTRAINT `fkescola` FOREIGN KEY (`escola_id`) REFERENCES `escolas` (`escola_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudantes`
--

LOCK TABLES `estudantes` WRITE;
/*!40000 ALTER TABLE `estudantes` DISABLE KEYS */;
INSERT INTO `estudantes` VALUES (1,'Sergio Henrique',18,1),(2,'Janete Ferreira',23,1),(3,'Paulo Castro',21,1),(4,'Ada Lovelace',38,1),(5,'Allan Turing',36,1),(6,'Airton Senna',47,1),(7,'João Cabral de Mello Neto',68,1),(8,'Machado de Assis',75,1),(9,'José de Alencar',20,1),(10,'Eça de Queiroz',19,1),(11,'Dalton Trvisan',35,1),(12,'Monteiro Lobato',45,1),(13,'Cecília Meirelles',52,1),(14,'Carlos Drummond de Andrade',98,1),(15,'Clarice Lispector',28,1),(16,'Graciliano Ramos ',29,1),(17,'Mario Quintana',88,1),(18,'Guimarães Rosa',40,1),(19,'Ruth Rocha',18,NULL),(20,'Luis Fernando Veríssimo',18,1),(21,'Ana Maria Machado',44,1),(22,'Adélia Prado',19,1),(23,'Zelia Gattai',75,1),(24,'Eva Furnari',19,1),(25,'Conceição Evaristo',18,1);
/*!40000 ALTER TABLE `estudantes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-16 12:59:50

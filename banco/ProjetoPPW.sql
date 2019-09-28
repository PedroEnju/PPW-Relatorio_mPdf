-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: projetoppw
-- ------------------------------------------------------
-- Server version	5.5.60-log

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
-- Table structure for table `cidade`
--

CREATE DATABASE IF NOT EXISTS ProjetoPPW;

USER ProjetoPPW;

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) DEFAULT NULL,
  `nome_cidade` varchar(100) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_cidade`),
  KEY `estado_cidade_idx` (`id_estado`),
  CONSTRAINT `estado_cidade` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,1,'Terra Roxa','85990-000','A'),(1000,1000,'Não Informado','','A');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cidade` int(11) NOT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estado_civil` char(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`,`id_cidade`),
  KEY `cliente_cidade_idx` (`id_cidade`),
  CONSTRAINT `cliente_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'Pedro Henrique Masato Enju','115.320.059-70','1999-11-22','M','4','pedro_enju@hotmail.com','A');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(100) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Paraná','PR','A'),(1000,'Não Informado','','A');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id_language` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(50) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Português','A'),(2,'Japonês','A'),(3,'Inglês','A');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavra`
--

DROP TABLE IF EXISTS `palavra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palavra` (
  `id_palavra` int(11) NOT NULL AUTO_INCREMENT,
  `id_palavra_principal` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  `palavra` varchar(150) DEFAULT NULL,
  `xp` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_palavra`),
  KEY `palavra_principal_palavra_idx` (`id_palavra_principal`),
  KEY `language_palavra_idx` (`id_language`),
  CONSTRAINT `palavra_principal_palavra` FOREIGN KEY (`id_palavra_principal`) REFERENCES `palavra_principal` (`id_palavra_principal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `language_palavra` FOREIGN KEY (`id_language`) REFERENCES `language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavra`
--

LOCK TABLES `palavra` WRITE;
/*!40000 ALTER TABLE `palavra` DISABLE KEYS */;
INSERT INTO `palavra` VALUES (1,1,1,'Preto',10.00),(2,1,2,'Kuro',10.00),(3,1,3,'Black',10.00),(4,2,1,'Vermelho',10.00),(5,2,2,'Aka',10.00),(6,2,3,'Red',10.00),(7,3,1,'Azul',10.00),(8,3,2,'Ao',10.00),(9,3,3,'Blue',10.00),(10,4,1,'Encontrar',10.00),(11,4,2,'Au',10.00),(12,4,3,'Meet',10.00),(13,5,1,'Casa',10.00),(14,5,2,'Ie',10.00),(15,5,3,'House',10.00),(16,6,1,'Sobrinho',10.00),(17,6,2,'Oi',10.00),(18,6,3,'Nephew',10.00),(19,7,1,'Peixe',10.00),(20,7,2,'Uo',10.00),(21,7,3,'Fish',10.00),(22,8,1,'Escrever',10.00),(23,8,2,'Kaku',10.00),(24,8,3,'Write',10.00),(25,9,1,'Ouvir',10.00),(26,9,2,'Kiku',10.00),(27,9,3,'Hear',10.00),(28,10,1,'Lago',10.00),(29,10,2,'Ike',10.00),(30,10,3,'Lake',10.00),(31,11,1,'Máquina',10.00),(32,11,2,'Kikai',10.00),(33,11,3,'Machine',10.00),(34,12,1,'Ladeira',10.00),(35,12,2,'Saka',10.00),(36,12,3,'Slope',10.00),(37,13,1,'Fino',10.00),(38,13,2,'Usui',10.00),(39,13,3,'Thin',10.00),(40,14,1,'Convidar',10.00),(41,14,2,'Sasou',10.00),(42,14,3,'To Invite',10.00),(43,15,1,'Comprar',10.00),(44,15,2,'Kau',10.00),(45,15,3,'Purchase',10.00),(46,16,1,'Pé',10.00),(47,16,2,'Ashi',10.00),(48,16,3,'Foot',10.00),(49,17,1,'Melancia',10.00),(50,17,2,'Suika',10.00),(51,17,3,'Watermelon',10.00),(52,18,1,'Tosse',10.00),(53,18,2,'Seki',10.00),(54,18,3,'Cough',10.00),(55,19,1,'Alí',10.00),(56,19,2,'Asoko',10.00),(57,19,3,'There',10.00);
/*!40000 ALTER TABLE `palavra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavra_info`
--

DROP TABLE IF EXISTS `palavra_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palavra_info` (
  `id_palavra_info` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) DEFAULT NULL,
  `id_palavra_principal` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  `xp_ganho` decimal(12,2) DEFAULT NULL,
  `num_acerto` int(11) DEFAULT NULL,
  `num_erro` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_palavra_info`),
  KEY `perfil_palavra_info_idx` (`id_perfil`),
  KEY `palavra_principal_palavra_info_idx` (`id_palavra_principal`),
  KEY `language_palavra_info_idx` (`id_language`),
  CONSTRAINT `perfil_palavra_info` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `palavra_principal_palavra_info` FOREIGN KEY (`id_palavra_principal`) REFERENCES `palavra_principal` (`id_palavra_principal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `language_palavra_info` FOREIGN KEY (`id_language`) REFERENCES `language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavra_info`
--

LOCK TABLES `palavra_info` WRITE;
/*!40000 ALTER TABLE `palavra_info` DISABLE KEYS */;
INSERT INTO `palavra_info` VALUES (1,1,1,2,20.00,2,0,'A');
/*!40000 ALTER TABLE `palavra_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavra_principal`
--

DROP TABLE IF EXISTS `palavra_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `palavra_principal` (
  `id_palavra_principal` int(11) NOT NULL AUTO_INCREMENT,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_palavra_principal`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavra_principal`
--

LOCK TABLES `palavra_principal` WRITE;
/*!40000 ALTER TABLE `palavra_principal` DISABLE KEYS */;
INSERT INTO `palavra_principal` VALUES (1,'A'),(2,'A'),(3,'A'),(4,'A'),(5,'A'),(6,'A'),(7,'A'),(8,'A'),(9,'A'),(10,'A'),(11,'A'),(12,'A'),(13,'A'),(14,'A'),(15,'A'),(16,'A'),(17,'A'),(18,'A'),(19,'A');
/*!40000 ALTER TABLE `palavra_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `tipo` char(1) NOT NULL,
  `xp` decimal(12,2) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`),
  KEY `usuario_perfil_palavra_idx` (`id_usuario`),
  CONSTRAINT `usuario_perfil` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,13,'P',20.00,0,'A');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `tipo_usuario` char(1) DEFAULT NULL,
  `nome_usuario` varchar(60) NOT NULL,
  `senha_usuario` varchar(64) NOT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `usuario_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (13,1,'2018-11-21 16:37:37','A','pedro','21232f297a57a5a743894a0e4a801fc3','A'),(14,1,'2018-11-23 17:17:48','A','admin','21232f297a57a5a743894a0e4a801fc3','A');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-23 17:18:14

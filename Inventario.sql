-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: InventoryManager
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `senha` char(60) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','abc@123');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `First` varchar(255) DEFAULT NULL,
  `Middle` varchar(255) DEFAULT NULL,
  `Last` varchar(255) DEFAULT NULL,
  `ProductId` int(11) unsigned NOT NULL,
  `NumberShipped` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_fk` (`ProductId`),
  CONSTRAINT `order_product_fk` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'','Suzy','','Customer',3,10,'2014-04-01'),(2,'','Suzy','','Customer',3,20,'2014-04-22'),(3,'','Ben','','Thomas',1,5,'2014-04-11'),(4,'','Johnny','','Test',3,10,'2014-04-02'),(5,'','Steve','','Smith',1,20,'2014-04-15'),(6,'','Steve','','Palmer',3,3,'2014-02-22'),(7,'','Tim','','Scott',3,5,'2014-03-22'),(8,'','Dave','','Boyd',3,10,'2014-01-22'),(9,'','Suzy','','Customer',2,30,'2014-01-21'),(10,'','Dylan','','Test',3,5,'2014-04-23'),(11,'','Betty','','Fryar',3,12,'2014-04-22'),(12,'','Jerry','','Sellers',2,124,'2014-04-22'),(13,'','BOB','','SMITH',2,500,'2014-05-11'),(14,'','Suzy','','Customer',5,5,'2015-04-07'),(15,'','Suzy','','Customer',9,50,'2015-04-07'),(16,'','Suzy','','Customer',3,1,'2015-04-07'),(17,'','Suzy','','Customer',10,5,'2015-09-09'),(18,'','john','','lemeasure',10,12,'2016-02-05'),(19,'','Suzy','','Customer',9,2,'2017-02-25'),(20,'','','','',9,1,'2017-01-15'),(21,'','llkjh','','kjlkh',11,250,'2017-02-15'),(22,'','Suzy','','Customer',16,14,'2017-04-05'),(23,'','Suzy','','Customer',11,50,'2017-06-05'),(24,'','Suzy','','Customer',9,200,'2017-06-05'),(25,'','Test','','Cowley',14,12,'2017-11-05'),(26,'','Elvis','','P',17,900,'2017-04-05'),(27,'','Elvis','','P',18,9000,'2017-06-05'),(28,'','','','',4,0,'2017-04-05');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NomeProduto` varchar(255) DEFAULT NULL,
  `Patrimonio` varchar(255) DEFAULT NULL,
  `RotuloProduto` varchar(255) DEFAULT NULL,
  `Localizacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Dell Server','XP 2000','Dell Server- XP 2000','100007'),(2,'Google Chromebooks','1','Google Chromebooks- 1.0','100'),(3,'Cisco Router','10X','Cisco Router- 10X','45'),(4,'sadasd','21','sadasd- 21','25'),(5,'Semih','37','Semih- 37','1'),(6,'crazy horse router','123DF5','crazy horse router- 123DF5','5'),(7,'Monitors','','Monitors - 999','0'),(8,'TEST','123','TEST- 123','10'),(9,'bob','bob-1','bob- bob-1','500'),(10,'Multimeter','c345','Multimeter- c345','3'),(11,'dfgdf','54334','dfgdf- 54334','0'),(12,'UniBox','1','UniBox- 1','200'),(13,'Test 1','123456','Test 1- 123456','50'),(14,'Toby','57456','Toby- 57456','567'),(15,'sdsad','sdsdsad','sdsad- sdsdsad','12'),(16,'test','55555','test- 55555','500'),(17,'Firewalls','362436','Firewalls- 362436','5'),(18,'Cables','7734','Cables- 7734','9'),(19,'Test','1','Test- 001','25');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SupplierId` int(11) unsigned NOT NULL,
  `ProductId` int(11) unsigned NOT NULL,
  `NumberReceived` int(11) NOT NULL,
  `PurchaseDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_product_fk` (`ProductId`),
  KEY `purchase_supplier_fk` (`SupplierId`),
  CONSTRAINT `purchase_product_fk` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`),
  CONSTRAINT `purchase_supplier_fk` FOREIGN KEY (`SupplierId`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,2,2,50,'2014-11-02'),(2,2,1,15,'2014-09-02'),(3,3,3,10,'2014-11-12'),(4,2,2,25,'2014-01-02'),(5,2,3,20,'2014-02-22'),(6,1,1,5,'2015-11-02'),(7,3,3,3,'2014-01-02'),(8,1,3,20,'2015-11-11'),(9,2,1,0,'2014-11-02'),(10,1,1,5,'2016-11-02'),(11,2,5,12,'2016-11-02'),(12,2,3,90,'2016-11-02'),(13,1,6,23,'2016-08-02'),(14,2,10,25,'2017-11-02'),(15,2,10,3,'2017-11-02'),(16,1,10,0,'2017-01-02'),(17,1,2,0,'2017-02-22'),(18,2,1,10,'2017-03-02'),(19,2,9,12,'2017-03-03'),(20,2,13,1234,'2017-05-12'),(21,1,12,0,'2017-05-22'),(22,1,13,0,'2017-06-12'),(23,2,3,0,'2017-08-02'),(24,3,9,400,'2017-10-02'),(25,1,14,0,'2017-11-02'),(26,2,16,12,'2017-11-30'),(27,1,3,0,'2017-07-02'),(28,3,17,33,'2017-07-12'),(29,1,18,453,'2017-07-23'),(30,2,18,22,'2017-11-02');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'ShockWave Tech'),(2,'CDW'),(3,'ACME Tech Supplies');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-19  8:31:12

-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cloud
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cloud_dir`
--

DROP TABLE IF EXISTS `cloud_dir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cloud_dir` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_name` varchar(512) NOT NULL,
  `dir_path` varchar(1024) NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_dir`
--

LOCK TABLES `cloud_dir` WRITE;
/*!40000 ALTER TABLE `cloud_dir` DISABLE KEYS */;
/*!40000 ALTER TABLE `cloud_dir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_file`
--

DROP TABLE IF EXISTS `cloud_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cloud_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(200) NOT NULL,
  `file_path` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_file`
--

LOCK TABLES `cloud_file` WRITE;
/*!40000 ALTER TABLE `cloud_file` DISABLE KEYS */;
INSERT INTO `cloud_file` VALUES (1,'289244.jpg','D:\\cloud\\18\\txt',18),(2,'csh.txt','D:\\cloud\\18\\txt',18),(3,'56f4d97ed7467.jpg','D:\\cloud\\11\\txt',11),(4,'csh.txt','D:\\cloud\\11\\txt',11),(5,'56f4d97ed7467.jpg','D:\\cloud\\11\\txt',11),(6,'csh.txt','D:\\cloud\\11\\txt',11),(7,'289244.jpg','D:\\cloud\\11\\images',11),(8,'csh.txt','D:\\cloud\\11\\txt',11),(9,'296032.jpg','D:\\cloud\\11\\images',11),(10,'csh.txt','D:\\cloud\\11\\txt',11);
/*!40000 ALTER TABLE `cloud_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_user`
--

DROP TABLE IF EXISTS `cloud_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cloud_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `register_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_user`
--

LOCK TABLES `cloud_user` WRITE;
/*!40000 ALTER TABLE `cloud_user` DISABLE KEYS */;
INSERT INTO `cloud_user` VALUES (10,'admin','admin','564654@qq.com','2019-02-19 00:00:00'),(11,'csh','123456','15358876@qq.com','2019-02-16 14:00:00'),(12,'aa','123456','16465656@qq.com','2018-01-02 14:00:00'),(18,'cc','cccccc','1235467@163.com','2019-02-21 19:04:01'),(19,'ali','456789','123456@qq.com','2019-02-22 16:56:23');
/*!40000 ALTER TABLE `cloud_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-23 22:02:36

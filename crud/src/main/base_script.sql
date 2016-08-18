CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `isAdmin` bit(1) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Григорий Федорченко',33,'','2016-08-18 15:55:30'),(2,'Нечипоренко Руслан',19,'\0','2016-08-18 15:55:40'),(3,'Игорь Александрович',37,'','2016-08-18 15:55:47'),(4,'Макаронов Владислав',40,'\0','2016-08-18 15:56:10'),(5,'Иванова Василиса',26,'','2016-08-18 13:26:10'),(6,'Нина Александровна',67,'\0','2016-08-06 20:53:28'),(7,'Катя',5,'\0','2016-08-18 15:56:27'),(8,'DongoDongi',24,'\0','2016-08-18 15:57:05'),(9,'Евгений Сысоев',17,'\0','2016-08-18 15:57:16'),(10,'Зинаида Никаноровна',66,'\0','2016-08-18 15:57:23'),(11,'Егор Кононенко',27,'','2016-08-18 15:57:38'),(12,'Mikkey',28,'\0','2016-08-18 15:58:03'),(13,'Самсоненко Екатерина',40,'\0','2016-08-18 15:58:14'),(14,'Федор Михайлов',76,'\0','2016-08-18 15:58:38'),(15,'Косолапенко Ирина',22,'\0','2016-08-18 15:58:48'),(16,'Зубатов Егор',34,'\0','2016-08-18 15:58:59'),(17,'Николай Евгениевич',60,'\0','2016-08-18 15:59:04'),(18,'Никанор Иванович',47,'\0','2016-08-18 15:59:08'),(19,'Настя Макаренко',18,'','2016-08-18 15:59:24'),(20,'Вася',15,'\0','2016-08-18 15:59:29'),(21,'Вася Горбач',37,'\0','2016-08-18 15:59:39'),(22,'Козлов Василий',69,'\0','2016-08-18 16:00:16'),(23,'Маня',10,'\0','2016-08-18 16:00:27'),(24,'Dr Zoidberg',100,'\0','2016-08-18 16:01:19'),(25,'Федот Михалыч',72,'\0','2016-08-18 16:01:37'),(26,'Виктор Семенович',39,'','2016-08-18 16:01:44'),(27,'Макуха Игорь',22,'\0','2016-08-18 16:01:50'),(28,'Неизвестный',45,'\0','2016-08-18 16:02:02'),(29,'Кадышева Надежда',47,'\0','2016-08-18 16:02:22'),(30,'Садовой Андрей',56,'','2016-08-18 16:02:29'),(31,'Лаврик Руслан',49,'\0','2016-08-18 16:02:40'),(32,'Мкртчан Армен',51,'','2016-08-18 16:02:50'),(33,'Макаренко Инна',26,'\0','2016-08-18 16:02:54'),(34,'Ващенко Саша',17,'\0','2016-08-17 21:51:59'),(35,'Захарченко Юра',19,'\0','2016-08-18 16:03:01'),(37,'Токаренко Татьяна М',35,'\0','2016-08-18 16:03:11'),(38,'Зурабов Михаил',62,'\0','2016-08-18 16:03:18'),(39,'Сергей Мищенко',45,'\0','2016-08-18 16:03:33'),(40,'Андрей Воробей',34,'\0','2016-08-18 16:03:38'),(41,'Татьяна Клочко',33,'\0','2016-08-18 16:03:49'),(42,'Новенко Руслан И',25,'\0','2016-08-18 16:04:03'),(43,'Жарков Николай',38,'','2016-08-17 21:50:18'),(44,'Мельниченко Андрей',56,'\0','2016-08-18 16:04:11'),(45,'Николай Евсеев',41,'\0','2016-08-18 16:04:17'),(46,'Мадам Lowrence',23,'','2016-08-18 12:51:05'),(47,'pinky',33,'','2016-08-18 16:05:26');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-18 19:06:43

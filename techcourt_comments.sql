-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: techcourt
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL,
  `post` int(11) NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `DatePosted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `points` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `FK_CommentAuthor` (`author`),
  KEY `FK_Post` (`post`),
  KEY `FK_ParentComment` (`parent`),
  CONSTRAINT `FK_CommentAuthor` FOREIGN KEY (`author`) REFERENCES `accounts` (`userid`),
  CONSTRAINT `FK_ParentComment` FOREIGN KEY (`parent`) REFERENCES `comments` (`commentid`),
  CONSTRAINT `FK_Post` FOREIGN KEY (`post`) REFERENCES `posts` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,2,2,'Test2','2018-12-06 23:51:41',3,NULL),(3,3,2,'Hello World!','2018-12-07 00:35:15',0,NULL),(4,2,2,'Well you see<br>This this blah blah blah test<br>Line 3','2018-12-15 20:40:13',2,NULL),(5,3,2,'Hello World','2018-12-16 01:12:06',0,NULL),(6,3,2,'Hello World','2018-12-16 01:18:21',1,NULL),(7,3,2,'adasdasdasdasda','2018-12-16 01:22:30',0,NULL),(8,3,2,' aadasdasdasdasd\r\nasdasd','2018-12-16 01:24:58',0,NULL),(9,3,1,'Hello World! this is the first comment!\r\n','2018-12-16 04:30:52',8,NULL),(10,3,2,' Testing testing','2018-12-16 05:08:29',1,NULL),(11,3,2,' Testing testing','2018-12-16 05:09:33',0,NULL),(12,3,2,'<em>This comment has been removed by the moderators</em>','2018-12-16 05:14:52',1,9),(13,3,1,'<em>This comment has been removed by the moderators</em>','2018-12-16 17:35:24',2,9),(14,3,1,'This comment has been removed by the moderators','2018-12-16 17:37:27',1,NULL),(15,3,1,'<em>This comment has been removed by the moderators</em>','2018-12-16 17:37:43',0,14),(16,3,1,'This comment has been removed by the moderators','2018-12-16 17:39:03',0,14),(17,3,1,'This comment has been removed by the moderators','2018-12-16 19:14:39',0,9),(18,3,1,'<em>This comment has been removed by the moderators</em>','2018-12-16 19:20:49',8,NULL),(19,3,1,'<em>This comment has been removed by the moderators</em>','2018-12-16 19:32:42',0,NULL),(20,3,1,'<div class =\"code-block\">\r\nTest<br>Test<br>Test\r\n</div>','2018-12-16 19:46:15',0,NULL),(21,3,1,'This comment has been removed by the moderators','2018-12-16 19:53:31',0,NULL),(22,3,1,'This comment has been removed by the moderators','2018-12-16 19:58:28',0,NULL),(23,3,1,'<div class =\"code-block\"> Test Test </div>','2018-12-16 23:44:34',0,NULL),(24,3,1,'<em>This comment has been removed by the moderators</em>','2018-12-16 23:44:50',0,18),(25,3,1,'I really hope this comment doesnt get added becaused im not logged in!','2018-12-17 02:27:39',0,18),(26,3,1,'really hope this comment doesnt get added becaused im not logged in! ','2018-12-17 02:29:18',0,18),(27,1,1,'<em>This comment has been removed by the moderators</em>','2018-12-17 04:45:35',0,NULL),(28,1,1,'Mine too!','2018-12-17 04:45:48',0,27),(29,1,1,' hello','2018-12-17 17:08:36',0,NULL),(30,1,1,'Test','2018-12-17 17:40:34',0,9),(31,3,1,' TESTSETSEt','2018-12-17 17:40:42',0,NULL),(32,3,1,' Hello','2018-12-17 18:32:10',0,NULL),(33,1,1,'hello','2018-12-17 18:32:24',0,9),(34,3,3,' YAAAAAAAAAAAAA IT WORKED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1','2018-12-17 19:36:30',1,NULL),(35,1,3,'You suck','2018-12-17 19:39:03',0,34),(36,3,3,' <div class =\"code-block\"> Test<br> test </div>','2018-12-17 19:39:29',0,NULL),(37,3,4,'sell it','2018-12-17 19:44:33',1,NULL),(38,1,4,'You are dumb','2018-12-18 04:44:00',1,37),(39,5,4,'Buy a new one','2018-12-18 06:16:01',0,NULL),(40,1,5,' Please work','2018-12-18 12:30:19',1,NULL),(41,1,5,'fdsfsd','2018-12-18 12:30:33',0,40),(42,1,14,' sd','2018-12-18 12:44:59',1,NULL),(43,1,14,'sd','2018-12-18 12:45:04',0,42);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-18  7:47:27

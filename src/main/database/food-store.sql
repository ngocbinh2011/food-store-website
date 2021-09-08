-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: foodstore
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_code` varchar(45) NOT NULL,
  `ADMIN_NAME` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `admin_phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_code_UNIQUE` (`admin_code`),
  KEY `fk_admin_user1_idx` (`user_id`),
  CONSTRAINT `fk_admin_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'cnb','can ngoc binh',1,'033228331');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_admin1_idx` (`admin_id`),
  CONSTRAINT `fk_category_admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'DO AN NONG',1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_product`
--

DROP TABLE IF EXISTS `image_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_link` varchar(45) DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_product_product1_idx` (`product_id`),
  CONSTRAINT `fk_image_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_product`
--

LOCK TABLES `image_product` WRITE;
/*!40000 ALTER TABLE `image_product` DISABLE KEYS */;
INSERT INTO `image_product` VALUES (2,'image/product/photo1.jpg',1),(3,'image/product/photo2.jpg',2),(4,'image/product/photo3.jpg',3),(5,'image/product/photo4.jpg',4),(6,'image/product/photo5.jpg',5),(7,'image/product/photo6.jpg',6),(8,'image/product/photo7.jpg',7),(9,'image/product/photo8.jpg',8),(10,'image/product/photo9.jpg',9),(11,'image/product/photo10.jpg',10),(12,'image/product/photo11.jpg',11),(13,'image/product/photo12.jpg',12),(14,'image/product/photo13.jpg',13),(15,'image/product/photo14.jpg',14),(16,'image/product/photo15.jpg',15),(17,'image/product/photo16.jpg',16),(18,'image/product/photo17.png',17),(19,'image/product/photo18.jpg',18),(20,'image/product/photo19.jpg',19),(21,'image/product/photo20.jpeg',20),(22,'image/product/photo15.jpg',21),(23,'image/product/photo1.jpg',22),(24,'image/product/photo12.jpg',23),(25,'image/product/photo13.jpg',24),(26,'image/product/photo2.jpg',25),(27,'image/product/photo3.jpg',26),(28,'image/product/photo5.jpg',27),(29,'image/product/photo9.jpg',28),(30,'image/product/photo15.jpg',29);
/*!40000 ALTER TABLE `image_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `order_amount` int NOT NULL,
  `order_pay` tinyint(1) NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_product1_idx` (`product_id`),
  KEY `fk_order_user1_idx` (`user_id`),
  CONSTRAINT `fk_order_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (3,'2021-09-08 16:19:33',1335,0,3,1),(5,'2021-09-08 14:29:50',1330,1,3,1),(9,'2021-09-08 13:45:44',8,1,5,1),(10,'2021-09-08 14:29:30',8,1,6,1),(11,'2021-09-08 13:45:52',1328,1,7,1),(22,'2021-09-08 14:29:50',1,1,3,1),(24,'2021-08-20 00:00:00',10,0,15,1),(25,'2021-09-08 14:29:30',11,0,6,1),(26,'2021-09-08 16:18:09',1113,0,19,1),(28,'2021-09-08 12:52:02',1000,1,20,1),(29,'2021-09-08 12:52:23',999,0,17,1),(31,'2021-09-08 13:46:03',2,1,1,1),(32,'2021-09-08 14:29:24',1,0,8,1),(33,'2021-09-08 14:32:33',1,0,1,1),(34,'2021-09-08 14:33:44',987,0,2,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `product_describe` text,
  `product_price` int NOT NULL,
  `product_amount` int DEFAULT NULL,
  `category_id` int NOT NULL,
  `provider_id` int NOT NULL,
  `admin_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category_idx` (`category_id`),
  KEY `fk_product_provider1_idx` (`provider_id`),
  KEY `fk_product_admin1_idx` (`admin_id`),
  CONSTRAINT `fk_product_admin1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_provider1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'com nong','Bún chả thường có cùng một lúc hai loại chả: Chả viên và chả miếng, tuy tùy theo sở thích ăn uống mà có khi thực khách chỉ chọn một trong hai. Chả viên được làm từ thịt nạc vai lợn băm thật nhuyễn nặn viên, ướp trộn với muối, tiêu, nước mắm trên 35 độ đạm[2], đường, hành khô băm thật nhuyễn, dầu thực vật hoặc mỡ nước. Tùy vào độ tươi của thịt, sau khi trộn gia vị nếu thấy thịt có vẻ hơi khô thì cho thêm một chút dầu sao cho miếng thịt dễ dàng kết dính khi vo nắn thành miếng cỡ 2 ngón tay rồi nhấn cho hơi dẹp lại. Nếu thích cầu kỳ hơn thì gói ngang mỗi miếng chả là một lần lá chuối rồi mới nướng, miếng chả sẽ không bị sạm và thơm hơnCòn chả miếng thường dùng thịt nách hoặc thịt ba chỉ (ba rọi) thái mỏng tẩm ướp gia vị tương tự chả viên và nướng vàng trên than củi. Tuỳ theo khẩu vị của mỗi người, có thể gọi toàn chả miếng hoặc chả viên để ăn cùng bún. Thịt miếng thường được lọc bỏ bì (da) để khi nướng không bị cứng và khét. Nếu dùng thịt nạc quá (thịt mông, thịt thăn) khi nướng sẽ không ngon vì chả bị khô và cứng.',30213,200,1,1,1),(2,'com nguoi','com nhu cut',20032,200,1,1,1),(3,'dau dan','bla bla bla bla',32103,200,1,1,1),(4,'xuc xich','bla bla bla bla',32113,200,1,1,1),(5,'banh ngot','bla bla bla bla',54643,200,1,1,1),(6,'nem dan','bla bla bla bla',35355399,200,1,1,1),(7,'xuong ham','bla bla bla bla',5353,200,1,1,1),(8,'canh chua','bla bla bla bla',5353,200,1,1,1),(9,'oc xao','bla bla bla bla',53535,535,1,1,1),(10,'com nong','bla bla bla bla',7575,200,1,1,1),(11,'com nong','bla bla bla bla',8419,200,1,1,1),(12,'com nong','bla bla bla bla',8000,200,1,1,1),(13,'com nong','bla bla bla bla',90000,200,1,1,1),(14,'com nong','bla bla bla bla',60000,200,1,1,1),(15,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(16,'com rang','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(17,'pho bo tai chin ngoc lanh dadas','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(18,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(19,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(20,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(21,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(22,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(23,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(24,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(25,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(26,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(27,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(28,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1),(29,'cut cho','com rat la hay com ra la ngon co cai cut',34500,340,1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prodiver_name` varchar(45) NOT NULL,
  `provider_address` varchar(45) DEFAULT NULL,
  `provider_phonenumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'hung fake','ha noi','000031');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_info`
--

DROP TABLE IF EXISTS `session_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(45) NOT NULL,
  `date_create` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id_UNIQUE` (`session_id`),
  KEY `fk_session_info_user1_idx` (`user_id`),
  CONSTRAINT `fk_session_info_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_info`
--

LOCK TABLES `session_info` WRITE;
/*!40000 ALTER TABLE `session_info` DISABLE KEYS */;
INSERT INTO `session_info` VALUES (76,'64DFE10E804839E29866A5526D4D00B2','2021-09-08 12:41:49','2021-09-08 12:41:49',1,1),(77,'959D4EF6185CCF6C467E42E4312E8C47','2021-09-08 12:44:17','2021-09-08 12:44:17',1,1),(78,'71E12F3245AB0AEECEF97CC8A369C98D','2021-09-08 12:44:31','2021-09-08 12:44:31',1,1),(81,'384F5D0E0EF2B813AAA266B2512167F9','2021-09-08 12:47:01','2021-09-08 12:47:01',1,1),(82,'7D8219383233142EB3D677FD69C64F7F','2021-09-08 12:47:32','2021-09-08 12:47:32',1,1),(83,'A658DC0696C4EB480A77CD2AC87D8212','2021-09-08 12:48:00','2021-09-08 12:48:00',1,1),(86,'57E5DF6E83E453D1E7DC5D25E3C782DF','2021-09-08 12:52:44','2021-09-08 12:52:44',1,1),(87,'65635948933DE59991671D8CE1993FE3','2021-09-08 12:53:23','2021-09-08 12:53:23',1,1),(88,'416DD1971D62C6B62D531BFCF9026A0D','2021-09-08 12:55:22','2021-09-08 12:55:22',1,1),(90,'D8CFC73E293AFF71E6DB79DEE6B4F65D','2021-09-08 13:00:55','2021-09-08 13:00:55',1,1),(94,'409AFB9035EF3005E8C9A29CEA519635','2021-09-08 13:11:00','2021-09-08 13:11:00',1,1),(95,'6BC2A78EB401192B76DB896746BC0672','2021-09-08 13:12:36','2021-09-08 13:12:36',1,1),(96,'AC7DA703E5583116836DC0FBBC4C204B','2021-09-08 13:15:53','2021-09-08 13:15:53',1,1),(97,'3609BA82E919C8170FF974EA2424463A','2021-09-08 13:17:28','2021-09-08 13:17:28',1,1),(98,'538D41E98FD80E32F846B42AAF94750B','2021-09-08 13:19:24','2021-09-08 13:19:24',1,1),(99,'9B26FA9043E15A369E258898CD264796','2021-09-08 13:21:39','2021-09-08 13:21:39',1,2),(100,'24D2B0B4376B135A5660B1CE4FF57DC8','2021-09-08 13:23:54','2021-09-08 13:23:54',1,1),(101,'07A243039BC476659695BB40E061E0A5','2021-09-08 13:26:05','2021-09-08 13:26:05',1,1),(102,'A0CD7504BD2B657DA503FE6ACB035C35','2021-09-08 13:31:50','2021-09-08 13:31:50',1,1),(104,'A3758745F88B1740508D76DD25A02F42','2021-09-08 13:35:40','2021-09-08 13:35:40',1,1),(108,'184AF2D201CA6CE7717CC29111E85D14','2021-09-08 13:37:41','2021-09-08 13:37:41',1,1),(115,'55ADAEFB5CD158B8B65EF8AA43F23B16','2021-09-08 13:41:46','2021-09-08 13:41:46',1,1),(123,'BC0FC648B760C205F2E51556966165E3','2021-09-08 13:45:08','2021-09-08 13:45:08',1,1),(126,'64303D96C48B73E0F0E5F450F28AA3E6','2021-09-08 13:46:27','2021-09-08 13:46:27',1,1),(127,'F970AEAA7EC0B5642E3D23977C69E855','2021-09-08 13:47:14','2021-09-08 13:47:14',1,1),(128,'62D45B66AADE237E6E2B6738686AA796','2021-09-08 13:49:37','2021-09-08 13:49:37',1,1),(129,'CE52AFD8597725B5F64626DB9EC6AD98','2021-09-08 13:50:39','2021-09-08 13:50:39',1,1),(132,'A918B652FD486CF9C53709289DE65EB9','2021-09-08 14:03:27','2021-09-08 14:03:27',1,1),(133,'B0EBC808927E566FA31EE85279422F73','2021-09-08 14:05:40','2021-09-08 14:05:40',1,1),(134,'20714E3D1F8FEB08B072815D300411B6','2021-09-08 14:05:43','2021-09-08 14:05:43',1,1),(135,'43B7965E2BE8CAC3DDFB2731A513C4E9','2021-09-08 14:07:47','2021-09-08 14:07:47',1,1),(136,'F2E212E47D6766329691B43239174FC9','2021-09-08 14:08:10','2021-09-08 14:08:10',1,1),(137,'2339C252C00E2F3774E8AF9F3B4DC9E9','2021-09-08 14:08:15','2021-09-08 14:08:15',1,1),(138,'D9CECA387F61D49E854838418E081C40','2021-09-08 14:08:41','2021-09-08 14:08:41',1,1),(141,'206BAAFDAAF52026B31FED7714FF9C4D','2021-09-08 14:11:20','2021-09-08 14:11:20',1,1),(142,'5C8B8A31120A1BACCE49FCDAA537C615','2021-09-08 14:16:09','2021-09-08 14:16:09',1,1),(145,'BE5BCDD04EFE9B05677F2572E91B4E98','2021-09-08 14:17:49','2021-09-08 14:17:49',1,1),(147,'1C8BF5976391EDD96EC6C32143A79A5A','2021-09-08 14:19:56','2021-09-08 14:19:56',1,1),(148,'50DA0BE9F2F9E5088818ADEBD449AF02','2021-09-08 14:23:23','2021-09-08 14:23:23',1,1),(149,'347461D9F4354A67F96A1F9DAFACB58C','2021-09-08 14:24:27','2021-09-08 14:24:27',1,1),(151,'E3EE656F568AA7B18D4C93BB169134DB','2021-09-08 14:29:02','2021-09-08 14:29:02',1,1),(157,'48252E0296A9495A9EBA4CC9F5BCF86C','2021-09-08 14:38:57','2021-09-08 14:38:57',1,1),(159,'C2B8175E5A6BCC297F812C1F3D755A0F','2021-09-08 14:47:03','2021-09-08 14:47:03',1,1),(160,'B2C85FF6D3AEA1A418379620D3FDF7A9','2021-09-08 14:47:42','2021-09-08 14:47:42',1,1),(161,'C7DF08852B5064249E810E7C6EEB2689','2021-09-08 14:48:53','2021-09-08 14:48:53',1,1),(162,'3C269C7C8D6CAFE930656B189118DE9F','2021-09-08 14:53:18','2021-09-08 14:53:18',1,1),(163,'AE16E3C2062121F8C344600831A53DF8','2021-09-08 14:54:45','2021-09-08 14:54:45',1,1),(165,'E9C9B17E916E126F4C9B16360EDF456F','2021-09-08 14:59:58','2021-09-08 14:59:58',1,1),(166,'95177A382CDB691475221366A9FC8DA3','2021-09-08 15:01:42','2021-09-08 15:01:42',1,1),(167,'DD370038D7B0CE7EF87A7E542A06FE8E','2021-09-08 15:05:45','2021-09-08 15:05:45',1,1),(168,'2CCB547CDDE8972D4BF6165B9BC40091','2021-09-08 15:09:25','2021-09-08 15:09:25',1,1),(169,'A683AFCE69EE24025374AD76075F54D9','2021-09-08 15:13:35','2021-09-08 15:13:35',1,1),(170,'DDD0957A31E381278A7733D6FAED06F0','2021-09-08 15:18:26','2021-09-08 15:18:26',1,1),(171,'950E8276BD3A24B218F5D0C783C41DFB','2021-09-08 15:20:36','2021-09-08 15:20:36',1,1),(172,'DF939919E67145A24F85AC9AFE5B1C92','2021-09-08 15:21:42','2021-09-08 15:21:42',1,1),(173,'499B8B09CB3DD6E9D9B82A91C99A4225','2021-09-08 15:23:25','2021-09-08 15:23:25',1,1),(174,'F02D5B2451A5C9483AE6E992D30A6AF7','2021-09-08 15:24:19','2021-09-08 15:24:19',1,1),(175,'454C22927DA6C33ADB99015757DF5299','2021-09-08 15:25:12','2021-09-08 15:25:12',1,1),(176,'BCEE34CBCA284CA5C3C340C4062771A8','2021-09-08 15:33:39','2021-09-08 15:33:39',1,1),(177,'D4D104022798862F825856742BDF3A35','2021-09-08 15:35:38','2021-09-08 15:35:38',1,1),(178,'5AA1100F4DBB24D065D6D74CCD1A2F44','2021-09-08 16:05:43','2021-09-08 16:05:43',1,1),(179,'76BD64D6FAB5362873E2359B8CA5C174','2021-09-08 16:07:10','2021-09-08 16:07:10',1,1),(180,'36F67215E4DF6834A8294E66D44E05DB','2021-09-08 16:13:32','2021-09-08 16:13:32',1,1);
/*!40000 ALTER TABLE `session_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_details`
--

DROP TABLE IF EXISTS `ship_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apartment_number` int NOT NULL,
  `wards` varchar(45) NOT NULL,
  `district` varchar(60) NOT NULL,
  `city` varchar(60) NOT NULL,
  `national` varchar(60) DEFAULT 'Việt Nam',
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ship_user` (`user_id`),
  KEY `fk_ship_order` (`order_id`),
  CONSTRAINT `fk_ship_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fk_ship_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_details`
--

LOCK TABLES `ship_details` WRITE;
/*!40000 ALTER TABLE `ship_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `u_username` varchar(45) NOT NULL,
  `u_password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u_username_UNIQUE` (`u_username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'canngocbinh','20112001'),(2,'canngocbinh1','20112001'),(3,'admin','12345');
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

-- Dump completed on 2021-09-08 16:30:19

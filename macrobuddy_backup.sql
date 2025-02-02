-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: macrobuddy
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.22.04.1

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
-- Table structure for table `macros`
--

DROP TABLE IF EXISTS `macros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `macros` (
  `macro_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `calories` int NOT NULL,
  `protein` int NOT NULL,
  `carbs` int NOT NULL,
  `fats` int NOT NULL,
  `weight` int DEFAULT NULL,
  PRIMARY KEY (`macro_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macros`
--

LOCK TABLES `macros` WRITE;
/*!40000 ALTER TABLE `macros` DISABLE KEYS */;
INSERT INTO `macros` VALUES (1,1,'2025-01-15 10:36:35',500,100,200,50,NULL),(2,1,'2025-01-15 10:36:35',500,100,200,50,NULL),(3,1,'2025-01-15 10:36:35',500,100,200,50,NULL),(4,1,'2025-01-15 10:36:35',500,100,200,50,NULL),(5,1,'2025-01-17 10:53:32',500,100,200,50,NULL),(6,1,'2025-01-17 10:53:33',500,100,200,50,NULL),(7,1,'2025-01-17 10:53:33',500,100,200,50,NULL),(8,1,'2025-01-17 10:53:33',500,100,200,50,NULL),(9,1,'2025-01-17 10:59:11',500,100,200,50,NULL),(10,1,'2025-01-17 10:59:12',500,100,200,50,NULL),(11,1,'2025-01-17 10:59:12',500,100,200,50,NULL),(12,1,'2025-01-17 10:59:12',500,100,200,50,NULL),(13,1,'2025-01-17 10:59:12',500,100,200,50,NULL),(14,1,'2025-01-17 11:02:51',500,100,200,50,NULL),(15,1,'2025-01-17 11:02:51',500,100,200,50,NULL),(16,1,'2025-01-17 11:02:51',500,100,200,50,NULL),(17,1,'2025-01-17 11:02:51',500,100,200,50,NULL),(18,1,'2025-01-17 11:02:51',500,100,200,50,NULL),(19,1,'2025-01-17 11:03:11',500,100,200,50,NULL),(20,1,'2025-01-17 11:03:11',500,100,200,50,NULL),(21,1,'2025-01-17 11:03:12',500,100,200,50,NULL),(22,1,'2025-01-17 11:03:12',500,100,200,50,NULL),(23,1,'2025-01-17 11:03:12',500,100,200,50,NULL),(24,1,'2025-01-21 09:11:33',500,100,200,50,NULL),(25,1,'2025-01-21 09:11:33',500,100,200,50,NULL),(26,1,'2025-01-21 09:11:33',500,100,200,50,NULL),(27,1,'2025-01-21 09:11:33',500,100,200,50,NULL),(28,1,'2025-01-21 09:11:33',500,100,200,50,NULL),(29,1,'2025-01-21 09:17:12',500,100,200,50,NULL),(30,1,'2025-01-21 09:17:12',500,100,200,50,NULL),(31,1,'2025-01-21 09:17:13',500,100,200,50,NULL),(32,1,'2025-01-21 09:17:13',500,100,200,50,NULL),(33,1,'2025-01-21 09:17:13',500,100,200,50,NULL),(34,1,'2025-01-21 09:45:26',500,100,200,50,NULL),(35,1,'2025-01-21 09:45:27',500,100,200,50,NULL),(36,1,'2025-01-21 09:45:27',500,100,200,50,NULL),(37,1,'2025-01-21 09:45:27',500,100,200,50,NULL),(38,1,'2025-01-21 09:45:27',500,100,200,50,NULL);
/*!40000 ALTER TABLE `macros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalinformation`
--

DROP TABLE IF EXISTS `personalinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalinformation` (
  `PI_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `height` int NOT NULL,
  `age` int NOT NULL,
  `weight` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PI_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalinformation`
--

LOCK TABLES `personalinformation` WRITE;
/*!40000 ALTER TABLE `personalinformation` DISABLE KEYS */;
INSERT INTO `personalinformation` VALUES (1,1,1,180,25,75,'John','Doe'),(2,2,0,165,28,60,'Jane','Doe'),(3,3,1,175,30,80,'Mike','Smith');
/*!40000 ALTER TABLE `personalinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `email` varchar(25) NOT NULL,
  `hashed_password` varchar(256) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$e+lDhkGWaOrfv4HUiKRNug$I5e30PSCwv11bWYhd5CM0VhuzVGrQQWI5rjr0tw01hY','2025-01-14 13:17:14'),(2,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$QTNps1DlVxv/XKH7lqZnQw$8OuC2i0AUS2KFohfPm9DhxVESrz+kHVk4Ni3W11FAj4','2025-01-17 11:05:25'),(3,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$01fV9LikgnvUaIVNK+X+aw$/NIhE+/esDBK8+kc+MQot4rd5L0s3hpMEMuSCKrLnLI','2025-01-17 11:05:25'),(4,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$GkxYK9CyYefpnN9mT/UR6g$qW9zz/TnSObEhUW00Frkh11i9pLM13mw6iwrnk3gZB0','2025-01-17 11:05:25'),(5,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$NFKhw0UKYSHDYh+rFPMocg$c4NMnqC5QMutW6QV1I7orckm3Ymsrpzx1ZQBIZcJGfM','2025-01-17 11:05:25'),(6,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$5FFvaHUbSYWVK/NlPawAJw$Z8aWo1RvFsd+FUmsO7nFoM4gpxAhIiTGpluy7DnQ4DI','2025-01-17 11:05:25'),(7,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$jl6G7vhFEsdWNx0C4AiQ7g$AfPqpyrfPEd/ig4MCs9yRNCsGzWNvkjEUKUu6U6YZeI','2025-01-17 11:05:26'),(8,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$JZ/apa4jlQOaEGml4uAXLQ$QYNNOT8b6qm9aP1lWt7o9ql1Gk6eY+0m+DqRgxrQ2GA','2025-01-17 11:10:14'),(9,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$JDIRabt4pvOcFQOos7YFkA$rJ3aC8T2YksSLbFrku0QLQHpgkcoskswMcw2Tm8RbKg','2025-01-17 11:10:14'),(10,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$VqOSlNAL74scf+2eRVTMgQ$WOCHEs0VWtjxN3TMSoBv9IelWBXwEaNURH8lUlUN9sM','2025-01-17 11:10:15'),(11,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$S+GLdadk8XKY2GmNWQZ7xQ$MwCK5T++uDaA+xugnKHdPFxQhbIq5baM14QIS3vj4jk','2025-01-17 11:10:15'),(12,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$v3uVp3DwBNWwKTxuLpV1Sw$Ft2pF9k5F/xzI9z16xdvlLeKPqnVtm8pCnxkYUbSusE','2025-01-17 11:10:15'),(13,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$kCOfyp45eBG7RiKt/UUATg$BF7MXgo5giGSV/TuSBK2keO0Xo/4mAiwHjXAdbVNVns','2025-01-17 11:10:15'),(14,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$fpIJoAsNW9SMkcX2Vt+Zcg$x4RfwMUYS/z5vqvRm6Y7FKruTQtovtRcLBHC7n8cnSE','2025-01-17 11:10:15'),(15,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$eQQG+cISPh9GLX9le/4sCQ$MnNjwoVlxQY4NfmlhjkzDCn4cDS1N5jgxzMD4FhArz0','2025-01-17 11:11:46'),(16,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$SWxv6xiETLBeAb3Yj+MnJg$duQ3Gsi+I18Rp5sP0oDbCib0mEmu7/rwVRunYpY76o0','2025-01-17 11:11:46'),(17,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$HiKe6Xh44NyCe4B93qUIEA$551UF0PdnEf/1YzKdPaSB6SF+Sq/u956Qcto1i+o8KQ','2025-01-17 11:11:46'),(18,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$XDMmgUFZ3RldiIeK7t392Q$6dK9Z0TBnC05dBayPY7aChRbLXnbj7Sd95vtdz37yRk','2025-01-17 11:11:46'),(19,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$fMyEdkQufL1wrGAOkabgJA$9QvHCG77lYg9UUUNgYrWHG44ACnJWScf1WImDGEx1D4','2025-01-17 11:15:33'),(20,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$6z7kZ+SRXpEwUe8qlmFTUg$XYe6qOqJ/H7SmvWaWvRepKNeXmoOkmqHoV55z/+MRWk','2025-01-17 11:15:33'),(21,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$223q7zqL691ZLJT35H63UQ$s4Z5biy6YWxfAn2s9A8383kTQsolUS27SuzCIUyO1ts','2025-01-17 11:15:33'),(22,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$8Eopqv7bJla/KDL1xJbDVg$tRGW0UeHVY8VsfGpErNWBu4KmRg4/UbWxJqJJi/ZXL8','2025-01-17 11:15:34'),(23,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$Zh2o6k0TFxOkNyYgnkIJKw$4k2zyrXNyw9DVI1TwWpXSmML14WKLhIBLAm3AOwiIG8','2025-01-17 11:22:07'),(24,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$3Yigv2bODbruldKR0hAlAw$SJzYQVZwhsdsfZc4f+CjHwdFmxekB5Vrk+xjEELFTAA','2025-01-17 11:22:07'),(25,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$peTrAxyge+6aMlAPpo4mgw$bT/oxwQ6yRMmZzZCrb5m/I3vYCoUKLNFnTEePFtZg+8','2025-01-17 11:22:07'),(26,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$o0poh0BfoWJzsengOeB0gA$wwG5vhavGzfKh2klrSPFJLvBVFzZSlZUnj5Gz1Ky33w','2025-01-17 11:22:07'),(27,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$59W8GtRk6fa5+Gfdt+Ns0A$uFRbZvr0YyLeaq4ja0pvzYEW/c2/YfFYIbM424AZSHw','2025-01-17 11:24:00'),(28,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$NQvUV4XHbp58Nh8tI1NhtQ$B3oTFIcp/Wx9osayg6XXnYW6F/PdFnXVpPo5VbPhm+s','2025-01-17 11:24:00'),(29,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$Qhhv0rIilZHmYAmG11zTfQ$RpHm+JFD5ex18roYLNSC/LfEP/ctHHdGxJCwb+a4wMo','2025-01-17 11:24:00'),(30,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$SgsMp0ojnHMJUiJw6nDFnQ$QqheDcYCJSckIPv2CbvWFmuhOZWnRncehVuqsm8CPkc','2025-01-17 11:24:00'),(31,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$8+7QupsRheRbp0ERYxe90g$Az+JrJ6uLcgqPwPR5qwmCsvGjUGeGbgccRDLehBj1ts','2025-01-17 11:27:08'),(32,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$JLht8ECY1r3v2WgCTtgIQA$6Uv7stcMfPlDEJrH/hcGTduD30Zm1yXLJRu89NcqaB8','2025-01-17 11:27:08'),(33,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$bmXUNGfH3MrsX4h9sEeTBA$mW75O6Fi3+D7kSQliH9pNpA+LZb2gqAyCyt+H4HLjnQ','2025-01-17 11:27:08'),(34,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$pj6CIvRlw5wCo75qlo6Xpw$GfSbrXBpXhS2qStnDCcLxQ4c+PYJ8066Oe4ZRtWLh5s','2025-01-17 11:27:09'),(35,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$8jxo6RYfYzKpakqJ4UhjSg$p8FrKj7Uky9RyZlrO5qsg8fkPRbfLyVCVTzcXGIqe+o','2025-01-17 11:27:44'),(36,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$OY20LAoaUqa/u2p2+QzpaQ$rA3sEBL4xSHq/9WEzDKJM2UlHUsoSXD7QkJxlPK+LqQ','2025-01-17 11:27:44'),(37,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$7z5YZyf+LdMmvEYVXtoazw$GbJ85CQVWnXvytXj6uwf9kzQxaTMrwiq7zBECfN+gcM','2025-01-17 11:27:44'),(38,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$zbqJqrpUg7ZSl0iB17pKiw$75c8S9zk27oc/xZuG/miOaqED/GMNaMGDJzngmTlWzo','2025-01-17 11:27:44'),(39,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$JABd1FsxrPtlV4GkcTci+w$jxDCRmRsmsQmhfhE2086vnPB7gwbG2D5O368HPE6alQ','2025-01-17 11:29:35'),(40,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$i9X8wl+KpUZ+UCcw6L42kQ$fsWC6PXRzZ+/JST4qM7GNMyi3DTUrNkVdnB5K2ykXXY','2025-01-17 11:29:35'),(41,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$AWB+WLowRa63sqrKBqSmMA$PHNVkRVO8PBL3BcioeVaMY3+9KG/4T4oQoz+FVxsjxs','2025-01-17 11:29:35'),(42,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$2z2QEcNppVhkAjwIAvMpRg$dk1adRS+kaRdlhTXXnZ+SPO33G3T0lHXYAem1HAindM','2025-01-17 11:29:35'),(43,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$6qlND+ZWJh9W5uldspXgIQ$GPeFnU7kx9Z9DI9nxqvtg4CmbUAlLvksyLrRWj+RV6E','2025-01-17 11:30:59'),(44,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$KXYxZ7s4YFZHIfCPPUcKjw$6Uzb+i5i4yhqkP4tdalEazNwpRuafEPGg79GhoaHOhM','2025-01-17 11:30:59'),(45,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$1+RlSYOP+jZQLswhvkf68w$VMeTG9J8NGfLBx7mx3GH2Lx/8yCB76VMCwiANBwRx3I','2025-01-17 11:30:59'),(46,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$wUeo8GluLogTqZ8m/R7NqQ$kx1vhz901rhvAHS4vymm8Z5YX0ZRXtDTjl1K3fvRuH8','2025-01-17 11:31:00'),(47,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$8++c58f+tg3cYVuzGONHcg$r7LeDjbv2Rfy3RQ6BYr6QJmlAomqjDRcXncdBh7qFRQ','2025-01-17 11:33:26'),(48,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$A/7XsaoU8sa8inHsbCmNqw$8LNZmCPUpdYjbCVjMxgzBLzCtd/oKwgsb2SOvDqd+GI','2025-01-17 11:33:26'),(49,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$kOtXo3kYo0gFBJVEqWaiOA$qnZqago7+TVDYV5LmPczsFqhf0HdWydme/Cv1mJjeIY','2025-01-17 11:33:26'),(50,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$LWSwNsMNXKxA1HUzc/rCTA$JxCsmlcNS05GInKarOhF1L9Q1z/TgRci6bkwtK9hdBE','2025-01-17 11:33:27'),(51,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$lKu3zD+orGt5Zk369TNaMQ$pN5L+LqUzxAWsTXkxJYkmPz4N0Zdk0tNuubZ17gjGSQ','2025-01-17 11:35:43'),(52,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$J3Y7TxuHLrpT4DkcImJMeA$kWDpnZeMPo+YiXHfGE1gerjeOcXe8YTjFW7LDCbfqT0','2025-01-17 11:37:40'),(53,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$caCp+fny/f1or702lbCZ2A$vUazJw6xDMVN4Zg8TgD7Kl7l4GcddeP/A46Nx/rZg+o','2025-01-21 09:18:25'),(54,'testuser','test@example.com','$argon2id$v=19$m=65536,t=3,p=4$AcFUIZ2N4YF0oGhIoFLOnA$sKzTH344y5qqWMC97mhtTsVumGsgsOEqeZtyx7aJPHg','2025-01-21 09:21:54');
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

-- Dump completed on 2025-02-02 14:46:28

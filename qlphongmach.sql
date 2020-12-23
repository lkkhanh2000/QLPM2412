-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: qlphongmach
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maHoaDon` int NOT NULL,
  `maThuoc` int NOT NULL,
  `soLuong` int DEFAULT NULL,
  `thanhTien` int NOT NULL,
  PRIMARY KEY (`id`,`maHoaDon`,`maThuoc`),
  KEY `maHoaDon` (`maHoaDon`),
  KEY `maThuoc` (`maThuoc`),
  CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`maHoaDon`) REFERENCES `hoadon` (`maHoaDon`),
  CONSTRAINT `chitiethoadon_ibfk_3` FOREIGN KEY (`maThuoc`) REFERENCES `thuoc` (`maThuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (1,1,1,2,20000),(2,1,2,2,40000);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhsachbenhnhan`
--

DROP TABLE IF EXISTS `danhsachbenhnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhsachbenhnhan` (
  `maBN` int NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` date DEFAULT NULL,
  `diaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayKham` date DEFAULT NULL,
  `loaiBenh` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trieuchung` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maBN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhsachbenhnhan`
--

LOCK TABLES `danhsachbenhnhan` WRITE;
/*!40000 ALTER TABLE `danhsachbenhnhan` DISABLE KEYS */;
INSERT INTO `danhsachbenhnhan` VALUES (1,'Nguyễn Hoàng Trung','Nam','2020-12-23','24a','2020-12-23','Cảm','Sốt'),(2,'Nguyễn Hoàng B','Nữ','2020-12-14','22a','2020-12-29','Covid','Sốt');
/*!40000 ALTER TABLE `danhsachbenhnhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `maHoaDon` int NOT NULL AUTO_INCREMENT,
  `ngayBan` date DEFAULT NULL,
  PRIMARY KEY (`maHoaDon`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (1,'2020-12-23');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `maNhanVien` int NOT NULL AUTO_INCREMENT,
  `hoTen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gioiTinh` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `diaChi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int NOT NULL,
  `contact` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maNhanVien`),
  KEY `id` (`id`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Nguyễn Hoàng A','Nam','2020-12-23','24a bcs',2,'000000'),(2,'Nguyễn Hoàng Trung','Nam','2020-12-24','24a',3,'0000001');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieukhambenh`
--

DROP TABLE IF EXISTS `phieukhambenh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieukhambenh` (
  `maPKB` int NOT NULL AUTO_INCREMENT,
  `maBN` int NOT NULL,
  PRIMARY KEY (`maPKB`,`maBN`),
  KEY `maBN` (`maBN`),
  CONSTRAINT `phieukhambenh_ibfk_1` FOREIGN KEY (`maBN`) REFERENCES `danhsachbenhnhan` (`maBN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieukhambenh`
--

LOCK TABLES `phieukhambenh` WRITE;
/*!40000 ALTER TABLE `phieukhambenh` DISABLE KEYS */;
INSERT INTO `phieukhambenh` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `phieukhambenh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `maThuoc` int NOT NULL AUTO_INCREMENT,
  `tenThuoc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaTien` float DEFAULT NULL,
  `cachDung` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maThuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (1,'A',10000,'2 lần/ngày'),(2,'B',20000,'3 lần/ngày'),(3,'C',40000,'1 lần/ngày');
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` enum('USER','ADMIN') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Khanh','admin','e10adc3949ba59abbe56e057f20f883e','ADMIN',1),(2,'a','a','0cc175b9c0f1b6a831c399e269772661','USER',1),(3,'aba','b','e10adc3949ba59abbe56e057f20f883e','USER',1);
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

-- Dump completed on 2020-12-23 18:40:04

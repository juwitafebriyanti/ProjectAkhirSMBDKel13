-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 152.67.198.76    Database: DB220441100007
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `KaryawanDepartemen`
--

DROP TABLE IF EXISTS `KaryawanDepartemen`;
/*!50001 DROP VIEW IF EXISTS `KaryawanDepartemen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `KaryawanDepartemen` AS SELECT
 1 AS `id_karyawan`,
  1 AS `nama_lengkap`,
  1 AS `nama_departemen`,
  1 AS `nama_jabatan` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departemen` (
  `id_departemen` int NOT NULL,
  `nama_departemen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen`
--

LOCK TABLES `departemen` WRITE;
/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
INSERT INTO `departemen` VALUES
(1,'HRD'),
(2,'IT'),
(3,'Keuangan '),
(4,'Produksi/Operasional'),
(5,'Penjualan dan Pemasaran'),
(6,'Logistik'),
(7,'Administrasi Umum'),
(8,'Kualitas'),
(9,'Penelitian dan Pengembangan');
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaji`
--

DROP TABLE IF EXISTS `gaji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gaji` (
  `id_gaji` int NOT NULL AUTO_INCREMENT,
  `id_karyawan` int DEFAULT NULL,
  `jumlah_gaji` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_gaji`),
  KEY `gaji_ibfk_1` (`id_karyawan`),
  CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaji`
--

LOCK TABLES `gaji` WRITE;
/*!40000 ALTER TABLE `gaji` DISABLE KEYS */;
INSERT INTO `gaji` VALUES
(1,1,13000000.00),
(2,2,15000000.00),
(3,3,10000000.00),
(4,4,11000000.00),
(5,5,10000000.00),
(6,6,10000000.00),
(7,7,10000000.00),
(8,8,12000000.00),
(9,9,10000000.00),
(10,10,10000000.00),
(11,11,15000000.00),
(12,12,11000000.00),
(13,13,10000000.00),
(14,14,10000000.00),
(15,15,10000000.00),
(16,16,13000000.00),
(17,17,10000000.00),
(18,18,10000000.00),
(19,19,10000000.00),
(21,20,10000000.00);
/*!40000 ALTER TABLE `gaji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jabatan` (
  `id_jabatan` int NOT NULL,
  `nama_jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jabatan`
--

LOCK TABLES `jabatan` WRITE;
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` VALUES
(1,'Direktur'),
(2,'Manager'),
(3,'Supervisor'),
(4,'Staff');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karyawan` (
  `id_karyawan` int NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `id_departemen` int DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nomor_telepon` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_jabatan` int DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`),
  KEY `id_jabatan` (`id_jabatan`),
  KEY `id_departemen` (`id_departemen`),
  CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`),
  CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` VALUES
(1,'Ananda Putri ','Perempuan','1999-01-05',2,'ananda@gmail.com','082267337821','Jl. Bumi Ayu No.13',2),
(2,'Adam Pratama','Laki-laki','1999-03-09',1,'adam@gmail.com','083321374628','Jl. Nusa Indah No.33',2),
(3,'Satriya Dwi Ardhi','Laki-laki','1994-05-09',4,'satriya@gmail.com','082246371837','Jl. Melati No.44',3),
(4,'Andi Wijaya','Laki-Laki','1995-06-14',6,'andi@gmail.com','082267583928','Jl. Buah Batu No.22',4),
(5,'Rani Permata Sari','Perempuan','1999-12-02',5,'rani@gmail.com','095237483736','Jl. Kenangan No.12',3),
(6,'Firman Maulana','Laki-Laki','1999-05-09',5,'firman@gmail.com','083126473849','Jl. Imam Bonjol No.43',2),
(7,'Anita Dewi','Perempuan','2000-02-01',3,'anita@gmail.com','081237485938','Jl. Kamboja No.32',4),
(8,'Lina Fitriani','Perempuan','2000-01-31',7,'lina@gmail.com','082264738293','Jl. Antapani No.33',1),
(9,'Dina Kartika','Perempuan','2020-09-28',9,'dina@gmail.com','089123745859','Jl. Cokroaminoto No.24',2),
(10,'Wulan Cahaya','Perempuan','1998-08-15',8,'wulan@gmail.com','081237483748','Jl. Bangau No.15',1),
(11,'Hafiz Rahman','Laki-Laki','1997-09-28',2,'hafiz@gmail.com','089536473839','Jl. Sukajadi No.23',1),
(12,'Arief Setiawan','Laki-Laki','2001-01-14',6,'arief@gmail.com','082237481928','Jl. Beringin No.21',4),
(13,'Nadia Putri','Perempuan','2020-08-11',3,'nadia@gmail.com','085238429384','Jl. Jambu No.22',3),
(14,'Dhani Pratama','Laki-Laki','1999-12-01',5,'dhani@gmail.com','083134827382','Jl. Belimbing No.28',2),
(15,'Rendra Nugroho','Laki-Laki','2001-05-15',9,'rendra@gmail.com','081364273829','Jl. Kartini No.08',3),
(16,'Siti Nurhayati','Perempuan','1998-10-27',1,'siti@gmail.com','083148372637','Jl. Senopati No.04',3),
(17,'Yoga Kurniawan','Laki-Laki','2000-12-12',4,'yoga@gmail.com','089526372817','Jl. Cempaka No.19',4),
(18,'Maya Dewi','Perempuan','2000-01-17',7,'maya@gmail.com','082216374627','Jl. Merpati No.20',2),
(19,'Rina Wahyuni','Laki-Laki','1999-07-14',3,'rina@gmail.com','082236475849','Jl. Diponegoro No.13',4),
(20,'Rizky Prasetyo','Laki-laki','1998-09-15',9,'rizky@gmai.com','082276458765','Jl. Sedono No.01',4);
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`220441100007`@`%`*/ /*!50003 TRIGGER `tr_insert_riwayat_pekerjaan` AFTER INSERT ON `karyawan` FOR EACH ROW BEGIN
    INSERT INTO riwayat_pekerjaan (id_karyawan, tanggal_mulai, tanggal_selesai, id_departemen, id_jabatan)
    VALUES (NEW.id_karyawan, NULL, NULL, NEW.id_departemen, NEW.id_jabatan);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`220441100007`@`%`*/ /*!50003 TRIGGER `delete_karyawan_data` AFTER DELETE ON `karyawan` FOR EACH ROW BEGIN
    DECLARE id_karyawan_deleted INT;

    SET id_karyawan_deleted = OLD.id_karyawan;
    DELETE FROM gaji WHERE id_karyawan = id_karyawan_deleted;
    DELETE FROM riwayat_pekerjaan WHERE id_karyawan = id_karyawan_deleted;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `karyawan_departemen`
--

DROP TABLE IF EXISTS `karyawan_departemen`;
/*!50001 DROP VIEW IF EXISTS `karyawan_departemen`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `karyawan_departemen` AS SELECT
 1 AS `nama_lengkap`,
  1 AS `nama_departemen` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `karyawan_jabatan`
--

DROP TABLE IF EXISTS `karyawan_jabatan`;
/*!50001 DROP VIEW IF EXISTS `karyawan_jabatan`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `karyawan_jabatan` AS SELECT
 1 AS `nama_lengkap`,
  1 AS `nama_jabatan` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `riwayat_pekerjaan`
--

DROP TABLE IF EXISTS `riwayat_pekerjaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riwayat_pekerjaan` (
  `id_riwayat` int NOT NULL AUTO_INCREMENT,
  `id_karyawan` int DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `id_jabatan` int DEFAULT NULL,
  `id_departemen` int DEFAULT NULL,
  `catatan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_riwayat`),
  KEY `id_departemen` (`id_departemen`),
  KEY `id_jabatan` (`id_jabatan`),
  KEY `riwayat_pekerjaan_ibfk_1` (`id_karyawan`),
  CONSTRAINT `riwayat_pekerjaan_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE,
  CONSTRAINT `riwayat_pekerjaan_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  CONSTRAINT `riwayat_pekerjaan_ibfk_3` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riwayat_pekerjaan`
--

LOCK TABLES `riwayat_pekerjaan` WRITE;
/*!40000 ALTER TABLE `riwayat_pekerjaan` DISABLE KEYS */;
INSERT INTO `riwayat_pekerjaan` VALUES
(1,1,'2023-09-04','2024-06-27',2,1,'Aktif'),
(2,2,'2018-02-08','2028-08-02',2,2,'Aktif'),
(3,3,'2017-09-11','2027-09-11',3,4,'Aktif'),
(4,4,'2013-07-11','2023-07-11',4,6,'Resign'),
(5,5,'2013-12-23','2023-12-23',3,5,'Resign'),
(6,6,'2012-12-20','2022-12-20',2,5,'Resign'),
(7,7,'2020-02-23','2030-02-23',4,3,'Aktif'),
(8,8,'2016-06-16','2026-06-16',1,7,'Aktif'),
(9,9,'2014-05-13','2024-05-13',2,9,'Resign'),
(10,10,'2020-01-06','2030-01-06',1,8,'Aktif'),
(11,11,'2022-08-22','2032-08-22',1,2,'Aktif'),
(12,12,'2020-09-14','2030-09-14',4,6,'Aktif'),
(13,13,'2018-05-07','2028-05-07',3,3,'Aktif'),
(14,14,'2019-10-15','2029-10-15',2,5,'Aktif'),
(15,15,'2022-10-18','2032-10-18',3,9,'Aktif'),
(16,16,'2013-10-15','2023-10-15',3,1,'Resign'),
(17,17,'2016-06-07','2026-06-07',4,4,'Aktif'),
(18,18,'2021-07-14','2031-07-14',2,7,'Aktif'),
(19,19,'2019-11-13','2029-11-13',4,3,'Aktif'),
(23,20,'2017-09-18','2027-09-18',4,9,'Aktif');
/*!40000 ALTER TABLE `riwayat_pekerjaan` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`220441100007`@`%`*/ /*!50003 TRIGGER `update_riwayat_pekerjaan` BEFORE UPDATE ON `riwayat_pekerjaan` FOR EACH ROW BEGIN
    IF NEW.tanggal_selesai < CURDATE() THEN
        SET NEW.catatan = 'Resign';
    ELSE
        SET NEW.catatan = 'Aktif'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `tampil_riwayat`
--

DROP TABLE IF EXISTS `tampil_riwayat`;
/*!50001 DROP VIEW IF EXISTS `tampil_riwayat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tampil_riwayat` AS SELECT
 1 AS `id_riwayat`,
  1 AS `nama_lengkap`,
  1 AS `tanggal_mulai`,
  1 AS `tanggal_selesai`,
  1 AS `nama_jabatan`,
  1 AS `nama_departemen`,
  1 AS `catatan` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_login` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` VALUES
('admin','123');
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_gaji`
--

DROP TABLE IF EXISTS `view_gaji`;
/*!50001 DROP VIEW IF EXISTS `view_gaji`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_gaji` AS SELECT
 1 AS `id_gaji`,
  1 AS `nama_lengkap`,
  1 AS `jumlah_gaji` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `KaryawanDepartemen`
--

/*!50001 DROP VIEW IF EXISTS `KaryawanDepartemen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`220441100007`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `KaryawanDepartemen` AS select `k`.`id_karyawan` AS `id_karyawan`,`k`.`nama_lengkap` AS `nama_lengkap`,`d`.`nama_departemen` AS `nama_departemen`,`j`.`nama_jabatan` AS `nama_jabatan` from ((`karyawan` `k` join `jabatan` `j` on((`j`.`id_jabatan` = `k`.`id_jabatan`))) join `departemen` `d` on((`k`.`id_departemen` = `d`.`id_departemen`))) order by `k`.`id_karyawan` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `karyawan_departemen`
--

/*!50001 DROP VIEW IF EXISTS `karyawan_departemen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `karyawan_departemen` AS select `a`.`nama_lengkap` AS `nama_lengkap`,`b`.`nama_departemen` AS `nama_departemen` from (`karyawan` `a` join `departemen` `b` on((`a`.`id_departemen` = `b`.`id_departemen`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `karyawan_jabatan`
--

/*!50001 DROP VIEW IF EXISTS `karyawan_jabatan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`220441100007`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `karyawan_jabatan` AS select `k`.`nama_lengkap` AS `nama_lengkap`,`j`.`nama_jabatan` AS `nama_jabatan` from ((`karyawan` `k` join `riwayat_pekerjaan` `r` on((`k`.`id_karyawan` = `r`.`id_karyawan`))) join `jabatan` `j` on((`j`.`id_jabatan` = `r`.`id_jabatan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tampil_riwayat`
--

/*!50001 DROP VIEW IF EXISTS `tampil_riwayat`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`220441100007`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tampil_riwayat` AS select `a`.`id_riwayat` AS `id_riwayat`,`b`.`nama_lengkap` AS `nama_lengkap`,`a`.`tanggal_mulai` AS `tanggal_mulai`,`a`.`tanggal_selesai` AS `tanggal_selesai`,`d`.`nama_jabatan` AS `nama_jabatan`,`c`.`nama_departemen` AS `nama_departemen`,`a`.`catatan` AS `catatan` from (((`riwayat_pekerjaan` `a` join `karyawan` `b` on((`a`.`id_karyawan` = `b`.`id_karyawan`))) join `departemen` `c` on((`b`.`id_departemen` = `c`.`id_departemen`))) join `jabatan` `d` on((`d`.`id_jabatan` = `a`.`id_jabatan`))) order by `a`.`id_riwayat` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_gaji`
--

/*!50001 DROP VIEW IF EXISTS `view_gaji`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`220441100007`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_gaji` AS select `g`.`id_gaji` AS `id_gaji`,`k`.`nama_lengkap` AS `nama_lengkap`,`g`.`jumlah_gaji` AS `jumlah_gaji` from (`gaji` `g` join `karyawan` `k` on((`g`.`id_karyawan` = `k`.`id_karyawan`))) */;
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

-- Dump completed on 2024-06-14 21:30:49

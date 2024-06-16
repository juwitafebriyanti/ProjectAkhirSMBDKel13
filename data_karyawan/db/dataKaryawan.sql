/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.37-0ubuntu0.22.04.3 : Database - DB220441100007
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`DB220441100007` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `DB220441100007`;

/*Table structure for table `departemen` */

DROP TABLE IF EXISTS `departemen`;

CREATE TABLE `departemen` (
  `id_departemen` int NOT NULL,
  `nama_departemen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_departemen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `departemen` */

insert  into `departemen`(`id_departemen`,`nama_departemen`) values 
(1,'HRD'),
(2,'IT'),
(3,'Keuangan '),
(4,'Produksi/Operasional'),
(5,'Penjualan dan Pemasaran'),
(6,'Logistik'),
(7,'Administrasi Umum'),
(8,'Kualitas'),
(9,'Penelitian dan Pengembangan');

/*Table structure for table `gaji` */

DROP TABLE IF EXISTS `gaji`;

CREATE TABLE `gaji` (
  `id_gaji` int NOT NULL AUTO_INCREMENT,
  `id_karyawan` int DEFAULT NULL,
  `jumlah_gaji` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_gaji`),
  KEY `gaji_ibfk_1` (`id_karyawan`),
  CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `gaji` */

insert  into `gaji`(`id_gaji`,`id_karyawan`,`jumlah_gaji`) values 
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

/*Table structure for table `jabatan` */

DROP TABLE IF EXISTS `jabatan`;

CREATE TABLE `jabatan` (
  `id_jabatan` int NOT NULL,
  `nama_jabatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `jabatan` */

insert  into `jabatan`(`id_jabatan`,`nama_jabatan`) values 
(1,'Direktur'),
(2,'Manager'),
(3,'Supervisor'),
(4,'Staff');

/*Table structure for table `karyawan` */

DROP TABLE IF EXISTS `karyawan`;

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

/*Data for the table `karyawan` */

insert  into `karyawan`(`id_karyawan`,`nama_lengkap`,`jenis_kelamin`,`tanggal_lahir`,`id_departemen`,`email`,`nomor_telepon`,`alamat`,`id_jabatan`) values 
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

/*Table structure for table `riwayat_pekerjaan` */

DROP TABLE IF EXISTS `riwayat_pekerjaan`;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `riwayat_pekerjaan` */

insert  into `riwayat_pekerjaan`(`id_riwayat`,`id_karyawan`,`tanggal_mulai`,`tanggal_selesai`,`id_jabatan`,`id_departemen`,`catatan`) values 
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

/*Table structure for table `tb_login` */

DROP TABLE IF EXISTS `tb_login`;

CREATE TABLE `tb_login` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tb_login` */

insert  into `tb_login`(`username`,`password`) values 
('admin','123');

/* Trigger structure for table `karyawan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tr_insert_riwayat_pekerjaan` */$$

/*!50003 CREATE */ /*!50017 DEFINER = '220441100007'@'%' */ /*!50003 TRIGGER `tr_insert_riwayat_pekerjaan` AFTER INSERT ON `karyawan` FOR EACH ROW BEGIN
    INSERT INTO riwayat_pekerjaan (id_karyawan, tanggal_mulai, tanggal_selesai, id_departemen, id_jabatan)
    VALUES (NEW.id_karyawan, NULL, NULL, NEW.id_departemen, NEW.id_jabatan);
END */$$


DELIMITER ;

/* Trigger structure for table `karyawan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_karyawan_data` */$$

/*!50003 CREATE */ /*!50017 DEFINER = '220441100007'@'%' */ /*!50003 TRIGGER `delete_karyawan_data` AFTER DELETE ON `karyawan` FOR EACH ROW BEGIN
    DECLARE id_karyawan_deleted INT;

    SET id_karyawan_deleted = OLD.id_karyawan;
    DELETE FROM gaji WHERE id_karyawan = id_karyawan_deleted;
    DELETE FROM riwayat_pekerjaan WHERE id_karyawan = id_karyawan_deleted;
END */$$


DELIMITER ;

/* Trigger structure for table `riwayat_pekerjaan` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_riwayat_pekerjaan` */$$

/*!50003 CREATE */ /*!50017 DEFINER = '220441100007'@'%' */ /*!50003 TRIGGER `update_riwayat_pekerjaan` BEFORE UPDATE ON `riwayat_pekerjaan` FOR EACH ROW BEGIN
    IF NEW.tanggal_selesai < CURDATE() THEN
        SET NEW.catatan = 'Resign';
    ELSE
        SET NEW.catatan = 'Aktif'; 
    END IF;
END */$$


DELIMITER ;

/* Procedure structure for procedure `jumlah_karyawan_per_departemen` */

/*!50003 DROP PROCEDURE IF EXISTS  `jumlah_karyawan_per_departemen` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_karyawan_per_departemen`()
BEGIN
    SELECT nama_departemen, COUNT(id_karyawan) AS jumlah_karyawan
    FROM departemen d
    LEFT JOIN karyawan k ON d.id_departemen = k.id_departemen
    GROUP BY nama_departemen;
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_karyawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_karyawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `update_karyawan`(
    IN p_id_karyawan INT,
    IN p_nama_lengkap VARCHAR(100),
    IN p_jenis_kelamin VARCHAR(10),
    IN p_tanggal_lahir DATE,
    IN p_departemen_id INT,
    IN p_email VARCHAR(100),
    IN p_nomor_telepon VARCHAR(20),
    IN p_alamat VARCHAR(255)
)
BEGIN
    -- Update data di tabel karyawan
    UPDATE karyawan
    SET nama_lengkap = p_nama_lengkap,
        jenis_kelamin = p_jenis_kelamin,
        tanggal_lahir = p_tanggal_lahir,
        id_departemen = p_departemen_id,
        email = p_email,
        nomor_telepon = p_nomor_telepon,
        alamat = p_alamat
    WHERE id_karyawan = p_id_karyawan;
END */$$
DELIMITER ;

/* Procedure structure for procedure `jumlah_karyawan_per_jabatan` */

/*!50003 DROP PROCEDURE IF EXISTS  `jumlah_karyawan_per_jabatan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`220441100007`@`%` PROCEDURE `jumlah_karyawan_per_jabatan`()
BEGIN
    SELECT nama_jabatan, COUNT(id_karyawan) AS jumlah_karyawan
    FROM jabatan j
    LEFT JOIN riwayat_pekerjaan k ON j.id_jabatan = k.id_jabatan
    GROUP BY nama_jabatan;
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_gaji_karyawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_gaji_karyawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`220441100007`@`%` PROCEDURE `update_gaji_karyawan`(
    IN p_id_karyawan INT,
    IN p_jumlah_gaji DECIMAL(10,2)
)
BEGIN
    UPDATE gaji
    SET jumlah_gaji = p_jumlah_gaji
    WHERE id_karyawan = p_id_karyawan;
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_tampil_riwayat` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_tampil_riwayat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`220441100007`@`%` PROCEDURE `update_tampil_riwayat`(
    IN p_nama_lengkap VARCHAR(255),
    IN p_tanggal_mulai DATE,
    IN p_tanggal_selesai DATE,
    IN p_nama_jabatan VARCHAR(255),
    IN p_nama_departemen VARCHAR(255) 
)
BEGIN
    -- Update the riwayat_pekerjaan table
    UPDATE riwayat_pekerjaan rp
    JOIN karyawan k ON rp.id_karyawan = k.id_karyawan
    JOIN departemen d ON k.id_departemen = d.id_departemen
    JOIN jabatan j ON j.id_jabatan = rp.id_jabatan
    SET
        rp.tanggal_mulai = p_tanggal_mulai,
        rp.tanggal_selesai = p_tanggal_selesai,
        rp.id_jabatan = (SELECT id_jabatan FROM jabatan WHERE nama_jabatan = p_nama_jabatan COLLATE utf8mb4_general_ci),
        k.id_departemen = d.id_departemen
    WHERE k.nama_lengkap = p_nama_lengkap COLLATE utf8mb4_general_ci
        AND d.nama_departemen = p_nama_departemen COLLATE utf8mb4_general_ci
        AND j.nama_jabatan = p_nama_jabatan COLLATE utf8mb4_general_ci;

    -- Check if the updates were successful
    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Update failed, check the input data';
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `tampilkan_karyawan` */

/*!50003 DROP PROCEDURE IF EXISTS  `tampilkan_karyawan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`220441100007`@`%` PROCEDURE `tampilkan_karyawan`()
BEGIN
    DECLARE id_karyawan INT DEFAULT 1;
    DECLARE max_id INT;
    
    SELECT MAX(id_karyawan) INTO max_id FROM karyawan;
    
    SET max_id = COALESCE(max_id, 0);
    
    WHILE id_karyawan <= max_id DO
        SELECT id_karyawan, nama_lengkap, jenis_kelamin, tanggal_lahir, email, nomor_telepon, alamat, nama_departemen, nama_jabatan 
        FROM karyawan k join departemen d on k.id_departemen=d.id_departemen 
        join jabatan j on k.id_jabatan=j.id_jabatan WHERE id_karyawan = id_karyawan;
        SET id_karyawan = id_karyawan + 1;
    END WHILE;
    
END */$$
DELIMITER ;

/*Table structure for table `KaryawanDepartemen` */

DROP TABLE IF EXISTS `KaryawanDepartemen`;

/*!50001 DROP VIEW IF EXISTS `KaryawanDepartemen` */;
/*!50001 DROP TABLE IF EXISTS `KaryawanDepartemen` */;

/*!50001 CREATE TABLE  `KaryawanDepartemen`(
 `id_karyawan` int ,
 `nama_lengkap` varchar(100) ,
 `id_departemen` int ,
 `id_jabatan` int 
)*/;

/*Table structure for table `karyawan_departemen` */

DROP TABLE IF EXISTS `karyawan_departemen`;

/*!50001 DROP VIEW IF EXISTS `karyawan_departemen` */;
/*!50001 DROP TABLE IF EXISTS `karyawan_departemen` */;

/*!50001 CREATE TABLE  `karyawan_departemen`(
 `nama_lengkap` varchar(100) ,
 `nama_departemen` varchar(255) 
)*/;

/*Table structure for table `karyawan_jabatan` */

DROP TABLE IF EXISTS `karyawan_jabatan`;

/*!50001 DROP VIEW IF EXISTS `karyawan_jabatan` */;
/*!50001 DROP TABLE IF EXISTS `karyawan_jabatan` */;

/*!50001 CREATE TABLE  `karyawan_jabatan`(
 `nama_lengkap` varchar(100) ,
 `nama_jabatan` varchar(255) 
)*/;

/*Table structure for table `tampil_riwayat` */

DROP TABLE IF EXISTS `tampil_riwayat`;

/*!50001 DROP VIEW IF EXISTS `tampil_riwayat` */;
/*!50001 DROP TABLE IF EXISTS `tampil_riwayat` */;

/*!50001 CREATE TABLE  `tampil_riwayat`(
 `id_riwayat` int ,
 `nama_lengkap` varchar(100) ,
 `tanggal_mulai` date ,
 `tanggal_selesai` date ,
 `nama_jabatan` varchar(255) ,
 `nama_departemen` varchar(255) ,
 `catatan` varchar(50) 
)*/;

/*Table structure for table `view_gaji` */

DROP TABLE IF EXISTS `view_gaji`;

/*!50001 DROP VIEW IF EXISTS `view_gaji` */;
/*!50001 DROP TABLE IF EXISTS `view_gaji` */;

/*!50001 CREATE TABLE  `view_gaji`(
 `id_gaji` int ,
 `nama_lengkap` varchar(100) ,
 `jumlah_gaji` decimal(10,2) 
)*/;

/*View structure for view KaryawanDepartemen */

/*!50001 DROP TABLE IF EXISTS `KaryawanDepartemen` */;
/*!50001 DROP VIEW IF EXISTS `KaryawanDepartemen` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`220441100007`@`%` SQL SECURITY DEFINER VIEW `KaryawanDepartemen` AS select `karyawan`.`id_karyawan` AS `id_karyawan`,`karyawan`.`nama_lengkap` AS `nama_lengkap`,`karyawan`.`id_departemen` AS `id_departemen`,`karyawan`.`id_jabatan` AS `id_jabatan` from `karyawan` */;

/*View structure for view karyawan_departemen */

/*!50001 DROP TABLE IF EXISTS `karyawan_departemen` */;
/*!50001 DROP VIEW IF EXISTS `karyawan_departemen` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `karyawan_departemen` AS select `a`.`nama_lengkap` AS `nama_lengkap`,`b`.`nama_departemen` AS `nama_departemen` from (`karyawan` `a` join `departemen` `b` on((`a`.`id_departemen` = `b`.`id_departemen`))) */;

/*View structure for view karyawan_jabatan */

/*!50001 DROP TABLE IF EXISTS `karyawan_jabatan` */;
/*!50001 DROP VIEW IF EXISTS `karyawan_jabatan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`220441100007`@`%` SQL SECURITY DEFINER VIEW `karyawan_jabatan` AS select `k`.`nama_lengkap` AS `nama_lengkap`,`j`.`nama_jabatan` AS `nama_jabatan` from ((`karyawan` `k` join `riwayat_pekerjaan` `r` on((`k`.`id_karyawan` = `r`.`id_karyawan`))) join `jabatan` `j` on((`j`.`id_jabatan` = `r`.`id_jabatan`))) */;

/*View structure for view tampil_riwayat */

/*!50001 DROP TABLE IF EXISTS `tampil_riwayat` */;
/*!50001 DROP VIEW IF EXISTS `tampil_riwayat` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`220441100007`@`%` SQL SECURITY DEFINER VIEW `tampil_riwayat` AS select `a`.`id_riwayat` AS `id_riwayat`,`b`.`nama_lengkap` AS `nama_lengkap`,`a`.`tanggal_mulai` AS `tanggal_mulai`,`a`.`tanggal_selesai` AS `tanggal_selesai`,`d`.`nama_jabatan` AS `nama_jabatan`,`c`.`nama_departemen` AS `nama_departemen`,`a`.`catatan` AS `catatan` from (((`riwayat_pekerjaan` `a` join `karyawan` `b` on((`a`.`id_karyawan` = `b`.`id_karyawan`))) join `departemen` `c` on((`b`.`id_departemen` = `c`.`id_departemen`))) join `jabatan` `d` on((`d`.`id_jabatan` = `a`.`id_jabatan`))) order by `a`.`id_riwayat` */;

/*View structure for view view_gaji */

/*!50001 DROP TABLE IF EXISTS `view_gaji` */;
/*!50001 DROP VIEW IF EXISTS `view_gaji` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`220441100007`@`%` SQL SECURITY DEFINER VIEW `view_gaji` AS select `g`.`id_gaji` AS `id_gaji`,`k`.`nama_lengkap` AS `nama_lengkap`,`g`.`jumlah_gaji` AS `jumlah_gaji` from (`gaji` `g` join `karyawan` `k` on((`g`.`id_karyawan` = `k`.`id_karyawan`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

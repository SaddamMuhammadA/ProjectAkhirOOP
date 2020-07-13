-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.6-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for rumahsakit
CREATE DATABASE IF NOT EXISTS `rumahsakit` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `rumahsakit`;

-- Dumping structure for table rumahsakit.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `id_dokter` varchar(5) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `keahlian` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rumahsakit.dokter: ~0 rows (approximately)
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;

-- Dumping structure for table rumahsakit.pemeriksaan
CREATE TABLE IF NOT EXISTS `pemeriksaan` (
  `id_periksa` varchar(5) NOT NULL,
  `tgl_periksa` date DEFAULT NULL,
  `id_dokter` varchar(5) DEFAULT NULL,
  `id_pasien` varchar(5) DEFAULT NULL,
  `diagnosa` varchar(30) DEFAULT NULL,
  `penyakit` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_periksa`),
  KEY `FK_pemeriksaan_dokter` (`id_dokter`),
  KEY `FK_pemeriksaan_registrasi` (`id_pasien`),
  CONSTRAINT `FK_pemeriksaan_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON UPDATE CASCADE,
  CONSTRAINT `FK_pemeriksaan_registrasi` FOREIGN KEY (`id_pasien`) REFERENCES `registrasi` (`id_pasien`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rumahsakit.pemeriksaan: ~0 rows (approximately)
/*!40000 ALTER TABLE `pemeriksaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pemeriksaan` ENABLE KEYS */;

-- Dumping structure for table rumahsakit.registrasi
CREATE TABLE IF NOT EXISTS `registrasi` (
  `id_pasien` varchar(5) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `no_telp` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rumahsakit.registrasi: ~5 rows (approximately)
/*!40000 ALTER TABLE `registrasi` DISABLE KEYS */;
INSERT INTO `registrasi` (`id_pasien`, `nama`, `alamat`, `email`, `no_telp`) VALUES
	('101', 'Gilang', 'JL.Barunagri', 'mohammadgilangg10@gmail.com', '089527056776'),
	('102', 'Saddam', 'jl.Garut', 'saddam@gmail.com', '08976578921'),
	('103', 'rizal', 'jl.ledeng', 'rizal@gmail.com', '0223457981'),
	('104', 'rafi', 'jln.Pahwalan', 'rafi@gmail.com', '09812128131'),
	('105', 'Kiki', 'jl.Dago', 'kiki@gmail.com', '0897251212');
/*!40000 ALTER TABLE `registrasi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

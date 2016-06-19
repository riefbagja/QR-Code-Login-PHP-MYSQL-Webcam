-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2016 at 03:30 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `puskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE IF NOT EXISTS `dokter` (
  `NOMOR_IZIN_PRAKTEK` varchar(5) NOT NULL,
  `NAMA_DOKTER` varchar(50) NOT NULL,
  `POLI` varchar(15) NOT NULL,
  `TGL_LAHIR` date DEFAULT NULL,
  `ALAMAT` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kartu_status`
--

CREATE TABLE IF NOT EXISTS `kartu_status` (
  `ID_KARTU` varchar(10) NOT NULL,
  `NOMOR_IDENTITAS` varchar(10) DEFAULT NULL,
  `ID_RESEP` varchar(6) DEFAULT NULL,
  `NOMOR_IZIN_PRAKTEK` varchar(5) DEFAULT NULL,
  `ID_POLI` varchar(5) DEFAULT NULL,
  `ID_PETUGAS` char(5) DEFAULT NULL,
  `TANGGAL_BEROBAT` date NOT NULL,
  `DIAGNOSA` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `ID_OBAT` varchar(5) NOT NULL,
  `NAMA_OBAT` varchar(20) NOT NULL,
  `GOLONGAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE IF NOT EXISTS `pasien` (
  `NOMOR_IDENTITAS` varchar(10) NOT NULL,
  `NAMA_PASIEN` varchar(50) NOT NULL,
  `TANGGAL_LAHIR` date NOT NULL,
  `ALAMAT` text NOT NULL,
  `JENIS_KELAMIN` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`NOMOR_IDENTITAS`, `NAMA_PASIEN`, `TANGGAL_LAHIR`, `ALAMAT`, `JENIS_KELAMIN`) VALUES
('141511035', 'Arief Subagja', '1995-09-22', 'Jl. Mandala 2 no 61', 'Laki-laki');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE IF NOT EXISTS `petugas` (
  `ID_PETUGAS` char(5) NOT NULL,
  `NAMA_PETUGAS` varchar(50) NOT NULL,
  `TGL_LAHIR` date DEFAULT NULL,
  `BIDANG` varchar(50) DEFAULT NULL,
  `ALAMAT` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE IF NOT EXISTS `poli` (
  `ID_POLI` varchar(5) NOT NULL,
  `NAMA_POLI` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `relationship_9`
--

CREATE TABLE IF NOT EXISTS `relationship_9` (
  `ID_OBAT` varchar(5) NOT NULL,
  `ID_RESEP` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE IF NOT EXISTS `resep` (
  `ID_RESEP` varchar(6) NOT NULL,
  `NOMOR_IZIN_PRAKTEK` varchar(5) DEFAULT NULL,
  `TANGGAL_DIBUAT` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_penyakit`
--

CREATE TABLE IF NOT EXISTS `riwayat_penyakit` (
  `NOMOR_IDENTITAS` varchar(10) DEFAULT NULL,
  `NOMOR_IZIN_PRAKTEK` varchar(5) DEFAULT NULL,
  `ID_RIWAYAT_PENYAKIT` char(5) DEFAULT NULL,
  `DESKRIPSI_PEYAKIT` text,
  `TGL_DIAGNOSA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
 ADD PRIMARY KEY (`NOMOR_IZIN_PRAKTEK`);

--
-- Indexes for table `kartu_status`
--
ALTER TABLE `kartu_status`
 ADD PRIMARY KEY (`ID_KARTU`), ADD KEY `FK_RELATIONSHIP_1` (`NOMOR_IDENTITAS`), ADD KEY `FK_RELATIONSHIP_2` (`ID_PETUGAS`), ADD KEY `FK_RELATIONSHIP_5` (`ID_RESEP`), ADD KEY `FK_RELATIONSHIP_6` (`NOMOR_IZIN_PRAKTEK`), ADD KEY `FK_RELATIONSHIP_8` (`ID_POLI`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
 ADD PRIMARY KEY (`ID_OBAT`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
 ADD PRIMARY KEY (`NOMOR_IDENTITAS`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
 ADD PRIMARY KEY (`ID_PETUGAS`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
 ADD PRIMARY KEY (`ID_POLI`);

--
-- Indexes for table `relationship_9`
--
ALTER TABLE `relationship_9`
 ADD PRIMARY KEY (`ID_OBAT`,`ID_RESEP`), ADD KEY `FK_RELATIONSHIP_10` (`ID_RESEP`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
 ADD PRIMARY KEY (`ID_RESEP`), ADD KEY `FK_RELATIONSHIP_3` (`NOMOR_IZIN_PRAKTEK`);

--
-- Indexes for table `riwayat_penyakit`
--
ALTER TABLE `riwayat_penyakit`
 ADD KEY `FK_RELATIONSHIP_11` (`NOMOR_IDENTITAS`), ADD KEY `FK_RELATIONSHIP_12` (`NOMOR_IZIN_PRAKTEK`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kartu_status`
--
ALTER TABLE `kartu_status`
ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`NOMOR_IDENTITAS`) REFERENCES `pasien` (`NOMOR_IDENTITAS`),
ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `petugas` (`ID_PETUGAS`),
ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_RESEP`) REFERENCES `resep` (`ID_RESEP`),
ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`NOMOR_IZIN_PRAKTEK`) REFERENCES `dokter` (`NOMOR_IZIN_PRAKTEK`),
ADD CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`ID_POLI`) REFERENCES `poli` (`ID_POLI`);

--
-- Constraints for table `relationship_9`
--
ALTER TABLE `relationship_9`
ADD CONSTRAINT `FK_RELATIONSHIP_10` FOREIGN KEY (`ID_RESEP`) REFERENCES `resep` (`ID_RESEP`),
ADD CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`ID_OBAT`) REFERENCES `obat` (`ID_OBAT`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`NOMOR_IZIN_PRAKTEK`) REFERENCES `dokter` (`NOMOR_IZIN_PRAKTEK`);

--
-- Constraints for table `riwayat_penyakit`
--
ALTER TABLE `riwayat_penyakit`
ADD CONSTRAINT `FK_RELATIONSHIP_11` FOREIGN KEY (`NOMOR_IDENTITAS`) REFERENCES `pasien` (`NOMOR_IDENTITAS`),
ADD CONSTRAINT `FK_RELATIONSHIP_12` FOREIGN KEY (`NOMOR_IZIN_PRAKTEK`) REFERENCES `dokter` (`NOMOR_IZIN_PRAKTEK`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

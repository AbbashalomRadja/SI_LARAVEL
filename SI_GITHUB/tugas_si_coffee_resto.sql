-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2024 at 08:08 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_si_coffee_resto`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_ADMIN` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `ID_CUSTOMERS` int DEFAULT NULL,
  `ID_WAITER` int DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coffeeshop`
--

CREATE TABLE `coffeeshop` (
  `ID_COFFEESHOP` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `KOTA` varchar(50) DEFAULT NULL,
  `PROVINSI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID_CUSTOMERS` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL,
  `ID_PEMESANAN` int DEFAULT NULL,
  `ID_PENILAIAN_COFFEESHOP` int DEFAULT NULL,
  `ID_PENILAIAN_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_coffeeshop`
--

CREATE TABLE `kriteria_coffeeshop` (
  `ID_KRITERIA_COFFEESHOP` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kriteria_restoran`
--

CREATE TABLE `kriteria_restoran` (
  `ID_KRITERIA_RESTORAN` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makanan`
--

CREATE TABLE `makanan` (
  `ID_MAKANAN` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `DESKRIPSI` text,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `minuman`
--

CREATE TABLE `minuman` (
  `ID_MINUMAN` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `DESKRIPSI` text,
  `HARGA` decimal(10,2) DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_PEMESANAN` int NOT NULL,
  `TANGGAL` date DEFAULT NULL,
  `JUMLAH` int DEFAULT NULL,
  `ID_MAKANAN` int DEFAULT NULL,
  `ID_MINUMAN` int DEFAULT NULL,
  `ID_CUSTOMERS` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_coffeeshop`
--

CREATE TABLE `penilaian_coffeeshop` (
  `ID_PENILAIAN_COFFEESHOP` int NOT NULL,
  `NILAI` int DEFAULT NULL,
  `ID_KRITERIA_COFFEESHOP` int DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_restoran`
--

CREATE TABLE `penilaian_restoran` (
  `ID_PENILAIAN_RESTORAN` int NOT NULL,
  `NILAI` int DEFAULT NULL,
  `ID_KRITERIA_RESTORAN` int DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restoran`
--

CREATE TABLE `restoran` (
  `ID_RESTORAN` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `KOTA` varchar(50) DEFAULT NULL,
  `PROVINSI` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `waiter`
--

CREATE TABLE `waiter` (
  `ID_WAITER` int NOT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `ID_PEMESANAN` int DEFAULT NULL,
  `ID_COFFEESHOP` int DEFAULT NULL,
  `ID_RESTORAN` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_ADMIN`),
  ADD KEY `ID_CUSTOMERS` (`ID_CUSTOMERS`),
  ADD KEY `ID_WAITER` (`ID_WAITER`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`);

--
-- Indexes for table `coffeeshop`
--
ALTER TABLE `coffeeshop`
  ADD PRIMARY KEY (`ID_COFFEESHOP`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID_CUSTOMERS`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`),
  ADD KEY `ID_PEMESANAN` (`ID_PEMESANAN`),
  ADD KEY `ID_PENILAIAN_COFFEESHOP` (`ID_PENILAIAN_COFFEESHOP`),
  ADD KEY `ID_PENILAIAN_RESTORAN` (`ID_PENILAIAN_RESTORAN`);

--
-- Indexes for table `kriteria_coffeeshop`
--
ALTER TABLE `kriteria_coffeeshop`
  ADD PRIMARY KEY (`ID_KRITERIA_COFFEESHOP`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`);

--
-- Indexes for table `kriteria_restoran`
--
ALTER TABLE `kriteria_restoran`
  ADD PRIMARY KEY (`ID_KRITERIA_RESTORAN`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`);

--
-- Indexes for table `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`ID_MAKANAN`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`);

--
-- Indexes for table `minuman`
--
ALTER TABLE `minuman`
  ADD PRIMARY KEY (`ID_MINUMAN`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_PEMESANAN`),
  ADD KEY `ID_MAKANAN` (`ID_MAKANAN`),
  ADD KEY `ID_MINUMAN` (`ID_MINUMAN`);

--
-- Indexes for table `penilaian_coffeeshop`
--
ALTER TABLE `penilaian_coffeeshop`
  ADD PRIMARY KEY (`ID_PENILAIAN_COFFEESHOP`),
  ADD KEY `ID_KRITERIA_COFFEESHOP` (`ID_KRITERIA_COFFEESHOP`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`);

--
-- Indexes for table `penilaian_restoran`
--
ALTER TABLE `penilaian_restoran`
  ADD PRIMARY KEY (`ID_PENILAIAN_RESTORAN`),
  ADD KEY `ID_KRITERIA_RESTORAN` (`ID_KRITERIA_RESTORAN`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`);

--
-- Indexes for table `restoran`
--
ALTER TABLE `restoran`
  ADD PRIMARY KEY (`ID_RESTORAN`);

--
-- Indexes for table `waiter`
--
ALTER TABLE `waiter`
  ADD PRIMARY KEY (`ID_WAITER`),
  ADD KEY `ID_PEMESANAN` (`ID_PEMESANAN`),
  ADD KEY `ID_COFFEESHOP` (`ID_COFFEESHOP`),
  ADD KEY `ID_RESTORAN` (`ID_RESTORAN`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`ID_CUSTOMERS`) REFERENCES `customers` (`ID_CUSTOMERS`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`ID_WAITER`) REFERENCES `waiter` (`ID_WAITER`),
  ADD CONSTRAINT `admin_ibfk_3` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`),
  ADD CONSTRAINT `admin_ibfk_4` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`),
  ADD CONSTRAINT `customers_ibfk_3` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`),
  ADD CONSTRAINT `customers_ibfk_4` FOREIGN KEY (`ID_PENILAIAN_COFFEESHOP`) REFERENCES `penilaian_coffeeshop` (`ID_PENILAIAN_COFFEESHOP`),
  ADD CONSTRAINT `customers_ibfk_5` FOREIGN KEY (`ID_PENILAIAN_RESTORAN`) REFERENCES `penilaian_restoran` (`ID_PENILAIAN_RESTORAN`);

--
-- Constraints for table `kriteria_coffeeshop`
--
ALTER TABLE `kriteria_coffeeshop`
  ADD CONSTRAINT `kriteria_coffeeshop_ibfk_1` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`);

--
-- Constraints for table `kriteria_restoran`
--
ALTER TABLE `kriteria_restoran`
  ADD CONSTRAINT `kriteria_restoran_ibfk_1` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`);

--
-- Constraints for table `makanan`
--
ALTER TABLE `makanan`
  ADD CONSTRAINT `makanan_ibfk_1` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`);

--
-- Constraints for table `minuman`
--
ALTER TABLE `minuman`
  ADD CONSTRAINT `minuman_ibfk_1` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`ID_MAKANAN`) REFERENCES `makanan` (`ID_MAKANAN`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`ID_MINUMAN`) REFERENCES `minuman` (`ID_MINUMAN`);

--
-- Constraints for table `penilaian_coffeeshop`
--
ALTER TABLE `penilaian_coffeeshop`
  ADD CONSTRAINT `penilaian_coffeeshop_ibfk_1` FOREIGN KEY (`ID_KRITERIA_COFFEESHOP`) REFERENCES `kriteria_coffeeshop` (`ID_KRITERIA_COFFEESHOP`),
  ADD CONSTRAINT `penilaian_coffeeshop_ibfk_2` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`);

--
-- Constraints for table `penilaian_restoran`
--
ALTER TABLE `penilaian_restoran`
  ADD CONSTRAINT `penilaian_restoran_ibfk_1` FOREIGN KEY (`ID_KRITERIA_RESTORAN`) REFERENCES `kriteria_restoran` (`ID_KRITERIA_RESTORAN`),
  ADD CONSTRAINT `penilaian_restoran_ibfk_2` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`);

--
-- Constraints for table `waiter`
--
ALTER TABLE `waiter`
  ADD CONSTRAINT `waiter_ibfk_1` FOREIGN KEY (`ID_PEMESANAN`) REFERENCES `pemesanan` (`ID_PEMESANAN`),
  ADD CONSTRAINT `waiter_ibfk_2` FOREIGN KEY (`ID_COFFEESHOP`) REFERENCES `coffeeshop` (`ID_COFFEESHOP`),
  ADD CONSTRAINT `waiter_ibfk_3` FOREIGN KEY (`ID_RESTORAN`) REFERENCES `restoran` (`ID_RESTORAN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2022 at 01:50 PM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lease_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location_created_at` datetime NOT NULL,
  `location_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location_name`, `location_created_at`, `location_updated_at`) VALUES
(1, 'Amsterdam', '2022-11-12 12:56:10', '2022-11-12 12:56:10'),
(2, 'Washington D.C', '2022-11-12 12:56:10', '2022-11-12 12:56:10'),
(3, 'San Francisco', '2022-11-12 12:56:51', '2022-11-12 12:56:51'),
(4, 'Singapore', '2022-11-12 12:56:51', '2022-11-12 12:56:51'),
(5, 'Dallas', '2022-11-12 12:57:17', '2022-11-12 12:57:17'),
(6, 'Frankfurt', '2022-11-12 12:57:17', '2022-11-12 12:57:17'),
(7, 'Hong Kong', '2022-11-12 12:59:15', '2022-11-12 12:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1667972920),
('m130524_201442_init', 1667972922);

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `server_id` int(11) NOT NULL,
  `server_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_ram` int(11) NOT NULL,
  `server_hard_disk_type` enum('SAS','SATA','SSD') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SATA',
  `server_hard_disk_space` int(11) NOT NULL DEFAULT '0',
  `server_price` double NOT NULL,
  `server_location_id` int(11) NOT NULL,
  `server_created_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `server_updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `servers`
--

INSERT INTO `servers` (`server_id`, `server_model`, `server_ram`, `server_hard_disk_type`, `server_hard_disk_space`, `server_price`, `server_location_id`, `server_created_at`, `server_updated_at`) VALUES
(1, 'Dell R210Intel Xeon X3440', 16, 'SATA', 4000, 49.99, 1, '2022-11-12 14:30:32', '2022-11-12 14:30:32'),
(2, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 16000, 119, 1, '2022-11-13 14:30:32', '2022-11-13 14:30:32'),
(3, 'HP DL380eG82x Intel Xeon E5-2420', 32, 'SATA', 16000, 131.99, 1, '2022-11-14 14:30:32', '2022-11-14 14:30:32'),
(4, 'RH2288v32x Intel Xeon E5-2650V4', 128, 'SSD', 1920, 227.99, 1, '2022-11-15 14:30:32', '2022-11-15 14:30:32'),
(5, 'RH2288v32x Intel Xeon E5-2620v4', 64, 'SATA', 8000, 161.99, 1, '2022-11-16 14:30:32', '2022-11-16 14:30:32'),
(6, 'Dell R210-IIIntel Xeon E3-1230v2', 16, 'SATA', 4000, 72.99, 1, '2022-11-17 14:30:32', '2022-11-17 14:30:32'),
(7, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 2400, 170.99, 5, '2022-11-18 14:30:32', '2022-11-18 14:30:32'),
(8, 'Dell R5102x Intel Xeon E5620', 8, 'SATA', 2000, 165.99, 5, '2022-11-19 14:30:32', '2022-11-19 14:30:32'),
(9, 'HP DL380eG82x Intel Xeon E5-2420', 64, 'SATA', 16000, 199.99, 5, '2022-11-20 14:30:32', '2022-11-20 14:30:32'),
(10, 'HP DL380eG82x Intel Xeon E5-2420', 16, 'SATA', 24000, 20.99, 5, '2022-11-21 14:30:32', '2022-11-21 14:30:32'),
(11, 'IBM X3650M42x Intel Xeon E5-2620', 32, 'SATA', 2000, 220.99, 5, '2022-11-22 14:30:32', '2022-11-22 14:30:32'),
(12, 'HP DL380pG82x Intel Xeon E5-2620', 32, 'SATA', 2000, 225.99, 5, '2022-11-23 14:30:32', '2022-11-23 14:30:32'),
(13, 'HP DL380pG82x Intel Xeon E5-2650', 128, 'SSD', 120, 297.99, 5, '2022-11-24 14:30:32', '2022-11-24 14:30:32'),
(14, 'Dell R730XD2x Intel Xeon E5-2650v4', 128, 'SSD', 1920, 395.99, 6, '2022-11-25 14:30:32', '2022-11-25 14:30:32'),
(15, 'Dell R730XD2x Intel Xeon E5-2620v3', 64, 'SSD', 240, 252.99, 6, '2022-11-26 14:30:32', '2022-11-26 14:30:32'),
(16, 'Dell R730XD2x Intel Xeon E5-2650v3', 128, 'SSD', 240, 342.99, 6, '2022-11-15 14:30:32', '2022-11-15 14:30:32'),
(17, 'Dell R730XD2x Intel Xeon E5-2670v3', 128, 'SSD', 240, 364.99, 6, '2022-11-16 14:30:32', '2022-11-16 14:30:32'),
(18, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 16000, 99, 6, '2022-11-17 14:30:32', '2022-11-17 14:30:32'),
(19, 'IBM X36302x Intel Xeon E5620', 32, 'SATA', 16000, 99, 6, '2022-11-18 14:30:32', '2022-11-18 14:30:32'),
(20, 'IBM X3650M42x Intel Xeon E5-2620', 32, 'SATA', 6000, 124.99, 6, '2022-11-19 14:30:32', '2022-11-19 14:30:32'),
(21, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 16000, 187.99, 6, '2022-11-20 14:30:32', '2022-11-20 14:30:32'),
(22, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 2000, 228, 7, '2022-11-21 14:30:32', '2022-11-21 14:30:32'),
(23, 'HP DL120G9Intel Xeon E5-1650v3', 64, 'SSD', 240, 368.99, 7, '2022-11-22 14:30:32', '2022-11-22 14:30:32'),
(24, 'HP DL20 G9Intel Xeon E3-1270v5', 16, 'SATA', 2000, 208, 7, '2022-11-23 14:30:32', '2022-11-23 14:30:32'),
(25, 'Dell R6302x Intel Xeon E5-2630v4', 64, 'SSD', 480, 489.99, 7, '2022-11-24 14:30:32', '2022-11-24 14:30:32'),
(26, 'Dell R730XD2x Intel Xeon E5-2620V4', 64, 'SATA', 8000, 421.99, 7, '2022-11-25 14:30:32', '2022-11-25 14:30:32'),
(27, 'Dell R210-IIIntel Xeon E3-1270v2', 8, 'SATA', 2000, 199.99, 7, '2022-11-26 14:30:32', '2022-11-26 14:30:32'),
(28, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 2000, 719.99, 7, '2022-11-27 14:30:32', '2022-11-27 14:30:32'),
(29, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 2000, 569.99, 7, '2022-11-28 14:30:32', '2022-11-28 14:30:32'),
(30, 'Dell R210-IIIntel Xeon E3-1270v2', 16, 'SATA', 2000, 121.99, 3, '2022-11-29 14:30:32', '2022-11-29 14:30:32'),
(31, 'HP DL180 G92x Intel Xeon E5-2620v3', 64, 'SSD', 240, 305.99, 3, '2022-11-30 14:30:32', '2022-11-30 14:30:32'),
(32, 'Dell R730XD2x Intel Xeon E5-2620v3', 64, 'SSD', 240, 303.99, 3, '2022-12-01 14:30:32', '2022-12-01 14:30:32'),
(33, 'HP DL180 G92x Intel Xeon E5-2630v3', 128, 'SSD', 240, 362.99, 3, '2022-12-02 14:30:32', '2022-12-02 14:30:32'),
(34, 'Dell R730XD2x Intel Xeon E5-2630v3', 128, 'SSD', 240, 360.99, 3, '2022-12-03 14:30:32', '2022-12-03 14:30:32'),
(35, 'Dell R730XD2x Intel Xeon E5-2630v4', 128, 'SSD', 1920, 380.99, 3, '2022-12-04 14:30:32', '2022-12-04 14:30:32'),
(36, 'HP DL180 G92x Intel Xeon E5-2650v3', 128, 'SSD', 240, 413.99, 3, '2022-12-05 14:30:32', '2022-12-05 14:30:32'),
(37, 'Dell R730XD2x Intel Xeon E5-2650v3', 128, 'SSD', 240, 411.99, 3, '2022-12-06 14:30:32', '2022-12-06 14:30:32'),
(38, 'Dell R730XD2x Intel Xeon E5-2650v4', 128, 'SSD', 1920, 431.99, 3, '2022-12-07 14:30:32', '2022-12-07 14:30:32'),
(39, 'Dell R730XD2x Intel Xeon E5-2620v4', 64, 'SSD', 240, 319.99, 3, '2022-12-08 14:30:32', '2022-12-08 14:30:32'),
(40, 'DL20G9Intel Xeon E3-1270v5', 16, 'SATA', 2000, 135.99, 3, '2022-12-09 14:30:32', '2022-12-09 14:30:32'),
(41, 'Dell R730XD2x Intel Xeon E5-2650V4', 128, 'SSD', 1920, 565.99, 4, '2022-12-10 14:30:32', '2022-12-10 14:30:32'),
(42, 'HP DL180G62x Intel Xeon E5620', 32, 'SATA', 2000, 228, 4, '2022-12-11 14:30:32', '2022-12-11 14:30:32'),
(43, 'Huawei RH1288v22x Intel Xeon E5-2650', 8, 'SATA', 2000, 269.99, 4, '2022-12-12 14:30:32', '2022-12-12 14:30:32'),
(44, 'Dell R730XD2x Intel Xeon E5-2620V4', 64, 'SATA', 8000, 421.99, 4, '2022-12-13 14:30:32', '2022-12-13 14:30:32'),
(45, 'Huawei RH2288V22x Intel Xeon E5-2620', 32, 'SATA', 2000, 239.99, 4, '2022-12-14 14:30:32', '2022-12-14 14:30:32'),
(46, 'Dell R730XD2x Intel Xeon E5-2650V3', 128, 'SSD', 240, 545.99, 4, '2022-12-15 14:30:32', '2022-12-15 14:30:32'),
(47, 'Dell R6302x Intel Xeon E5-2650v3', 128, 'SSD', 240, 555.99, 4, '2022-12-16 14:30:32', '2022-12-16 14:30:32'),
(48, 'HP DL120G9Intel Xeon E5-1650v3', 64, 'SSD', 240, 368.99, 4, '2022-12-17 14:30:32', '2022-12-17 14:30:32'),
(49, 'Dell R9304x Intel Xeon E7-4820v3', 64, 'SSD', 240, 1328.99, 4, '2022-12-18 14:30:32', '2022-12-18 14:30:32'),
(50, 'Dell R9304x Intel Xeon E7-4830v3', 64, 'SSD', 240, 1516.99, 4, '2022-12-19 14:30:32', '2022-12-19 14:30:32'),
(51, 'Dell R9304x Intel Xeon E7-4850v3', 64, 'SSD', 240, 1787.99, 4, '2022-12-20 14:30:32', '2022-12-20 14:30:32'),
(52, 'HP DL20 G9Intel Xeon E3-1270v5', 16, 'SATA', 2000, 208, 4, '2022-12-21 14:30:32', '2022-12-21 14:30:32'),
(53, 'HP DL120G7Intel Xeon E3-1240', 16, 'SATA', 4000, 105.99, 2, '2022-12-22 14:30:32', '2022-12-22 14:30:32'),
(54, 'Dell R210Intel Xeon X3430', 8, 'SATA', 1000, 55.99, 2, '2022-12-23 14:30:32', '2022-12-23 14:30:32'),
(55, 'Dell R730XD2x Intel Xeon E5-2650v4', 128, 'SSD', 1920, 431.99, 2, '2022-12-24 14:30:32', '2022-12-24 14:30:32'),
(56, 'Dell R730XD2x Intel Xeon E5-2630v4', 128, 'SSD', 1920, 380.99, 2, '2022-12-25 14:30:32', '2022-12-25 14:30:32'),
(57, 'Dell R730XD2x Intel Xeon E5-2630v3', 128, 'SSD', 240, 360.99, 2, '2022-12-26 14:30:32', '2022-12-26 14:30:32'),
(58, 'HP DL180 G92x Intel Xeon E5-2650v3', 128, 'SSD', 240, 413.99, 2, '2022-12-27 14:30:32', '2022-12-27 14:30:32'),
(59, 'Dell R730XD2x Intel Xeon E5-2620v4', 64, 'SSD', 240, 319.99, 2, '2022-12-28 14:30:32', '2022-12-28 14:30:32'),
(60, 'HP DL180G62x Intel Xeon E5620', 32, 'SAS', 2400, 170.99, 2, '2022-12-29 14:30:32', '2022-12-29 14:30:32'),
(61, 'HP DL380eG82x Intel Xeon E5-2420', 32, 'SATA', 2000, 199.99, 2, '2022-12-30 14:30:32', '2022-12-30 14:30:32'),
(62, 'IBM X3650M42x Intel Xeon E5-2620', 32, 'SATA', 2000, 220.99, 2, '2022-12-31 14:30:32', '2022-12-31 14:30:32'),
(63, 'Dell R730XD2x Intel Xeon E5-2670v3', 128, 'SSD', 240, 437.99, 2, '2023-01-01 14:30:32', '2023-01-01 14:30:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`server_id`),
  ADD KEY `idx-servers-server_location_id` (`server_location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `servers`
--
ALTER TABLE `servers`
  MODIFY `server_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `servers`
--
ALTER TABLE `servers`
  ADD CONSTRAINT `fk-servers-server_location_id` FOREIGN KEY (`server_location_id`) REFERENCES `locations` (`location_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

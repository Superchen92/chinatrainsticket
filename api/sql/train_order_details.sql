-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2023 at 08:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `train`
--

-- --------------------------------------------------------

--
-- Table structure for table `train_order_details`
--

CREATE TABLE `train_order_details` (
  `id` int(11) NOT NULL,
  `from_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from_station` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_station` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_time` time NOT NULL,
  `cost_time` time NOT NULL,
  `seat` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat_price` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_cost` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_price` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `link_order_id` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `train_order_details`
--

INSERT INTO `train_order_details` (`id`, `from_city`, `from_station`, `to_city`, `to_station`, `start_date`, `departure_time`, `arrival_time`, `cost_time`, `seat`, `seat_price`, `total_cost`, `total_price`, `link_order_id`) VALUES
(20, '北京', 'Beijing Nan (South)', '上海', 'Shanghai Hongqiao', '2023-05-31', '07:17:00', '13:03:00', '05:46:00', '2nd class ', '79', '79', '85', 'JAS230607001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `train_order_details`
--
ALTER TABLE `train_order_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `train_order_details`
--
ALTER TABLE `train_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

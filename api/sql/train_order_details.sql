-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-06-06 11:42:35
-- 服务器版本： 10.4.28-MariaDB
-- PHP 版本： 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `train`
--

-- --------------------------------------------------------

--
-- 表的结构 `train_order_details`
--

CREATE TABLE `train_order_details` (
  `id` int(11) NOT NULL,
  `from_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from_station` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_station` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
-- 转储表的索引
--

--
-- 表的索引 `train_order_details`
--
ALTER TABLE `train_order_details`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `train_order_details`
--
ALTER TABLE `train_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

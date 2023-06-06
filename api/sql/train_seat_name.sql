-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2023-06-06 11:42:42
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
-- 表的结构 `train_seat_name`
--

CREATE TABLE `train_seat_name` (
  `id` int(2) NOT NULL,
  `code` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_eng` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name_cn` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `train_seat_name`
--

INSERT INTO `train_seat_name` (`id`, `code`, `name_eng`, `name_cn`) VALUES
(1, 'yd', '1st class seat', '一等座'),
(2, 'ed', '2nd class seat', '二等座'),
(3, 'sw', 'Business seat', '商务座'),
(4, 'yw', 'Hard sleeper', '硬卧'),
(5, 'yz', 'Hard seat', '硬座'),
(6, 'rw', 'Soft sleeper', '软卧'),
(7, 'wz', 'Standing', '无座'),
(8, 'yz', 'Hard seat', '硬座');

--
-- 转储表的索引
--

--
-- 表的索引 `train_seat_name`
--
ALTER TABLE `train_seat_name`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `train_seat_name`
--
ALTER TABLE `train_seat_name`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 05, 2020 at 08:15 AM
-- Server version: 5.7.24-log
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iqdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `admin_name` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `is_active`, `admin_name`, `created_at`) VALUES
(1, 1, 'Amrit', '2020-12-03 20:01:46'),
(2, 2, 'Aman', '2020-12-04 17:54:52'),
(3, 3, 'Ankit', '2020-12-04 17:57:44'),
(4, 4, 'Anand', '2020-12-04 17:57:44'),
(5, 5, 'Sanjay', '2020-12-04 17:57:44'),
(6, 6, 'Sunil', '2020-12-04 17:57:44'),
(7, 7, 'Lakhan', '2020-12-04 17:57:44');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE IF NOT EXISTS `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `user_name` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `admin_id`, `user_name`, `created_at`) VALUES
(1, 1, 'Amit', '2020-12-03 19:55:55'),
(2, 2, 'Amrit', '2020-12-03 19:58:03'),
(3, 3, 'Ankit', '2020-12-03 19:58:35'),
(4, 4, 'Aman', '2020-12-03 19:58:50'),
(5, 5, 'Akash', '2020-12-03 19:59:00'),
(6, 6, 'Rahul', '2020-12-03 19:59:12'),
(7, 7, 'Arvind', '2020-12-03 19:59:24'),
(8, 8, 'Rajat', '2020-12-04 18:01:21'),
(9, 9, 'Ayush', '2020-12-04 18:01:21'),
(10, 10, 'Ayushi', '2020-12-04 18:01:21'),
(11, 11, 'Kamal', '2020-12-04 18:01:22'),
(12, 12, 'Gaourav', '2020-12-04 18:01:22'),
(13, 13, 'Ansari', '2020-12-04 18:01:31');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

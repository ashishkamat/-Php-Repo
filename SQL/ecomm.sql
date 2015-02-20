-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2015 at 02:42 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecomm`
--
CREATE DATABASE IF NOT EXISTS `ecomm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecomm`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(15) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `buy_details`
--

DROP TABLE IF EXISTS `buy_details`;
CREATE TABLE IF NOT EXISTS `buy_details` (
  `buy_id` varchar(15) NOT NULL DEFAULT '0',
  `user_id` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`buy_id`),
  KEY `user_id` (`user_id`,`product_id`),
  KEY `user_id_2` (`user_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `buy_details`
--
DROP TRIGGER IF EXISTS `buy_trigger`;
DELIMITER //
CREATE TRIGGER `buy_trigger` BEFORE INSERT ON `buy_details`
 FOR EACH ROW BEGIN
  INSERT INTO buy_seq VALUES (NULL);
  SET NEW.buy_id = CONCAT('BU', LPAD(LAST_INSERT_ID(), 3, '0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buy_seq`
--

DROP TABLE IF EXISTS `buy_seq`;
CREATE TABLE IF NOT EXISTS `buy_seq` (
  `buy_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`buy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `buy_seq`
--

INSERT INTO `buy_seq` (`buy_id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_id` varchar(15) NOT NULL,
  `buy_id` varchar(15) NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `buy_id` (`buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `order_details`
--
DROP TRIGGER IF EXISTS `order_trigger`;
DELIMITER //
CREATE TRIGGER `order_trigger` BEFORE INSERT ON `order_details`
 FOR EACH ROW BEGIN
  INSERT INTO order_seq VALUES (NULL);
  SET NEW.order_id = CONCAT('ORD', LPAD(LAST_INSERT_ID(), 3, '0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_seq`
--

DROP TABLE IF EXISTS `order_seq`;
CREATE TABLE IF NOT EXISTS `order_seq` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order_seq`
--

INSERT INTO `order_seq` (`order_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` varchar(15) NOT NULL DEFAULT '0',
  `product_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `image_name` varchar(20) NOT NULL,
  `image_path` varchar(400) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `product_name`, `price`, `image_name`, `image_path`, `description`) VALUES
('PROD059', 'Computer', 20000, 'Computer', 'uploads/prod_1.jpg', '');

--
-- Triggers `product_details`
--
DROP TRIGGER IF EXISTS `product_trigger`;
DELIMITER //
CREATE TRIGGER `product_trigger` BEFORE INSERT ON `product_details`
 FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.product_id = CONCAT('PROD', LPAD(LAST_INSERT_ID(), 3, '0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
CREATE TABLE IF NOT EXISTS `product_seq` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` varchar(15) NOT NULL DEFAULT '0',
  `email_id` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table is for New User Creation';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email_id`, `password`) VALUES
('USER001', 'ashishkamat27@gmail.com', '123456');

--
-- Triggers `user`
--
DROP TRIGGER IF EXISTS `user_trigger`;
DELIMITER //
CREATE TRIGGER `user_trigger` BEFORE INSERT ON `user`
 FOR EACH ROW BEGIN
  INSERT INTO user_seq VALUES (NULL);
  SET NEW.user_id = CONCAT('USER', LPAD(LAST_INSERT_ID(), 3, '0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE IF NOT EXISTS `user_details` (
  `user_detail_id` varchar(15) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(400) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` int(6) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  PRIMARY KEY (`user_detail_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_detail_id`, `user_name`, `mobile`, `address`, `city`, `zip`, `user_id`) VALUES
('UD003', 'Ashish Kamat', '9004916161', 'Kopar khairne', 'Navi Mumbai', 400709, 'USER001');

--
-- Triggers `user_details`
--
DROP TRIGGER IF EXISTS `user_details_trigger`;
DELIMITER //
CREATE TRIGGER `user_details_trigger` BEFORE INSERT ON `user_details`
 FOR EACH ROW BEGIN
  INSERT INTO user_details_seq VALUES (NULL);
  SET NEW.user_detail_id = CONCAT('UD', LPAD(LAST_INSERT_ID(), 3, '0'));
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_details_seq`
--

DROP TABLE IF EXISTS `user_details_seq`;
CREATE TABLE IF NOT EXISTS `user_details_seq` (
  `user_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_detail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_details_seq`
--

INSERT INTO `user_details_seq` (`user_detail_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
CREATE TABLE IF NOT EXISTS `user_seq` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`user_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buy_details`
--
ALTER TABLE `buy_details`
  ADD CONSTRAINT `buy_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buy_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy_details` (`buy_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

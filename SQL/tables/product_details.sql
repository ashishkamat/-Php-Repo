-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2015 at 02:10 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

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
('PROD003', 'Lenovo G500s ', 50000, 'PanCard', 'D:\\Images\\PanCard.png', NULL);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

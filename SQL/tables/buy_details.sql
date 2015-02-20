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
-- Table structure for table `buy_details`
--

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
-- Dumping data for table `buy_details`
--

INSERT INTO `buy_details` (`buy_id`, `user_id`, `product_id`, `price`) VALUES
('BU001', 'USER001', 'PROD003', 150000);

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buy_details`
--
ALTER TABLE `buy_details`
  ADD CONSTRAINT `buy_product_FK` FOREIGN KEY (`product_id`) REFERENCES `product_details` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `buy_user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

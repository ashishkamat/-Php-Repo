-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2015 at 02:11 PM
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
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_detail_id` varchar(15) NOT NULL DEFAULT '0',
  `mobile` varchar(10) NOT NULL,
  `address` varchar(400) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip` int(6) DEFAULT NULL,
  `user_id` varchar(15) NOT NULL,
  PRIMARY KEY (`user_detail_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_detail_id`, `mobile`, `address`, `city`, `zip`, `user_id`) VALUES
('UD001', '9004916161', 'Yerwada,Pune', 'Pune', 411014, 'USER001');

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

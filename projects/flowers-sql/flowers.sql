-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2018 at 11:12 PM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flowers`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_on_item`
--

CREATE TABLE IF NOT EXISTS `add_on_item` (
  `add_on_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`add_on_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `add_on_item`
--

INSERT INTO `add_on_item` (`add_on_item_id`, `name`, `price`, `quantity`) VALUES
(1, 'Simple Card', 2, 1),
(2, 'Fancy Card', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `arrangement`
--

CREATE TABLE IF NOT EXISTS `arrangement` (
  `arrangement_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `flowers_used` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `lead_time` time DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`arrangement_id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address_line` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip_code` int(5) NOT NULL,
  `phone` char(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `credit_card` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flowers`
--

CREATE TABLE IF NOT EXISTS `flowers` (
  `flower_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`flower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `total_price` int(11) DEFAULT NULL,
  `order_item_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_item_id` (`order_item_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE IF NOT EXISTS `order_items` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `arranement_id` int(11) DEFAULT NULL,
  `flower_id` int(11) DEFAULT NULL,
  `add_on_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `arrangement_id` (`arranement_id`),
  KEY `flower_id` (`flower_id`),
  KEY `add_on_id` (`add_on_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `type_of_arrangement`
--

CREATE TABLE IF NOT EXISTS `type_of_arrangement` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `price` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangement`
--
ALTER TABLE `arrangement`
  ADD CONSTRAINT `arrangement_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type_of_arrangement` (`type_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `client` (`order_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`order_item_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`add_on_id`) REFERENCES `add_on_item` (`add_on_item_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`flower_id`) REFERENCES `flowers` (`flower_id`),
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`arranement_id`) REFERENCES `arrangement` (`arrangement_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

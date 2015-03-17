-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2015 at 11:05 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gadgets`
--
CREATE DATABASE IF NOT EXISTS `gadgets` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gadgets`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
`admin_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Truncate table before insert `admin`
--

TRUNCATE TABLE `admin`;
--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `name`, `email`, `status`, `date_added`) VALUES
(1, 'admin', 'admin', 'Naveen', 'naveen@gadget.loc', 1, '2014-09-07 13:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `brand_logo` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `brand`
--

TRUNCATE TABLE `brand`;
--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `brand_logo`, `status`) VALUES
(0, 'Apple', 'noimage.jog', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`category_id` int(11) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `category`
--

TRUNCATE TABLE `category`;
-- --------------------------------------------------------

--
-- Table structure for table `expert_review`
--

CREATE TABLE IF NOT EXISTS `expert_review` (
  `produc_id` int(11) NOT NULL,
  `review` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `expert_review`
--

TRUNCATE TABLE `expert_review`;
-- --------------------------------------------------------

--
-- Table structure for table `network`
--

CREATE TABLE IF NOT EXISTS `network` (
  `product_id` int(11) NOT NULL,
  `2g` tinyint(1) NOT NULL DEFAULT '1',
  `2g_specs` varchar(30) NOT NULL DEFAULT 'GSM 850 / 900 / 1800 / 1900',
  `3g` tinyint(1) NOT NULL DEFAULT '1',
  `3g_specs` varchar(30) NOT NULL DEFAULT 'HSDPA 850 / 900 / 1900 / 2100',
  `4g` tinyint(1) NOT NULL DEFAULT '1',
  `4g_specs` varchar(60) NOT NULL DEFAULT 'LTE 800 / 850 / 900 / 1800 / 1900 / 2100 / 2600'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `network`
--

TRUNCATE TABLE `network`;
-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE IF NOT EXISTS `price` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `price` int(10) DEFAULT NULL,
  `product_link` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `price`
--

TRUNCATE TABLE `price`;
-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `product_alias` varchar(100) DEFAULT NULL,
  `release_date` date NOT NULL,
  `announce_date` date NOT NULL,
  `sim` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Truncate table before insert `products`
--

TRUNCATE TABLE `products`;
--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `product_type_id`, `brand_id`, `product_alias`, `release_date`, `announce_date`, `sim`, `status`, `date_added`) VALUES
(1, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(2, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(3, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(4, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(5, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(6, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(7, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(8, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(9, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(10, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(11, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(12, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(13, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(14, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(15, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(16, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(17, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(18, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30'),
(19, 'test', 1, 1, 1, 'alisa', '0000-00-00', '0000-00-00', '2', 1, '2014-09-10 01:18:30');

-- --------------------------------------------------------

--
-- Table structure for table `products_old`
--

CREATE TABLE IF NOT EXISTS `products_old` (
`product_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `product_type_id` int(11) DEFAULT NULL,
  `brand_id` int(11) NOT NULL,
  `product_alias` varchar(100) DEFAULT NULL,
  `release_date` date NOT NULL,
  `announce_date` date NOT NULL,
  `sim` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `products_old`
--

TRUNCATE TABLE `products_old`;
-- --------------------------------------------------------

--
-- Table structure for table `product_battery`
--

CREATE TABLE IF NOT EXISTS `product_battery` (
  `product_id` int(11) NOT NULL,
  `battery` varchar(50) NOT NULL,
  `standby` varchar(30) NOT NULL,
  `talktime` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_battery`
--

TRUNCATE TABLE `product_battery`;
-- --------------------------------------------------------

--
-- Table structure for table `product_body`
--

CREATE TABLE IF NOT EXISTS `product_body` (
  `product_id` int(11) NOT NULL,
  `dimension` varchar(40) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_body`
--

TRUNCATE TABLE `product_body`;
-- --------------------------------------------------------

--
-- Table structure for table `product_camera`
--

CREATE TABLE IF NOT EXISTS `product_camera` (
  `product_id` int(11) NOT NULL,
  `primary_cam` varchar(65) NOT NULL,
  `features` varchar(200) DEFAULT NULL,
  `video` varchar(30) NOT NULL,
  `secondary` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_camera`
--

TRUNCATE TABLE `product_camera`;
-- --------------------------------------------------------

--
-- Table structure for table `product_data`
--

CREATE TABLE IF NOT EXISTS `product_data` (
  `product_id` int(11) NOT NULL,
  `gprs` tinyint(1) NOT NULL,
  `edge` tinyint(1) NOT NULL,
  `speed` varchar(50) NOT NULL,
  `wlan` varchar(50) NOT NULL,
  `bluetooth` varchar(50) NOT NULL,
  `nfc` tinyint(1) NOT NULL,
  `usb` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_data`
--

TRUNCATE TABLE `product_data`;
-- --------------------------------------------------------

--
-- Table structure for table `product_display`
--

CREATE TABLE IF NOT EXISTS `product_display` (
  `product_id` int(11) NOT NULL,
  `type` varchar(60) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `multitouch` varchar(10) DEFAULT 'yes',
  `protection` varchar(40) DEFAULT NULL,
  `display_others` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_display`
--

TRUNCATE TABLE `product_display`;
-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE IF NOT EXISTS `product_features` (
  `product_id` int(11) NOT NULL,
  `os` varchar(35) NOT NULL,
  `chipset` varchar(50) DEFAULT NULL,
  `cpu` varchar(30) NOT NULL,
  `gpu` varchar(30) NOT NULL,
  `sensors` varchar(100) DEFAULT NULL,
  `messaging` varchar(60) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `radio` varchar(30) DEFAULT NULL,
  `gps` varchar(50) DEFAULT NULL,
  `java` varchar(50) DEFAULT NULL,
  `colors` varchar(150) DEFAULT NULL,
  `features_others` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_features`
--

TRUNCATE TABLE `product_features`;
-- --------------------------------------------------------

--
-- Table structure for table `product_memory`
--

CREATE TABLE IF NOT EXISTS `product_memory` (
  `product_id` int(11) NOT NULL,
  `card_slot` tinyint(1) NOT NULL,
  `ram` varchar(30) NOT NULL,
  `internal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_memory`
--

TRUNCATE TABLE `product_memory`;
-- --------------------------------------------------------

--
-- Table structure for table `product_misc`
--

CREATE TABLE IF NOT EXISTS `product_misc` (
  `product_id` int(11) NOT NULL,
  `sar_us` varchar(50) DEFAULT NULL,
  `sar_eu` varchar(50) DEFAULT NULL,
  `price_group` tinyint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_misc`
--

TRUNCATE TABLE `product_misc`;
-- --------------------------------------------------------

--
-- Table structure for table `product_sound`
--

CREATE TABLE IF NOT EXISTS `product_sound` (
  `product_id` int(11) NOT NULL,
  `alert_type` varchar(60) DEFAULT NULL,
  `loudspeaker` tinyint(1) NOT NULL,
  `jack_35mm` varchar(4) NOT NULL DEFAULT 'yes',
  `sound_others` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_sound`
--

TRUNCATE TABLE `product_sound`;
-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE IF NOT EXISTS `product_type` (
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `product_type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `product_type`
--

TRUNCATE TABLE `product_type`;
-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE IF NOT EXISTS `seller` (
`seller_id` int(11) NOT NULL,
  `seller_name` varchar(45) NOT NULL,
  `rating` int(5) NOT NULL DEFAULT '0',
  `shipping_info` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `seller`
--

TRUNCATE TABLE `seller`;
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `password` varchar(65) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Truncate table before insert `users`
--

TRUNCATE TABLE `users`;
-- --------------------------------------------------------

--
-- Table structure for table `user_rating`
--

CREATE TABLE IF NOT EXISTS `user_rating` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `user_rating`
--

TRUNCATE TABLE `user_rating`;
-- --------------------------------------------------------

--
-- Table structure for table `user_review`
--

CREATE TABLE IF NOT EXISTS `user_review` (
  `user_id` int(11) NOT NULL,
  `produc_id` int(11) NOT NULL,
  `review` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `user_review`
--

TRUNCATE TABLE `user_review`;
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
 ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
 ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `network`
--
ALTER TABLE `network`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `products_old`
--
ALTER TABLE `products_old`
 ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_battery`
--
ALTER TABLE `product_battery`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_body`
--
ALTER TABLE `product_body`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_camera`
--
ALTER TABLE `product_camera`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_data`
--
ALTER TABLE `product_data`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_display`
--
ALTER TABLE `product_display`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_memory`
--
ALTER TABLE `product_memory`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_misc`
--
ALTER TABLE `product_misc`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_sound`
--
ALTER TABLE `product_sound`
 ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
 ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
 ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `user_name_UNIQUE` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `products_old`
--
ALTER TABLE `products_old`
MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `network`
--
ALTER TABLE `network`
ADD CONSTRAINT `network_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `price`
--
ALTER TABLE `price`
ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_battery`
--
ALTER TABLE `product_battery`
ADD CONSTRAINT `product_battery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_body`
--
ALTER TABLE `product_body`
ADD CONSTRAINT `product_body_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_camera`
--
ALTER TABLE `product_camera`
ADD CONSTRAINT `product_camera_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_data`
--
ALTER TABLE `product_data`
ADD CONSTRAINT `product_data_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_display`
--
ALTER TABLE `product_display`
ADD CONSTRAINT `product_display_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
ADD CONSTRAINT `product_features_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_memory`
--
ALTER TABLE `product_memory`
ADD CONSTRAINT `product_memory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_misc`
--
ALTER TABLE `product_misc`
ADD CONSTRAINT `product_misc_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_sound`
--
ALTER TABLE `product_sound`
ADD CONSTRAINT `product_sound_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2015 at 11:06 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gadgetsold`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
`product_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL DEFAULT '0',
  `product_name` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_alias` varchar(100) DEFAULT NULL,
  `release_date` date NOT NULL,
  `announce_date` date NOT NULL,
  `sim` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `battery` varchar(50) NOT NULL,
  `standby` varchar(30) NOT NULL,
  `talktime` varchar(30) NOT NULL,
  `dimension` varchar(40) DEFAULT NULL,
  `weight` varchar(100) DEFAULT NULL,
  `primary_cam` varchar(65) NOT NULL,
  `features` varchar(200) DEFAULT NULL,
  `video` varchar(30) NOT NULL,
  `secondary` varchar(30) NOT NULL,
  `gprs` tinyint(1) NOT NULL,
  `edge` tinyint(1) NOT NULL,
  `speed` varchar(50) NOT NULL,
  `wlan` varchar(50) NOT NULL,
  `bluetooth` varchar(50) NOT NULL,
  `nfc` tinyint(1) NOT NULL,
  `usb` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(60) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `multitouch` varchar(10) DEFAULT 'yes',
  `protection` varchar(40) DEFAULT NULL,
  `display_others` varchar(150) DEFAULT NULL,
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
  `features_others` varchar(250) DEFAULT NULL,
  `card_slot` tinyint(1) NOT NULL,
  `ram` varchar(30) NOT NULL,
  `internal` varchar(100) NOT NULL,
  `sar_us` varchar(50) DEFAULT NULL,
  `sar_eu` varchar(50) DEFAULT NULL,
  `price_group` tinyint(10) DEFAULT NULL,
  `alert_type` varchar(60) DEFAULT NULL,
  `loudspeaker` tinyint(1) NOT NULL,
  `jack_35mm` varchar(4) NOT NULL DEFAULT 'yes',
  `sound_others` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

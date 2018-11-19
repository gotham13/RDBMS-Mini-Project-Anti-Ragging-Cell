-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 19, 2018 at 03:40 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anti_ragging`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_profile`
--

DROP TABLE IF EXISTS `admin_profile`;
CREATE TABLE IF NOT EXISTS `admin_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_pic` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainant` varchar(250) DEFAULT NULL,
  `victim` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `pincode` varchar(250) DEFAULT NULL,
  `details` varchar(250) DEFAULT NULL,
  `latitude` varchar(250) DEFAULT NULL,
  `longitude` varchar(250) DEFAULT NULL,
  `attachment1` varchar(250) DEFAULT NULL,
  `attachment2` varchar(250) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `resolved_by_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `pincode` varchar(250) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `state` varchar(250) NOT NULL,
  `feedback` varchar(250) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `email_verified` int(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `undertaking`
--

DROP TABLE IF EXISTS `undertaking`;
CREATE TABLE IF NOT EXISTS `undertaking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_family_name` varchar(250) DEFAULT NULL,
  `student_first_name` varchar(250) DEFAULT NULL,
  `student_middle_name` varchar(250) DEFAULT NULL,
  `gender` varchar(250) DEFAULT NULL,
  `nationality` varchar(250) DEFAULT NULL,
  `student_mobile_no` varchar(250) DEFAULT NULL,
  `student_freind_mob_no` varchar(250) DEFAULT NULL,
  `student_email_id` varchar(250) DEFAULT NULL,
  `student_p_address1` varchar(250) DEFAULT NULL,
  `student_p_address2` varchar(250) DEFAULT NULL,
  `student_city` varchar(250) DEFAULT NULL,
  `student_state` varchar(250) DEFAULT NULL,
  `pg_name` varchar(250) DEFAULT NULL,
  `pg_address1` varchar(250) DEFAULT NULL,
  `pg_address2` varchar(250) DEFAULT NULL,
  `pg_city` varchar(250) DEFAULT NULL,
  `pg_state` varchar(250) DEFAULT NULL,
  `pg_mobile` varchar(250) DEFAULT NULL,
  `pg_email` varchar(250) DEFAULT NULL,
  `degree` varchar(250) DEFAULT NULL,
  `name_of_course` varchar(250) DEFAULT NULL,
  `reg_no` varchar(250) DEFAULT NULL,
  `no_of_students` varchar(250) DEFAULT NULL,
  `year_of_study` varchar(250) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_profile`
--

DROP TABLE IF EXISTS `volunteer_profile`;
CREATE TABLE IF NOT EXISTS `volunteer_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `mobile` int(14) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `profile_pic` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

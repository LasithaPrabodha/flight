-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2016 at 07:33 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flight_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE IF NOT EXISTS `bookings` (
`booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `booking_reference` longtext NOT NULL,
  `class` varchar(2) NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  `amount` float NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `flight_id`, `booking_reference`, `class`, `seat_no`, `amount`, `date_created`) VALUES
(4, 6, 1, 'dsag462dgsa', 'b', '33', 34000, '2016-03-14 19:47:59'),
(5, 6, 2, 'GY67HBBB9', 'e', '56W', 18000, '2016-03-14 19:47:59'),
(8, 6, 1, '56e8dab2f1177', 'e', '46,47', 6789, '2016-03-16 04:01:54'),
(9, 6, 1, '56e8db42e6dc1', 'e', '39', 6789, '2016-03-16 04:04:18'),
(10, 6, 1, '56e8ed11a0be1', 'e', '2,4', 0, '2016-03-16 05:20:17'),
(11, 6, 1, '56e8eec97ed0c', 'e', '7', 4000, '2016-03-16 05:27:37'),
(12, 6, 2, '56e8f399d1a8b', 'e', '1', 2300, '2016-03-16 05:48:09'),
(13, 6, 1, '56e8f58387193', 'e', '1', 3000, '2016-03-16 05:56:19'),
(14, 6, 1, '56e8f774cf5c9', 'e', '1', 3000, '2016-03-16 06:04:36'),
(15, 6, 1, '56e8f784c1d54', 'e', '3,17', 3000, '2016-03-16 06:04:52'),
(16, 6, 1, '56e8f7a585ee2', 'e', '42', 3000, '2016-03-16 06:05:25'),
(17, 6, 2, '56e8f82e11ed0', 'e', '42', 2300, '2016-03-16 06:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `booking_payments`
--

CREATE TABLE IF NOT EXISTS `booking_payments` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `booking_payments`
--

INSERT INTO `booking_payments` (`id`, `user_id`, `flight_id`, `booking_id`, `amount`, `date_created`) VALUES
(1, 0, 1, 10, 0, '2016-03-16 05:20:17'),
(2, 6, 1, 11, 4000, '2016-03-16 05:27:37'),
(3, 6, 2, 12, 2300, '2016-03-16 05:48:09'),
(4, 6, 1, 13, 3000, '2016-03-16 05:56:19'),
(5, 6, 1, 14, 3000, '2016-03-16 06:04:36'),
(6, 6, 1, 15, 3000, '2016-03-16 06:04:52'),
(7, 6, 1, 16, 3000, '2016-03-16 06:05:25'),
(8, 6, 2, 17, 2300, '2016-03-16 06:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
`id` int(11) NOT NULL,
  `flight_no` varchar(10) NOT NULL,
  `airline` varchar(50) NOT NULL,
  `depature` varchar(200) NOT NULL,
  `destination` varchar(200) NOT NULL,
  `depature_date` datetime NOT NULL,
  `b_price` float NOT NULL,
  `b_seat_count` int(5) NOT NULL,
  `b_seat_booked` longtext NOT NULL,
  `e_price` float NOT NULL,
  `e_seat_count` int(5) NOT NULL,
  `e_seat_booked` longtext NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `flight_no`, `airline`, `depature`, `destination`, `depature_date`, `b_price`, `b_seat_count`, `b_seat_booked`, `e_price`, `e_seat_count`, `e_seat_booked`, `date_created`) VALUES
(1, '123', 'airlanka', 'Sri Lanka', 'United Kingdom', '2016-03-16 00:00:00', 4000, 35, '1,2,10,14', 3000, 50, ',2,4,7,1,1,3,17,42', '2016-03-14 12:12:10'),
(2, '311', 'kingfisher', 'Sri Lanka', 'Japan', '2016-03-15 00:00:00', 3400, 40, '', 2300, 60, '44,1,42', '2016-03-14 12:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `profile_image` longtext NOT NULL,
  `user_type` varchar(3) NOT NULL,
  `phone` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `passport_no` varchar(20) NOT NULL,
  `date_registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `profile_image`, `user_type`, `phone`, `address`, `passport_no`, `date_registered`) VALUES
(1, 'amjad', 'naz', 'a@g.com', '25d55ad283aa400af464c76d713c07ad', '', 'U', 345345, '', '', '2016-03-14 10:39:53'),
(4, 'amjad', 'nazeer', 'a@ss.com', '25d55ad283aa400af464c76d713c07ad', '', 'U', 65754645, '', '', '2016-03-14 11:21:27'),
(5, 'aaa', 'aaa', 'a@ss.ss', '722279e9e630b3e731464b69968ea4b4', '', 'A', 452, '', '', '2016-03-14 14:23:12'),
(6, 'bhagas', 'bbbba', 'b@b.b', '0cc175b9c0f1b6a831c399e269772661', 'images/56e6d7797ecbcnot_updated_etisalart.jpg', '', 123123123, '', '', '2016-03-14 14:33:31'),
(7, 'Lasitha', 'Prabodha', 'l@l.l', '722279e9e630b3e731464b69968ea4b4', '', '', 716544776, '', '987334522', '2016-03-15 06:10:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
 ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `booking_payments`
--
ALTER TABLE `booking_payments`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `booking_payments`
--
ALTER TABLE `booking_payments`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

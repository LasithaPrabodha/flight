-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2016 at 04:10 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cdcol`
--

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
`id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Database: `doc_res`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinments`
--

CREATE TABLE IF NOT EXISTS `appoinments` (
`appoinment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `time_slot` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `appoinments`
--

INSERT INTO `appoinments` (`appoinment_id`, `user_id`, `doctor_id`, `time_slot`) VALUES
(2, 4, 1, 'M1');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
`doctor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT '1',
  `specialization` longtext NOT NULL,
  `allocated_appointment_time` longtext NOT NULL,
  `reserved_time_slots` longtext NOT NULL,
  `charges_id` int(11) NOT NULL,
  `account_no` varchar(40) NOT NULL,
  `bank` int(11) NOT NULL,
  `Address` longtext NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `user_id`, `availability`, `specialization`, `allocated_appointment_time`, `reserved_time_slots`, `charges_id`, `account_no`, `bank`, `Address`) VALUES
(1, 1, 1, 'Heart surgeon', 'M1,Z1,T2,Z2,Z3,T4,W4,L4,F4,S4,Z4,L5,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16', ',M1', 0, '', 0, 'No2,Kandy,Srilanka'),
(2, 5, 1, 'Dermatologist', '', '', 0, '', 0, 'No2,Kandy,Srilanka'),
(3, 3, 1, 'Psychiatrist', '', '', 0, '', 0, 'No2,Kandy,Srilanka'),
(4, 4, 1, 'Dermatologist', 'M1,Z1,T2,Z2,Z3,T4,W4,L4,F4,S4,Z4,L5,Z5,Z6,Z7,Z8,Z9,Z10,Z11,Z12,Z13,Z14,Z15,Z16', '', 0, '', 0, 'No2,Kandy,Srilanka');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_charges`
--

CREATE TABLE IF NOT EXISTS `doctor_charges` (
`charges_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `channeling_fee` float NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `doctor_charges`
--

INSERT INTO `doctor_charges` (`charges_id`, `doctor_id`, `channeling_fee`) VALUES
(1, 1, 800);

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE IF NOT EXISTS `donations` (
  `donation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blood_group` varchar(5) NOT NULL,
  `details` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical_c`
--

CREATE TABLE IF NOT EXISTS `medical_c` (
`mc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `qualifications` longtext NOT NULL,
  `acc_no` varchar(30) NOT NULL,
  `bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gp_payments`
--

CREATE TABLE IF NOT EXISTS `gp_payments` (
  `mc_payment_id` int(11) NOT NULL,
  `mc_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dob` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_payments`
--

CREATE TABLE IF NOT EXISTS `patient_payments` (
`p_payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `appoinment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `patient_payments`
--

INSERT INTO `patient_payments` (`p_payment_id`, `user_id`, `appoinment_id`, `doctor_id`, `amount`, `date`) VALUES
(1, 4, 1, 1, 1000, '2016-03-12 17:10:41'),
(2, 4, 2, 1, 1000, '2016-03-12 19:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE IF NOT EXISTS `time_slots` (
`id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `time_string` longtext NOT NULL,
  `appointment_string` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(11) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `name_with_initials` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `profile_img` longtext NOT NULL,
  `gender` varchar(1) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `is_active` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `Address` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `name_with_initials`, `email`, `profile_img`, `gender`, `user_type`, `is_active`, `password`, `contact_number`, `Address`) VALUES
(1, 'Arun', 'Thomas', 'A.P.Thomasa', 'a@g.com', 'images/WWW.YIFY-TORRENTS.COM.jpg56e526a5d3a8d', 'm', 'D', 1, '722279e9e630b3e731464b69968ea4b4', '0716544554', 0),
(2, 'Amjad', 'Nazeer', 'A.Nazeer', 'a@ss.com', '', 'f', 'P', 1, '722279e9e630b3e731464b69968ea4b4', '07112312313', 0),
(3, 'Lasitha', 'weligampola', 'L.Weligampola', 'L@gmail.com', '', 'm', 'G', 1, '722279e9e630b3e731464b69968ea4b4', '', 0),
(4, 'sajith', 'sudarshana', 'ss.sudarshana', 's@s.c', '', 'm', 'P', 1, '722279e9e630b3e731464b69968ea4b4', '', 0),
(5, 'bhagyani', 'balas', 'b.b.aaaaaaa', 'b@b.com', '', 'f', 'D', 1, '0cc175b9c0f1b6a831c399e269772661', '', 0),
(6, 'udara', 'karunarathna', 'U.P.D Karunarathne', 'u@u.u', '', 'm', 'G', 1, '722279e9e630b3e731464b69968ea4b4', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoinments`
--
ALTER TABLE `appoinments`
 ADD PRIMARY KEY (`appoinment_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
 ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `doctor_charges`
--
ALTER TABLE `doctor_charges`
 ADD PRIMARY KEY (`charges_id`);

--
-- Indexes for table `medical_c`
--
ALTER TABLE `medical_c`
 ADD PRIMARY KEY (`mc_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patient_payments`
--
ALTER TABLE `patient_payments`
 ADD PRIMARY KEY (`p_payment_id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoinments`
--
ALTER TABLE `appoinments`
MODIFY `appoinment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `doctor_charges`
--
ALTER TABLE `doctor_charges`
MODIFY `charges_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `medical_c`
--
ALTER TABLE `medical_c`
MODIFY `mc_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient_payments`
--
ALTER TABLE `patient_payments`
MODIFY `p_payment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `flight_id`, `booking_reference`, `class`, `seat_no`, `amount`, `date_created`) VALUES
(4, 6, 1, 'dsag462dgsa', 'b', '33', 34000, '2016-03-14 19:47:59'),
(5, 6, 2, 'GY67HBBB9', 'e', '56W', 18000, '2016-03-14 19:47:59');

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
  `b_seat_count_w` int(5) NOT NULL,
  `b_seat_count_m` int(5) NOT NULL,
  `e_price` float NOT NULL,
  `e_seat_count_w` int(5) NOT NULL,
  `e_seat_count_m` int(5) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`id`, `flight_no`, `airline`, `depature`, `destination`, `depature_date`, `b_price`, `b_seat_count_w`, `b_seat_count_m`, `e_price`, `e_seat_count_w`, `e_seat_count_m`, `date_created`) VALUES
(1, '123', 'airlanka', 'Sri Lanka', 'United Kingdom', '2016-03-16 00:00:00', 4000, 5, 22, 3000, 5, 34, '2016-03-14 12:12:10'),
(2, '311', 'kingfisher', 'Sri Lanka', 'Japan', '2016-03-15 00:00:00', 3400, 7, 33, 2300, 8, 44, '2016-03-14 12:12:10');

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
MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;--
-- Database: `form_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `code`) VALUES
(1, '<input id="*" name="#" type="text">'),
(2, '	\r\n<input id="*" name="#" type="password">'),
(3, '	\r\n<textarea id="*" name="#">$</textarea>'),
(4, '<button id="*" name="#">$</button>'),
(6, '<input type="radio" name="#" id="*" value="@">^'),
(7, '<input type="checkbox" name="#" id="*" value="@">^'),
(8, '<select id="*" name="#">$</select>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
 ADD PRIMARY KEY (`id`);
--
-- Database: `formdetail`
--

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `formTitle` varchar(200) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `pathToFile` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`formTitle`, `createdDate`, `pathToFile`) VALUES
('abc', '2016-02-09 08:27:00', './Forms/abc.html');
--
-- Database: `formgen`
--

-- --------------------------------------------------------

--
-- Table structure for table `formelements`
--

CREATE TABLE IF NOT EXISTS `formelements` (
  `id` int(2) NOT NULL,
  `name` varchar(10) NOT NULL,
  `content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formelements`
--

INSERT INTO `formelements` (`id`, `name`, `content`) VALUES
(4, 'button', '<button id="*" name="#">$</button>'),
(8, 'select', '<select id="*" name="#">$</select>'),
(1, 'textinput', '<input id="*" name="#" type="text">'),
(2, 'passinput', '<input id="*" name="#" type="password">'),
(3, 'textarea', '<textarea id="*" name="#">$</textarea>'),
(7, 'checkbox', '<input type="checkbox" name="#" id="*" value="@">^'),
(6, 'radio', '<input type="radio" name="#" id="*" value="@">^');

-- --------------------------------------------------------

--
-- Table structure for table `input_fields`
--

CREATE TABLE IF NOT EXISTS `input_fields` (
`auto_id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(200) NOT NULL,
  `values` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `input_fields`
--

INSERT INTO `input_fields` (`auto_id`, `label`, `name`, `id`, `type`, `values`) VALUES
(1, '', 'asd', 'as', '1', ''),
(2, '', 'sd', 'df', '1', ''),
(3, '', 'test', 'TEST', '1', ''),
(4, '', 'test', 'TEST', '1', ''),
(5, 'test', 'test', 'TEST', '1', ''),
(6, 'test', 'test', 'test', '1', ''),
(7, 'asd', 'asd', 'asd', '1', ''),
(8, 'asd', 'asd', 'asd', '1', ''),
(9, 'asd', 'asd', 'asd', '1', ''),
(10, 'asd', 'asd', 'asd', '1', ''),
(11, 'asd', 'asd', 'asd', '1', ''),
(12, 'asd', 'asd', 'asd', '1', ''),
(13, 'qwe', 'qwe', 'qwe', '1', ''),
(14, 'qwe', 'qwe', 'qwe', '1', ''),
(15, 'asd', 'asd', 'asd', '1', ''),
(16, 'aa', 'aa', 'aa', '1', ''),
(17, 'aa', 'aa', 'aa', '1', ''),
(18, 'asd', 'asd', 'asd', '1', ''),
(19, 'zz', 'zz', 'zz', '1', ''),
(20, 'qq', 'qq', 'qq', '1', ''),
(21, 'qq', 'qq', 'qq', '1', ''),
(22, 'qq', 'qq', 'qq', '1', ''),
(23, 'qq', 'qq', 'qq', '1', ''),
(24, 'as', 'as', 'as', '1', ''),
(25, 'zxc', 'zxc', 'zxc', '1', ''),
(26, 'asdd', 'asdd', 'asdd', '1', ''),
(27, 'asdd', 'asdd', 'asdd', '1', ''),
(28, 'asdd', 'asdd', 'asdd', '1', ''),
(29, 'dd', 'dd', 'dd', '1', ''),
(30, 'dd', 'dd', 'dd', '1', ''),
(31, 'wewe', 'wewe', 'wewe', '1', ''),
(32, 'aaa', 'aaa', 'aaa', '1', ''),
(33, 'asd', 'asd', 'asd', '2', ''),
(34, 'asd', 'asd', 'asd', '4', ''),
(35, 'asd', 'asd', 'asd', '4', ''),
(36, 'asd', 'asd', 'asd', '4', ''),
(37, '', 'asd', 'asd', '7', ''),
(38, 'asd', 'asd', 'asd', '3', ''),
(39, '111', '111', '1111', '3', ''),
(40, '111', '111', '1111', '3', ''),
(41, 'First name', 'fname', 'fname', '1', ''),
(42, 'Last name', 'lname', 'lname', '1', ''),
(43, 'sex', 'name', 'id', '4', ''),
(44, '', 'name', 'name', '4', ''),
(45, '', 'name', 'id', '4', ''),
(46, '', 'name', 'name', '4', ''),
(47, '', 'name', 'name', '4', ''),
(48, 'doen', 'oena', 'oasnd', '3', ''),
(49, 'name', 'name', 'name', '1', ''),
(50, 'asda', 'dsad', 'dasd', '1', ''),
(51, 'asdsa', 'dasd', 'dasd', '3', ''),
(52, 'dsa', 'das', 'dasd', '2', ''),
(53, 'das', 'dasd', 'dasd', '4', ''),
(54, 'dsad', 'dsad', 'dsad', '6', ''),
(55, 'dsa', 'dsad', 'dsa', '6', ''),
(56, 'dsad', 'sad', 'sdsa', '7', ''),
(57, 'dsad', 'dsad', 'dsad', '8', ''),
(58, 'dasd', 'dsad', 'sada', '8', ''),
(59, 'dasd', 'dsad', 'dasd', '1', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `input_fields`
--
ALTER TABLE `input_fields`
 ADD PRIMARY KEY (`auto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `input_fields`
--
ALTER TABLE `input_fields`
MODIFY `auto_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;--
-- Database: `oabs`
--

-- --------------------------------------------------------

--
-- Table structure for table `oabs_adverts`
--

CREATE TABLE IF NOT EXISTS `oabs_adverts` (
`id` int(4) NOT NULL,
  `adcode` text NOT NULL,
  `impcount` int(10) NOT NULL DEFAULT '0',
  `implimit` int(10) NOT NULL DEFAULT '0',
  `address` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oabs_customers`
--

CREATE TABLE IF NOT EXISTS `oabs_customers` (
  `name` text NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `county` text NOT NULL,
  `postcode` text NOT NULL,
`customer` tinyint(4) NOT NULL,
  `seats` text NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT '0',
  `class` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oabs_flights`
--

CREATE TABLE IF NOT EXISTS `oabs_flights` (
`number` tinyint(4) NOT NULL,
  `Dest` text NOT NULL,
  `datetime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `passb` int(4) NOT NULL DEFAULT '0',
  `passf` int(4) NOT NULL DEFAULT '0',
  `passe` int(4) NOT NULL DEFAULT '0',
  `cost` int(10) NOT NULL DEFAULT '0',
  `priceb` int(4) NOT NULL DEFAULT '0',
  `pricef` int(4) NOT NULL DEFAULT '0',
  `pricee` int(4) NOT NULL DEFAULT '0',
  `senior` int(4) NOT NULL DEFAULT '0',
  `child` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oabs_offers`
--

CREATE TABLE IF NOT EXISTS `oabs_offers` (
`no` tinyint(4) NOT NULL,
  `offer` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oabs_user`
--

CREATE TABLE IF NOT EXISTS `oabs_user` (
`ID` smallint(3) NOT NULL,
  `Name` varchar(30) NOT NULL DEFAULT '',
  `Password` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oabs_adverts`
--
ALTER TABLE `oabs_adverts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oabs_customers`
--
ALTER TABLE `oabs_customers`
 ADD PRIMARY KEY (`customer`), ADD UNIQUE KEY `customer` (`customer`);

--
-- Indexes for table `oabs_flights`
--
ALTER TABLE `oabs_flights`
 ADD PRIMARY KEY (`number`), ADD UNIQUE KEY `number` (`number`);

--
-- Indexes for table `oabs_offers`
--
ALTER TABLE `oabs_offers`
 ADD KEY `no` (`no`);

--
-- Indexes for table `oabs_user`
--
ALTER TABLE `oabs_user`
 ADD PRIMARY KEY (`ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oabs_adverts`
--
ALTER TABLE `oabs_adverts`
MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oabs_customers`
--
ALTER TABLE `oabs_customers`
MODIFY `customer` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oabs_flights`
--
ALTER TABLE `oabs_flights`
MODIFY `number` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oabs_offers`
--
ALTER TABLE `oabs_offers`
MODIFY `no` tinyint(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oabs_user`
--
ALTER TABLE `oabs_user`
MODIFY `ID` smallint(3) NOT NULL AUTO_INCREMENT;--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
`id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
`id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=105 ;

--
-- Dumping data for table `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'doc_res', 'user', 'user_id', '', '', '_', ''),
(2, 'doc_res', 'user', 'first_name', '', '', '_', ''),
(3, 'doc_res', 'user', 'last_name', '', '', '_', ''),
(4, 'doc_res', 'user', 'name_with_initials', '', '', '_', ''),
(5, 'doc_res', 'user', 'email', '', '', '_', ''),
(6, 'doc_res', 'user', 'profile_img', '', '', '_', ''),
(7, 'doc_res', 'user', 'gender', '', '', '_', ''),
(8, 'doc_res', 'user', 'user_type', '', '', '_', ''),
(9, 'doc_res', 'user', 'is_active', '', '', '_', ''),
(10, 'doc_res', 'user', 'password', '', '', '_', ''),
(11, 'doc_res', 'user', 'contact_number', '', '', '_', ''),
(12, 'doc_res', 'doctor', 'doctor_id', '', '', '_', ''),
(13, 'doc_res', 'doctor', 'user_id', '', '', '_', ''),
(14, 'doc_res', 'doctor', 'specialization', '', '', '_', ''),
(15, 'doc_res', 'doctor', 'allocated_appointment_time', '', '', '_', ''),
(16, 'doc_res', 'doctor', 'charges_id', '', '', '_', ''),
(17, 'doc_res', 'doctor', 'account_no', '', '', '_', ''),
(18, 'doc_res', 'doctor', 'bank', '', '', '_', ''),
(19, 'doc_res', 'appoinments', 'appoinment_id', '', '', '_', ''),
(20, 'doc_res', 'appoinments', 'user_id', '', '', '_', ''),
(21, 'doc_res', 'appoinments', 'doctor_id', '', '', '_', ''),
(69, 'flight_db', 'users', 'first_name', '', '', '_', ''),
(70, 'flight_db', 'users', 'last_name', '', '', '_', ''),
(63, 'doc_res', 'appoinments', 'time_slot', '', '', '_', ''),
(25, 'doc_res', 'medical_c', 'mc_id', '', '', '_', ''),
(26, 'doc_res', 'medical_c', 'user_id', '', '', '_', ''),
(27, 'doc_res', 'medical_c', 'qualifications', '', '', '_', ''),
(28, 'doc_res', 'medical_c', 'acc_no', '', '', '_', ''),
(29, 'doc_res', 'medical_c', 'bank', '', '', '_', ''),
(30, 'doc_res', 'doctor_charges', 'charges_id', '', '', '_', ''),
(31, 'doc_res', 'doctor_charges', 'doctor_id', '', '', '_', ''),
(32, 'doc_res', 'doctor_charges', 'channeling_fee', '', '', '_', ''),
(33, 'doc_res', 'patient_payments', 'p_payment_id', '', '', '_', ''),
(34, 'doc_res', 'patient_payments', 'user_id', '', '', '_', ''),
(35, 'doc_res', 'patient_payments', 'appoinment_id', '', '', '_', ''),
(36, 'doc_res', 'patient_payments', 'doctor_id', '', '', '_', ''),
(37, 'doc_res', 'patient_payments', 'amount', '', '', '_', ''),
(38, 'doc_res', 'patient_payments', 'date', '', '', '_', ''),
(39, 'doc_res', 'gp_payments', 'mc_payment_id', '', '', '_', ''),
(40, 'doc_res', 'gp_payments', 'mc_id', '', '', '_', ''),
(41, 'doc_res', 'gp_payments', 'amount', '', '', '_', ''),
(42, 'doc_res', 'gp_payments', 'date', '', '', '_', ''),
(43, 'doc_res', 'donations', 'donation_id', '', '', '_', ''),
(44, 'doc_res', 'donations', 'user_id', '', '', '_', ''),
(45, 'doc_res', 'donations', 'blood_group', '', '', '_', ''),
(46, 'doc_res', 'donations', 'details', '', '', '_', ''),
(47, 'doc_res', 'donations', 'date', '', '', '_', ''),
(48, 'form_db', 'elements', 'id', '', '', '_', ''),
(49, 'form_db', 'elements', 'code', '', '', '_', ''),
(50, 'sep_db', 'users', 'active', '', '', '_', ''),
(51, 'doc_res', 'patient', 'id', '', '', '_', ''),
(52, 'doc_res', 'patient', 'user_id', '', '', '_', ''),
(53, 'doc_res', 'patient', 'dob', '', '', '_', ''),
(54, 'doc_res', 'doctor', 'availability', '', '', '_', ''),
(55, 'doc_res', 'appoinments', 'appoinment_time', '', '', '_', ''),
(56, 'doc_res', 'appoinments', 'appointment_date', '', '', '_', ''),
(57, 'doc_res', 'time_slots', 'id', '', '', '_', ''),
(58, 'doc_res', 'time_slots', 'doctor_id', '', '', '_', ''),
(59, 'doc_res', 'time_slots', 'time_string', '', '', '_', ''),
(60, 'doc_res', 'time_slots', 'appointment_string', '', '', '_', ''),
(61, 'doc_res', 'doctor', 'Address', '', '', '_', ''),
(62, 'doc_res', 'doctor', 'reserved_time_slots', '', '', '_', ''),
(71, 'flight_db', 'users', 'email', '', '', '_', ''),
(68, 'flight_db', 'users', 'id', '', '', '_', ''),
(72, 'flight_db', 'users', 'password', '', '', '_', ''),
(73, 'flight_db', 'users', 'phone', '', '', '_', ''),
(74, 'flight_db', 'users', 'address', '', '', '_', ''),
(75, 'flight_db', 'users', 'passport_no', '', '', '_', ''),
(76, 'flight_db', 'users', 'date_registered', '', '', '_', ''),
(77, 'flight_db', 'flights', 'id', '', '', '_', ''),
(78, 'flight_db', 'flights', 'flight_no1', '', '', '_', ''),
(79, 'flight_db', 'flights', 'flight_no2', '', '', '_', ''),
(80, 'flight_db', 'flights', 'airline', '', '', '_', ''),
(81, 'flight_db', 'flights', 'depature', '', '', '_', ''),
(82, 'flight_db', 'flights', 'destination', '', '', '_', ''),
(83, 'flight_db', 'flights', 'depature_date', '', '', '_', ''),
(84, 'flight_db', 'flights', 'return_date', '', '', '_', ''),
(85, 'flight_db', 'flights', 'b_price', '', '', '_', ''),
(86, 'flight_db', 'flights', 'b_seat_count', '', '', '_', ''),
(87, 'flight_db', 'flights', 'b_seat_pattern', '', '', '_', ''),
(88, 'flight_db', 'flights', 'b_booked_seats', '', '', '_', ''),
(89, 'flight_db', 'flights', 'e_price', '', '', '_', ''),
(90, 'flight_db', 'flights', 'e_seat_count', '', '', '_', ''),
(91, 'flight_db', 'flights', 'e_seat_pattern', '', '', '_', ''),
(92, 'flight_db', 'flights', 'e_booked_seats', '', '', '_', ''),
(93, 'flight_db', 'flights', 'date_created', '', '', '_', ''),
(94, 'flight_db', 'bookings', 'booking_id', '', '', '_', ''),
(95, 'flight_db', 'bookings', 'user_id', '', '', '_', ''),
(96, 'flight_db', 'bookings', 'flight_id', '', '', '_', ''),
(97, 'flight_db', 'bookings', 'booking_reference', '', '', '_', ''),
(98, 'flight_db', 'bookings', 'class', '', '', '_', ''),
(99, 'flight_db', 'bookings', 'seat_no', '', '', '_', ''),
(100, 'flight_db', 'bookings', 'amount', '', '', '_', ''),
(101, 'flight_db', 'bookings', 'date_created', '', '', '_', ''),
(102, 'flight_db', 'users', 'profile_img', '', '', '_', ''),
(103, 'flight_db', 'users', 'user_type', '', '', '_', ''),
(104, 'flight_db', 'users', 'profile_image', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
`id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_navigationhiding`
--

CREATE TABLE IF NOT EXISTS `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
`page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"flight_db","table":"flights"},{"db":"flight_db","table":"bookings"},{"db":"flight_db","table":"users"},{"db":"oabs","table":"oabs_adverts"},{"db":"oabs","table":"oabs_offers"},{"db":"oabs","table":"oabs_flights"},{"db":"oabs","table":"oabs_customers"},{"db":"oabs","table":"oabs_user"},{"db":"doc_res","table":"user"},{"db":"doc_res","table":"gp_payments"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma_savedsearches`
--

CREATE TABLE IF NOT EXISTS `pma_savedsearches` (
`id` int(5) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma_table_uiprefs`
--

INSERT INTO `pma_table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'doc_res', 'user', '{"sorted_col":"`user`.`name_with_initials` DESC"}', '2016-02-17 21:32:42'),
('root', 'doc_res', 'appoinments', '{"sorted_col":"`appoinment_id` DESC"}', '2016-03-12 15:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-12-26 13:51:44', '{"collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma_usergroups`
--

CREATE TABLE IF NOT EXISTS `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma_users`
--

CREATE TABLE IF NOT EXISTS `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_history`
--
ALTER TABLE `pma_history`
 ADD PRIMARY KEY (`id`), ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
 ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
 ADD PRIMARY KEY (`page_nr`), ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma_recent`
--
ALTER TABLE `pma_recent`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_relation`
--
ALTER TABLE `pma_relation`
 ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`), ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma_table_info`
--
ALTER TABLE `pma_table_info`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
 ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma_tracking`
--
ALTER TABLE `pma_tracking`
 ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
 ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma_users`
--
ALTER TABLE `pma_users`
 ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `pma_history`
--
ALTER TABLE `pma_history`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;--
-- Database: `sep_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_feed`
--

CREATE TABLE IF NOT EXISTS `activity_feed` (
`id` int(11) NOT NULL,
  `initiator_id` int(11) NOT NULL,
  `activity_type` int(11) NOT NULL,
  `activity_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `activity_type`
--

CREATE TABLE IF NOT EXISTS `activity_type` (
`id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `color_code` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `apply_leaves`
--

CREATE TABLE IF NOT EXISTS `apply_leaves` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `is_half_day` tinyint(1) DEFAULT NULL,
  `applied_date` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `leave_status` int(1) NOT NULL COMMENT '0 - Pending , 1 - Apdproved , 2 - Rejecte',
  `remarks` varchar(255) DEFAULT NULL,
  `no_of_days` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `apply_leaves`
--

INSERT INTO `apply_leaves` (`id`, `user_id`, `teacher_id`, `leave_type_id`, `is_half_day`, `applied_date`, `start_date`, `end_date`, `reason`, `leave_status`, `remarks`, `no_of_days`) VALUES
(1, 35, 2, 1, 0, '2015-09-06', '2015-09-14', '2015-09-18', 'Private Reason', 0, NULL, 4),
(2, 35, 2, 2, 0, '2015-09-06', '2015-09-29', '2015-09-30', 'Private Reason', 1, 'Leave Approved', 1),
(3, 34, 1, 1, 0, '2015-09-06', '2015-09-15', '2015-09-17', 'Private Reason', 0, NULL, 2),
(4, 34, 1, 1, 1, '2015-09-06', '2015-09-30', '2015-09-30', 'Private reason | Half Day for extra short leaves', 0, NULL, 1),
(5, 29, 3, 1, 1, '2015-10-11', '2015-10-20', '2015-10-20', 'testt | Half Day for extra short leaves', 0, NULL, 1),
(32, 2, 4, 1, 0, '2015-05-24', '2015-05-25', '2015-05-29', 'duty bug fix 1', 0, NULL, 1),
(33, 2, 4, 4, 0, '2015-05-24', '2015-05-25', '2015-06-01', 'test', 2, 'Leave Reject', 6),
(34, 2, 4, 3, 0, '2015-05-24', '2015-05-25', '2015-05-29', 'test', 2, 'Leave Reject', 3),
(35, 2, 4, 3, 0, '2015-05-24', '2015-05-25', '2015-06-01', 'test', 2, 'Leave Reject', 6),
(36, 2, 4, 3, 0, '2015-05-24', '2015-05-25', '2015-06-01', 'test', 2, 'Leave Reject', 4),
(37, 2, 4, 4, 0, '2015-05-24', '2015-05-25', '2015-06-01', 'test', 1, 'Leave Approved', 4),
(38, 4, 8, 1, 0, '2015-05-24', '2015-05-26', '2015-05-29', 'sample admin leave', 1, 'Leave Approved', 2),
(39, 12, 13, 1, 0, '2015-05-24', '2015-06-01', '2015-06-05', 'supun leaves', 1, 'Leave Approved', 4),
(40, 14, 15, 2, 0, '2015-05-24', '2015-05-27', '2015-05-31', 'edd', 0, NULL, 2),
(41, 2, 4, 2, 0, '2015-06-02', '2016-06-11', '2016-06-24', 'asfaf', 0, NULL, 0),
(42, 2, 4, 2, 0, '2015-06-02', '2015-06-11', '2015-06-14', 'asfaf', 0, NULL, 2),
(43, 2, 4, 1, 1, '2015-06-17', '2015-06-26', '2015-06-26', 'half day test', 1, 'Leave Approved', 1),
(44, 2, 4, 1, 1, '2015-06-17', '2015-06-29', '2015-06-29', 'test | Half Day', 0, NULL, 1),
(45, 2, 4, 1, 1, '2015-06-17', '2015-06-29', '2015-06-29', 'gedara yannam test | Half Day', 0, NULL, 1),
(46, 2, 4, 1, 1, '2015-06-17', '2015-06-26', '2015-06-26', 'teata | Half Day for extra short leaves', 0, NULL, 1),
(47, 2, 4, 1, 1, '2015-06-17', '2015-06-25', '2015-06-25', 'test | Half Day for extra short leaves', 0, NULL, 1),
(48, 29, 3, 1, 0, '2015-10-13', '2015-10-14', '2015-10-15', 'Yes!', 1, 'Leave Approved', 1);

-- --------------------------------------------------------

--
-- Table structure for table `apply_short_leaves`
--

CREATE TABLE IF NOT EXISTS `apply_short_leaves` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `leave_Type` int(11) NOT NULL COMMENT '1 - Short Leaves 2 - Half day',
  `applied_date` date NOT NULL,
  `date` date NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0 - Pending 1 - Approved 2 - Rejected',
  `remarks` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `apply_short_leaves`
--

INSERT INTO `apply_short_leaves` (`id`, `user_id`, `teacher_id`, `leave_Type`, `applied_date`, `date`, `reason`, `status`, `remarks`) VALUES
(1, 34, 1, 1, '2015-09-06', '2015-09-07', 'Private Reason', 2, 'Short Leave Reject'),
(2, 34, 1, 1, '2015-09-06', '2015-09-16', 'Private Reason', 0, ''),
(3, 34, 1, 1, '2015-09-06', '2015-09-30', 'Private reason', 0, ''),
(4, 29, 0, 1, '2015-10-11', '2015-10-26', 'test', 0, ''),
(5, 29, 0, 1, '2015-10-11', '2015-10-21', 'testtt', 0, ''),
(6, 29, 3, 1, '2015-10-11', '2015-10-20', 'testt', 0, ''),
(16, 2, 4, 1, '2015-06-17', '2015-06-18', 'short leave ekak oneh', 1, 'Short Leave Approved'),
(17, 2, 4, 1, '2015-06-17', '2015-06-19', 'short leave thawa ekak', 0, ''),
(18, 2, 4, 1, '2015-06-17', '2015-06-26', 'teata', 2, ''),
(19, 2, 4, 1, '2015-06-17', '2015-06-25', 'test', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `archived_guardians`
--

CREATE TABLE IF NOT EXISTS `archived_guardians` (
`id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `addr` varchar(400) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `is_pastpupil` tinyint(1) DEFAULT '0',
  `house_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `archived_guardians`
--

INSERT INTO `archived_guardians` (`id`, `student_id`, `fullname`, `name_with_initials`, `relation`, `contact_mobile`, `contact_home`, `addr`, `dob`, `occupation`, `gender`, `is_pastpupil`, `house_id`) VALUES
(6, 24, 'adsasadsa', 'dsadsada', 'f', '0987654321', '0786745321', 'zxcc', '1966-07-14', 'Czcz', 'm', 0, NULL),
(7, 34, 'test', 'test', 'f', '9986544654', '0716544554', 'test', '1955-08-26', 'Bank Manager', 'm', 0, NULL),
(8, 0, '', '', '', '', '', '', '0000-00-00', '', '', 0, NULL),
(9, 0, '', '', '', '', '', '', '0000-00-00', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `archived_students`
--

CREATE TABLE IF NOT EXISTS `archived_students` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admission_no` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `nic_no` varchar(10) DEFAULT NULL,
  `language` varchar(1) DEFAULT NULL,
  `religion` varchar(3) DEFAULT NULL,
  `permanent_addr` varchar(512) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_data` mediumblob
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `archived_students`
--

INSERT INTO `archived_students` (`id`, `user_id`, `admission_no`, `admission_date`, `full_name`, `name_with_initials`, `dob`, `gender`, `nic_no`, `language`, `religion`, `permanent_addr`, `contact_home`, `email`, `house_id`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_data`) VALUES
(12, 24, '4666', '2015-07-06', 'sasccZ cxzczzxczxc', 'cxzcxzczx', '1997-07-14', 'M', NULL, 'e', '4', 'cxzc', '0812348526', 'SSudaraka@gmail.com', 3, '2015-09-05 06:33:32', NULL, NULL, NULL, NULL),
(13, 34, '7777 ', '2015-08-03', 'test  test ', 'test ', '1997-08-26', 'M', NULL, 't', '5 ', 'test ', '0716544554 ', 'daraka@gmail.com ', 2, '2015-09-06 08:00:39', NULL, NULL, NULL, NULL),
(14, 0, '', '0000-00-00', '', '', '0000-00-00', 'M', NULL, '', '', '', '', '', 0, '2015-09-06 12:22:00', NULL, NULL, NULL, NULL),
(15, 0, '', '0000-00-00', '', '', '0000-00-00', 'M', NULL, '', '', '', '', '', 0, '2015-09-06 12:22:16', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `archived_teachers`
--

CREATE TABLE IF NOT EXISTS `archived_teachers` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `signature_no` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `serial_no` varchar(10) DEFAULT NULL,
  `personal_file_no` varchar(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `teacher_register_no` varchar(30) DEFAULT NULL,
  `nic_no` varchar(10) DEFAULT NULL,
  `permanent_addr` varchar(512) DEFAULT NULL,
  `wnop_no` varchar(20) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `nature_of_appointment` varchar(40) DEFAULT NULL,
  `main_subject_id` int(11) DEFAULT NULL,
  `medium` char(1) DEFAULT NULL,
  `first_appointment_date` date DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `civil_status` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_data` mediumblob,
  `religion_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `educational_qualific` text,
  `professional_qualific` text,
  `promotions` text,
  `increment_date` date DEFAULT NULL,
  `duty_assume_date` date DEFAULT NULL,
  `pension_date` date DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `archived_teachers`
--

INSERT INTO `archived_teachers` (`id`, `user_id`, `signature_no`, `email`, `serial_no`, `personal_file_no`, `full_name`, `name_with_initials`, `gender`, `section`, `teacher_register_no`, `nic_no`, `permanent_addr`, `wnop_no`, `service`, `grade`, `nature_of_appointment`, `main_subject_id`, `medium`, `first_appointment_date`, `contact_mobile`, `contact_home`, `dob`, `remarks`, `civil_status`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_data`, `religion_id`, `nationality_id`, `designation_id`, `educational_qualific`, `professional_qualific`, `promotions`, `increment_date`, `duty_assume_date`, `pension_date`, `joined_date`) VALUES
(10, NULL, NULL, 'udarapathmin@gmail.com', NULL, NULL, 'Udara Karunarathna', 'Udara Karunarathna', 'm', NULL, NULL, '933564152V', '266/8 Kohomban watta', '1', NULL, NULL, NULL, NULL, NULL, NULL, '0766663414', '0112456324', '1993-03-31', NULL, 'm', NULL, NULL, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
`id` int(11) NOT NULL,
  `academic_year` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`id`, `academic_year`, `name`, `grade`) VALUES
(1, 1, '2015BATCH', 1),
(2, 0, '2010BATCH', 5),
(3, 0, '2011BATCH', 4),
(4, 0, '2012BATCH', 3),
(5, 2, '2016BATCH', 1),
(6, 0, 'TEST', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ci_cookies`
--

CREATE TABLE IF NOT EXISTS `ci_cookies` (
`id` int(11) NOT NULL,
  `cookie_id` varchar(255) DEFAULT NULL,
  `netid` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `orig_page_requested` varchar(120) DEFAULT NULL,
  `php_session_id` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_timetable`
--

CREATE TABLE IF NOT EXISTS `class_timetable` (
`id` int(11) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `class_timetable`
--

INSERT INTO `class_timetable` (`id`, `class_id`, `year`) VALUES
(3, 9, 2015),
(4, 6, 1990);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE IF NOT EXISTS `classes` (
`id` int(11) NOT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `grade_id`, `name`, `teacher_id`) VALUES
(5, 7, '7A', NULL),
(6, 7, '7B', NULL),
(7, 8, '8A', NULL),
(8, 8, '8C', NULL),
(9, 12, '12M1', 2),
(10, 12, '12M2', NULL),
(11, 13, '13B1', NULL),
(13, 1, '1A', 1),
(14, 1, '1B', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
`id` int(11) NOT NULL,
  `event_type` varchar(100) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `event_type`, `description`) VALUES
(1, 'Sports Event', 'All the School Sports Events goes in this category'),
(2, 'Religious Event', 'All the Religious Events goes in this category'),
(3, 'Special Event', 'All the Special Events goes in this category'),
(4, 'School Event', 'All regular events in school goes in this category'),
(5, 'Wesak ', 'Wesak event');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `description` text,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `in_charge_id` varchar(100) DEFAULT NULL,
  `is_sport_event` tinyint(1) DEFAULT NULL,
  `society_or_sport_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `details` text,
  `location` varchar(100) DEFAULT NULL,
  `guest` varchar(100) DEFAULT NULL,
  `event_type` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_time`, `end_time`, `in_charge_id`, `is_sport_event`, `society_or_sport_id`, `start_date`, `end_date`, `status`, `budget`, `details`, `location`, `guest`, `event_type`) VALUES
(1, 'Annual Sports Meet ', 'D.S. College Annual Sports Meet 2015 is schedule to be on  10th of September 2015. All students are welcome to participate in various events on this.', '13:00:00', '18:30:00', '806021521V', NULL, NULL, '2015-09-10', '2015-09-10', 'success', 250000, 'School Sports Meet', 'College Ground', '', 'Sports Event'),
(2, 'Annual Pirith Sajjayana', 'DS College Annual Pirith Sajjayana is scheduled to be on 31st July 2015 organized by college Prefects Association', '20:00:00', '06:00:00', '752356541V', NULL, NULL, '2015-07-31', '2015-08-01', 'success', 50000, 'DS College Annual Pirith Sajjayana', 'College Main Hall', '', 'Religious Event'),
(3, 'Opening of Nanayakkara Building', 'Opening of newly built Nanayakkara Building on college premises ', '10:00:00', '14:00:00', '752356541V', NULL, NULL, '2015-09-03', '2015-09-03', 'success', 750000, 'Opening of newly built Nanayakkara Building on college premises ', 'Nanayakkara Building', '', 'Special Event'),
(4, 'Annual Media & Broadcasting Day', 'D.S. Senanayake College Annual Media & Broadcasting Day is to be held on the 12th of August in the School Auditorium, organized by DSSC Media Unit.', '08:00:00', '17:00:00', '571900955V', NULL, NULL, '2015-12-08', '2015-12-08', 'rejected', 100000, NULL, NULL, NULL, 'School Event'),
(5, 'Science Day 2015', 'D.S. Senanayake College Annual Science Day is scheduled to be held on the 28th of August, organized by the DSSC Science Committee 2015.', '09:00:00', '17:00:00', '571900955V', NULL, NULL, '2015-08-28', '2015-08-28', 'approved', 100000, NULL, NULL, NULL, 'School Event'),
(6, 'Inter-School Swimming Championship 2015', 'D.S. Senanayaka College Inter-School Swimming Championship is to be held on the 10th of October, organized by the OBA of DSSC. ', '09:00:00', '20:00:00', '869898751v', NULL, NULL, '2015-10-10', '2015-10-10', 'approved', 75000, NULL, NULL, NULL, 'Sports Event'),
(7, 'Annual Prize Giving - 2015', 'D.S. Senanayake College Annual Prize Giving is to be held on the 5th of December, at the College Auditorium. All students are welcome to participate. ', '09:00:00', '17:00:00', '869898751v', NULL, NULL, '2015-12-05', '2015-12-05', 'success', 150000, 'Some name', 'Some name', 'Some name', 'Special Event'),
(8, 'Pirith Dharma Deshanaya', 'Wesak Sharma deshanawa', '13:00:00', '15:01:00', '854642365V', NULL, NULL, '2015-07-24', '2015-07-31', 'success', 12000, 'Pirith deshanaya', 'auditorium', '', 'Wesak ');

-- --------------------------------------------------------

--
-- Table structure for table `exam_marks`
--

CREATE TABLE IF NOT EXISTS `exam_marks` (
  `exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `marks` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_subjects`
--

CREATE TABLE IF NOT EXISTS `exam_subjects` (
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `year` char(4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `government_exam_admission_nos`
--

CREATE TABLE IF NOT EXISTS `government_exam_admission_nos` (
  `government_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `admission_no` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `government_exam_marks`
--

CREATE TABLE IF NOT EXISTS `government_exam_marks` (
  `government_exam_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `government_exams`
--

CREATE TABLE IF NOT EXISTS `government_exams` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE IF NOT EXISTS `grades` (
`id` int(11) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `head_user_id` int(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE IF NOT EXISTS `guardians` (
`id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `addr` varchar(400) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `is_pastpupil` tinyint(1) DEFAULT '0',
  `house_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `guardians`
--

INSERT INTO `guardians` (`id`, `student_id`, `fullname`, `name_with_initials`, `relation`, `contact_mobile`, `contact_home`, `addr`, `dob`, `occupation`, `gender`, `is_pastpupil`, `house_id`) VALUES
(1, 9, 'Sunil', 'Anuradha', 'f', '0755056435', '0755056435', '41 Lien Parkway\nClove\n7540 Blaine Drive', '1970-07-12', 'Teacher', 'm', 0, NULL),
(2, 10, 'Manoj', 'M.S Bandara', 'f', '0776655443', '0812348526', 'No 2 ,Kandy Rd,Peradeniya', '1976-07-14', 'Assistent Bank Manager', 'm', 0, NULL),
(3, 10, 'Manoj', 'M.S Bandara', 'f', '0776655443', '0812348526', 'No 2 ,Kandy Rd,Peradeniya', '1976-07-14', 'Assistent Bank Manager', 'm', 0, NULL),
(4, 11, 'Saman ', 'S.l.Perera', 'f', '0776688443', '0112348544', 'No,6 Daisy villa ave,Colombo 4 ', '1966-07-08', 'Doctor', 'm', 1, NULL),
(5, 12, 'Priyani', 'P.N.M Gunarathna', 'm', '0716655443', '0116745321', 'N0 188,Rajagiriya colombo', '1975-07-12', 'Teacher', 'm', 0, NULL),
(6, 13, 'Nihal', 'N.j.Karunarathna', 'g', '0776688444', '0114567890', 'no 4 Rathmalana ,Colombo', '1955-07-09', 'Bank Manager Rtd', 'm', 1, NULL),
(7, 14, 'nalin', 'N.K Palihakkara', 'f', '0776655898', '0116544554', '123 Nawala Rd,Rajagiriya', '1972-07-01', 'Businessmen', 'm', 1, NULL),
(8, 16, 'Lathifa', 'S. Nazeer', 'm', '0987654321', '0812348526', 'Nawalapitiya', '1982-07-14', 'Teacher', 'f', 0, NULL),
(9, 17, 'Milroy', 'M.K Steve', 'g', '0776655443', '0812348526', 'peradeniya kandy', '1944-12-08', 'Doctor Rtd', 'm', 0, NULL),
(10, 18, 'suren', 's.K.Sivakumar', 'f', '0776655443', '0812348526', 'No2, Kalniya ,colombo', '1966-07-14', 'Businessmen', 'm', 1, NULL),
(11, 19, 'Sampath', 'Perera', 'f', '0776655443', '0116544554', 'galadenita,gampha', '1977-07-17', 'accountant', 'm', 0, NULL),
(12, 21, 'Sumith', 'S.K. Peries', 'f', '1234567890', '1234567890', '72 Warbler Drive\nSachs\n39 Sunfield Street', '1980-10-23', 'Doctor', 'm', 1, NULL),
(13, 40, 'kjkjjkjkjjij', 'pkkpkklklklkpkl', 'f', '0766663414', '0717863426', 'tuighjfgdhgfcvhj kjhjhgkjklhj ', '1986-10-15', 'Police', 'm', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
`id` int(11) NOT NULL,
  `house_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `inbox_conversations`
--

CREATE TABLE IF NOT EXISTS `inbox_conversations` (
`conversation_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `sender_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `receiver_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL,
  `last_updated_time` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `inbox_conversations`
--

INSERT INTO `inbox_conversations` (`conversation_id`, `sender_id`, `receiver_id`, `subject`, `sender_deleted`, `receiver_deleted`, `created_time`, `last_updated_time`) VALUES
(9, 1, 37, 'Test', 0, 0, '2015-10-11 13:20:37', '2015-10-11 13:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `inbox_messages`
--

CREATE TABLE IF NOT EXISTS `inbox_messages` (
`message_id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `created_time` datetime NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `read_time` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `inbox_messages`
--

INSERT INTO `inbox_messages` (`message_id`, `conversation_id`, `created_time`, `sender_id`, `receiver_id`, `content`, `is_read`, `read_time`) VALUES
(13, 9, '2015-10-11 13:20:37', 1, 37, 'Test message', 1, NULL),
(14, 9, '2015-10-11 13:22:45', 37, 1, 'Got it', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_status`
--

CREATE TABLE IF NOT EXISTS `leave_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_status`
--

INSERT INTO `leave_status` (`id`, `status`) VALUES
(0, 'Pending'),
(1, 'Approved'),
(2, 'Rejected');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE IF NOT EXISTS `leave_types` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `max_leave_count` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `name`, `max_leave_count`) VALUES
(1, 'Casual', 20),
(2, 'Medical', 21),
(3, 'Duty', 0),
(4, 'Other', 0),
(5, 'Maternity', 84);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `user_fullname` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `pro_img` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `user_id`, `title`, `content`, `user_fullname`, `created_at`, `updated_at`, `pro_img`) VALUES
(3, 1, NULL, 'Publish a news', 'hello sajja', '2015-08-27 13:07:44', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(4, 1, NULL, 'Publish a news', 'hello sajja', '2015-08-30 17:45:03', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(5, 1, NULL, 'Publish a news', 'hello sajja', '2015-08-30 17:46:20', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(19, 1, NULL, 'Generate section teacher reports', 'Sajith Sudharshana', '2015-09-05 19:34:08', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(39, 2, NULL, 'Apply a leave', 'Hiroshani Kaushalya', '2015-09-06 16:36:08', NULL, 'http://localhost/sep-testmerge/uploads/Chrysanthemum2.jpg'),
(40, 2, NULL, 'Create new event', 'Hiroshani Kaushalya', '2015-09-06 16:36:41', NULL, 'http://localhost/sep-testmerge/uploads/Chrysanthemum2.jpg'),
(41, 1, NULL, 'Generate personal teacher reports', 'Sajith Sudharshana', '2015-09-06 18:53:09', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(42, 1, NULL, 'Generate section teacher reports', 'Sajith Sudharshana', '2015-09-06 18:54:20', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(43, 1, NULL, 'Update a news', 'Sajith Sudharshana', '2015-09-06 15:25:20', NULL, 'http://localhost/sep-testmerge/uploads/Desert.jpg'),
(44, 29, NULL, 'Apply a leave', 'Mahesh Udara Denipitiya', '2015-10-13 06:52:08', NULL, 'http://localhost/sep/uploads/'),
(45, 1, NULL, 'Approved the event', '', '2015-10-13 03:26:18', NULL, ''),
(46, 1, NULL, 'Approved the event', '', '2015-10-13 03:26:45', NULL, ''),
(47, 1, NULL, 'Publish a news', '', '2015-10-13 06:57:56', NULL, ''),
(48, 1, NULL, 'Approved the event', '', '2015-10-13 08:03:54', NULL, ''),
(49, 1, NULL, 'Approved the event', '', '2015-10-13 08:04:00', NULL, ''),
(50, 1, NULL, 'Generate sectionwise teacher report', 'Ecole', '2015-10-17 11:37:27', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png'),
(51, 1, NULL, 'Approve the leave', 'Ecole', '2015-10-17 08:08:06', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png'),
(52, 1, NULL, 'Publish a news', 'Ecole', '2015-10-17 11:38:32', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png'),
(53, 1, NULL, 'Approved the event', 'Ecole', '2015-10-17 08:08:48', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png'),
(54, 29, NULL, 'Published approved event', '', '2015-10-17 11:40:07', NULL, ''),
(55, 1, NULL, 'Insert a new student', 'Ecole', '2015-10-17 08:22:59', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png'),
(56, 1, NULL, 'Insert a new student', 'Ecole', '2015-10-17 08:24:02', NULL, 'http://udara.info/sep/uploads/Teacher-male2.png');

-- --------------------------------------------------------

--
-- Table structure for table `news_field`
--

CREATE TABLE IF NOT EXISTS `news_field` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `create_at` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `news_field`
--

INSERT INTO `news_field` (`id`, `name`, `description`, `create_at`) VALUES
(1, 'For the vacation', 'All students have to come on poya day to the school main auditorium ', '2015-08-29 06:20:30'),
(3, 'Attempting to the shramadhana', 'All students and stuff members have to participate that event', '2015-08-29 08:29:27'),
(5, 'English Day', 'English day is held on 31st October 2015 at school auditorium starting 7.00 a.m', '2015-08-29 16:18:34'),
(9, 'For a seminar', 'most probably it will held on next week. Keep in touch', '2015-09-04 19:18:27'),
(10, 'English Day festival', 'It will be held on next Thursday. So all students have to participate this', '2015-09-05 13:03:16'),
(11, 'Some test news', 'I am just testing it', '2015-10-13 06:57:56'),
(12, 'Some test news', 'Some test news', '2015-10-17 11:38:32');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
`id` int(11) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `head_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `short_leave_types`
--

CREATE TABLE IF NOT EXISTS `short_leave_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `short_leave_types`
--

INSERT INTO `short_leave_types` (`id`, `name`) VALUES
(1, 'Short Leave'),
(2, 'Half Day');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance`
--

CREATE TABLE IF NOT EXISTS `student_attendance` (
`id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `marked_by` int(11) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `student_attendance`
--

INSERT INTO `student_attendance` (`id`, `student_id`, `marked_by`, `is_present`, `date`, `date_created`) VALUES
(39, 21, 1, 1, '2015-09-05', '2015-09-05 03:52:00'),
(40, 22, 1, 0, '2015-09-05', '2015-09-05 03:52:01'),
(41, 23, 1, 1, '2015-09-05', '2015-09-05 03:52:01'),
(42, 21, 1, 0, '2015-08-05', '2015-09-05 06:26:38'),
(43, 22, 1, 1, '2015-08-05', '2015-09-05 06:26:38'),
(44, 23, 1, 0, '2015-08-05', '2015-09-05 06:26:39'),
(45, 22, 1, 0, '2015-09-04', '2015-09-05 06:26:55'),
(46, 23, 1, 1, '2015-09-04', '2015-09-05 06:26:55'),
(47, 21, 1, 0, '2015-09-04', '2015-09-05 06:26:56'),
(48, 22, 1, 0, '2015-09-06', '2015-09-06 00:54:16'),
(49, 23, 1, 0, '2015-09-06', '2015-09-06 00:54:17'),
(50, 22, 1, 0, '2015-08-06', '2015-09-06 01:02:06'),
(51, 23, 1, 1, '2015-08-06', '2015-09-06 01:02:06'),
(52, 22, 1, 1, '2015-09-01', '2015-09-06 01:04:10'),
(53, 23, 1, 1, '2015-09-01', '2015-09-06 01:04:10'),
(54, 22, 1, 0, '2015-04-06', '2015-09-06 01:04:26'),
(55, 23, 1, 0, '2015-04-06', '2015-09-06 01:04:26'),
(56, 22, 1, 0, '2014-09-06', '2015-09-06 04:04:36'),
(57, 23, 1, 0, '2014-09-06', '2015-09-06 04:04:36'),
(58, 22, 1, 0, '2014-09-05', '2015-09-06 05:00:48'),
(59, 27, 1, 1, '2014-09-05', '2015-09-06 05:00:48'),
(60, 29, 1, 0, '2014-09-05', '2015-09-06 05:00:48'),
(61, 23, 1, 1, '2014-09-05', '2015-09-06 05:00:48'),
(62, 25, 1, 1, '2014-09-05', '2015-09-06 05:00:48'),
(63, 28, 1, 1, '2014-09-05', '2015-09-06 05:00:48'),
(64, 22, 1, 0, '2015-09-03', '2015-09-06 08:02:39'),
(65, 23, 1, 0, '2015-09-03', '2015-09-06 08:02:39'),
(66, 25, 1, 1, '2015-09-03', '2015-09-06 08:02:39'),
(67, 27, 1, 1, '2015-09-03', '2015-09-06 08:02:40'),
(68, 28, 1, 1, '2015-09-03', '2015-09-06 08:02:40'),
(69, 29, 1, 1, '2015-09-03', '2015-09-06 08:02:40'),
(70, 30, 1, 1, '2015-09-03', '2015-09-06 08:02:40'),
(71, 31, 1, 1, '2015-09-03', '2015-09-06 08:02:40'),
(72, 4, 1, 0, '2015-10-17', '2015-10-17 06:17:29'),
(73, 13, 1, 0, '2015-10-17', '2015-10-17 06:17:29'),
(74, 1, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(75, 2, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(76, 3, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(77, 5, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(78, 6, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(79, 7, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(80, 8, 1, 1, '2015-10-17', '2015-10-17 06:17:29'),
(81, 9, 1, 1, '2015-10-17', '2015-10-17 06:17:30'),
(82, 10, 1, 1, '2015-10-17', '2015-10-17 06:17:30'),
(83, 11, 1, 1, '2015-10-17', '2015-10-17 06:17:30'),
(84, 12, 1, 1, '2015-10-17', '2015-10-17 06:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendance_log`
--

CREATE TABLE IF NOT EXISTS `student_attendance_log` (
`id` int(11) NOT NULL,
  `class` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `student_attendance_log`
--

INSERT INTO `student_attendance_log` (`id`, `class`, `date`, `date_created`) VALUES
(16, 0, '2015-09-05', '2015-09-05 03:52:01'),
(17, 0, '2015-08-05', '2015-09-05 06:26:39'),
(18, 0, '2015-09-04', '2015-09-05 06:26:56'),
(19, 0, '2015-09-06', '2015-09-06 00:54:17'),
(20, 0, '2015-08-06', '2015-09-06 01:02:06'),
(21, 0, '2015-09-01', '2015-09-06 01:04:10'),
(22, 0, '2015-04-06', '2015-09-06 01:04:26'),
(23, 0, '2014-09-06', '2015-09-06 04:04:36'),
(24, 0, '2014-09-05', '2015-09-06 05:00:48'),
(25, 0, '2015-09-03', '2015-09-06 08:02:40'),
(26, 0, '2015-10-17', '2015-10-17 06:17:30');

-- --------------------------------------------------------

--
-- Table structure for table `student_class`
--

CREATE TABLE IF NOT EXISTS `student_class` (
`id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admission_no` varchar(255) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `nic_no` varchar(10) DEFAULT NULL,
  `language` varchar(1) DEFAULT NULL,
  `religion` varchar(3) DEFAULT NULL,
  `permanent_addr` varchar(512) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_data` mediumblob,
  `batch` int(11) DEFAULT NULL COMMENT 'batchid',
  `class` int(11) DEFAULT NULL COMMENT 'classid'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `admission_no`, `admission_date`, `full_name`, `name_with_initials`, `dob`, `gender`, `nic_no`, `language`, `religion`, `permanent_addr`, `contact_home`, `email`, `house_id`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_data`, `batch`, `class`) VALUES
(1, 9, '1234', '2004-07-12', 'Kokila Anuradha', 'S.P. K. Anuradha', '1998-07-12', 'M', '', 's', '1', '266/8 Kohomban Watta,\nHapugala, Malabe', '0114567890', '', 1, '2015-07-12 18:21:44', NULL, NULL, NULL, NULL, 3, 13),
(2, 10, '7536', '2015-07-06', 'Madura Bandara', 'M.K.L. Bandara', '1998-07-14', 'M', '', 's', '1', 'No 2,kandy rd,peradeniya', '0812348526', 'Madura@gmail.com', 1, '2015-07-12 18:44:30', NULL, NULL, NULL, NULL, NULL, 7),
(3, 11, '7537', '2015-07-07', 'Sanuka Perera', 'S.K Perara', '1996-07-16', 'M', '', 'e', '4', 'No 6 Daisy villa ave,Colombo4', '0716544554', 'Sanuka@gmail.com', 2, '2015-07-12 18:47:46', NULL, NULL, NULL, NULL, NULL, 7),
(4, 12, '7538', '2015-07-07', 'Dhanuja Gunarathna', 'D.I. unarathna', '1995-07-03', 'M', '', 'e', '1', 'N0 188,Rajagiriya colombo', '0786745321', 'daraka@gmail.com', 1, '2015-07-12 18:50:52', NULL, NULL, NULL, NULL, 3, 7),
(5, 13, '7539', '2015-07-13', 'Sujeewa Peiris', 'S.D Peiris', '1997-07-09', 'M', '', 's', '1', 'no 4 Rathmalana ,Colombo', '0114567890', 'Sujeewa@gmail.com', 1, '2015-07-12 18:55:32', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 14, '7540', '2015-07-01', 'Sahan Palihakkara', 'S.D Palihakkara', '1997-07-01', 'M', '', 'e', '5', '123 Nawala Rd,Rajagiriya', '0812348526', '', 3, '2015-07-12 18:58:47', NULL, NULL, NULL, NULL, NULL, 13),
(7, 15, '7541', '2015-07-08', 'Srikanth Nadaraja', 'S Nadaraja', '1996-12-13', 'M', '', 't', '2', 'Handala Wattala', '0118976754', 'Srik@gmil.info', 2, '2015-07-12 19:02:00', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 16, '7766', '2015-07-07', 'Amjad Nazeer', 'A.Nazeer', '1997-07-14', 'M', '', 'e', '3', '45.Main street,Nawalapitiya', '0812348526', 'Amjad@gmail.com', 2, '2015-07-12 19:17:51', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 17, '7885', '2015-07-14', 'Stefan  Steve', 'S.R Steve', '1997-12-08', 'M', '', 'e', '4', 'peradeniya Kandy', '0812348526', 'Asfr@gmail.com', 3, '2015-07-12 19:20:54', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 18, '6767', '2015-07-13', 'Arjun Sivakumar', 'A.K.Sivakumar', '1996-07-14', 'M', '', 't', '2', 'No 2 ,Kalaniya , colombo', '0786745321', 'daraka@gmail.com', 2, '2015-07-12 19:23:27', NULL, NULL, NULL, NULL, NULL, 9),
(11, 19, '7777', '2015-07-06', 'Niresh Perera', 'N.M N perera', '1996-07-17', 'M', '', 's', '1', 'Galadeniya ,agampha', '0812348544', 'nirash@info.com', 1, '2015-07-12 19:25:45', NULL, NULL, NULL, NULL, NULL, 9),
(12, 21, '6768', '2005-07-13', 'Pasindu Peries', 'P.D.S. Peries', '1998-10-23', 'M', '', 'e', '5', '72 Warbler Drive\nSachs\n39 Sunfield Street', '', 'pdsperies@gmail.com', 4, '2015-07-13 03:59:59', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 32, '2344', '2015-07-13', 'Anura Perera', 'A.Perea', '1997-07-12', 'M', '', 's', '1', 'Malabe,Colombo', '0755056435', 'akila@gmail.com', 2, '2015-07-13 10:31:55', NULL, NULL, NULL, NULL, 2, 9),
(14, 38, '1235', '2015-10-17', 'Udara  Karunarathna', 'U.P.D. Karunarathna', '1998-10-09', 'M', '', 's', '1', '72 Warbler Drive\r\nClove\r\n39 Sunfield Street', '0717863426', 'udarapathmin@gmail.com', 1, '2015-10-17 08:22:59', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 39, '1238', '2015-10-21', 'Udara Pathminda', 'U.P.D. Karunarathna', '1998-10-29', 'M', '', 's', '1', '72 Warbler Drive\r\nSachs\r\n39 Sunfield Street', '0717863426', 'udarapathmin@gmail.com', 0, '2015-10-17 08:24:01', NULL, NULL, NULL, NULL, NULL, NULL),
(16, 40, '6534 ', '2015-10-17', 'ssssss  ssssss ', 'ssssssssss ', '1996-10-15', 'M', '921722125V', 's', '1 ', 'dasdadwdsadsdwdsdwc ', '0112757039 ', 'ssudaraka@gmail.com ', 2, '2015-10-17 08:31:29', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
`id` int(11) NOT NULL,
  `subject_name` varchar(120) DEFAULT NULL,
  `subject_code` varchar(120) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `subject_incharge_id` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `subject_code`, `section_id`, `subject_incharge_id`) VALUES
(1, 'English', 'S001', NULL, NULL),
(2, 'Mathematics', 'S002', NULL, NULL),
(3, 'Science', 'S003', NULL, NULL),
(4, 'Buddhism', 'S004', NULL, NULL),
(5, 'History', 'S005', NULL, NULL),
(6, 'Pure Maths', 'AL001', NULL, NULL),
(7, 'Applied Maths', 'AL002', NULL, NULL),
(8, 'Chemistry', 'AL003', NULL, NULL),
(9, 'Physics', 'AL004', NULL, NULL),
(10, 'Biology', 'AL005', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_config`
--

CREATE TABLE IF NOT EXISTS `system_config` (
  `is_strong_password` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_config`
--

INSERT INTO `system_config` (`is_strong_password`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendance`
--

CREATE TABLE IF NOT EXISTS `teacher_attendance` (
  `teacher_id` int(11) NOT NULL,
  `signature_no` int(11) NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_attendance`
--

INSERT INTO `teacher_attendance` (`teacher_id`, `signature_no`, `is_present`, `date`) VALUES
(1, 1, 1, '2015-07-12'),
(1, 1, 1, '2015-07-13'),
(2, 2, 1, '2015-07-12'),
(2, 2, 1, '2015-07-13'),
(3, 3, 0, '2015-07-12'),
(3, 3, 0, '2015-07-13'),
(4, 4, 0, '2015-07-12'),
(4, 4, 0, '2015-07-13'),
(5, 5, 0, '2015-07-12'),
(5, 5, 0, '2015-07-13'),
(6, 6, 0, '2015-07-12'),
(6, 6, 0, '2015-07-13'),
(7, 7, 0, '2015-07-12'),
(7, 7, 0, '2015-07-13'),
(8, 8, 0, '2015-07-13'),
(9, 9, 0, '2015-07-13'),
(10, 10, 0, '2015-07-13'),
(11, 11, 0, '2015-07-13'),
(12, 12, 0, '2015-07-13'),
(13, 13, 0, '2015-07-13'),
(14, 14, 0, '2015-07-13'),
(16, 15, 0, '2015-07-13'),
(17, 16, 0, '2015-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
`id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `signature_no` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `serial_no` varchar(10) DEFAULT NULL,
  `personal_file_no` varchar(20) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `name_with_initials` varchar(255) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `section` int(11) DEFAULT NULL,
  `teacher_register_no` varchar(30) DEFAULT NULL,
  `nic_no` varchar(10) DEFAULT NULL,
  `permanent_addr` varchar(512) DEFAULT NULL,
  `wnop_no` varchar(20) DEFAULT NULL,
  `service` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `nature_of_appointment` varchar(40) DEFAULT NULL,
  `main_subject_id` int(11) DEFAULT NULL,
  `medium` char(1) DEFAULT NULL,
  `first_appointment_date` date DEFAULT NULL,
  `contact_mobile` varchar(15) DEFAULT NULL,
  `contact_home` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `civil_status` char(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_file_name` varchar(255) DEFAULT NULL,
  `photo_content_type` varchar(255) DEFAULT NULL,
  `photo_data` mediumblob,
  `religion_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `educational_qualific` text,
  `professional_qualific` text,
  `promotions` text,
  `increment_date` date DEFAULT NULL,
  `duty_assume_date` date DEFAULT NULL,
  `pension_date` date DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `signature_no`, `email`, `serial_no`, `personal_file_no`, `full_name`, `name_with_initials`, `gender`, `section`, `teacher_register_no`, `nic_no`, `permanent_addr`, `wnop_no`, `service`, `grade`, `nature_of_appointment`, `main_subject_id`, `medium`, `first_appointment_date`, `contact_mobile`, `contact_home`, `dob`, `remarks`, `civil_status`, `created_at`, `updated_at`, `photo_file_name`, `photo_content_type`, `photo_data`, `religion_id`, `nationality_id`, `designation_id`, `educational_qualific`, `professional_qualific`, `promotions`, `increment_date`, `duty_assume_date`, `pension_date`, `joined_date`) VALUES
(1, 34, '123', 'rishysr@gmail.com', '74185', '', 'Anton Dias Karunarathna', 'A. D. Karunarathna', 'm', 3, '789456', '909895701V', '56/A Nawam Mawawtha, Kandy', '1', NULL, 11, '1', 0, 's', '0000-00-00', '0717863444', '0717863444', '1990-09-30', NULL, 's', '2015-09-06 04:45:28', NULL, 'http://localhost/sep/uploads/', NULL, NULL, 1, 1, 7, '', '', NULL, NULL, NULL, '0000-00-00', '2015-01-01'),
(2, 35, '124', 'rishysr@gmail.com', '01236', '', 'Kaveesha Gamage', 'K. Gamage', 'm', 4, '04365', '571900955V', '41 Lien Parkway', '1', NULL, 11, '2', 8, 's', '0000-00-00', '0777564263', '0717863444', '1980-12-12', NULL, 's', '2015-09-06 04:48:00', NULL, 'http://localhost/sep/uploads/', NULL, NULL, 1, 1, 7, '', '', NULL, NULL, NULL, '0000-00-00', '2008-09-30'),
(3, 29, '007', 'udarapath@gmail.com', '50324', '', 'Mahesh Udara Denipitiya', 'M.U. Denipitiya', 'm', 5, '36524', '708565412V', '266/ Kohomban watta', '1', NULL, 10, '2', 9, 's', '0000-00-00', '0717863444', '0717863444', '1970-11-20', NULL, 'm', '2015-09-06 05:12:21', NULL, 'http://localhost/sep/uploads/', NULL, NULL, 1, 1, 7, '', '', NULL, NULL, NULL, '0000-00-00', '2013-09-06');

-- --------------------------------------------------------

--
-- Table structure for table `temp_teacher_attendance`
--

CREATE TABLE IF NOT EXISTS `temp_teacher_attendance` (
  `teacher_id` int(11) NOT NULL,
  `signature_no` int(11) NOT NULL,
  `is_present` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timetable_slot`
--

CREATE TABLE IF NOT EXISTS `timetable_slot` (
  `timetable_id` int(11) NOT NULL,
  `slot_id` char(3) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_slot`
--

INSERT INTO `timetable_slot` (`timetable_id`, `slot_id`, `teacher_id`, `subject_id`, `year`) VALUES
(4, 'MO1', 3, 4, 1990);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_type` char(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `profile_img` text,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` int(11) NOT NULL,
  `superuser` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `user_type`, `created_at`, `email`, `profile_img`, `lastvisit_at`, `active`, `superuser`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Ecole', 'Administrator', 'A', '2015-07-12 00:00:00', 'udarapathmin@gmail.com', 'http://udara.info/sep/uploads/Teacher-male2.png', '2016-02-26 23:08:04', 1, 1),
(2, 'warunithe', '7b405a6df41056707df2b694c8f21d91', NULL, NULL, 'T', '2015-07-12 17:28:35', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(3, 'dgego', 'b9c5b873aeb025d30915719f295c9648', NULL, NULL, 'T', '2015-07-12 17:37:53', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(4, 'skmaname', '14287f996c966a854148f05324c77a6a', NULL, NULL, 'T', '2015-07-12 17:42:08', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(5, 'rswije', '977897b99e527f2de03ce7cfbba868de', NULL, NULL, 'T', '2015-07-12 17:46:30', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(6, 'gamlathwije', 'ec049662289aedf02d86aa748f43bd36', NULL, NULL, 'T', '2015-07-12 17:51:42', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(7, 'sanduni', '39e1d1262c8c2d144b49a0534aa1713c', NULL, NULL, 'T', '2015-07-13 02:41:10', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(8, 'senarathara', 'b1557a0a00c3079591ad493c415b52ce', NULL, NULL, 'T', '2015-07-12 18:14:45', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(9, '1234', 'a830cb6f949004f454dd2355c2923753', NULL, NULL, 'S', '2015-07-12 18:21:44', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(10, '7536', '36393a1ab2a9ba34820961720ea29069', NULL, NULL, 'S', '2015-07-12 18:44:30', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(11, '7537', 'f25a5e7178a690c30f2cac56d8ae1714', NULL, NULL, 'S', '2015-07-12 18:47:46', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(12, '7538', '2148dff2b77cde2681af957f0a70dee0', NULL, NULL, 'S', '2015-07-12 18:50:52', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(13, '7539', '53899b3a2564cecf84bbda85a26ad140', NULL, NULL, 'S', '2015-07-12 18:55:32', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(14, '7540', 'b9b7807c1e8cdba4890a4619e370d926', NULL, NULL, 'S', '2015-07-12 18:58:47', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(15, '7541', 'd5c0a72caf6ce75a3be63980bb78cbd3', NULL, NULL, 'S', '2015-07-12 19:02:00', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(16, '7766', 'be398081c0802042adcaef7062d3d034', NULL, NULL, 'S', '2015-07-12 19:17:51', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(17, '7885', 'b4bcf8c1c5132994b96d84b881887727', NULL, NULL, 'S', '2015-07-12 19:20:54', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(18, '6767', '3b1a22b92a9ff07cfd16543d0b75ac4c', NULL, NULL, 'S', '2015-07-12 19:23:27', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(19, '7777', 'e38b5bf8292a8e406d9452f11e58bd61', NULL, NULL, 'S', '2015-07-12 19:25:45', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(20, 'mahesh.ud', 'a656b2ec935c1aae96352e740c5a2e53', NULL, NULL, 'T', '2015-07-13 03:40:19', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(21, '6768', '35ea97aa48d86d986a3598a5fa4ce42a', NULL, NULL, 'S', '2015-07-13 03:59:59', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(22, 'antonk', 'a2cdd018f8b7ccc909d9b471742d9a7a', NULL, NULL, 'T', '2015-07-13 04:07:48', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(23, 'agalawatta', 'e1a379cc8c09d7d716103eebbe5fae0d', NULL, NULL, 'T', '2015-07-13 04:11:20', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(24, 'mkm.mendis', 'cd1b764bf89b5d3768d0806fe3e7182e', NULL, NULL, 'T', '2015-07-13 04:16:58', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(25, 'd.nimanthika', '9b4cda8811cab37f04064f222338d0ea', NULL, NULL, 'T', '2015-07-13 04:24:12', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(26, 'dharmasena.ms', '6203b16fd2fd0e6e73373baac976b780', NULL, NULL, 'T', '2015-07-13 04:48:56', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(27, 'ppoornika87', '409a6454912f142dd8eecffee1a2ee4c', NULL, NULL, 'T', '2015-07-13 04:52:30', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(28, 'damien715', '7fb198aebd1af80137842c57e79f8014', NULL, NULL, 'T', '2015-07-13 04:57:34', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(29, 'teacher', '8d788385431273d11e8b43bb78f3aa41', NULL, NULL, 'T', '2015-07-13 09:31:30', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(31, 'Thilina', 'f493a9f67e30d38221c0387b5fdca2e8', NULL, NULL, 'T', '2015-07-13 10:19:24', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(32, '2344', 'e1a015f3021dbf496e7e0f70e417a7ce', NULL, NULL, 'S', '2015-07-13 10:31:55', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(33, 'dataop', 'ac6e93db73efcfe018914ff307d159a4', 'System', 'Operator', 'A', NULL, 'no-email@gmail.com', NULL, '0000-00-00 00:00:00', 0, 1),
(34, 'antonkaru', '8d788385431273d11e8b43bb78f3aa41', NULL, NULL, 'T', '2015-09-06 04:46:03', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(35, 'kgamage', '8d788385431273d11e8b43bb78f3aa41', NULL, NULL, 'T', '2015-09-06 04:48:10', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(36, 'maheshdeni', '8d788385431273d11e8b43bb78f3aa41', NULL, NULL, 'T', '2015-09-06 05:12:43', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(37, 'ssudaraka', 'e061e395765b7a5fc62eba37e9bf58da', 'Supun', 'Suda', 'A', '2015-10-11 13:18:04', 'ssudaraka123@gmail.com', '', '0000-00-00 00:00:00', 0, 1),
(38, '1235', 'c2d43e6914f481c03dd16ddb52e79aba', '', '', 'S', '2015-10-17 08:22:59', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(39, '1238', '2792ab6f24d46f15973a4eb9a9d2c60d', '', '', 'S', '2015-10-17 08:24:02', NULL, NULL, '0000-00-00 00:00:00', 0, 0),
(40, '6534 ', 'f73d7c051db0086abc448ce5a5095d28', 'ssssss ', 'ssssss ', 'S', '2015-10-17 08:31:29', NULL, NULL, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `year_plan`
--

CREATE TABLE IF NOT EXISTS `year_plan` (
`id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1 - Active 0 - Inactive',
  `t1_start_date` date NOT NULL,
  `t1_end_date` date NOT NULL,
  `t2_start_date` date NOT NULL,
  `t2_end_date` date NOT NULL,
  `t3_start_date` date NOT NULL,
  `t3_end_date` date NOT NULL,
  `structure` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `year_plan`
--

INSERT INTO `year_plan` (`id`, `name`, `start_date`, `end_date`, `status`, `t1_start_date`, `t1_end_date`, `t2_start_date`, `t2_end_date`, `t3_start_date`, `t3_end_date`, `structure`) VALUES
(0, 'Other', '2099-01-01', '2099-01-01', 0, '2099-01-01', '2099-01-01', '2099-01-01', '2099-01-01', '2099-01-01', '2099-01-01', NULL),
(1, 'AY2015', '2015-01-01', '2015-12-31', 1, '2015-01-05', '2015-04-03', '2015-04-20', '2015-08-07', '2015-09-06', '2015-12-04', '2015-01-01=1, 2015-01-02=1, 2015-01-03=1, 2015-01-04=1, 2015-01-05=0, 2015-01-06=0, 2015-01-07=0, 2015-01-08=0, 2015-01-09=0, 2015-01-10=1, 2015-01-11=1, 2015-01-12=0, 2015-01-13=0, 2015-01-14=0, 2015-01-15=0, 2015-01-16=0, 2015-01-17=1, 2015-01-18=1, 2015-01-19=0, 2015-01-20=0, 2015-01-21=0, 2015-01-22=0, 2015-01-23=0, 2015-01-24=1, 2015-01-25=1, 2015-01-26=0, 2015-01-27=0, 2015-01-28=0, 2015-01-29=0, 2015-01-30=0, 2015-01-31=1, 2015-02-01=1, 2015-02-02=0, 2015-02-03=0, 2015-02-04=0, 2015-02-05=0, 2015-02-06=0, 2015-02-07=1, 2015-02-08=1, 2015-02-09=0, 2015-02-10=0, 2015-02-11=0, 2015-02-12=0, 2015-02-13=0, 2015-02-14=1, 2015-02-15=1, 2015-02-16=0, 2015-02-17=0, 2015-02-18=0, 2015-02-19=0, 2015-02-20=0, 2015-02-21=1, 2015-02-22=1, 2015-02-23=0, 2015-02-24=0, 2015-02-25=0, 2015-02-26=0, 2015-02-27=0, 2015-02-28=1, 2015-03-01=1, 2015-03-02=0, 2015-03-03=0, 2015-03-04=0, 2015-03-05=0, 2015-03-06=0, 2015-03-07=1, 2015-03-08=1, 2015-03-09=0, 2015-03-10=0, 2015-03-11=0, 2015-03-12=0, 2015-03-13=0, 2015-03-14=1, 2015-03-15=1, 2015-03-16=0, 2015-03-17=0, 2015-03-18=0, 2015-03-19=0, 2015-03-20=0, 2015-03-21=1, 2015-03-22=1, 2015-03-23=0, 2015-03-24=0, 2015-03-25=0, 2015-03-26=0, 2015-03-27=0, 2015-03-28=1, 2015-03-29=1, 2015-03-30=0, 2015-03-31=0, 2015-04-01=0, 2015-04-02=0, 2015-04-03=0, 2015-04-04=1, 2015-04-05=1, 2015-04-06=1, 2015-04-07=1, 2015-04-08=1, 2015-04-09=1, 2015-04-10=1, 2015-04-11=1, 2015-04-12=1, 2015-04-13=1, 2015-04-14=1, 2015-04-15=1, 2015-04-16=1, 2015-04-17=1, 2015-04-18=1, 2015-04-19=1, 2015-04-20=0, 2015-04-21=0, 2015-04-22=0, 2015-04-23=0, 2015-04-24=0, 2015-04-25=1, 2015-04-26=1, 2015-04-27=0, 2015-04-28=0, 2015-04-29=0, 2015-04-30=0, 2015-05-01=0, 2015-05-02=1, 2015-05-03=1, 2015-05-04=0, 2015-05-05=0, 2015-05-06=0, 2015-05-07=0, 2015-05-08=0, 2015-05-09=1, 2015-05-10=1, 2015-05-11=0, 2015-05-12=0, 2015-05-13=0, 2015-05-14=0, 2015-05-15=0, 2015-05-16=1, 2015-05-17=1, 2015-05-18=0, 2015-05-19=0, 2015-05-20=0, 2015-05-21=0, 2015-05-22=0, 2015-05-23=1, 2015-05-24=1, 2015-05-25=0, 2015-05-26=0, 2015-05-27=0, 2015-05-28=0, 2015-05-29=0, 2015-05-30=1, 2015-05-31=1, 2015-06-01=0, 2015-06-02=0, 2015-06-03=0, 2015-06-04=0, 2015-06-05=0, 2015-06-06=1, 2015-06-07=1, 2015-06-08=0, 2015-06-09=0, 2015-06-10=0, 2015-06-11=0, 2015-06-12=0, 2015-06-13=1, 2015-06-14=1, 2015-06-15=0, 2015-06-16=0, 2015-06-17=0, 2015-06-18=0, 2015-06-19=0, 2015-06-20=1, 2015-06-21=1, 2015-06-22=0, 2015-06-23=0, 2015-06-24=0, 2015-06-25=0, 2015-06-26=0, 2015-06-27=1, 2015-06-28=1, 2015-06-29=0, 2015-06-30=0, 2015-07-01=0, 2015-07-02=0, 2015-07-03=0, 2015-07-04=1, 2015-07-05=1, 2015-07-06=0, 2015-07-07=0, 2015-07-08=0, 2015-07-09=0, 2015-07-10=0, 2015-07-11=1, 2015-07-12=1, 2015-07-13=0, 2015-07-14=0, 2015-07-15=0, 2015-07-16=0, 2015-07-17=0, 2015-07-18=3, 2015-07-19=1, 2015-07-20=0, 2015-07-21=0, 2015-07-22=0, 2015-07-23=0, 2015-07-24=0, 2015-07-25=1, 2015-07-26=1, 2015-07-27=0, 2015-07-28=0, 2015-07-29=0, 2015-07-30=0, 2015-07-31=2, 2015-08-01=1, 2015-08-02=1, 2015-08-03=0, 2015-08-04=0, 2015-08-05=0, 2015-08-06=0, 2015-08-07=0, 2015-08-08=1, 2015-08-09=1, 2015-08-10=1, 2015-08-11=1, 2015-08-12=1, 2015-08-13=1, 2015-08-14=1, 2015-08-15=1, 2015-08-16=1, 2015-08-17=1, 2015-08-18=1, 2015-08-19=1, 2015-08-20=1, 2015-08-21=1, 2015-08-22=1, 2015-08-23=1, 2015-08-24=1, 2015-08-25=1, 2015-08-26=1, 2015-08-27=1, 2015-08-28=1, 2015-08-29=2, 2015-08-30=1, 2015-08-31=1, 2015-09-01=1, 2015-09-02=1, 2015-09-03=1, 2015-09-04=1, 2015-09-05=1, 2015-09-06=1, 2015-09-07=0, 2015-09-08=0, 2015-09-09=0, 2015-09-10=0, 2015-09-11=0, 2015-09-12=1, 2015-09-13=1, 2015-09-14=0, 2015-09-15=0, 2015-09-16=0, 2015-09-17=0, 2015-09-18=0, 2015-09-19=1, 2015-09-20=1, 2015-09-21=0, 2015-09-22=0, 2015-09-23=3, 2015-09-24=0, 2015-09-25=0, 2015-09-26=1, 2015-09-27=2, 2015-09-28=0, 2015-09-29=0, 2015-09-30=0, 2015-10-01=0, 2015-10-02=0, 2015-10-03=1, 2015-10-04=1, 2015-10-05=0, 2015-10-06=0, 2015-10-07=0, 2015-10-08=0, 2015-10-09=0, 2015-10-10=1, 2015-10-11=1, 2015-10-12=0, 2015-10-13=0, 2015-10-14=0, 2015-10-15=0, 2015-10-16=0, 2015-10-17=1, 2015-10-18=1, 2015-10-19=0, 2015-10-20=0, 2015-10-21=0, 2015-10-22=0, 2015-10-23=0, 2015-10-24=1, 2015-10-25=1, 2015-10-26=0, 2015-10-27=2, 2015-10-28=0, 2015-10-29=0, 2015-10-30=0, 2015-10-31=1, 2015-11-01=1, 2015-11-02=0, 2015-11-03=0, 2015-11-04=0, 2015-11-05=0, 2015-11-06=0, 2015-11-07=1, 2015-11-08=1, 2015-11-09=0, 2015-11-10=0, 2015-11-11=3, 2015-11-12=0, 2015-11-13=0, 2015-11-14=1, 2015-11-15=1, 2015-11-16=0, 2015-11-17=0, 2015-11-18=0, 2015-11-19=0, 2015-11-20=0, 2015-11-21=1, 2015-11-22=1, 2015-11-23=0, 2015-11-24=0, 2015-11-25=2, 2015-11-26=0, 2015-11-27=0, 2015-11-28=1, 2015-11-29=1, 2015-11-30=0, 2015-12-01=0, 2015-12-02=0, 2015-12-03=0, 2015-12-04=0, 2015-12-05=1, 2015-12-06=1, 2015-12-07=1, 2015-12-08=1, 2015-12-09=1, 2015-12-10=1, 2015-12-11=1, 2015-12-12=1, 2015-12-13=1, 2015-12-14=1, 2015-12-15=1, 2015-12-16=1, 2015-12-17=1, 2015-12-18=1, 2015-12-19=1, 2015-12-20=1, 2015-12-21=1, 2015-12-22=1, 2015-12-23=1, 2015-12-24=2, 2015-12-25=3, 2015-12-26=1, 2015-12-27=1, 2015-12-28=1, 2015-12-29=1, 2015-12-30=1, 2015-12-31=1'),
(2, 'AY2016', '2016-01-01', '2016-12-31', 0, '2016-01-04', '2016-07-04', '2016-08-16', '2016-09-23', '2016-08-31', '2016-12-31', '2016-01-01=1, 2016-01-02=1, 2016-01-03=1, 2016-01-04=0, 2016-01-05=0, 2016-01-06=0, 2016-01-07=0, 2016-01-08=0, 2016-01-09=1, 2016-01-10=1, 2016-01-11=0, 2016-01-12=0, 2016-01-13=0, 2016-01-14=0, 2016-01-15=0, 2016-01-16=1, 2016-01-17=1, 2016-01-18=0, 2016-01-19=0, 2016-01-20=0, 2016-01-21=0, 2016-01-22=0, 2016-01-23=1, 2016-01-24=1, 2016-01-25=0, 2016-01-26=0, 2016-01-27=0, 2016-01-28=0, 2016-01-29=0, 2016-01-30=1, 2016-01-31=1, 2016-02-01=0, 2016-02-02=0, 2016-02-03=0, 2016-02-04=0, 2016-02-05=0, 2016-02-06=1, 2016-02-07=1, 2016-02-08=0, 2016-02-09=0, 2016-02-10=0, 2016-02-11=0, 2016-02-12=0, 2016-02-13=1, 2016-02-14=1, 2016-02-15=0, 2016-02-16=0, 2016-02-17=0, 2016-02-18=0, 2016-02-19=0, 2016-02-20=1, 2016-02-21=1, 2016-02-22=0, 2016-02-23=0, 2016-02-24=0, 2016-02-25=0, 2016-02-26=0, 2016-02-27=1, 2016-02-28=1, 2016-02-29=0, 2016-03-01=0, 2016-03-02=0, 2016-03-03=0, 2016-03-04=0, 2016-03-05=1, 2016-03-06=1, 2016-03-07=0, 2016-03-08=0, 2016-03-09=0, 2016-03-10=0, 2016-03-11=0, 2016-03-12=1, 2016-03-13=1, 2016-03-14=0, 2016-03-15=0, 2016-03-16=0, 2016-03-17=0, 2016-03-18=0, 2016-03-19=1, 2016-03-20=1, 2016-03-21=0, 2016-03-22=0, 2016-03-23=0, 2016-03-24=0, 2016-03-25=0, 2016-03-26=1, 2016-03-27=1, 2016-03-28=0, 2016-03-29=0, 2016-03-30=0, 2016-03-31=0, 2016-04-01=0, 2016-04-02=1, 2016-04-03=1, 2016-04-04=0, 2016-04-05=0, 2016-04-06=0, 2016-04-07=0, 2016-04-08=0, 2016-04-09=1, 2016-04-10=1, 2016-04-11=0, 2016-04-12=0, 2016-04-13=0, 2016-04-14=0, 2016-04-15=0, 2016-04-16=1, 2016-04-17=1, 2016-04-18=0, 2016-04-19=0, 2016-04-20=0, 2016-04-21=0, 2016-04-22=0, 2016-04-23=1, 2016-04-24=1, 2016-04-25=0, 2016-04-26=0, 2016-04-27=0, 2016-04-28=0, 2016-04-29=0, 2016-04-30=1, 2016-05-01=1, 2016-05-02=0, 2016-05-03=0, 2016-05-04=0, 2016-05-05=0, 2016-05-06=0, 2016-05-07=1, 2016-05-08=1, 2016-05-09=0, 2016-05-10=0, 2016-05-11=0, 2016-05-12=0, 2016-05-13=0, 2016-05-14=1, 2016-05-15=1, 2016-05-16=0, 2016-05-17=0, 2016-05-18=0, 2016-05-19=0, 2016-05-20=0, 2016-05-21=1, 2016-05-22=1, 2016-05-23=0, 2016-05-24=0, 2016-05-25=0, 2016-05-26=0, 2016-05-27=0, 2016-05-28=1, 2016-05-29=1, 2016-05-30=0, 2016-05-31=0, 2016-06-01=0, 2016-06-02=0, 2016-06-03=0, 2016-06-04=1, 2016-06-05=1, 2016-06-06=0, 2016-06-07=0, 2016-06-08=0, 2016-06-09=0, 2016-06-10=0, 2016-06-11=1, 2016-06-12=1, 2016-06-13=0, 2016-06-14=0, 2016-06-15=0, 2016-06-16=0, 2016-06-17=0, 2016-06-18=1, 2016-06-19=1, 2016-06-20=0, 2016-06-21=0, 2016-06-22=0, 2016-06-23=0, 2016-06-24=0, 2016-06-25=1, 2016-06-26=1, 2016-06-27=0, 2016-06-28=0, 2016-06-29=0, 2016-06-30=0, 2016-07-01=0, 2016-07-02=1, 2016-07-03=1, 2016-07-04=0, 2016-07-05=1, 2016-07-06=1, 2016-07-07=1, 2016-07-08=1, 2016-07-09=1, 2016-07-10=1, 2016-07-11=1, 2016-07-12=1, 2016-07-13=1, 2016-07-14=1, 2016-07-15=1, 2016-07-16=1, 2016-07-17=1, 2016-07-18=1, 2016-07-19=1, 2016-07-20=1, 2016-07-21=1, 2016-07-22=1, 2016-07-23=1, 2016-07-24=1, 2016-07-25=1, 2016-07-26=1, 2016-07-27=1, 2016-07-28=1, 2016-07-29=1, 2016-07-30=1, 2016-07-31=1, 2016-08-01=1, 2016-08-02=1, 2016-08-03=1, 2016-08-04=1, 2016-08-05=1, 2016-08-06=1, 2016-08-07=1, 2016-08-08=1, 2016-08-09=1, 2016-08-10=1, 2016-08-11=1, 2016-08-12=1, 2016-08-13=1, 2016-08-14=1, 2016-08-15=1, 2016-08-16=0, 2016-08-17=0, 2016-08-18=0, 2016-08-19=0, 2016-08-20=1, 2016-08-21=1, 2016-08-22=0, 2016-08-23=0, 2016-08-24=0, 2016-08-25=0, 2016-08-26=0, 2016-08-27=1, 2016-08-28=1, 2016-08-29=0, 2016-08-30=0, 2016-08-31=0, 2016-09-01=0, 2016-09-02=0, 2016-09-03=1, 2016-09-04=1, 2016-09-05=0, 2016-09-06=0, 2016-09-07=0, 2016-09-08=0, 2016-09-09=0, 2016-09-10=1, 2016-09-11=1, 2016-09-12=0, 2016-09-13=0, 2016-09-14=0, 2016-09-15=0, 2016-09-16=0, 2016-09-17=1, 2016-09-18=1, 2016-09-19=0, 2016-09-20=0, 2016-09-21=0, 2016-09-22=0, 2016-09-23=0, 2016-09-24=1, 2016-09-25=1, 2016-09-26=0, 2016-09-27=0, 2016-09-28=0, 2016-09-29=0, 2016-09-30=0, 2016-10-01=1, 2016-10-02=1, 2016-10-03=0, 2016-10-04=0, 2016-10-05=0, 2016-10-06=0, 2016-10-07=0, 2016-10-08=1, 2016-10-09=1, 2016-10-10=0, 2016-10-11=0, 2016-10-12=0, 2016-10-13=0, 2016-10-14=0, 2016-10-15=1, 2016-10-16=1, 2016-10-17=0, 2016-10-18=0, 2016-10-19=0, 2016-10-20=0, 2016-10-21=0, 2016-10-22=1, 2016-10-23=1, 2016-10-24=0, 2016-10-25=0, 2016-10-26=0, 2016-10-27=0, 2016-10-28=0, 2016-10-29=1, 2016-10-30=1, 2016-10-31=0, 2016-11-01=0, 2016-11-02=0, 2016-11-03=0, 2016-11-04=0, 2016-11-05=1, 2016-11-06=1, 2016-11-07=0, 2016-11-08=0, 2016-11-09=0, 2016-11-10=0, 2016-11-11=0, 2016-11-12=1, 2016-11-13=1, 2016-11-14=0, 2016-11-15=0, 2016-11-16=0, 2016-11-17=0, 2016-11-18=0, 2016-11-19=1, 2016-11-20=1, 2016-11-21=0, 2016-11-22=0, 2016-11-23=0, 2016-11-24=0, 2016-11-25=0, 2016-11-26=1, 2016-11-27=1, 2016-11-28=0, 2016-11-29=0, 2016-11-30=0, 2016-12-01=0, 2016-12-02=0, 2016-12-03=1, 2016-12-04=1, 2016-12-05=0, 2016-12-06=0, 2016-12-07=0, 2016-12-08=0, 2016-12-09=0, 2016-12-10=1, 2016-12-11=1, 2016-12-12=0, 2016-12-13=0, 2016-12-14=0, 2016-12-15=0, 2016-12-16=0, 2016-12-17=1, 2016-12-18=1, 2016-12-19=0, 2016-12-20=0, 2016-12-21=0, 2016-12-22=0, 2016-12-23=0, 2016-12-24=1, 2016-12-25=1, 2016-12-26=0, 2016-12-27=0, 2016-12-28=0, 2016-12-29=0, 2016-12-30=0, 2016-12-31=1');

-- --------------------------------------------------------

--
-- Table structure for table `year_plan_temp_date`
--

CREATE TABLE IF NOT EXISTS `year_plan_temp_date` (
`id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `year_plan_temp_date`
--

INSERT INTO `year_plan_temp_date` (`id`, `year_id`, `date`, `status`) VALUES
(1, 1, '2015-07-18', 1),
(2, 1, '2015-07-31', 0),
(3, 1, '2015-08-29', 1),
(4, 1, '2015-09-23', 0),
(5, 1, '2015-09-27', 1),
(6, 1, '2015-10-27', 0),
(7, 1, '2015-11-11', 0),
(8, 1, '2015-11-25', 0),
(9, 1, '2015-12-24', 1),
(10, 1, '2015-12-25', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_feed`
--
ALTER TABLE `activity_feed`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activity_type`
--
ALTER TABLE `activity_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_leaves`
--
ALTER TABLE `apply_leaves`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_short_leaves`
--
ALTER TABLE `apply_short_leaves`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archived_guardians`
--
ALTER TABLE `archived_guardians`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archived_students`
--
ALTER TABLE `archived_students`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `archived_teachers`
--
ALTER TABLE `archived_teachers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batch`
--
ALTER TABLE `batch`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
 ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `class_timetable`
--
ALTER TABLE `class_timetable`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_marks`
--
ALTER TABLE `exam_marks`
 ADD PRIMARY KEY (`exam_id`,`student_id`,`subject_id`);

--
-- Indexes for table `exam_subjects`
--
ALTER TABLE `exam_subjects`
 ADD PRIMARY KEY (`exam_id`,`subject_id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `government_exam_admission_nos`
--
ALTER TABLE `government_exam_admission_nos`
 ADD PRIMARY KEY (`government_exam_id`,`student_id`,`admission_no`);

--
-- Indexes for table `government_exams`
--
ALTER TABLE `government_exams`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inbox_conversations`
--
ALTER TABLE `inbox_conversations`
 ADD PRIMARY KEY (`conversation_id`);

--
-- Indexes for table `inbox_messages`
--
ALTER TABLE `inbox_messages`
 ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `leave_status`
--
ALTER TABLE `leave_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_field`
--
ALTER TABLE `news_field`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `short_leave_types`
--
ALTER TABLE `short_leave_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance`
--
ALTER TABLE `student_attendance`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_attendance_log`
--
ALTER TABLE `student_attendance_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_class`
--
ALTER TABLE `student_class`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_attendance`
--
ALTER TABLE `teacher_attendance`
 ADD PRIMARY KEY (`teacher_id`,`signature_no`,`date`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_teacher_attendance`
--
ALTER TABLE `temp_teacher_attendance`
 ADD PRIMARY KEY (`teacher_id`,`signature_no`);

--
-- Indexes for table `timetable_slot`
--
ALTER TABLE `timetable_slot`
 ADD PRIMARY KEY (`timetable_id`,`slot_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `year_plan`
--
ALTER TABLE `year_plan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `year_plan_temp_date`
--
ALTER TABLE `year_plan_temp_date`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_feed`
--
ALTER TABLE `activity_feed`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `activity_type`
--
ALTER TABLE `activity_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `apply_leaves`
--
ALTER TABLE `apply_leaves`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `apply_short_leaves`
--
ALTER TABLE `apply_short_leaves`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `archived_guardians`
--
ALTER TABLE `archived_guardians`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `archived_students`
--
ALTER TABLE `archived_students`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `archived_teachers`
--
ALTER TABLE `archived_teachers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `batch`
--
ALTER TABLE `batch`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ci_cookies`
--
ALTER TABLE `ci_cookies`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_timetable`
--
ALTER TABLE `class_timetable`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `government_exams`
--
ALTER TABLE `government_exams`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inbox_conversations`
--
ALTER TABLE `inbox_conversations`
MODIFY `conversation_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `inbox_messages`
--
ALTER TABLE `inbox_messages`
MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `news_field`
--
ALTER TABLE `news_field`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_attendance`
--
ALTER TABLE `student_attendance`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `student_attendance_log`
--
ALTER TABLE `student_attendance_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `student_class`
--
ALTER TABLE `student_class`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `year_plan`
--
ALTER TABLE `year_plan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `year_plan_temp_date`
--
ALTER TABLE `year_plan_temp_date`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;--
-- Database: `test`
--
--
-- Database: `webauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_pwd`
--
ALTER TABLE `user_pwd`
 ADD PRIMARY KEY (`name`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

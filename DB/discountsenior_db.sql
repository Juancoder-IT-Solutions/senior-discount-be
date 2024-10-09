-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 04:04 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `discountsenior_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `ID_announcement` int(11) NOT NULL,
  `what_announcement` varchar(255) NOT NULL,
  `where_announcement` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_posted` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ID_announcement`, `what_announcement`, `where_announcement`, `subject`, `description`, `date_posted`) VALUES
(10, 'Join us for the unveiling of our latest product line!', 'Grand Ballroom, [Venue Name]', 'New Product lunch', 'Join us for the unveiling of our latest product line! Be the first to experience cutting-edge technology and innovative features that will revolutionize the industry. Don\'t miss out on this exclusive event!', '2024-05-15 23:23:50'),
(12, 'Sample', 'Grand Ballroom, [Venue Name]', 'New Product lunch', 'Join us for the unveiling of our latest product line! Be the first to experience cutting-edge technology and innovative features that will revolutionize the industry. Don\'t miss out on this exclusive event!', '2024-05-16 00:04:30');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_files`
--

CREATE TABLE `announcement_files` (
  `ID_files` int(11) NOT NULL,
  `ID_announcement_FK` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement_files`
--

INSERT INTO `announcement_files` (`ID_files`, `ID_announcement_FK`, `filename`, `file_type`) VALUES
(6, 10, 'registrationofanotheradmin.mp4', 'mp4'),
(7, 10, 'Screenshot 2023-03-31 004941.png', 'png'),
(11, 12, 'approvingApplication.mp4', 'mp4'),
(12, 12, 'bandicam 2022-06-20 21-37-50-497.jpg', 'jpg');

-- --------------------------------------------------------

--
-- Table structure for table `approve_table`
--

CREATE TABLE `approve_table` (
  `approve_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `approve_table`
--

INSERT INTO `approve_table` (`approve_id`, `senior_id`, `status`, `date_created`) VALUES
(35, 8, 1, '2024-05-14'),
(36, 8, 1, '2024-04-03'),
(37, 8, 0, '2024-05-16'),
(38, 9, 1, '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `birthcertificate_table`
--

CREATE TABLE `birthcertificate_table` (
  `BC_ID` int(11) NOT NULL,
  `approve_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `file_name_birth` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `birthcertificate_table`
--

INSERT INTO `birthcertificate_table` (`BC_ID`, `approve_id`, `senior_id`, `file_name_birth`, `date_created`) VALUES
(42, 35, 8, 'uploads/birth_certificates/66424849b44c4_Screenshot 2023-03-31 004941.png', '2024-05-14'),
(43, 35, 8, 'uploads/birth_certificates/66424849b5662_Screenshot 2023-03-31 005001.png', '2024-05-14'),
(44, 36, 8, 'uploads/birth_certificates/6644fb31ae6ce_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(45, 37, 8, 'uploads/birth_certificates/6644fd9c1f48a_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(46, 38, 9, 'uploads/birth_certificates/6644fec0a27da_Screenshot 2023-03-31 004941.png', '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `establishment`
--

CREATE TABLE `establishment` (
  `ID_establishment` int(11) NOT NULL,
  `establishment_name` varchar(255) NOT NULL,
  `establishment_address` varchar(255) NOT NULL,
  `give_discount` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `establishment`
--

INSERT INTO `establishment` (`ID_establishment`, `establishment_name`, `establishment_address`, `give_discount`, `date_created`) VALUES
(5, 'Merci', 'Bacolod City', '20', '2024-05-14'),
(6, 'Foodman', 'Bacolod City', '15', '2024-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `government_id`
--

CREATE TABLE `government_id` (
  `government_id` int(11) NOT NULL,
  `approve_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `file_name_id` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `government_id`
--

INSERT INTO `government_id` (`government_id`, `approve_id`, `senior_id`, `type`, `file_name_id`, `date_created`) VALUES
(45, 35, 8, 'SSS', 'uploads/gov_id/66424849b5ee9_Screenshot 2023-04-03 221649.png', '2024-05-14'),
(46, 35, 8, 'SSS', 'uploads/gov_id/66424849b69c2_Screenshot 2023-04-03 222012.png', '2024-05-14'),
(47, 36, 8, 'ssss', 'uploads/gov_id/6644fb31af50f_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(48, 37, 8, '1', 'uploads/gov_id/6644fd9c1f8d9_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(49, 38, 9, 'sss', 'uploads/gov_id/6644fec0a3292_Screenshot 2023-03-31 004941.png', '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `idpicture_table`
--

CREATE TABLE `idpicture_table` (
  `ID_picture` int(11) NOT NULL,
  `approve_id` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `idpicture_table`
--

INSERT INTO `idpicture_table` (`ID_picture`, `approve_id`, `senior_id`, `file_name`, `date_created`) VALUES
(45, 35, 8, 'uploads/id_pictures/66424849b8514_Screenshot 2023-04-09 094223.png', '2024-05-14'),
(46, 35, 8, 'uploads/id_pictures/66424849b9afb_Screenshot 2023-04-09 101400.png', '2024-05-14'),
(47, 36, 8, 'uploads/id_pictures/6644fb31b02e6_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(48, 37, 8, 'uploads/id_pictures/6644fd9c1fd3b_Screenshot 2023-03-31 004941.png', '2024-05-16'),
(49, 38, 9, 'uploads/id_pictures/6644fec0a37a9_Screenshot 2023-03-31 004941.png', '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `senior_table`
--

CREATE TABLE `senior_table` (
  `senior_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `full_address` varchar(255) NOT NULL,
  `brgy` varchar(255) NOT NULL,
  `city_municipality` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `senior_username` varchar(255) NOT NULL,
  `senior_password` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `senior_table`
--

INSERT INTO `senior_table` (`senior_id`, `first_name`, `middle_name`, `last_name`, `suffix`, `full_address`, `brgy`, `city_municipality`, `age`, `gender`, `phone_number`, `email_address`, `senior_username`, `senior_password`, `date_created`) VALUES
(8, 'Kent', 'John', 'Espejo', '', 'Bacolod City, Alijis, 3rd Road, Block 1 Lot 26', 'Barangay Alijis', 'Bacolod City', '64', 'Male', '12345678910', 'kent@gmail.com', 'kent', 'kent', '2024-05-14'),
(9, 'arnold', 'e', 'elle', '', 'Bacolod City, Banago, 1223', 'Barangay Banago', 'Bacolod City', '28', 'Male', '12345678910', 'arnold@gmail.com', 'arnold', 'arnold', '2024-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `transaction_id` int(11) NOT NULL,
  `ID_establishment` int(11) NOT NULL,
  `senior_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_id`, `ID_establishment`, `senior_id`, `date_added`) VALUES
(1, 5, 0, '2024-09-25 14:19:44'),
(2, 6, 0, '2024-09-25 14:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_initial` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username_admin` varchar(255) NOT NULL,
  `password_admin` varchar(255) NOT NULL,
  `date_created` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `first_name`, `middle_initial`, `last_name`, `username_admin`, `password_admin`, `date_created`) VALUES
(5, 'admin', 'admin', 'admin', 'admin@gmail.com', 'admin', '2024-04-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`ID_announcement`);

--
-- Indexes for table `announcement_files`
--
ALTER TABLE `announcement_files`
  ADD PRIMARY KEY (`ID_files`);

--
-- Indexes for table `approve_table`
--
ALTER TABLE `approve_table`
  ADD PRIMARY KEY (`approve_id`);

--
-- Indexes for table `birthcertificate_table`
--
ALTER TABLE `birthcertificate_table`
  ADD PRIMARY KEY (`BC_ID`);

--
-- Indexes for table `establishment`
--
ALTER TABLE `establishment`
  ADD PRIMARY KEY (`ID_establishment`);

--
-- Indexes for table `government_id`
--
ALTER TABLE `government_id`
  ADD PRIMARY KEY (`government_id`);

--
-- Indexes for table `idpicture_table`
--
ALTER TABLE `idpicture_table`
  ADD PRIMARY KEY (`ID_picture`);

--
-- Indexes for table `senior_table`
--
ALTER TABLE `senior_table`
  ADD PRIMARY KEY (`senior_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `ID_announcement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `announcement_files`
--
ALTER TABLE `announcement_files`
  MODIFY `ID_files` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `approve_table`
--
ALTER TABLE `approve_table`
  MODIFY `approve_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `birthcertificate_table`
--
ALTER TABLE `birthcertificate_table`
  MODIFY `BC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `establishment`
--
ALTER TABLE `establishment`
  MODIFY `ID_establishment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `government_id`
--
ALTER TABLE `government_id`
  MODIFY `government_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `idpicture_table`
--
ALTER TABLE `idpicture_table`
  MODIFY `ID_picture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `senior_table`
--
ALTER TABLE `senior_table`
  MODIFY `senior_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

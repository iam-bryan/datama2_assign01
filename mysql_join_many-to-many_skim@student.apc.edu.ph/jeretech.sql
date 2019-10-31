-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2019 at 02:45 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jeretech`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  `course_type` varchar(45) DEFAULT NULL,
  `course_time` datetime DEFAULT NULL,
  `professional_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_name`, `course_type`, `course_time`, `professional_id`) VALUES
(1, 'MATH', 'GENERAL', '2018-10-30 18:00:00', 1),
(2, 'SCIENCE', 'STEM', '2018-10-18 12:00:00', 2),
(3, 'ARTS', 'CREATIVE ARTS', '2018-02-17 14:30:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `professional1`
--

CREATE TABLE `professional1` (
  `id` int(11) NOT NULL,
  `prof_Fname` varchar(45) DEFAULT NULL,
  `prof_Lname` varchar(45) DEFAULT NULL,
  `prof_address` varchar(45) DEFAULT NULL,
  `prof_email` varchar(45) DEFAULT NULL,
  `prof_date_of_hire` date DEFAULT NULL,
  `prof_phone_number` varchar(11) DEFAULT NULL,
  `prof_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professional1`
--

INSERT INTO `professional1` (`id`, `prof_Fname`, `prof_Lname`, `prof_address`, `prof_email`, `prof_date_of_hire`, `prof_phone_number`, `prof_type`) VALUES
(1, 'Jackson', 'Huge', '123 ABC', 'jhuge@gmail.com', '2018-10-28', '09174865237', 'DEAN'),
(2, 'Hugo', 'Jackman', '123 CDE', 'hugojack@gmail.com', '2016-05-18', '097686317', 'ASST.PROF'),
(3, 'Jackson', 'Michigan', 'Rosevelt 123', 'michijackson@gmail.com', '2014-03-03', '09176863187', 'PARTTIMER');

-- --------------------------------------------------------

--
-- Stand-in structure for view `subjects`
-- (See below for the actual view)
--
CREATE TABLE `subjects` (
`prof_Fname` varchar(45)
,`prof_Lname` varchar(45)
,`prof_email` varchar(45)
,`course_name` varchar(45)
,`course_type` varchar(45)
,`course_time` datetime
);

-- --------------------------------------------------------

--
-- Structure for view `subjects`
--
DROP TABLE IF EXISTS `subjects`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `subjects`  AS  select `professional1`.`prof_Fname` AS `prof_Fname`,`professional1`.`prof_Lname` AS `prof_Lname`,`professional1`.`prof_email` AS `prof_email`,`course`.`course_name` AS `course_name`,`course`.`course_type` AS `course_type`,`course`.`course_time` AS `course_time` from (`course` join `professional1` on((`course`.`professional_id` = `course`.`professional_id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`,`professional_id`),
  ADD KEY `fk_course_professional_idx` (`professional_id`);

--
-- Indexes for table `professional1`
--
ALTER TABLE `professional1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `professional1`
--
ALTER TABLE `professional1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_course_professional` FOREIGN KEY (`professional_id`) REFERENCES `professional1` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

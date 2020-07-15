-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 10, 2020 at 12:27 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Tutor`
--

-- --------------------------------------------------------

--
-- Table structure for table `Institute`
--

CREATE TABLE `Institute` (
  `Institute_ID` int(10) NOT NULL,
  `Institute_Name` varchar(20) NOT NULL,
  `Contact_Number` int(10) NOT NULL,
  `Institute_Email` varchar(100) NOT NULL,
  `Institute_Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Institute`
--

INSERT INTO `Institute` (`Institute_ID`, `Institute_Name`, `Contact_Number`, `Institute_Email`, `Institute_Password`) VALUES
(1, 'SASIP', 112541254, 'sasip@gmail.com', '000111'),
(2, 'Rotary', 112585632, 'rotary@gmail.com', '0210120'),
(3, 'Sepala', 112412475, 'sepala@gmail.com', '000000'),
(5, 'Susipone', 774125896, 'susip@gmail.com', '444444');

-- --------------------------------------------------------

--
-- Table structure for table `Institute_Ad`
--

CREATE TABLE `Institute_Ad` (
  `Institute_ID` int(10) NOT NULL,
  `Subject_ID` int(10) NOT NULL,
  `Teacher_Name` varchar(100) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Institute_Ad`
--

INSERT INTO `Institute_Ad` (`Institute_ID`, `Subject_ID`, `Teacher_Name`, `Area`, `Description`) VALUES
(1, 2, 'Nimal Perera', 'Nugegoda', ' Best class in Nugegoda Area.'),
(2, 2, 'Manoj Solanagarachchi', 'Nugegoda', ' '),
(2, 5, 'Ruwan Darshana', 'Delkadha,Nugegoda', ' '),
(3, 4, 'Charitha Disanayake', 'Pannipitiya', '');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `Student_ID` int(10) NOT NULL,
  `Student_Name` varchar(50) DEFAULT NULL,
  `Contact_Number` varchar(10) NOT NULL,
  `Student_Email` varchar(30) NOT NULL,
  `Student_Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`Student_ID`, `Student_Name`, `Contact_Number`, `Student_Email`, `Student_Password`) VALUES
(2, 'Nipun', '0774521452', 'nipun@gmail.com', '000000'),
(4, 'Denuka', '0712545632', 'denuka2@gmail.com', '111111'),
(6, 'Maneesha', '0774541254', 'maneesha@gmail.com', '22222'),
(86, 'kasun', '0112589632', 'kasun@gmail.com', '1230');

-- --------------------------------------------------------

--
-- Table structure for table `Subject`
--

CREATE TABLE `Subject` (
  `Subject_ID` int(5) NOT NULL,
  `Subject_Name` varchar(50) NOT NULL,
  `Medium` varchar(50) NOT NULL,
  `Stream` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Subject`
--

INSERT INTO `Subject` (`Subject_ID`, `Subject_Name`, `Medium`, `Stream`) VALUES
(2, 'Mathematics', 'Sinhala', 'O/L'),
(3, 'Science', 'Sinhala', 'O/L'),
(4, 'Science', 'English', 'O/L'),
(5, 'Combined Maths', 'Sinhala', 'A/L'),
(6, 'Chemistry', 'English', 'A/L');

-- --------------------------------------------------------

--
-- Table structure for table `Teacher`
--

CREATE TABLE `Teacher` (
  `Teacher_ID` int(11) NOT NULL,
  `Teacher_Name` varchar(50) NOT NULL,
  `Contact_Number` int(10) NOT NULL,
  `Teacher_Email` varchar(30) NOT NULL,
  `Teacher_Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Teacher`
--

INSERT INTO `Teacher` (`Teacher_ID`, `Teacher_Name`, `Contact_Number`, `Teacher_Email`, `Teacher_Password`) VALUES
(1, 'Nihal Perera', 774525412, 'nihalperera@gmail.com', '00000'),
(4, 'sunil', 775452144, 'sunil@gmail.com', '00000'),
(5, 'Nimal ', 77458589, 'nimal@gmail.com', '7777777'),
(7, 'Sunil Kumara', 112561048, 'sunilkumara@gmail.com', '111111'),
(8, 'Janaka', 112452145, 'janaka@gmail.com', '789456'),
(9, 'Sunimal Bandara', 772595365, 'sunimal@gmail.com', 'sunimal'),
(10, 'Gamini Samarakoon', 778541258, 'gamini@gmail.com', '1230');

-- --------------------------------------------------------

--
-- Table structure for table `Teacher_Ad`
--

CREATE TABLE `Teacher_Ad` (
  `Teacher_ID` int(10) NOT NULL,
  `Subject_ID` int(10) NOT NULL,
  `Contact_Number` int(10) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Teacher_Ad`
--

INSERT INTO `Teacher_Ad` (`Teacher_ID`, `Subject_ID`, `Contact_Number`, `Area`, `Description`) VALUES
(1, 2, 774552155, 'Kandy', 'Currently I\'m teaching in Royal College as a permanent teacher. I have experienced more than 30 years of teaching.'),
(1, 3, 112547852, 'Kandy/Peradeniya', '  More than 20 years of experience in teaching. Practical sessions will be done in the class.'),
(4, 2, 76525452, 'Mathara', 'Currently I\'m teaching in Royal College as a permanent teacher. I have experienced more than 30 years of teaching.'),
(4, 3, 71542458, 'Gampaha/Kurunegala', 'Currently I\'m teaching in Royal College as a permanent teacher. I have experienced more than 30 years of teaching.'),
(8, 3, 712586935, 'Galle/Mathara', '   Experience in teaching more than 10 years. Currently teaching in Mathara Rahula college.'),
(9, 5, 1125478542, 'Kadawatha/Kiribathgoda', 'More than 15 years of teaching experience. I manged to teach isaland 1st in 2017 A/L.'),
(10, 5, 1112589654, 'Nugegoda', 'Well experienced teacher who hold degree of Engineering from UoP.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Institute`
--
ALTER TABLE `Institute`
  ADD PRIMARY KEY (`Institute_ID`);

--
-- Indexes for table `Institute_Ad`
--
ALTER TABLE `Institute_Ad`
  ADD PRIMARY KEY (`Institute_ID`,`Subject_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `Subject`
--
ALTER TABLE `Subject`
  ADD PRIMARY KEY (`Subject_ID`);

--
-- Indexes for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`Teacher_ID`) USING BTREE;

--
-- Indexes for table `Teacher_Ad`
--
ALTER TABLE `Teacher_Ad`
  ADD PRIMARY KEY (`Teacher_ID`,`Subject_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Institute`
--
ALTER TABLE `Institute`
  MODIFY `Institute_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `Student_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `Subject`
--
ALTER TABLE `Subject`
  MODIFY `Subject_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `Teacher_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Institute_Ad`
--
ALTER TABLE `Institute_Ad`
  ADD CONSTRAINT `Institute_Ad_ibfk_1` FOREIGN KEY (`Institute_ID`) REFERENCES `Institute` (`Institute_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Institute_Ad_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `Subject` (`Subject_ID`);

--
-- Constraints for table `Teacher_Ad`
--
ALTER TABLE `Teacher_Ad`
  ADD CONSTRAINT `Teacher_Ad_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `Subject` (`Subject_ID`),
  ADD CONSTRAINT `Teacher_Ad_ibfk_3` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher` (`Teacher_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2024 at 03:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentcheck`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `checkID` int(11) NOT NULL,
  `stdID` int(11) NOT NULL,
  `checkStatus` int(11) NOT NULL,
  `groupID` int(11) NOT NULL,
  `dayID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminUserName` varchar(20) NOT NULL,
  `adminPass` varchar(20) NOT NULL,
  `statusID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminUserName`, `adminPass`, `statusID`) VALUES
('admin', '1234', '3');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branchID` int(11) NOT NULL,
  `branchName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branchID`, `branchName`) VALUES
(1, 'นักพัฒนาซอฟต์แวร์คอมพิวเตอร์');

-- --------------------------------------------------------

--
-- Table structure for table `date`
--

CREATE TABLE `date` (
  `dateID` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `imgID` varchar(10) NOT NULL,
  `yearID` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `date`
--

INSERT INTO `date` (`dateID`, `date`, `imgID`, `yearID`) VALUES
(2, '30 ตุลาคม 2567', '', ''),
(3, '31 ตุลาคม 2567', '', ''),
(4, '1 พฤศจิกายน 2567', '', ''),
(5, '2 พฤศจิกายน 2567', '', ''),
(10, '3 พฤศจิกายน 2567', '', ''),
(12, '4 พฤศจิกายน 2567', '', ''),
(14, '7 พฤศจิกายน 2567', '', ''),
(17, '14 พฤศจิกายน 2567', '', ''),
(18, '26 พฤศจิกายน 2567', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `depID` int(11) NOT NULL,
  `depName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`depID`, `depName`) VALUES
(1, 'เทคโนโลยีสารสนเทศ');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `groupID` int(11) NOT NULL,
  `roomID` int(10) NOT NULL,
  `branchID` int(10) NOT NULL,
  `depID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`groupID`, `roomID`, `branchID`, `depID`) VALUES
(1, 55, 1, 1),
(3, 51, 1, 1),
(8, 11, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomID` int(11) NOT NULL,
  `roomName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomID`, `roomName`) VALUES
(11, 'A1'),
(12, 'A2'),
(21, 'B1'),
(22, 'B2'),
(31, 'C1'),
(32, 'C2'),
(41, 'D1'),
(45, 'D5'),
(51, 'E1'),
(55, 'E5');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `statusID` int(5) NOT NULL,
  `statusName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`statusID`, `statusName`) VALUES
(1, 'นักศึกษา'),
(2, 'ผู้เช็คชื่อ'),
(3, 'ผู้ดูแลระบบ'),
(4, 'ครูที่ปรึกษา');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `stdID` int(10) NOT NULL,
  `stdUserName` varchar(11) NOT NULL,
  `stdPass` varchar(13) NOT NULL,
  `stdFirstName` varchar(40) NOT NULL,
  `stdLastName` varchar(40) NOT NULL,
  `statusID` varchar(5) NOT NULL,
  `groupID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`stdID`, `stdUserName`, `stdPass`, `stdFirstName`, `stdLastName`, `statusID`, `groupID`) VALUES
(3, 'student1', '1234', 'นายภานุเดช', 'เคนชมภู', '1', 1),
(4, 'student2', '1234', 'นางสาววิภาวานี', 'ยอดแสง', '2', 1),
(17, '123451', '2345', 'นายวิทยา', 'เพ็งแจ่ม', '1', 1),
(18, '1', '1', 'นาย12341', '11111', '1', 3),
(19, '66309010001', '1234', 'นายตะวัน', 'บุญหว่าน', '1', 1),
(20, 'student3', '1234', 'นายเมธี', 'โยธะศรี', '2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacherID` int(10) NOT NULL,
  `teacherUserName` varchar(30) NOT NULL,
  `teacherPass` varchar(30) NOT NULL,
  `teacherFirstName` varchar(40) NOT NULL,
  `teacherLastName` varchar(40) NOT NULL,
  `statusID` varchar(5) NOT NULL,
  `adviserID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacherID`, `teacherUserName`, `teacherPass`, `teacherFirstName`, `teacherLastName`, `statusID`, `adviserID`) VALUES
(1, 'teacher1', '1234', 'ครูอลงกรณ์', 'ภูคงคา', '4', '5');

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

CREATE TABLE `year` (
  `yearID` int(11) NOT NULL,
  `term` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`yearID`, `term`) VALUES
(1, '2/2567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`checkID`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminUserName`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchID`);

--
-- Indexes for table `date`
--
ALTER TABLE `date`
  ADD PRIMARY KEY (`dateID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`depID`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`statusID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`stdID`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherID`);

--
-- Indexes for table `year`
--
ALTER TABLE `year`
  ADD PRIMARY KEY (`yearID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `checkID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `date`
--
ALTER TABLE `date`
  MODIFY `dateID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `depID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `roomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `stdID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacherID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `year`
--
ALTER TABLE `year`
  MODIFY `yearID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `depID` FOREIGN KEY (`depID`) REFERENCES `department` (`depID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

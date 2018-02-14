-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2017 at 06:55 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_selling`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_id`
--

CREATE TABLE `author_id` (
  `Author_ID` int(11) NOT NULL,
  `Author_First` varchar(32) NOT NULL,
  `Author_Last` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `author_id`
--

INSERT INTO `author_id` (`Author_ID`, `Author_First`, `Author_Last`) VALUES
(1, 'Donald', 'Trump'),
(2, 'trump', 'donald');

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `Bid_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Sem_Book_ID` int(11) NOT NULL,
  `Bid_Ammount` double NOT NULL,
  `Bid_Accepted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_ID` int(11) NOT NULL,
  `Author_ID` int(11) NOT NULL,
  `Title` varchar(32) NOT NULL,
  `Book_Edition` int(11) NOT NULL,
  `ISBN_Number` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_ID`, `Author_ID`, `Title`, `Book_Edition`, `ISBN_Number`) VALUES
(1, 1, 'Make America Great Again', 666, '66893423'),
(2, 2, 'Math', 6, '9234898');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` int(11) NOT NULL,
  `Course_Name` varchar(32) NOT NULL,
  `Alpha_Num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_Name`, `Alpha_Num`) VALUES
(1, 'Math 206', 11234),
(2, 'English 100', 12345);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `Message_ID` int(11) NOT NULL,
  `Student_ID1` int(11) NOT NULL,
  `Student_ID2` int(11) NOT NULL,
  `Subject` varchar(100) NOT NULL,
  `Message` varchar(250) NOT NULL,
  `Time_Sent` timestamp NOT NULL,
  `Time_Read` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sem_book`
--

CREATE TABLE `sem_book` (
  `Sem_Book_ID` int(11) NOT NULL,
  `Course_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Student_ID` int(11) NOT NULL,
  `Semester` varchar(32) NOT NULL,
  `Professor_Name` varchar(32) NOT NULL,
  `Trans_Type` int(11) NOT NULL,
  `Time` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sem_book`
--

INSERT INTO `sem_book` (`Sem_Book_ID`, `Course_ID`, `Book_ID`, `Student_ID`, `Semester`, `Professor_Name`, `Trans_Type`, `Time`) VALUES
(1, 2, 1, 5, 'FALL', 'Dr Trump', 1, '2017-03-31 22:00:00'),
(2, 1, 2, 4, 'FA', 'professor', 1, '2017-04-02 10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(11) NOT NULL,
  `Full_Name` varchar(50) NOT NULL,
  `Email` varchar(32) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Phone_Num` int(32) NOT NULL,
  `Sign_up_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `Full_Name`, `Email`, `Password`, `Phone_Num`, `Sign_up_date`) VALUES
(4, 'roof', 'chuck1@gmail.com', '7c6a180b36896a0a8c02787eeafb0e4c', 1231213213, '2017-04-02 06:01:46'),
(7, 'some user', 'email@email.com', '7c6a180b36896a0a8c02787eeafb0e4c', 2123334444, '2017-04-02 10:00:00'),
(8, 'new user', 'new@gmail.com', '7c6a180b36896a0a8c02787eeafb0e4c', 813923123, '2017-04-02 10:00:00'),
(9, 'My Name', '123@gmail.com', '$2y$10$80Bn8OPEWqB92i1GG8SMXuTIIvdIealWuO/upWcw58VL7mY.gYIue', 12358482, '2017-04-02 10:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author_id`
--
ALTER TABLE `author_id`
  ADD PRIMARY KEY (`Author_ID`);

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`Bid_ID`),
  ADD UNIQUE KEY `Student_ID` (`Student_ID`),
  ADD UNIQUE KEY `Sem_Book_ID` (`Sem_Book_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`),
  ADD UNIQUE KEY `Author_ID` (`Author_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`Message_ID`),
  ADD UNIQUE KEY `Student_ID2` (`Student_ID2`),
  ADD UNIQUE KEY `Student_ID1` (`Student_ID1`);

--
-- Indexes for table `sem_book`
--
ALTER TABLE `sem_book`
  ADD PRIMARY KEY (`Sem_Book_ID`),
  ADD UNIQUE KEY `Course_ID` (`Course_ID`),
  ADD UNIQUE KEY `Book_ID` (`Book_ID`),
  ADD UNIQUE KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author_id`
--
ALTER TABLE `author_id`
  MODIFY `Author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `bid`
--
ALTER TABLE `bid`
  MODIFY `Bid_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `Message_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sem_book`
--
ALTER TABLE `sem_book`
  MODIFY `Sem_Book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bid`
--
ALTER TABLE `bid`
  ADD CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`),
  ADD CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`Sem_Book_ID`) REFERENCES `sem_book` (`Sem_Book_ID`);

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Author_ID`) REFERENCES `author_id` (`Author_ID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`Student_ID1`) REFERENCES `student` (`ID`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`Student_ID2`) REFERENCES `student` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

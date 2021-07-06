-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 06 يوليو 2021 الساعة 22:36
-- إصدار الخادم: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `administrative-portal`
--

-- --------------------------------------------------------

--
-- بنية الجدول `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) NOT NULL,
  `section` int(55) NOT NULL,
  `teacher` int(11) NOT NULL,
  `subject` int(11) NOT NULL,
  `time` varchar(44) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject`),
  KEY `teacher_id` (`teacher`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `section`, `teacher`, `subject`, `time`) VALUES
(1, 'A11', 1, 1, 1, '9:00'),
(2, 'SA21', 3, 2, 2, '11:30'),
(6, 'A10', 4, 5, 10, '4:30'),
(7, 'A22', 5, 4, 11, '2:00'),
(8, 'A30', 7, 4, 11, '4:00'),
(9, 'A21', 11, 3, 11, '2:11'),
(10, 'A31', 12, 3, 10, '11:30'),
(11, 'A23', 6, 3, 8, '3:33'),
(12, 'B11', 10, 4, 14, '4:00'),
(13, 'B10', 31231, 4, 13, '9:00'),
(14, 'B22', 10, 6, 3, '2:11'),
(15, 'B22', 10, 6, 3, '2:11');

-- --------------------------------------------------------

--
-- بنية الجدول `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `class` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `age`, `class`) VALUES
(1, 'Ali', 'Ahsan', 21, 1),
(2, 'Hassan', 'Ahmed', 23, 2),
(4, 'Gazi', 'Dani', 21, 1),
(5, 'Tony', 'Fadel', 18, 2),
(6, 'Lami', 'Saro', 24, 1),
(7, 'Yazen', 'Rawn', 24, 2),
(8, 'Mohammed', 'Ali', 25, 10),
(9, 'Ahmed', 'amr', 21, 2),
(10, 'Amged', 'Saleh', 25, 2),
(11, 'jalal', 'mostafa', 30, 2),
(12, 'Mohaned', 'Omar', 22, 2),
(13, 'Hamdy', 'Ali', 27, 2);

-- --------------------------------------------------------

--
-- بنية الجدول `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `shortcut` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `shortcut`) VALUES
(1, 'English', 'ENG'),
(2, 'Mathematics', 'MATH'),
(3, 'Arts', 'A'),
(5, 'Science', 's'),
(6, 'Chemistry', 'ch'),
(7, 'Biology', 'B'),
(8, 'Physics', 'PH'),
(9, 'General Knowledge', 'GK'),
(10, 'Sports', 'S'),
(11, 'History', 'H'),
(12, 'Geography', 'G'),
(13, 'Computers', 'C'),
(14, 'Health', 'H'),
(16, 'Social', 'S');

-- --------------------------------------------------------

--
-- بنية الجدول `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `age` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- إرجاع أو استيراد بيانات الجدول `teachers`
--

INSERT INTO `teachers` (`id`, `fname`, `lname`, `age`) VALUES
(1, 'Sami', 'Rashed', '55'),
(2, 'Rami', 'Sari', '66'),
(3, 'Ali', 'Ahmed', '22'),
(4, 'Omar', 'Al etayby', '31'),
(5, 'Wesam ', 'Abdu', '20'),
(6, 'Ayman', 'Mosleh', '35');

--
-- قيود الجداول المحفوظة
--

--
-- القيود للجدول `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `subject_id` FOREIGN KEY (`subject`) REFERENCES `subjects` (`id`),
  ADD CONSTRAINT `teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`);

--
-- القيود للجدول `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `class_id` FOREIGN KEY (`class`) REFERENCES `classes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

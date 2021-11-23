-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2021 at 05:09 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c4coding`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(100) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `msg` text NOT NULL,
  `date` varchar(15) DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `msg`, `date`) VALUES
(1, 'first name', 'firstemail@gmail.com', '987654321', 'this is the first msg for testing', 'current_timesta'),
(20, 'afzal hussain', 'azzu01122@gmail.com', '6397238556', 'entry by afzal', '2021-11-10 19:2'),
(21, 'manoj sharma', 'manojsharma25x@gmail.com', '7983334108', 'hey vmro!', '2021-11-10 19:2'),
(22, 'bhaskar', 'bhaskarbhatt@gmail.com', '9627826536', 'ab to send ho ja plz', '2021-11-10 20:3'),
(23, 'afzal hussain', 'manojsharma25x@gmail.com', '6397238556', 'ab to hoja', '2021-11-10 20:4');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(15) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'C Language', 'Tutorial with programming approach for beginners and professionals.', 'c-language-post', 'The C Language is developed by Dennis Ritchie for creating system applications that directly interact with the hardware devices such as drivers, kernels etc.\r\n\r\nC programming is considered as the base for other programming languages, that is why it is known as mother language.\r\n\r\nIt can be defined by the following ways:\r\n\r\n1-Mother language\r\n2-System programming language\r\n3-Procedure-oriented programming language\r\n4-Structured programming language\r\n5 Mid-level programming language', 'first-photo.', '2021-11-15 19:27:49'),
(2, 'C++', 'C++ tutorial provides basic and advanced concepts of C++.', 'C++-language-post', 'C++ is a cross-platform language that can be used to create high-performance applications.\r\n\r\nC++ was developed by Bjarne Stroustrup, as an extension to the C language.\r\n\r\nC++ gives programmers a high level of control over system resources and memory.\r\n\r\nThe language was updated 3 major times in 2011, 2014, and 2017 to C++11, C++14, and C++17.', '', '2021-11-11 22:39:37'),
(3, 'Java Programming Language', 'Java is a programming language and a platform.', 'java-language-post', 'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need for recompilation.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client–server web applications, with a reported 9 million developers.', '', '2021-11-12 22:06:12'),
(4, 'Object-Oriented Programming', 'What is Object Oriented Programming?', 'oops-post', 'Object Oriented programming (OOP) is a programming paradigm that relies on the concept of classes and objects. It is used to structure a software program into simple, reusable pieces of code blueprints (usually called classes), which are used to create individual instances of objects. There are many object-oriented programming languages including JavaScript, C++, Java, and Python.\r\n\r\nA class is an abstract blueprint used to create more specific, concrete objects. Classes often represent broad categories, like Car or Dog that share attributes. These classes define what attributes an instance of this type will have, like color, but not the value of those attributes for a specific object.', '', '2021-11-12 22:06:12'),
(5, 'Mysql', 'MySQL is ideal for both small and large applications.', 'mysql-post', 'MySQL is a widely used relational database management system (RDBMS).\r\n\r\nMySQL is free and open-source.\r\nMySQL is currently the most popular database management system software used for managing the relational database. It is open-source database software, which is supported by Oracle Company. It is fast, scalable, and easy to use database management system in comparison with Microsoft SQL Server and Oracle Database. It is commonly used in conjunction with PHP scripts for creating powerful and dynamic server-side or web-based enterprise applications.\r\n\r\nIt is developed, marketed, and supported by MySQL AB, a Swedish company, and written in C programming language and C++ programming language. The official pronunciation of MySQL is not the My Sequel; it is My Ess Que Ell. However, you can pronounce it in your way. Many small and big companies use MySQL. MySQL supports many Operating Systems like Windows, Linux, MacOS, etc. with C, C++, and Java languages.', 'third-photo', '2021-11-12 22:11:48'),
(9, 'ek aur new post', '15 nov tag', 'slug by given by me', 'adding this post, because i want to check that \'add new post function\' is working properly or not.  ', 'white-photo.', '2021-11-15 19:31:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

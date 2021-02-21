-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2021 at 10:38 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infra`
--

-- --------------------------------------------------------

--
-- Table structure for table `fe`
--

CREATE TABLE `fe` (
  `sno` int(11) NOT NULL,
  `emoji` text NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` int(200) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `phone`, `message`, `date`) VALUES
(6, 'Suman Rakshit', 'sumanrakshit1997@gmail.com', 6, 'wsd', '2020-10-14 09:42:25'),
(8, 'Sourav Dey', 'sourav@gmail.com', 98765, 'This is very bad ', '2020-07-15 18:31:00'),
(9, 'Kanu Khan', 'kanu@gmail.com', 987654, 'I like it', '2021-02-12 05:08:55'),
(10, 'Indra Burman', 'indra@gmail.com', 1234, 'I impress this Articles', '2021-02-12 05:10:04'),
(11, 'Manjur Rahaman', 'manjur@gmail.com', 34567, 'this is very bad', '2021-02-12 05:11:03'),
(12, 'sumanta Rakshit', 'sumanta@gmail.com', 876654, 'This is awesome product .i like it.\r\n ', '2021-02-15 11:07:04'),
(13, 'Sanjib Rakshit', 'sanjib@gmail.com', 76543, 'average', '2021-02-02 11:11:30'),
(14, 'Kalu Mandal', 'kalu@gmail.com', 98765, 'I like this movie', '2021-02-21 10:30:53'),
(15, 'Priti Khan', 'priti@gmail.com', 23456, 'I like this very much', '2021-02-21 10:57:02');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `segment` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `segment`) VALUES
(1, 'Positive'),
(2, 'Positive'),
(3, 'Negative'),
(4, 'Negative'),
(5, 'Positive'),
(6, 'Neutral'),
(7, 'Neutral'),
(8, 'Neutral'),
(9, 'Negative'),
(10, 'Negative'),
(11, 'Neutral'),
(12, 'Neutral'),
(14, 'Neutral'),
(15, 'Neutral'),
(16, 'Neutral'),
(18, 'Neutral'),
(20, 'Neutral'),
(21, 'Neutral'),
(22, 'Neutral'),
(23, 'Neutral'),
(26, 'Neutral'),
(27, 'Neutral'),
(28, 'Neutral'),
(29, 'Neutral'),
(30, 'Neutral'),
(31, 'Neutral'),
(32, 'Neutral'),
(33, 'Neutral'),
(34, 'Neutral'),
(35, 'Neutral'),
(36, 'Neutral'),
(37, 'Neutral'),
(38, 'Neutral'),
(39, 'Neutral'),
(40, 'Neutral'),
(41, 'Neutral'),
(42, 'Neutral'),
(43, 'Neutral'),
(44, 'Neutral'),
(45, 'Neutral'),
(46, 'Neutral'),
(47, 'Neutral'),
(48, 'Neutral'),
(49, 'Neutral'),
(50, 'Neutral'),
(51, 'Neutral'),
(52, 'Neutral'),
(53, 'Neutral'),
(54, 'Neutral'),
(55, 'Neutral'),
(56, 'Neutral'),
(57, 'Neutral'),
(58, 'Neutral'),
(59, 'Neutral'),
(60, 'Neutral'),
(61, 'Neutral'),
(62, 'Neutral'),
(63, 'Neutral'),
(64, 'Neutral'),
(65, 'Neutral'),
(66, 'Neutral'),
(67, 'Neutral'),
(68, 'Neutral'),
(69, 'Neutral'),
(70, 'Neutral'),
(71, 'Neutral'),
(72, 'Neutral'),
(73, 'Neutral'),
(74, 'Neutral'),
(75, 'Neutral'),
(76, 'Neutral'),
(77, 'Negative'),
(78, 'Negative'),
(79, 'Negative'),
(80, 'Negative'),
(81, 'Negative'),
(82, 'Negative'),
(83, 'Negative'),
(84, 'Negative'),
(85, 'Negative'),
(86, 'Negative'),
(87, 'Negative'),
(88, 'Negative'),
(89, 'Positive'),
(90, 'Positive'),
(91, 'Positive'),
(92, 'Positive'),
(93, 'Positive'),
(94, 'Positive'),
(95, 'Positive'),
(96, 'Positive'),
(97, 'Positive'),
(98, 'Positive'),
(99, 'Positive'),
(100, 'Positive'),
(101, 'Positive'),
(102, 'Positive'),
(103, 'Positive'),
(104, 'Positive'),
(105, 'Positive'),
(106, 'Positive'),
(107, 'Positive'),
(108, 'Neutral'),
(109, 'Positive'),
(110, 'Positive'),
(111, 'Positive'),
(112, 'Positive'),
(113, 'Positive'),
(114, 'Positive'),
(115, 'Positive'),
(116, 'Positive'),
(117, 'Positive'),
(118, 'Positive'),
(119, 'Positive'),
(120, 'Positive'),
(121, 'Positive'),
(122, 'Positive'),
(123, 'Positive'),
(124, 'Positive'),
(125, 'Positive'),
(126, 'Positive'),
(127, 'Positive'),
(128, 'Positive'),
(129, 'Positive'),
(130, 'Positive'),
(131, 'Positive'),
(132, 'Positive'),
(133, 'Negative'),
(134, 'Negative'),
(135, 'Negative'),
(136, 'Negative'),
(137, 'Negative'),
(138, 'Negative'),
(139, 'Positive'),
(140, 'Positive');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `uname`, `email`, `password`) VALUES
(1, 'suman rakshit', 'suman@gmail.com', '123'),
(2, 'sumanrakshit1997@gmail.com', 'sumanrakshit1997@gmail.com', 'sha256$DSGONYr7$5ba0550db45eea8e56f50bd51820b5e5f71f8312a92025cf3094a5e4fbd2092a'),
(3, 'ram', 'ram@gmail.com', 'sha256$nN5gNd9X$6cc13621fd8c042f9ce649d177d02bc04d6950b0697b5b884240e43ea31bda00'),
(4, '', '', 'sha256$tKBme2iL$a9835d5ec73419a32d6732fa5d08f8a7ac914b07fc1c5544e60b0b3bebca7c76'),
(5, 'guru@gmail.com', 'guru@gmail.com', 'sha256$x6TMfHPh$0972ffae12f3587ffc1d533c0ffd1589e75af82bef156f01beb1585fc801a412');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

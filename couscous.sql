-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 01, 2025 at 07:14 PM
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
-- Database: `couscous`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `msg` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `msg`) VALUES
(1, '💀💀💀');

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `info` longtext NOT NULL,
  `authorid` int(11) NOT NULL,
  `visitedids` int(11) NOT NULL,
  `playercount` int(11) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `offsale` tinyint(1) NOT NULL,
  `createdon` longtext NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `onassetid` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `sender` varchar(100) NOT NULL,
  `receiver` varchar(100) NOT NULL,
  `status` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `sender`, `receiver`, `status`) VALUES
(1, '1', '2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `userbought` longtext NOT NULL,
  `boughtid` longtext NOT NULL,
  `boughtdate` longtext NOT NULL,
  `type` longtext NOT NULL,
  `wearing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitekeys`
--

CREATE TABLE `invitekeys` (
  `invite_id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `used_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invitekeys`
--

INSERT INTO `invitekeys` (`invite_id`, `created_by`, `key`, `used_by`) VALUES
(3, '1247656595241046069', 'ACEREV-UXCc9FKCaNqf', 'sofeyan'),
(4, '1321634762896441347', 'ACEREV-hGIpos4n1Wmo', NULL),
(5, '1321634762896441347', 'ACEREV-EhpVuz8bw2Nr', NULL),
(6, '1321634762896441347', 'ACEREV-qw836aohtfFp', NULL),
(7, '1321634762896441347', 'ACEREV-3bYYQVcASyXf', NULL),
(8, '1321634762896441347', 'ACEREV-tKoPQZacEDyQ', NULL),
(9, '1247656595241046069', 'ACEREV-Axqy1vPxLGg8', 'vianra'),
(10, '1321634762896441347', 'ACEREV-z74VgHyGFC4y', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `fromid` longtext NOT NULL,
  `toid` longtext NOT NULL,
  `subject` longtext DEFAULT NULL,
  `content` longtext NOT NULL,
  `request` longtext DEFAULT NULL,
  `wasread` tinyint(4) NOT NULL,
  `date` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `fromid`, `toid`, `subject`, `content`, `request`, `wasread`, `date`) VALUES
(1, '1', '2', 'Hiiii', 'Hi :3', NULL, 1, '1736632933'),
(2, '2', '1', 'RE: Hiiii', ':3', NULL, 1, '1736633977'),
(4, '2', '1', 'RE: RE: RE: Hiiii', 'no idea', NULL, 1, '1736634503'),
(5, '1', '2', 'RE: RE: RE: RE: Hiiii', 'im gonna upload game', NULL, 1, '1736634524'),
(6, '2', '4', ':3', ':3', NULL, 1, '1736685362'),
(7, '4', '2', 'RE: :3', ':3333', NULL, 1, '1736687317');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` longtext NOT NULL,
  `password` longtext NOT NULL,
  `email` longtext NOT NULL,
  `bio` longtext NOT NULL,
  `bodycolors` longtext NOT NULL,
  `tickets` int(11) NOT NULL,
  `robux` int(11) NOT NULL,
  `lastseen` longtext NOT NULL,
  `currencystipend` int(11) NOT NULL,
  `createdon` longtext NOT NULL,
  `cooldown` longtext DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `safechat` tinyint(1) NOT NULL,
  `knockouts` int(11) NOT NULL,
  `wipeouts` int(11) NOT NULL,
  `token` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `bio`, `bodycolors`, `tickets`, `robux`, `lastseen`, `currencystipend`, `createdon`, `cooldown`, `rank`, `safechat`, `knockouts`, `wipeouts`, `token`) VALUES
(1, 'unconnected', '$2y$10$YFqcoNW7xyPSNeoZBo0mLOZOH9bAiuSWVVIh0zAi/7lqjC2TC4z6a', 'admin@admin.com', 'I got my head sexed', '226;24;226;226;37;37', 20, 0, '1738270461', 1738270037, '1736632674', '53', 0, 0, 0, 0, '6KM1H6LhXYc3GOiUmN9N8FCVSoDbwuBTDq3YfuzhO9CNtbIMBJ6McsslicT2ep9Q'),
(2, 'Snowy.vtf', '$2y$10$mFXiijLEPqS8NMCfLdbqNu3lSrqga/R6YOlxb5jjSXQSku.JF1/w6', 'NULL@gmail.com', 'I got my head checked', '1;1;1;1;1;1', 9999999, 9999999, '1736705517', 1736719303, '1736632903', '36', 0, 0, 0, 0, 'gBETKCzcC8CsHenbDx5y1thhih9kjv6HkXf6c2FRmQsApx0WND8eNkvUtXBHUsnS'),
(3, 'sofeyan', '$2y$10$rHEmChR471lyZX8uphR58O.N7JGP6E8wsu/YonbDXnMTUvfJXHdOO', 'sfyanallhbyy08@gmail.com', 'I got my head checked', '1;1;1;1;1;1', 10, 0, '1736652746', 1736738306, '1736651906', NULL, 0, 0, 0, 0, 'HmqOwyfGRjwFLGN1sZeYYptbQ4CKM2gmZvlx9nkk4BkhUVrGZNmjxj1q48yWXHgZ'),
(4, 'vianra', '$2y$10$2sOcI/61N37xeyEqZd9CAuhnWC0niFtlhiUJJ.7Ut4rPz7E/2fZMm', 'nexacopic@gmail.com', 'I got my head checked', '1;1;1;1;1;1', 10, 0, '1736704409', 1736771656, '1736685256', '08', 0, 0, 0, 0, 'SNAt6fGEwoXLPNeiRpdDj9DQtiyk97hUs6sHZfNZvQRYbD7zMtT8iBENSJOenmbD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitekeys`
--
ALTER TABLE `invitekeys`
  ADD PRIMARY KEY (`invite_id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
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
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitekeys`
--
ALTER TABLE `invitekeys`
  MODIFY `invite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

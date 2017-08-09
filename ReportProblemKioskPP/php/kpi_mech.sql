-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2017 at 07:26 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kpi_mech`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_db`
--

CREATE TABLE `account_db` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_db`
--

INSERT INTO `account_db` (`id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'admin', 'admin', 'jomar', 'maquinay');

-- --------------------------------------------------------

--
-- Table structure for table `cancel_db`
--

CREATE TABLE `cancel_db` (
  `id` int(11) NOT NULL,
  `taskID` int(11) NOT NULL,
  `mech` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cancel_db`
--

INSERT INTO `cancel_db` (`id`, `taskID`, `mech`, `date`, `time`, `recorded`) VALUES
(1, 1, 1, '2016-11-24', '15:19:10', '2016-11-24 07:19:10'),
(3, 6, 49, '2016-11-24', '16:51:05', '2016-11-24 08:51:05'),
(4, 7, 49, '2016-11-24', '16:52:06', '2016-11-24 08:52:06'),
(5, 7, 49, '2016-11-24', '16:56:59', '2016-11-24 08:56:59'),
(6, 3, 49, '2016-11-30', '11:52:03', '2016-11-30 03:52:03'),
(7, 7, 49, '2016-11-30', '14:02:20', '2016-11-30 06:02:20'),
(8, 15, 49, '2017-01-16', '18:24:30', '2017-01-16 10:24:30'),
(9, 14, 49, '2017-01-24', '16:30:51', '2017-01-24 08:30:51'),
(10, 1, 49, '2017-03-02', '12:09:18', '2017-03-02 04:09:18'),
(11, 1, 1, '2017-03-10', '19:26:40', '2017-03-10 11:26:40');

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `auto_num` int(11) NOT NULL,
  `clockNo` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `categoryOther` varchar(20) DEFAULT NULL,
  `question` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hr`
--

INSERT INTO `hr` (`auto_num`, `clockNo`, `category`, `categoryOther`, `question`, `status`) VALUES
(1, 93198, 3, NULL, 'question', 0),
(2, 93198, 5, NULL, 'question', 0),
(3, 93198, 8, '213213', 'question', 0),
(4, 93198, 1, NULL, 'question', 0),
(5, 93198, 1, NULL, 'question', 0),
(6, 93198, 1, NULL, 'sqqwe', 0),
(7, 93198, 6, NULL, 'hello', 0),
(8, 93198, 8, 'mike', 'hi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mbcode_db`
--

CREATE TABLE `mbcode_db` (
  `id` int(11) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mbcode_db`
--

INSERT INTO `mbcode_db` (`id`, `details`) VALUES
(1, 'THREAD SKIP, BROKEN STITCH'),
(2, 'THREAD TIGHT / LOOSE TENSION'),
(3, 'THREAD LOOSE STITCH'),
(4, 'THREAD BREAKING'),
(5, 'PACKERING, WAVE / STRETCH'),
(6, 'TAPE UNEVEN SEAMMING'),
(7, 'UNEVEN STITCHES'),
(8, 'NEEDLE CUT, HOLE'),
(9, 'NEEDLE BREAKING'),
(10, 'UNEVEN SEAMMING'),
(11, 'ROTARY HOOK STOCK-UP'),
(12, 'POOR FEEDING'),
(13, 'FEED DOG MARK'),
(14, 'KNIFE SHARPENING'),
(15, 'LOST SCREW , NUT'),
(16, 'OIL STAIN, RUST STAIN'),
(17, 'SPEED PROBLEM'),
(18, 'WIRE BURNED MOTOR'),
(19, 'ELECTRICAL PROBLEM'),
(20, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `mbreak_db`
--

CREATE TABLE `mbreak_db` (
  `SpecialSerial` int(255) NOT NULL,
  `StartTime` time NOT NULL,
  `EndTime` time NOT NULL,
  `TaskID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mbreak_db`
--

INSERT INTO `mbreak_db` (`SpecialSerial`, `StartTime`, `EndTime`, `TaskID`) VALUES
(1, '19:45:44', '00:00:00', 1),
(0, '19:43:12', '00:00:00', 23),
(0, '19:43:40', '00:00:00', 24);

-- --------------------------------------------------------

--
-- Table structure for table `mech_db`
--

CREATE TABLE `mech_db` (
  `empID` int(11) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `ShortName` varchar(11) NOT NULL,
  `dayOrNight` int(2) UNSIGNED DEFAULT NULL,
  `NotifNo` int(100) NOT NULL,
  `CurrentTask` int(255) NOT NULL,
  `plant` int(2) UNSIGNED DEFAULT NULL,
  `status` int(2) NOT NULL,
  `auto_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mech_db`
--

INSERT INTO `mech_db` (`empID`, `FirstName`, `LastName`, `ShortName`, `dayOrNight`, `NotifNo`, `CurrentTask`, `plant`, `status`, `auto_num`) VALUES
(1, 'Elmer', 'Nieva', 'Elmer', 1, 0, 0, 0, 2, 1),
(49, 'Jose Marie', 'Maquinay', 'jomar', 0, 0, 0, NULL, 0, 2),
(479, 'JunRey', 'Ronquillo', 'JunR', 0, 0, 0, 0, 0, 3),
(93198, 'Michael', 'Formentos', 'Kel', 1, 0, 0, 0, 1, 4),
(6114, 'Marvin', 'Ablasa', 'Marv', 0, 0, 0, 0, 1, 5),
(123, 'Edwin', 'Millena', 'popo', 0, 0, 0, NULL, 0, 6),
(93127, 'Reno', 'Amojedo', 'Ren', 1, 0, 0, 0, 0, 7),
(92545, 'Ruben', 'Roco', 'Ruben', 0, 0, 0, 0, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `meetingatt_db`
--

CREATE TABLE `meetingatt_db` (
  `id` int(11) NOT NULL,
  `empID` int(11) NOT NULL,
  `curtime` time NOT NULL,
  `meetingID` int(11) NOT NULL,
  `username` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meetingatt_db`
--

INSERT INTO `meetingatt_db` (`id`, `empID`, `curtime`, `meetingID`, `username`) VALUES
(1, 1, '00:00:00', 1, 'admin'),
(2, 1, '00:00:00', 1, 'admin'),
(3, 1, '00:00:00', 1, 'admin'),
(4, 1, '00:21:44', 1, 'admin'),
(5, 93198, '00:56:39', 1, 'admin'),
(6, 93198, '00:57:41', 2, 'admin'),
(7, 1, '01:24:11', 5, 'admin'),
(8, 49, '01:24:24', 5, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_db`
--

CREATE TABLE `meeting_db` (
  `meetingid` int(11) NOT NULL,
  `meetingname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting_db`
--

INSERT INTO `meeting_db` (`meetingid`, `meetingname`) VALUES
(1, 'michael'),
(2, 'losito'),
(3, ''),
(4, 'qweqwe'),
(5, 'ew');

-- --------------------------------------------------------

--
-- Table structure for table `notif_db`
--

CREATE TABLE `notif_db` (
  `NotifNo` int(100) NOT NULL,
  `CurrentTask` int(10) NOT NULL,
  `Status` int(10) NOT NULL,
  `Notes` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif_db`
--

INSERT INTO `notif_db` (`NotifNo`, `CurrentTask`, `Status`, `Notes`) VALUES
(1, 6, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `sm_db`
--

CREATE TABLE `sm_db` (
  `AssetName` varchar(50) NOT NULL,
  `Site` varchar(50) NOT NULL,
  `SerialNo` varchar(50) NOT NULL,
  `Make` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Barcode` varchar(50) NOT NULL,
  `Supplier` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `AssetStatus` varchar(50) NOT NULL,
  `AssetCondition` varchar(50) NOT NULL,
  `Notes` varchar(50) NOT NULL,
  `SpecialSerial` int(8) NOT NULL,
  `RFID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sm_db`
--

INSERT INTO `sm_db` (`AssetName`, `Site`, `SerialNo`, `Make`, `Model`, `Barcode`, `Supplier`, `Category`, `Location`, `AssetStatus`, `AssetCondition`, `Notes`, `SpecialSerial`, `RFID`) VALUES
('3 STEP ZIGZAG', 'PHILIPPINES', 'PC7358', '3 STEP ZIGZAG- att/top elas.', '457G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1, 2202009),
('3 STEP ZIGZAG', 'PHILIPPINES', 'LZOEH60958', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 2, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'G5605252', '3 STEP ZIGZAG- att/top elas.', 'B854', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 3, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '60936', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 4, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U950906120', '3 STEP ZIGZAG- att/top elas.', '457 A1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 5, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '60957', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 6, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'PC 3112', '3 STEP ZIGZAG- att/top elas.', '457 G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 7, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'LZOHE60110', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 8, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U950806046', '3 STEP ZIGZAG- att/top elas.', '457G135', 'N/A', 'Singer ', '304', 'SEWING', 'in production', 'GOOD', '', 9, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U940306168', '3 STEP ZIGZAG- att/top elas.', '457 G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 10, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'LZ0EH60929', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 11, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U945206084', '3 STEP ZIGZAG- att/top elas.', '457 A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 12, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U955060118', '3 STEP ZIGZAG- att/top elas.', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 13, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'LZOEHG0128', '3 STEP ZIGZAG- att/top elas.', 'LZ229 OSS7', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 14, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U945206048', '3 STEP ZIGZAG- att/top elas.', '457 G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 15, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U940306160', '3 STEP ZIGZAG- att/top elas.', '457U143', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 16, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U945206087', '3 STEP ZIGZAG- att/top elas.', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 17, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '868536', '3 STEP ZIGZAG- att/top elas.', '269201MD01', 'N/A', 'RIMOLDI', '304', 'SEWING', 'in production', 'GOOD', '', 18, 0),
('BARTACK', 'PHILIPPINES', 'LK0WG41199', 'BARTACK- TACKING', 'LK-1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 19, 0),
('BARTACK', 'PHILIPPINES', 'LKOYH65851', 'BARTACK- TACKING', 'LK-1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 20, 0),
('BARTACK', 'PHILIPPINES', 'LKOWJ42809', 'BARTACK- TACKING', 'LK-1852', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 21, 0),
('BARTACK', 'PHILIPPINES', 'LKOYG64268', 'BARTACK- TACKING', 'LK-1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 22, 0),
('BARTACK', 'PHILIPPINES', 'LKOWJ42819', 'BARTACK- TACKING', 'LK-1852', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 23, 0),
('BARTACK', 'PHILIPPINES', 'LKOYG64269', 'BARTACK- TACKING', 'LK 1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 24, 0),
('BARTACK', 'PHILIPPINES', '1850-R40125', 'BARTACK- TACKING', 'LK2250', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 25, 0),
('BARTACK', 'PHILIPPINES', 'LK0YG64244', 'BARTACK- TACKING', 'LK-1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 26, 0),
('BARTACK', 'PHILIPPINES', 'LKOYG64246', 'BARTACK- TACKING', 'LK 1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 27, 0),
('BARTACK', 'PHILIPPINES', '2LIAE00818', 'BARTACK- TACKING', 'LK1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 28, 0),
('BARTACK', 'PHILIPPINES', 'LKOFH49040', 'BARTACK- TACKING', 'LK 1900 HS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 29, 0),
('BARTACK', 'PHILIPPINES', 'LK0YHG65853', 'BARTACK- TACKING', 'LK1850 ', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 30, 0),
('BARTACK', 'PHILIPPINES', 'LKOYH65828', 'BARTACK- TACKING', 'LK 1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 31, 0),
('BARTACK', 'PHILIPPINES', 'LKOWF39700', 'BARTACK- TACKING', 'LK 1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 32, 0),
('BOWTACK', 'PHILIPPINES', 'G7214849', 'BOWTACK - HANGTAG/BOW', 'CB3-B917-1', 'N/A', 'BROTHER', '', 'SEWING', 'in production', 'GOOD', '', 33, 0),
('COVER STITCH', 'PHILIPPINES', '1607873', 'COVER STITCH - HEM/ATT.ELAS', 'F63464MD05', 'N/A', 'RIMOLDI  ', '605', 'SEWING', 'in production', 'GOOD', '', 34, 0),
('COVER STITCH', 'PHILIPPINES', '1506367', 'COVER STITCH - HEM/ATT.ELAS', 'F71', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 35, 0),
('COVER STITCH', 'PHILIPPINES', 'K2591215', 'COVER STITCH - HEM/ATT.ELAS', 'FD4B2720218', 'N/A', 'BROTHER', '605', 'SEWING', 'in production', 'GOOD', '', 36, 0),
('COVER STITCH', 'PHILIPPINES', '710914', 'COVER STITCH - HEM/ATT.ELAS', '261', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 37, 0),
('COVER STITCH', 'PHILIPPINES', '6760909', 'COVER STITCH - HEM/ATT.ELAS', '4562', 'N/A', 'MAUSER SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 38, 0),
('COVER STITCH', 'PHILIPPINES', '1503492', 'COVER STITCH - HEM/ATT.ELAS', '271', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 39, 0),
('COVER STITCH', 'PHILIPPINES', '1607485', 'COVER STITCH - HEM/ATT.ELAS', 'F63 05', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 40, 0),
('COVER STITCH', 'PHILIPPINES', '836981', 'COVER STITCH - HEM/ATT.ELAS', '263-46-3MD-01', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 41, 0),
('COVER STITCH', 'PHILIPPINES', 'KS735555M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 42, 0),
('COVER STITCH', 'PHILIPPINES', '11010797', 'COVER STITCH - HEM/ATT.ELAS', 'SR562-FQ', 'N/A', 'SAHL', '605', 'SEWING', 'in production', 'GOOD', '', 43, 0),
('COVER STITCH', 'PHILIPPINES', '1604929', 'COVER STITCH - HEM/ATT.ELAS', 'F63', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 44, 0),
('COVER STITCH', 'PHILIPPINES', '861837', 'COVER STITCH - HEM/ATT.ELAS', '', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 45, 0),
('COVER STITCH', 'PHILIPPINES', '868522', 'COVER STITCH - HEM/ATT.ELAS', '269-20-ZMD-01', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 46, 0),
('COVER STITCH', 'PHILIPPINES', '1603651', 'COVER STITCH - HEM/ATT.ELAS', 'F63-46-3MD01', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 47, 0),
('COVER STITCH', 'PHILIPPINES', '8153316', 'COVER STITCH - HEM/ATT.ELAS', 'WT 562', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 48, 0),
('COVER STITCH', 'PHILIPPINES', '8153413', 'COVER STITCH - HEM/ATT.ELAS', 'WT500', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 49, 0),
('COVER STITCH', 'PHILIPPINES', 'VF-22041', 'COVER STITCH - HEM/ATT.ELAS', 'VF-2409G-132M', 'N/A', 'YAMATO', '605', 'SEWING', 'in production', 'GOOD', '', 50, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 221949', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 51, 0),
('COVER STITCH', 'PHILIPPINES', '681548', 'COVER STITCH - HEM/ATT.ELAS', '261', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 52, 0),
('COVER STITCH', 'PHILIPPINES', '868523', 'COVER STITCH - HEM/ATT.ELAS', '269-202MD', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 53, 0),
('COVER STITCH', 'PHILIPPINES', '1605564', 'COVER STITCH - HEM/ATT.ELAS', 'F63', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 54, 0),
('COVER STITCH', 'PHILIPPINES', '1600680', 'COVER STITCH - HEM/ATT.ELAS', 'F63463MD', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 55, 0),
('COVER STITCH', 'PHILIPPINES', 'VF26692', 'COVER STITCH - HEM/ATT.ELAS', 'VF-2409G', 'N/A', 'YAMATO', '605', 'SEWING', 'in production', 'GOOD', '', 56, 0),
('COVER STITCH', 'PHILIPPINES', '11010788', 'COVER STITCH - HEM/ATT.ELAS', 'SR-562-FQ', 'N/A', 'SAHL', '605', 'SEWING', 'in production', 'GOOD', '', 57, 0),
('COVER STITCH', 'PHILIPPINES', '6893732', 'COVER STITCH - HEM/ATT.ELAS', 'WT664', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 58, 0),
('COVER STITCH', 'PHILIPPINES', 'KS731689M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 59, 0),
('COVER STITCH', 'PHILIPPINES', '6772303', 'COVER STITCH - HEM/ATT.ELAS', '4562', 'N/A', 'MAUZER SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 60, 0),
('COVER STITCH', 'PHILIPPINES', '11010800', 'COVER STITCH - HEM/ATT.ELAS', 'SR562-FQ', 'N/A', 'SAHL', '605', 'SEWING', 'in production', 'GOOD', '', 61, 0),
('COVER STITCH', 'PHILIPPINES', '895950', 'COVER STITCH - HEM/ATT.ELAS', 'W562-02BB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 62, 0),
('COVER STITCH', 'PHILIPPINES', '8169547', 'COVER STITCH - HEM/ATT.ELAS', '356', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 63, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 731688M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803N', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 64, 0),
('COVER STITCH', 'PHILIPPINES', '8169529', 'COVER STITCH - HEM/ATT.ELAS', 'CW562N-01GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 65, 0),
('COVER STITCH', 'PHILIPPINES', '799950', 'COVER STITCH - HEM/ATT.ELAS', '261', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 66, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 738759M', 'COVER STITCH - HEM/ATT.ELAS', 'W 8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 67, 0),
('COVER STITCH', 'PHILIPPINES', '11010295', 'COVER STITCH - HEM/ATT.ELAS', 'SR562-FQ', 'N/A', 'SAHL', '605', 'SEWING', 'in production', 'GOOD', '', 68, 0),
('COVER STITCH', 'PHILIPPINES', 'KS738822M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 69, 0),
('COVER STITCH', 'PHILIPPINES', 'VF21926', 'COVER STITCH - HEM/ATT.ELAS', 'VF-24096', 'N/A', 'YAMATO', '605', 'SEWING', 'in production', 'GOOD', '', 70, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 731694 M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8000', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 71, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 731660M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-8803D', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 72, 0),
('COVER STITCH', 'PHILIPPINES', '854035', 'COVER STITCH - HEM/ATT.ELAS', '263', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 73, 0),
('COVER STITCH', 'PHILIPPINES', '11010792', 'COVER STITCH - HEM/ATT.ELAS', 'SR-562-FQ', 'N/A', 'SAHL', '605', 'SEWING', 'in production', 'GOOD', '', 74, 0),
('COVER STITCH', 'PHILIPPINES', 'KS 731696M', 'COVER STITCH - HEM/ATT.ELAS', 'WX-880', 'N/A', 'KANSAI SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 75, 0),
('COVER STITCH', 'PHILIPPINES', '8169530', 'COVER STITCH - HEM/ATT.ELAS', '356', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 76, 0),
('COVER STITCH', 'PHILIPPINES', '1607505', 'COVER STITCH - HEM/ATT.ELAS', 'F63 05', 'N/A', 'RIMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 77, 0),
('COVER STITCH', 'PHILIPPINES', '341139', 'COVER STITCH - HEM/ATT.ELAS', '5340012', 'N/A', 'UNION SPECIAL', '605', 'SEWING', 'in production', 'GOOD', '', 78, 0),
('COVER STITCH', 'PHILIPPINES', '8153314', 'COVER STITCH - HEM/ATT.ELAS', 'WT 562', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 79, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA 758088', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 80, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U924312023', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 A141AA', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 81, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PE08901', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 82, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PB 512093', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 83, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PB 510044', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 84, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC13031', 'DOUBLE NEEDLE- SPREAD/OPEN', '167G101', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 85, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC 6573', 'DOUBLE NEEDLE- SPREAD/OPEN', '457 G1', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 86, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931212071', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 87, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931312018', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 88, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931312024', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 89, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931312007', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 90, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'W1812858', 'DOUBLE NEEDLE- SPREAD/OPEN', '212W140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 91, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '3L3ZD01615', 'DOUBLE NEEDLE- SPREAD/OPEN', '41-3126', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 92, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '3L3ZD01654', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-3126', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 93, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L4524381', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2-B842-3', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 94, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'W 1781396', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 W140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 95, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7020003', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B845-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 96, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'J5512018', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 97, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U932012089', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 98, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7040001', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B842-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 99, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'G6572999', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 100, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U933012026', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 101, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA923107', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 102, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '8597909', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 103, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC 1922', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G 140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 104, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LHOXA07991', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 105, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7020011', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B842-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 106, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U932212030', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 107, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'N931312014', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 108, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U900812050', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 109, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LH0XD03529', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 110, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U932012029', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 111, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7020009', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B842-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 112, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'H3595290', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2-B842-3', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 113, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931312068', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 114, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA75450', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 115, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC1405', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 116, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC73729', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 117, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PE02430', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 118, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U914112011', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 119, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LH0XA07993', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 120, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '3L3ZD01629', 'DOUBLE NEEDLE- SPREAD/OPEN', '41-3126', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 121, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F3574770', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2-13842-3', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 122, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4592430', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 123, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PE 07601', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 124, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '6562078', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 125, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PE 02842', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 126, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LH0XA07091', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 127, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PB349488', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 128, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LH0XD03538', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 129, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '3542221', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 130, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'LHOXD03519', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LH-515', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 131, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'M6527436', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 132, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '3120024', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B842-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 133, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7020002', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B845-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 134, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PB349349', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 135, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA 756858', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 136, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931712051', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 137, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA923445', 'DOUBLE NEEDLE- SPREAD/OPEN', '212 W140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 138, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7839', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 139, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC76924', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 140, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7020010', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TW3-B842-3', 'N/A', 'SAHL', '302', 'SEWING', 'in production', 'GOOD', '', 141, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '7561843', 'DOUBLE NEEDLE- SPREAD/OPEN', 'B842', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 142, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PC393', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G140', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 143, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U931212008', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 144, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOVA70399', 'OVERLOCK - JOINING/HEM', 'MO-2400', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 145, 0),
('OVERLOCK', 'PHILIPPINES', 'R2504-MO1461', 'OVERLOCK - JOINING/HEM', 'MOR-2514', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 146, 0),
('OVERLOCK', 'PHILIPPINES', '2000-Q67422', 'OVERLOCK - JOINING/HEM', 'MO2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 147, 0),
('OVERLOCK', 'PHILIPPINES', '20060608220', 'OVERLOCK - JOINING/HEM', 'MO-3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 148, 0),
('OVERLOCK', 'PHILIPPINES', 'P531501', 'OVERLOCK - JOINING/HEM', '618', 'N/A', 'BROTHER', '503', 'SEWING', 'in production', 'GOOD', '', 149, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYF61550', 'OVERLOCK - JOINING/HEM', 'MO-3604', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 150, 0),
('OVERLOCK', 'PHILIPPINES', '2000Q71478', 'OVERLOCK - JOINING/HEM', 'MO2316', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 151, 0),
('OVERLOCK', 'PHILIPPINES', 'SA19353', 'OVERLOCK - JOINING/HEM', 'AZ6020H-Y6DF', 'N/A', 'YAMATO', '503', 'SEWING', 'in production', 'GOOD', '', 152, 0),
('OVERLOCK', 'PHILIPPINES', '1047565', 'OVERLOCK - JOINING/HEM', '627', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 153, 0),
('OVERLOCK', 'PHILIPPINES', '20060608284', 'OVERLOCK - JOINING/HEM', 'MO-3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 154, 0),
('OVERLOCK', 'PHILIPPINES', 'YK73782', 'OVERLOCK - JOINING/HEM', 'PN0449', 'N/A', 'YAMATO', '503', 'SEWING', 'in production', 'GOOD', '', 155, 0),
('OVERLOCK', 'PHILIPPINES', '1046288', 'OVERLOCK - JOINING/HEM', '627', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 156, 0),
('OVERLOCK', 'PHILIPPINES', 'M00UJ46616', 'OVERLOCK - JOINING/HEM', 'MO-2404N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 157, 0),
('OVERLOCK', 'PHILIPPINES', '1200582', 'OVERLOCK - JOINING/HEM', 'F27', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 158, 0),
('OVERLOCK', 'PHILIPPINES', '1024388', 'OVERLOCK - JOINING/HEM', '627', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 159, 0),
('OVERLOCK', 'PHILIPPINES', 'M00YM19859', 'OVERLOCK - JOINING/HEM', 'MO-36004 ', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 160, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYF61109', 'OVERLOCK - JOINING/HEM', 'MO 34', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 161, 0),
('OVERLOCK', 'PHILIPPINES', '7806069', 'OVERLOCK - JOINING/HEM', '363', 'N/A', 'MAUSER SPECIAL', '503', 'SEWING', 'in production', 'GOOD', '', 162, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOVF61092', 'OVERLOCK - JOINING/HEM', 'MO3604', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 163, 0),
('OVERLOCK', 'PHILIPPINES', '2000-P52787', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 164, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOBB30482', 'OVERLOCK - JOINING/HEM', 'MO-3914', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 165, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYF61567', 'OVERLOCK - JOINING/HEM', 'MO-3604', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 166, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOVA70397', 'OVERLOCK - JOINING/HEM', 'BD6 40', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 167, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYH67201', 'OVERLOCK - JOINING/HEM', 'MO-3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 168, 0),
('OVERLOCK', 'PHILIPPINES', '5071251', 'OVERLOCK - JOINING/HEM', '427-00-1CD', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 169, 0),
('OVERLOCK', 'PHILIPPINES', 'RMOGD01011', 'OVERLOCK - JOINING/HEM', 'MO-6514', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 170, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYH66925', 'OVERLOCK - JOINING/HEM', 'MO 3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 171, 0),
('OVERLOCK', 'PHILIPPINES', '2000-R37619', 'OVERLOCK - JOINING/HEM', 'MO2414S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 172, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYH66931', 'OVERLOCK - JOINING/HEM', 'MO 3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 173, 0),
('OVERLOCK', 'PHILIPPINES', '20060608743', 'OVERLOCK - JOINING/HEM', 'MO 3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 174, 0),
('OVERLOCK', 'PHILIPPINES', '2000-R37337', 'OVERLOCK - JOINING/HEM', 'MO 2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 175, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOWF35535', 'OVERLOCK - JOINING/HEM', 'MO-2414N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 176, 0),
('OVERLOCK', 'PHILIPPINES', '1201365', 'OVERLOCK - JOINING/HEM', 'VEGA', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 177, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOWF35527', 'OVERLOCK - JOINING/HEM', 'MO 2414N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 178, 0),
('OVERLOCK', 'PHILIPPINES', '200047500', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 179, 0),
('OVERLOCK', 'PHILIPPINES', 'RMOGD01175', 'OVERLOCK - JOINING/HEM', 'MO-6514', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 180, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOZM54378', 'OVERLOCK - JOINING/HEM', 'MO-3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 181, 0),
('OVERLOCK', 'PHILIPPINES', '20060608273', 'OVERLOCK - JOINING/HEM', 'MO-3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 182, 0),
('OVERLOCK', 'PHILIPPINES', '9118679', 'OVERLOCK - JOINING/HEM', 'EX5214', 'N/A', 'PEGASUS', '503', 'SEWING', 'in production', 'GOOD', '', 183, 0),
('OVERLOCK', 'PHILIPPINES', 'RMOGD01105', 'OVERLOCK - JOINING/HEM', 'MO-6514', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 184, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOAM23852', 'OVERLOCK - JOINING/HEM', 'MO-3914', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 185, 0),
('OVERLOCK', 'PHILIPPINES', 'YK70329', 'OVERLOCK - JOINING/HEM', 'AZ6020H-Y6DF', 'N/A', 'YAMATO', '503', 'SEWING', 'in production', 'GOOD', '', 186, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOVA70327', 'OVERLOCK - JOINING/HEM', 'MO-2404N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 187, 0),
('OVERLOCK', 'PHILIPPINES', '200003302', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 188, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOWG39051', 'OVERLOCK - JOINING/HEM', 'MO-2414N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 189, 0),
('OVERLOCK', 'PHILIPPINES', '20060608789', 'OVERLOCK - JOINING/HEM', 'MO3614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 190, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYF61575', 'OVERLOCK - JOINING/HEM', 'MO-3600', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 191, 0),
('OVERLOCK', 'PHILIPPINES', '2000 R52774', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 192, 0),
('OVERLOCK', 'PHILIPPINES', '2000-R64482', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 193, 0),
('OVERLOCK', 'PHILIPPINES', 'MD0WG39055', 'OVERLOCK - JOINING/HEM', 'M02414N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 194, 0),
('OVERLOCK', 'PHILIPPINES', '1201297', 'OVERLOCK - JOINING/HEM', 'F27', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 195, 0),
('OVERLOCK', 'PHILIPPINES', '2000-Q67424', 'OVERLOCK - JOINING/HEM', 'MO-2304', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 196, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOBB30500', 'OVERLOCK - JOINING/HEM', 'MO-3914', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 197, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOWF35537', 'OVERLOCK - JOINING/HEM', 'G20-0056', 'N/A', 'Juki', '503', 'SEWING', 'in production', 'GOOD', '', 198, 0),
('OVERLOCK', 'PHILIPPINES', 'MT-92498', 'OVERLOCK - JOINING/HEM', 'MT-2400', 'N/A', 'MULTI-TECH', '503', 'SEWING', 'in production', 'GOOD', '', 199, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOYF61570', 'OVERLOCK - JOINING/HEM', '', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 200, 0),
('OVERLOCK', 'PHILIPPINES', '1202639', 'OVERLOCK - JOINING/HEM', 'F27', 'N/A', 'RIMOLDI', '503', 'SEWING', 'in production', 'GOOD', '', 201, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOUJ46618', 'OVERLOCK - JOINING/HEM', 'MO 2404N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 202, 0),
('OVERLOCK', 'PHILIPPINES', 'MOOVA70382', 'OVERLOCK - JOINING/HEM', 'MO-2404N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 203, 0),
('OVERLOCK', 'PHILIPPINES', '20060608249', 'OVERLOCK - JOINING/HEM', 'M03614', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 204, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '280600332', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 205, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'Y227-69217', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 206, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04778', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 207, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '270200026', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 208, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G3583299', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 209, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04557', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 210, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04096', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 211, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57709', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 212, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56183', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 213, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04531', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 214, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MNH04417', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 215, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04209', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 216, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG02401', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 217, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04236', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 218, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E4568332', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 219, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04580', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 220, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57143', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 221, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MHO4798', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 222, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57142', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 223, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'SN256', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 224, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MHO4743', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 225, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57140', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 226, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'B4549948', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZ-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 227, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MHO4682', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 228, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '59688', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 229, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G3583345', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 230, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E5566297', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2B737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 231, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729087', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591D3006', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 232, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'R01186', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLD5430-6', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 233, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '522-F11331', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLM-522', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 234, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MHO4577', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 235, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200625', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 236, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729074', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591D3006', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 237, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56233', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 238, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH03840', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 239, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04639', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 240, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04162', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 241, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200606', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 242, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '260500054', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 243, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729039', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 244, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57619', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 245, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'Q63657', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 246, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH03827', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 247, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04352', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 248, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729036', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 249, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '270200012', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 250, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'B4549937', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 251, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '260500033', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 252, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '418209', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-5550', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 253, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56254', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 254, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0ZF03603', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-87007', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 255, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '280600322', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 256, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'NO SERIAL', 'SINGLE - JOINING/BASTING/TOP STITCH', '5550', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 257, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF03610', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 258, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E555-59708', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 259, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57689', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 260, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '251000607', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 261, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '280600323', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 262, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG023650', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 263, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'L3532380', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZ-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 264, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A3524645', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZ-B731-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 265, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'NO SERIAL', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 266, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '56617', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555-5', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 267, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729088', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591300L', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 268, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P 57669', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 269, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04371', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 270, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '95267', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-5550', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 271, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A3524609', 'SINGLE - JOINING/BASTING/TOP STITCH', 'PB2-B737-4B', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 272, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729079', 'SINGLE - JOINING/BASTING/TOP STITCH', '591D300G', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 273, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'B3535655', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-913', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 274, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF03626', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 275, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF3617', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 276, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04161', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 277, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729065', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 278, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G3596980', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2B716-105', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 279, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G3583349', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 280, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'R14766', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 281, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57733', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 282, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04702', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 283, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04351', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 284, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-G94098', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 285, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200589', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 286, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U313310432', 'SINGLE - JOINING/BASTING/TOP STITCH', '591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 287, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG02026', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 288, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04345', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 289, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOSF08120', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 290, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '260400058', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 291, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'S29192', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-5550-4', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 292, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57699', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 293, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200581', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 294, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E227-03834', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 295, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57683', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 296, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '280600326', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 297, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200629', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 298, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'DLDUJ01786', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLD-5430-4', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 299, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04776', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 300, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF033389', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 301, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227F63278', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 302, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF03392', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 303, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'S29191', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-5550-4', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 304, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-F62128', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 305, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04197', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 306, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'S78483', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL -555', 'N/A', 'JuKI', '301', 'SEWING', 'in production', 'GOOD', '', 307, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04150', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 308, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-F62104', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 309, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '418207', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-5550', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 310, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E5566295', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 311, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-F62574', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 312, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG01986', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 313, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04096', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 314, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MHO4124', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 315, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04761', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 316, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '24253', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 317, 0);
INSERT INTO `sm_db` (`AssetName`, `Site`, `SerialNo`, `Make`, `Model`, `Barcode`, `Supplier`, `Category`, `Location`, `AssetStatus`, `AssetCondition`, `Notes`, `SpecialSerial`, `RFID`) VALUES
('SINGLE NEEDLE', 'PHILIPPINES', '227-F62583', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 318, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-M03282', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 319, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOSH06999', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 320, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOHE06219', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 321, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOGL13705', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 322, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOHE01884', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 323, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729043', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 324, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '31099', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLM-522', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 325, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04529', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL 888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 326, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'DLDZC11872', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLD-5430N7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 327, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04763', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 328, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOZF03629', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8700-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 329, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57726', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 330, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56260', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 331, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '270200058', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 332, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56252', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 333, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '227-MO6185', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 334, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E4568330', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2-B737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 335, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG02015', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 336, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P56230', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 337, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04558', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL 888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 338, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57666', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 339, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E555-59666', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 340, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7532', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DLM - 522', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 341, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729082', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 342, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P49810', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 343, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04359', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 344, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '212', 'SINGLE - JOINING/BASTING/TOP STITCH', '491', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 345, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P52029', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 346, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729063', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 347, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729100', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591D3006', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 348, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200591', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 349, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4DOTG04374', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-8500-7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 350, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729051', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591D300G', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 351, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57741', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 352, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U983729035', 'SINGLE - JOINING/BASTING/TOP STITCH', '1591', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 353, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '261200593', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GC6-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 354, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57715', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 355, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57667', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 356, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04240', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 357, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '52668', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-555', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 358, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH04532', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-888', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 359, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G3583360', 'SINGLE - JOINING/BASTING/TOP STITCH', 'B737-413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 360, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '2000Q67496', 'SINGLE - JOINING/BASTING/TOP STITCH', 'MO-2304', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 361, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0TG02104', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 362, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '6758845', 'SINGLE - JOINING/BASTING/TOP STITCH', 'TJ-00179', 'N/A', 'MAUSER', '301', 'SEWING', 'in production', 'GOOD', '', 363, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '130150', 'SINGLE - JOINING/BASTING/TOP STITCH', 'M752-17', 'N/A', 'Pegasus', '301', 'SEWING', 'in production', 'GOOD', '', 364, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'LK0BC31265', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LK-1900-FS', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 365, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U871712007', 'SINGLE - JOINING/BASTING/TOP STITCH', '212', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 366, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'C4558050', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', '', '301', 'SEWING', 'in production', 'GOOD', '', 367, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'MOOWG39060', 'SINGLE - JOINING/BASTING/TOP STITCH', 'MO2414M', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 368, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '6758489', 'SINGLE - JOINING/BASTING/TOP STITCH', '4562-05AB', 'N/A', 'MAUSER', '301', 'SEWING', 'in production', 'GOOD', '', 369, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'MOOVA40334', 'SINGLE - JOINING/BASTING/TOP STITCH', 'OD4-306', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 370, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A88MH044087', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 371, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7020007', 'SINGLE - JOINING/BASTING/TOP STITCH', 'TW2-B842-3', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 372, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '280600331', 'SINGLE - JOINING/BASTING/TOP STITCH', 'GCG-1-D3E', 'N/A', 'SAHL', '301', 'SEWING', 'in production', 'GOOD', '', 373, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'LZOEJ61615', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LZ2290SS-7', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 374, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U950606102', 'SINGLE - JOINING/BASTING/TOP STITCH', '457', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 375, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'PC17851', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 376, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P842101', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Brother', '301', 'SEWING', 'in production', 'GOOD', '', 377, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H5Z84016', 'SINGLE - JOINING/BASTING/TOP STITCH', 'BE-438D', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 378, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 379, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '2L2JC00016', 'SINGLE - JOINING/BASTING/TOP STITCH', 'lz-2290A-SS', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 380, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '22841410021', 'SINGLE - JOINING/BASTING/TOP STITCH', 'SR2284', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 381, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 382, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'P57717', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL-227', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 383, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'LZOEH60928', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LZ-2290SS-7', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 384, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'DA3624', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LK1900BSS', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 385, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'MOOWJ51073', 'SINGLE - JOINING/BASTING/TOP STITCH', 'MO-39045', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 386, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U1287', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'Juki', '301', 'SEWING', 'in production', 'GOOD', '', 387, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'LKOAB19421', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LK-1900', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 388, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'LKOCH51341', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LK-1850', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 389, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4530093', 'SINGLE - JOINING/BASTING/TOP STITCH', 'LT2-B845-3', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 390, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'KH300A', 'SINGLE - JOINING/BASTING/TOP STITCH', '2014-133/02', 'N/A', 'MAUSER', '301', 'SEWING', 'in production', 'GOOD', '', 391, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '1605564', 'SINGLE - JOINING/BASTING/TOP STITCH', 'F65463MP01', 'N/A', 'RIMOLDI', '301', 'SEWING', 'in production', 'GOOD', '', 392, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '1500925', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'RIMOLDI', '301', 'SEWING', 'in production', 'GOOD', '', 393, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U942785300', 'SINGLE - JOINING/BASTING/TOP STITCH', '457', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 394, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U914566042', 'SINGLE - JOINING/BASTING/TOP STITCH', '457U105', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 395, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'PC34926', 'SINGLE - JOINING/BASTING/TOP STITCH', '457G5', 'N/A', 'SINGER', '301', 'SEWING', 'in production', 'GOOD', '', 396, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'U952106016', 'SINGLE - JOINING/BASTING/TOP STITCH', '457-A13', 'N/A', 'Singer', '301', 'SEWING', 'in production', 'GOOD', '', 397, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '1230034', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'HIKARI', '301', 'SEWING', 'in production', 'GOOD', '', 398, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H0512290283', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'HIKARI', '301', 'SEWING', 'in production', 'GOOD', '', 399, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H261114414', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'HIKARI', '301', 'SEWING', 'in production', 'GOOD', '', 400, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H261114416', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'HIKARI', '301', 'SEWING', 'in production', 'GOOD', '', 401, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H261114415', 'SINGLE - JOINING/BASTING/TOP STITCH', '', 'N/A', 'HIKARI', '301', 'SEWING', 'in production', 'GOOD', '', 402, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 314707', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 403, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506005', 'ZIGZAG     attach/top stitch', '457 A105-M', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 404, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906030', 'ZIGZAG     attach/top stitch', '457U105-MW', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 405, 0),
('ZIGZAG', 'PHILIPPINES', 'U96106119', 'ZIGZAG     attach/top stitch', '457AX147', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 406, 0),
('ZIGZAG', 'PHILIPPINES', 'PC33602', 'ZIGZAG     attach/top stitch', '457G-1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 407, 0),
('ZIGZAG', 'PHILIPPINES', 'PC88819', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'Singer', '304', 'SEWING', 'in production', 'GOOD', '', 408, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106153', 'ZIGZAG     attach/top stitch', '457 A105-L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 409, 0),
('ZIGZAG', 'PHILIPPINES', 'PB314299', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 410, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 80731', 'ZIGZAG     attach/top stitch', '457 G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 411, 0),
('ZIGZAG', 'PHILIPPINES', 'U950506046', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 412, 0),
('ZIGZAG', 'PHILIPPINES', 'U883206026', 'ZIGZAG     attach/top stitch', '457U405-03', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 413, 0),
('ZIGZAG', 'PHILIPPINES', 'PC48399', 'ZIGZAG     attach/top stitch', '457G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 414, 0),
('ZIGZAG', 'PHILIPPINES', 'U952108124', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 415, 0),
('ZIGZAG', 'PHILIPPINES', 'U942706297', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 416, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506037', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 417, 0),
('ZIGZAG', 'PHILIPPINES', 'U914206079', 'ZIGZAG     attach/top stitch', '457-U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 418, 0),
('ZIGZAG', 'PHILIPPINES', 'U950606144', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 419, 0),
('ZIGZAG', 'PHILIPPINES', '20051103547', 'ZIGZAG     attach/top stitch', '', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 420, 0),
('ZIGZAG', 'PHILIPPINES', '20013117', 'ZIGZAG     attach/top stitch', '451A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 421, 0),
('ZIGZAG', 'PHILIPPINES', 'PE81130', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 422, 0),
('ZIGZAG', 'PHILIPPINES', 'PE 15289', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 423, 0),
('ZIGZAG', 'PHILIPPINES', 'U930206007', 'ZIGZAG     attach/top stitch', '457U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 424, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 34926', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 425, 0),
('ZIGZAG', 'PHILIPPINES', 'PC18425', 'ZIGZAG     attach/top stitch', '457G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 426, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106107', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 427, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106136', 'ZIGZAG     attach/top stitch', '457 A105-L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 428, 0),
('ZIGZAG', 'PHILIPPINES', 'U9506038', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 429, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106092', 'ZIGZAG     attach/top stitch', '457 A LOT', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 430, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 6631', 'ZIGZAG     attach/top stitch', '457 G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 431, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106140', 'ZIGZAG     attach/top stitch', '457 A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 432, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106141', 'ZIGZAG     attach/top stitch', '457-A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 433, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106150', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 434, 0),
('ZIGZAG', 'PHILIPPINES', '20013126', 'ZIGZAG     attach/top stitch', '451A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 435, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906049', 'ZIGZAG     attach/top stitch', '457U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 436, 0),
('ZIGZAG', 'PHILIPPINES', 'U940306143', 'ZIGZAG     attach/top stitch', '', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 437, 0),
('ZIGZAG', 'PHILIPPINES', 'U961506161', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 438, 0),
('ZIGZAG', 'PHILIPPINES', 'U890306082', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 439, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106149', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 440, 0),
('ZIGZAG', 'PHILIPPINES', 'U950606147', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 441, 0),
('ZIGZAG', 'PHILIPPINES', 'U952906193', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 442, 0),
('ZIGZAG', 'PHILIPPINES', '20013122', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 443, 0),
('ZIGZAG', 'PHILIPPINES', 'U95210891', 'ZIGZAG     attach/top stitch', '', 'N/A', 'Singer', '304', 'SEWING', 'in production', 'GOOD', '', 444, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106122', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 445, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 185360', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 446, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506047', 'ZIGZAG     attach/top stitch', '457 105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 447, 0),
('ZIGZAG', 'PHILIPPINES', 'U954506054', 'ZIGZAG     attach/top stitch', '', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 448, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506003', 'ZIGZAG     attach/top stitch', '457 A105-M', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 449, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906013', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 450, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106130', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 451, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 89369', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 452, 0),
('ZIGZAG', 'PHILIPPINES', '20013124', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 453, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506017', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 454, 0),
('ZIGZAG', 'PHILIPPINES', 'U952906252', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 455, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906063', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 456, 0),
('ZIGZAG', 'PHILIPPINES', 'U961606120', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 457, 0),
('ZIGZAG', 'PHILIPPINES', 'U950606155', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 458, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 314715', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 459, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506197', 'ZIGZAG     attach/top stitch', '457G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 460, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506033', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 461, 0),
('ZIGZAG', 'PHILIPPINES', '20013125', 'ZIGZAG     attach/top stitch', '457 A105-M', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 462, 0),
('ZIGZAG', 'PHILIPPINES', 'PC86839', 'ZIGZAG     attach/top stitch', '457G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 463, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106142', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 464, 0),
('ZIGZAG', 'PHILIPPINES', 'NO SERIAL', 'ZIGZAG     attach/top stitch', '', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 465, 0),
('ZIGZAG', 'PHILIPPINES', 'U953306049', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 466, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106129', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 467, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506011', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 468, 0),
('ZIGZAG', 'PHILIPPINES', 'U924306076', 'ZIGZAG     attach/top stitch', '457U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 469, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906038', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 470, 0),
('ZIGZAG', 'PHILIPPINES', 'LZ0XC15384', 'ZIGZAG     attach/top stitch', 'LZ-2280', 'N/A', 'Juki', '304', 'SEWING', 'in production', 'GOOD', '', 471, 0),
('ZIGZAG', 'PHILIPPINES', 'U924806081', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 472, 0),
('ZIGZAG', 'PHILIPPINES', 'PB314169', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 473, 0),
('ZIGZAG', 'PHILIPPINES', 'U940306075', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 474, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906054', 'ZIGZAG     attach/top stitch', '457 U 105MW', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 475, 0),
('ZIGZAG', 'PHILIPPINES', 'U954506051', 'ZIGZAG     attach/top stitch', '', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 476, 0),
('ZIGZAG', 'PHILIPPINES', 'U924706132', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 477, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 311044', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 478, 0),
('ZIGZAG', 'PHILIPPINES', 'PE14122', 'ZIGZAG     attach/top stitch', '457G1052', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 479, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 3007', 'ZIGZAG     attach/top stitch', '457G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 480, 0),
('ZIGZAG', 'PHILIPPINES', 'U924806125', 'ZIGZAG     attach/top stitch', '457U105MW', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 481, 0),
('ZIGZAG', 'PHILIPPINES', 'U953506045', 'ZIGZAG     attach/top stitch', '457 A105-M', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 482, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 86228', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 483, 0),
('ZIGZAG', 'PHILIPPINES', 'U972906189', 'ZIGZAG     attach/top stitch', '457G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 484, 0),
('ZIGZAG', 'PHILIPPINES', 'U931606025', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 485, 0),
('ZIGZAG', 'PHILIPPINES', 'U912806066', 'ZIGZAG     attach/top stitch', '457-U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 486, 0),
('ZIGZAG', 'PHILIPPINES', 'PC4905', 'ZIGZAG     attach/top stitch', '457G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 487, 0),
('ZIGZAG', 'PHILIPPINES', '20051103551', 'ZIGZAG     attach/top stitch', '457A135-M', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 488, 0),
('ZIGZAG', 'PHILIPPINES', 'U952906264', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 489, 0),
('ZIGZAG', 'PHILIPPINES', 'PB314988', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 490, 0),
('ZIGZAG', 'PHILIPPINES', 'F4604459', 'ZIGZAG     attach/top stitch', 'LZ2-B852-3', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 491, 0),
('ZIGZAG', 'PHILIPPINES', 'PB317431', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 492, 0),
('ZIGZAG', 'PHILIPPINES', 'U914506042', 'ZIGZAG     attach/top stitch', '457U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 493, 0),
('ZIGZAG', 'PHILIPPINES', 'PE 15238', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 494, 0),
('ZIGZAG', 'PHILIPPINES', 'PC17484', 'ZIGZAG     attach/top stitch', '457G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 495, 0),
('ZIGZAG', 'PHILIPPINES', 'PE 13870', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 496, 0),
('ZIGZAG', 'PHILIPPINES', 'PC87836', 'ZIGZAG     attach/top stitch', '457G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 497, 0),
('ZIGZAG', 'PHILIPPINES', 'U914206052', 'ZIGZAG     attach/top stitch', '457U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 498, 0),
('ZIGZAG', 'PHILIPPINES', 'U825306011', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 499, 0),
('ZIGZAG', 'PHILIPPINES', 'U901708174', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 500, 0),
('ZIGZAG', 'PHILIPPINES', 'PC32410', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 501, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 18184', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 502, 0),
('ZIGZAG', 'PHILIPPINES', 'PC18501', 'ZIGZAG     attach/top stitch', '457G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 503, 0),
('ZIGZAG', 'PHILIPPINES', 'PB8264', 'ZIGZAG     attach/top stitch', '457 G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 504, 0),
('ZIGZAG', 'PHILIPPINES', 'U933906034', 'ZIGZAG     attach/top stitch', '457 G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 505, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 310913', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 506, 0),
('ZIGZAG', 'PHILIPPINES', 'PB186215', 'ZIGZAG     attach/top stitch', '457G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 507, 0),
('ZIGZAG', 'PHILIPPINES', 'PE14186', 'ZIGZAG     attach/top stitch', '457G105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 508, 0),
('ZIGZAG', 'PHILIPPINES', 'U901706186', 'ZIGZAG     attach/top stitch', '457 U105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 509, 0),
('ZIGZAG', 'PHILIPPINES', 'U952106199', 'ZIGZAG     attach/top stitch', '457A105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 510, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 89727', 'ZIGZAG     attach/top stitch', '457 G135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 511, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 63340', 'ZIGZAG     attach/top stitch', '457 G5', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 512, 0),
('ZIGZAG', 'PHILIPPINES', 'PB 8483', 'ZIGZAG     attach/top stitch', '457 G1', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 513, 0),
('ZIGZAG', 'PHILIPPINES', 'PE11756', 'ZIGZAG     attach/top stitch', '4514', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 514, 0),
('ZIGZAG', 'PHILIPPINES', 'U942806077', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 515, 0),
('ZIGZAG', 'PHILIPPINES', 'U930806144', 'ZIGZAG     attach/top stitch', '457', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 516, 0),
('BARTACK', 'PHILIPPINES', '31411243381', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 517, 0),
('BARTACK', 'PHILIPPINES', '31603182924', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 518, 0),
('BARTACK', 'PHILIPPINES', '31603182928', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 519, 0),
('BARTACK', 'PHILIPPINES', '31603182922', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 520, 0),
('BARTACK', 'PHILIPPINES', '31603182906', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 521, 0),
('BARTACK', 'PHILIPPINES', '31603182904', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 522, 0),
('BARTACK', 'PHILIPPINES', '31603182918', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 523, 0),
('BARTACK', 'PHILIPPINES', '31603182926', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 524, 0),
('BARTACK', 'PHILIPPINES', '31603182903', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 525, 0),
('BARTACK', 'PHILIPPINES', '31603182907', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 526, 0),
('BARTACK', 'PHILIPPINES', '31603182909', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 527, 0),
('BARTACK', 'PHILIPPINES', '31411243383', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 528, 0),
('BARTACK', 'PHILIPPINES', '31603182912', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 529, 0),
('BARTACK', 'PHILIPPINES', '31603182916', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 530, 0),
('BARTACK', 'PHILIPPINES', '31603182920', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 531, 0),
('BARTACK', 'PHILIPPINES', '31603182905', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 532, 0),
('BARTACK', 'PHILIPPINES', '31603182915', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 533, 0),
('BARTACK', 'PHILIPPINES', '31603182925', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 534, 0),
('BARTACK', 'PHILIPPINES', '31603182921', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 535, 0),
('BARTACK', 'PHILIPPINES', '31603182911', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 536, 0),
('BARTACK', 'PHILIPPINES', '31603182910', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 537, 0),
('BARTACK', 'PHILIPPINES', '31603182914', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 538, 0),
('BARTACK', 'PHILIPPINES', '31603182908', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 539, 0),
('BARTACK', 'PHILIPPINES', '31603182923', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 540, 0),
('BARTACK', 'PHILIPPINES', '31603182927', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 541, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00041', '3 STEP ZIGZAG- att/top elas.', '2L2JA00043', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 542, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00042', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 543, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00043', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 544, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00044', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 545, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00045', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 546, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00046', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 547, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00047', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 548, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00048', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 549, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00049', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 550, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00050', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 551, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00051', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 552, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00052', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 553, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00053', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 554, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00054', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 555, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00055', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 556, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00056', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 557, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00057', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 558, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00058', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 559, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JA00059', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 560, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2F00071', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 561, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2F00221', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 562, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2F00222', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 563, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2F00223', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 564, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JF00225', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 565, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JC00020', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 566, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2F00224', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 567, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JE00136', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 568, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JE0084', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 569, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JC00012', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 570, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JC00072', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 571, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JC00005', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 572, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2HJ00001', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 573, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JE00083', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 574, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2JC00004', '3 STEP ZIGZAG- att/top elas.', 'LZ2290ASS', 'N/A', 'juki', '304', 'SEWING', 'in production', 'GOOD', '', 575, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410024', '3 STEP ZIGZAG- att/top elas.', 'SR2284', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 576, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410023', '3 STEP ZIGZAG- att/top elas.', 'SR2285', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 577, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410017', '3 STEP ZIGZAG- att/top elas.', 'SR2286', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 578, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410022', '3 STEP ZIGZAG- att/top elas.', 'SR2287', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 579, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410018', '3 STEP ZIGZAG- att/top elas.', 'SR2288', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 580, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410021', '3 STEP ZIGZAG- att/top elas.', 'SR2289', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 581, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '22841410019', '3 STEP ZIGZAG- att/top elas.', 'SR2290', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 582, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603029', '3 STEP ZIGZAG- att/top elas.', 'SR2291', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 583, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603008', '3 STEP ZIGZAG- att/top elas.', 'SR2292', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 584, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603023', '3 STEP ZIGZAG- att/top elas.', 'SR2293', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 585, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603032', '3 STEP ZIGZAG- att/top elas.', 'SR2294', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 586, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603017', '3 STEP ZIGZAG- att/top elas.', 'SR2295', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 587, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603014', '3 STEP ZIGZAG- att/top elas.', 'SR2296', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 588, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603020', '3 STEP ZIGZAG- att/top elas.', 'SR2297', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 589, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603030', '3 STEP ZIGZAG- att/top elas.', 'SR2298', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 590, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603024', '3 STEP ZIGZAG- att/top elas.', 'SR2299', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 591, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603011', '3 STEP ZIGZAG- att/top elas.', 'SR2300', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 592, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603007', '3 STEP ZIGZAG- att/top elas.', 'SR2301', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 593, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603026', '3 STEP ZIGZAG- att/top elas.', 'SR2302', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 594, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603034', '3 STEP ZIGZAG- att/top elas.', 'SR2303', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 595, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603021', '3 STEP ZIGZAG- att/top elas.', 'SR2304', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 596, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603006', '3 STEP ZIGZAG- att/top elas.', 'SR2305', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 597, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603028', '3 STEP ZIGZAG- att/top elas.', 'SR2306', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 598, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603009', '3 STEP ZIGZAG- att/top elas.', 'SR2307', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 599, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603022', '3 STEP ZIGZAG- att/top elas.', 'SR2308', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 600, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603015', '3 STEP ZIGZAG- att/top elas.', 'SR2309', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 601, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603016', '3 STEP ZIGZAG- att/top elas.', 'SR2310', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 602, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603012', '3 STEP ZIGZAG- att/top elas.', 'SR2311', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 603, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603025', '3 STEP ZIGZAG- att/top elas.', 'SR2312', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 604, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'A1603027', '3 STEP ZIGZAG- att/top elas.', 'SR2313', 'N/A', 'SAHL', '304', 'SEWING', 'in production', 'GOOD', '', 605, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02185', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 606, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02170', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 607, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH2116', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 608, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH03635', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 609, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02179', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 610, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02182', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 611, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02107', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 612, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02297', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 613, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02111', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 614, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02274', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 615, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH01472', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 616, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02097', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 617, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02144', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 618, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02127', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 619, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02104', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 620, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02175', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 621, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02189', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 622, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02121', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 623, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02155', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 624, 0),
('OVERLOCK ', 'PHILIPPINES', 'RMOJH02267', '4T OVERLOCK - JOING/HEM', 'MO6814S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 625, 0),
('BARTACK', 'PHILIPPINES', '2L1JC00510', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 626, 0),
('BARTACK', 'PHILIPPINES', '2LIWK00581', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 627, 0),
('BARTACK', 'PHILIPPINES', '2LIWK00595', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 628, 0),
('BARTACK', 'PHILIPPINES', '2LIWK00596', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 629, 0),
('BARTACK', 'PHILIPPINES', '2LIWK00597', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 630, 0),
('BARTACK', 'PHILIPPINES', '2L1XC00740', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 631, 0),
('BARTACK', 'PHILIPPINES', '2L1XC00751', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 632, 0),
('BARTACK', 'PHILIPPINES', '2L1XD00986', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 633, 0),
('BARTACK', 'PHILIPPINES', '2L1XD01000', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 634, 0),
('BARTACK', 'PHILIPPINES', '2L1YB00335', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 635, 0),
('BARTACK', 'PHILIPPINES', '2L1YB00333', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 636, 0),
('BARTACK', 'PHILIPPINES', '2L1YB00330', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 637, 0),
('BARTACK', 'PHILIPPINES', '2L1ZH00506', 'BARTACK- TACKING', '1900AFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 638, 0),
('BARTACK', 'PHILIPPINES', '900594', 'BARTACK- TACKING', '', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 639, 0),
('BARTACK', 'PHILIPPINES', '2LIFL01454', 'BARTACK- TACKING', 'LK1900ANFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 640, 0);
INSERT INTO `sm_db` (`AssetName`, `Site`, `SerialNo`, `Make`, `Model`, `Barcode`, `Supplier`, `Category`, `Location`, `AssetStatus`, `AssetCondition`, `Notes`, `SpecialSerial`, `RFID`) VALUES
('BARTACK', 'PHILIPPINES', '2L1FL01450', 'BARTACk-TACKING ', 'LK1900ANFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 641, 0),
('BARTACK', 'PHILIPPINES', '2LIFL01461', 'BARTACK- TACKING', 'LK1900ANFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 642, 0),
('BARTACK', 'PHILIPPINES', 'LK0DJ13189', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 643, 0),
('BARTACK', 'PHILIPPINES', 'LK0BK40425', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 644, 0),
('BARTACK', 'PHILIPPINES', '1403', 'BARTACK- TACKING', 'LK1900BHS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 645, 0),
('BARTACK', 'PHILIPPINES', '2LIJF00636', 'BARTACK- TACKING', 'LK1900BHS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 646, 0),
('BARTACK', 'PHILIPPINES', '1437', 'BARTACK- TACKING', 'LK1900BHS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 647, 0),
('BARTACK', 'PHILIPPINES', '639', 'BARTACK- TACKING', 'LK1900BHS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 648, 0),
('BARTACK', 'PHILIPPINES', '2L1JK01812', 'BARTACK- TACKING', 'LK1900BSS00A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 649, 0),
('BARTACK', 'PHILIPPINES', '2L1JK01810', 'BARTACK- TACKING', 'LK1900BSS00A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 650, 0),
('BARTACK', 'PHILIPPINES', 'LKODF66274', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 651, 0),
('BARTACK', 'PHILIPPINES', 'LKOFJ50112', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 652, 0),
('BARTACK', 'PHILIPPINES', 'LKOED26634', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 653, 0),
('BARTACK', 'PHILIPPINES', 'LKODJ12110', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 654, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530053', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 655, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530060', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 656, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530095', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 657, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230121', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 658, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530093', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 659, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530045', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 660, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530046', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 661, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230159', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 662, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230122', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 663, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230143', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 664, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530090', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 665, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230123', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B42380', 'N/A', 'JUKI', '302', 'SEWING', 'in production', 'GOOD', '', 666, 0),
('COVER STITCH', 'PHILIPPINES', '30753264G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 667, 0),
('COVER STITCH', 'PHILIPPINES', '30753259G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 668, 0),
('COVER STITCH', 'PHILIPPINES', '30753915', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 669, 0),
('COVER STITCH', 'PHILIPPINES', '30753278G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 670, 0),
('COVER STITCH', 'PHILIPPINES', '30753267G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 671, 0),
('COVER STITCH', 'PHILIPPINES', '30751559C', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 672, 0),
('COVER STITCH', 'PHILIPPINES', '30753277G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 673, 0),
('COVER STITCH', 'PHILIPPINES', '30753904', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 674, 0),
('COVER STITCH', 'PHILIPPINES', '30753276G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 675, 0),
('COVER STITCH', 'PHILIPPINES', '30753254G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 676, 0),
('COVER STITCH', 'PHILIPPINES', '30753286G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 677, 0),
('COVER STITCH', 'PHILIPPINES', '30753245G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 678, 0),
('COVER STITCH', 'PHILIPPINES', '30753909', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 679, 0),
('COVER STITCH', 'PHILIPPINES', '30753249G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 680, 0),
('COVER STITCH', 'PHILIPPINES', '30753253G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 681, 0),
('COVER STITCH', 'PHILIPPINES', '30753260G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 682, 0),
('COVER STITCH', 'PHILIPPINES', '30753243G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 683, 0),
('COVER STITCH', 'PHILIPPINES', '30753284G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 684, 0),
('COVER STITCH', 'PHILIPPINES', '30753268G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 685, 0),
('COVER STITCH', 'PHILIPPINES', '30753256G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 686, 0),
('COVER STITCH', 'PHILIPPINES', '30753913', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 687, 0),
('COVER STITCH', 'PHILIPPINES', '30753270G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 688, 0),
('COVER STITCH', 'PHILIPPINES', '30753247G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 689, 0),
('COVER STITCH', 'PHILIPPINES', '30753242G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 690, 0),
('COVER STITCH', 'PHILIPPINES', '30753272G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 691, 0),
('COVER STITCH', 'PHILIPPINES', '30753266G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 692, 0),
('COVER STITCH', 'PHILIPPINES', '30753240G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 693, 0),
('COVER STITCH', 'PHILIPPINES', '30753248G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 694, 0),
('COVER STITCH', 'PHILIPPINES', '30753261G', 'COVER STITCH - HEM/ATT.ELAS', 'FT7000356M', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 695, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'D9555114', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 696, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L9586134', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 697, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L9586130', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8421C', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 698, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'A15886829', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 699, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'D9555009', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 700, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'D9555019', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 701, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'J2Z03792', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TN842E003', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 702, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L9586133', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 703, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B1592183', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 704, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L8541274', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 705, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'M8535350', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 706, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'J9577651', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 707, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B6875791', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 708, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'D955113', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 709, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'J1129222', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 710, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'A1588629', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 711, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'K0568351', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 712, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B1592196', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 713, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'H055268', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 714, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B1592190', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 715, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'G0542175', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 716, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530018', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 717, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530019', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 718, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530012', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 719, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530040', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 720, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530013', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 721, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530028', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 722, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530007', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 723, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530059', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 724, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70207778', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 725, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70600659', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 726, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70207764', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 727, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70800690', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 728, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70207761', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 729, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70601080', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 730, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70207766', '3 STEP ZIGZAG- att/top elas.', '457135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 731, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U921506126', '3 STEP ZIGZAG- att/top elas.', '457105', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 732, 0),
('ZIGZAG', 'PHILIPPINES', '2L27C00092', 'ZIGZAG     attach/top stitch', '', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 733, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A3524625', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 734, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'B3535790', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 735, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'F3567052', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 736, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'H4592500', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 737, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'H4593209', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 738, 0),
('COVER STITCH', 'PHILIPPINES', 'J9623666', 'COVER STITCH - HEM/ATT.ELAS', 'FD4B27', 'N/A', 'BROTHER', '605', 'SEWING', 'in production', 'GOOD', '', 739, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'L3532386', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DBZB737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 740, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'M0013807', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2B755403A', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 741, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'M0013838', 'SINGLE - JOINING/BASTING/TOP STITCH', 'B755403A', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 742, 0),
('OVER LOCK', 'PHILIPPINES', 'M00VD28681', 'OVERLOCK - JOINING/HEM', 'MO2514N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 743, 0),
('COVER STITCH', 'PHILIPPINES', 'WT51073', 'COVER STITCH - HEM/ATT.ELAS', '', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 744, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'XG23560', 'SEWING MACHINE FROM ROSKO', 'DLN5410N7', 'N/A', 'JUKI', '', 'SEWING', 'in production', '', '', 745, 0),
('COVER STITCH', 'PHILIPPINES', '8147816', 'COVER STITCH - HEM/ATT.ELAS', 'WT562', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 746, 0),
('COVER STITCH', 'PHILIPPINES', '8153467', 'COVER STITCH - HEM/ATT.ELAS', 'WT562', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 747, 0),
('COVER STITCH', 'PHILIPPINES', '8153622', 'COVER STITCH - HEM/ATT.ELAS', 'WT562-01CB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 748, 0),
('OVER LOCK', 'PHILIPPINES', '9117925', 'OVERLOCK - JOINING/HEM', 'EX521403', 'N/A', 'PEGASUS', '503', 'SEWING', 'in production', 'GOOD', '', 749, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U851312046', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 750, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '852112017', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 751, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U852112018', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 752, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U852812011', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 753, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U872612002', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 754, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '880712011', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 755, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '882612006', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 756, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U891612034', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 757, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U891612040', 'DOUBLE NEEDLE- SPREAD/OPEN', '212', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 758, 0),
('ZIGZAG', 'PHILIPPINES', 'PC 13264', 'ZIGZAG     attach/top stitch', '167G101', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 759, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'A3524635', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DB2B737413', 'N/A', 'BROTHER', '301', 'SEWING', 'in production', 'GOOD', '', 760, 0),
('COVER STITCH', 'PHILIPPINES', 'G6572993', 'COVER STITCH - HEM/ATT.ELAS', 'G6572993', 'N/A', 'BROTHER', '605', 'SEWING', 'in production', 'GOOD', '', 761, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B4550032', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 762, 0),
('COVER STITCH', 'PHILIPPINES', 'C9622383', 'COVER STITCH - HEM/ATT.ELAS', 'C9622383', 'N/A', 'BROTHER', '605', 'SEWING', 'in production', 'GOOD', '', 763, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F3567045', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8523', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 764, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F4579507', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8523', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 765, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F4604415', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8523', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 766, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'G3583317', 'DOUBLE NEEDLE- SPREAD/OPEN', 'DB213737413', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 767, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'G3583339', 'DOUBLE NEEDLE- SPREAD/OPEN', 'DB213737413', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 768, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'G3583359', 'DOUBLE NEEDLE- SPREAD/OPEN', 'DB213737413', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 769, 0),
('COVER STITCH', 'PHILIPPINES', 'M8619831', 'COVER STITCH - HEM/ATT.ELAS', 'FD3B257', 'N/A', 'BROTHER', '605', 'SEWING', 'in production', 'GOOD', '', 770, 0),
('OVER LOCK', 'PHILIPPINES', '31994', 'OVERLOCK - JOINING/HEM', 'MO2404N', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 771, 0),
('OVER LOCK', 'PHILIPPINES', 'AC58805', 'OVERLOCK - JOINING/HEM', 'MO3604', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 772, 0),
('OVER LOCK', 'PHILIPPINES', 'S81376', 'OVERLOCK - JOINING/HEM', 'MO2514', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 773, 0),
('COVER STITCH', 'PHILIPPINES', 'YM19859', 'COVER STITCH - HEM/ATT.ELAS', '', 'N/A', 'YAMATO', '605', 'SEWING', 'in production', 'GOOD', '', 774, 0),
('COVER STITCH', 'PHILIPPINES', '8147272', 'COVER STITCH - HEM/ATT.ELAS', 'WT562025B', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 775, 0),
('OVER LOCK', 'PHILIPPINES', '9140001', 'OVERLOCK - JOINING/HEM', 'X521403', 'N/A', 'PEGASUS', '503', 'SEWING', 'in production', 'GOOD', '', 776, 0),
('COVER STITCH', 'PHILIPPINES', '839038', 'COVER STITCH - HEM/ATT.ELAS', '236162MD1016', 'N/A', 'REMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 777, 0),
('COVER STITCH', 'PHILIPPINES', '854908', 'COVER STITCH - HEM/ATT.ELAS', '236162MD1016', 'N/A', 'REMOLDI', '605', 'SEWING', 'in production', 'GOOD', '', 778, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U822612049', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 779, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U882512110', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 780, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U891012012', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 781, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '891012016', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 782, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'U89112092', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 783, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'PA927176', 'DOUBLE NEEDLE- SPREAD/OPEN', '212G141', 'N/A', 'SINGER', '302', 'SEWING', 'in production', 'GOOD', '', 784, 0),
('COVER STITCH', 'PHILIPPINES', 'YK73652', 'COVER STITCH - HEM/ATT.ELAS', 'AZ602HY6DF', 'N/A', 'YAMATO', '605', 'SEWING', 'in production', 'GOOD', '', 785, 0),
('BOWTACK', 'PHILIPPINES', '8M2GK11151', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 786, 0),
('BOWTACK', 'PHILIPPINES', '8M2GK11153', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 787, 0),
('BOWTACK', 'PHILIPPINES', '8M2GK11156', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 788, 0),
('BOWTACK', 'PHILIPPINES', '8M2GK11159', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 789, 0),
('BOWTACK', 'PHILIPPINES', '8M2GK11155', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 790, 0),
('BARTACK', 'PHILIPPINES', '2L1GK00552', 'BARTACK- TACKING', 'LK1900NFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 791, 0),
('BARTACK', 'PHILIPPINES', '2L1GK00553', 'BARTACK- TACKING', 'LK1900NFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 792, 0),
('BARTACK', 'PHILIPPINES', '2L1GK00549', 'BARTACK- TACKING', 'LK1900NFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 793, 0),
('BARTACK', 'PHILIPPINES', '2L1GK00556', 'BARTACK- TACKING', 'LK1900NFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 794, 0),
('BARTACK', 'PHILIPPINES', '2L1GK00561', 'BARTACK- TACKING', 'LK1900NFS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 795, 0),
('BOWTACK', 'PHILIPPINES', 'F7Z56917', 'BOWTACK - HANGTAG/BOW', 'MB917M001', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 796, 0),
('BOWTACK', 'PHILIPPINES', 'M6Z05276', 'BOWTACK - HANGTAG/BOW', 'MB917M001', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 797, 0),
('BOWTACK', 'PHILIPPINES', 'H7267279', 'BOWTACK - HANGTAG/BOW', 'MB917M001', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 798, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '8L2GE12104', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 799, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2FK00004', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 800, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2GM00086', '3 STEP ZIGZAG- att/top elas.', 'LZ229ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 801, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2EM00111', '3 STEP ZIGZAG- att/top elas.', 'LZ229ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 802, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2EM00107', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 803, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2GM00087', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 804, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2HA00004', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 805, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2HA00008', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 806, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2EM00104', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 807, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2EM00105', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 808, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2EM00114', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 809, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2HA0002', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 810, 0),
('COVER STITCH', 'PHILIPPINES', 'MBOBF59331', 'COVER STITCH - HEM/ATT.ELAS', 'BE483D', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 811, 0),
('COVER STITCH', 'PHILIPPINES', '26269', 'COVER STITCH - HEM/ATT.ELAS', 'BE483D', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 812, 0),
('COVER STITCH', 'PHILIPPINES', '84016', 'COVER STITCH - HEM/ATT.ELAS', 'BE483D', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 813, 0),
('COVER STITCH', 'PHILIPPINES', '83943', 'COVER STITCH - HEM/ATT.ELAS', 'BE483D', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 814, 0),
('COVER STITCH', 'PHILIPPINES', '30753905', 'COVER STITCH - HEM/ATT.ELAS', 'BE483D', 'N/A', 'BROTHER', '304', 'SEWING', 'in production', 'GOOD', '', 815, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'EO4867', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 816, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'E07233', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 817, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07285', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 818, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07294', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 819, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07275', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 820, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04382', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 821, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07431', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 822, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07380', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 823, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07241', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 824, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04252', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 825, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07267', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 826, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04389', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 827, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04437', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 828, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07282', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 829, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07384', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 830, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04393', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 831, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07465', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 832, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04408', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 833, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07472', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 834, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07264', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8100B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 835, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4064561', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 836, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4023646', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 837, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4043940', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 838, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4106441', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 839, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '2020833', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 840, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4095601', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 841, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4054499', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 842, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4054556', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 843, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4106400', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 844, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4106434', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 845, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4106402', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 846, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4085518', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 847, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4054558', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 848, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4106439', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 849, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4085513', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 850, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4095673', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 851, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4095610', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 852, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4095672', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 853, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4095681', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 854, 0),
('ZIGZAG', 'PHILIPPINES', '70801156', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 855, 0),
('ZIGZAG', 'PHILIPPINES', '70800686', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 856, 0),
('ZIGZAG', 'PHILIPPINES', '70601085', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 857, 0),
('ZIGZAG', 'PHILIPPINES', '70614457', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 858, 0),
('ZIGZAG', 'PHILIPPINES', '70600664', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 859, 0),
('ZIGZAG', 'PHILIPPINES', '70601081', 'ZIGZAG     attach/top stitch', 'KM2070L', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 860, 0),
('BARTACK', 'PHILIPPINES', 'LK0CC45384', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 861, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4064576', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 862, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4064624', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 863, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4043959', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 864, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4023694', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 865, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4043946', 'SINGLE - JOINING/BASTING/TOP STITCH', 'KLD800AL', 'N/A', 'KINGTEX', '301', 'SEWING', 'in production', 'GOOD', '', 866, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJC01234', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 867, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJC01231', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 868, 0),
('OVER LOCK', 'PHILIPPINES', '8MOHM01609', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 869, 0),
('OVER LOCK', 'PHILIPPINES', '8MOHM00707', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 870, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJA00734', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 871, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJC01229', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 872, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJA00830', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 873, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJA00837', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 874, 0),
('OVER LOCK', 'PHILIPPINES', '8MOJA00810', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 875, 0),
('OVER LOCK', 'PHILIPPINES', '8MOH01611', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 876, 0),
('OVER LOCK', 'PHILIPPINES', '8MOH00661', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 877, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04424', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 878, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04440', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 879, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07260', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 880, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07388', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 881, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07466', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 882, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07274', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 883, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'D17873', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 884, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G04421', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 885, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07248', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 886, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07433', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 887, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07332', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 888, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07318', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 889, 0),
('SINGLE NEEDLE', 'PHILIPPINES', 'G07315', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 890, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07311', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 891, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07319', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 892, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07280', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 893, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07370', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 894, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07279', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 895, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07258', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 896, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07393', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 897, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04400', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 898, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07250', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 899, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07425', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 900, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07406', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 901, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07341', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 902, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07325', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 903, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD18252', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 904, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG0444', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 905, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07402', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 906, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07417', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 907, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07439', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 908, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07266', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 909, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07435', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 910, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07306', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 911, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07375', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 912, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07438', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 913, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07422', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 914, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD18308', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 915, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD18116', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 916, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD17909', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 917, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07450', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 918, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD18148', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 919, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07441', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 920, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD18240', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 921, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HD17746', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 922, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04414', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 923, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07339', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 924, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07365', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 925, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04420', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 926, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07236', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 927, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07429', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 928, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04435', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 929, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HE05632', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 930, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04365', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 931, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HE04940', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 932, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07362', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 933, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04439', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 934, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07293', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 935, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG04355', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 936, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4D0HG07328', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 937, 0),
('BARTACK', 'PHILIPPINES', '2L1JK01797', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 938, 0),
('BARTACK', 'PHILIPPINES', '2L1JK01797', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 939, 0),
('BARTACK', 'PHILIPPINES', '2L1JL00580', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 940, 0),
('BARTACK', 'PHILIPPINES', '2L1JL00571', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 941, 0),
('BARTACK', 'PHILIPPINES', '2L1JL00569', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 942, 0),
('BARTACK', 'PHILIPPINES', '2L1JL00557', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 943, 0),
('BARTACK', 'PHILIPPINES', '2L1JK01814', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 944, 0),
('BARTACK', 'PHILIPPINES', '2L1JL0567', 'BARTACK- TACKING', 'LK1900BSS000A', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 945, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2LZHA00005', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 946, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2AE00446', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 947, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2LZHA0006', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 948, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '2L2HA0003', '3 STEP ZIGZAG- att/top elas.', 'LZ229 ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 949, 0),
('OVERLOCK', 'PHILIPPINES', 'K03842', 'OVERLOCK - JOINING/HEM', 'MO6714S', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 950, 0),
('BARTACK', 'PHILIPPINES', '2L1K01785', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 951, 0),
('BARTACK', 'PHILIPPINES', '2L1JL00572', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 952, 0),
('BARTACK', 'PHILIPPINES', '2L1J00574', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 953, 0),
('BARTACK', 'PHILIPPINES', '2L1JD01858', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 954, 0),
('BARTACK', 'PHILIPPINES', '2L1JD01856', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 955, 0);
INSERT INTO `sm_db` (`AssetName`, `Site`, `SerialNo`, `Make`, `Model`, `Barcode`, `Supplier`, `Category`, `Location`, `AssetStatus`, `AssetCondition`, `Notes`, `SpecialSerial`, `RFID`) VALUES
('BARTACK', 'PHILIPPINES', '2LJK01807', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 956, 0),
('BARTACK', 'PHILIPPINES', '2L1JK00555', 'BARTACK- TACKING', 'LK1900BSS', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 957, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2LC00003', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 958, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JF00231', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 959, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JF00232', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 960, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00102', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 961, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2F00230', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 962, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC0091', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 963, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00057', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 964, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2C00099', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 965, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00002', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 966, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2J000101', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 967, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00015', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 968, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00013', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 969, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00008', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 970, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00094', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 971, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00233', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 972, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JJ00129', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 973, 0),
(' ZIGZAG', 'PHILIPPINES', '2L2JC00100', 'ZIGZAG     attach/top stitch', 'LZ2290ASS', 'N/A', 'JUKI', '304', 'SEWING', 'in production', 'GOOD', '', 974, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7368', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 975, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7371', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 976, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4422', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 977, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7426', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 978, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '17859', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 979, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7239', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 980, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7442', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 981, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '17836', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 982, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7416', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 983, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4372', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 984, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '18141', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 985, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7407', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 986, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '18100', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 987, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7228', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 988, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7468', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 989, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7454', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 990, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4412', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 991, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '18011', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 992, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7453', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 993, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7424', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 994, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '18051', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 995, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4419', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 996, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7353', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 997, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7352', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 998, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4417', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 999, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '7376', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 1000, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4427', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 1001, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4449', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 1002, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '4426', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 1003, 0),
('SINGLE NEEDLE', 'PHILIPPINES', '5669', 'SINGLE - JOINING/BASTING/TOP STITCH', 'DDL8700B7', 'N/A', 'JUKI', '301', 'SEWING', 'in production', 'GOOD', '', 1004, 0),
('BOWTACK', 'PHILIPPINES', 'JD00052', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1005, 0),
('BOWTACK', 'PHILIPPINES', 'JD00029', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1006, 0),
('BOWTACK', 'PHILIPPINES', 'JD00053', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1007, 0),
('BOWTACK', 'PHILIPPINES', 'JD00031', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1008, 0),
('BOWTACK', 'PHILIPPINES', 'JD00054', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1009, 0),
('BOWTACK', 'PHILIPPINES', 'JD00055', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1010, 0),
('BOWTACK', 'PHILIPPINES', 'JD00035', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1011, 0),
('BOWTACK', 'PHILIPPINES', 'JD00036', 'BOWTACK - HANGTAG/BOW', 'MB1373', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1012, 0),
('BARTACK', 'PHILIPPINES', '31411243381', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1013, 0),
('BARTACK', 'PHILIPPINES', '31603182924', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1014, 0),
('BARTACK', 'PHILIPPINES', '31603182928', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1015, 0),
('BARTACK', 'PHILIPPINES', '31603182922', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1016, 0),
('BARTACK', 'PHILIPPINES', '31603182906', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1017, 0),
('BARTACK', 'PHILIPPINES', '31603182904', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1018, 0),
('BARTACK', 'PHILIPPINES', '31603182918', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1019, 0),
('BARTACK', 'PHILIPPINES', '31603182926', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1020, 0),
('BARTACK', 'PHILIPPINES', '31603182903', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1021, 0),
('BARTACK', 'PHILIPPINES', '31603182907', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1022, 0),
('BARTACK', 'PHILIPPINES', '31603182909', 'BARTACK- TACKING', 'SR1900AS', 'N/A', 'SAHL', 'BT', 'SEWING', 'in production', 'GOOD', '', 1023, 0),
('BARTACK', 'PHILIPPINES', 'DA3624', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1024, 0),
(' ZIGZAG', 'PHILIPPINES', 'U98906003', 'ZIGZAG     attach/top stitch', '457A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1025, 0),
(' ZIGZAG', 'PHILIPPINES', 'U98280609', 'ZIGZAG     attach/top stitch', '457A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1026, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U99200651', '3 STEP ZIGZAG- att/top elas.', '457A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1027, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U992006058', '3 STEP ZIGZAG- att/top elas.', '457A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1028, 0),
(' ZIGZAG', 'PHILIPPINES', 'U981406016', 'ZIGZAG     attach/top stitch', '457A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1029, 0),
(' ZIGZAG', 'PHILIPPINES', 'U974006033', 'ZIGZAG     attach/top stitch', '457A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1030, 0),
(' ZIGZAG', 'PHILIPPINES', 'U9911206114', 'ZIGZAG     attach/top stitch', '457A105L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1031, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U982906030', '3 STEP ZIGZAG- att/top elas.', '457A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1032, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U984006043', '3 STEP ZIGZAG- att/top elas.', '457A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1033, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', 'U982806101', '3 STEP ZIGZAG- att/top elas.', '457A135', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1034, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70850691', '3 STEP ZIGZAG- att/top elas.', '70850691', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 1035, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '70850696', '3 STEP ZIGZAG- att/top elas.', '70850691', 'N/A', 'SUNSTAR', '304', 'SEWING', 'in production', 'GOOD', '', 1036, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '20062385', '3 STEP ZIGZAG- att/top elas.', '457A125L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1037, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '20062388', '3 STEP ZIGZAG- att/top elas.', '457A125L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1038, 0),
('3 STEP ZIGZAG', 'PHILIPPINES', '20062386', '3 STEP ZIGZAG- att/top elas.', '457A125L', 'N/A', 'SINGER', '304', 'SEWING', 'in production', 'GOOD', '', 1039, 0),
('BARTACK', 'PHILIPPINES', 'LKODHLO506', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1040, 0),
('BARTACK', 'PHILIPPINES', 'LKOED26638', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1041, 0),
('BARTACK', 'PHILIPPINES', 'LKODJL3215', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1042, 0),
('BARTACK', 'PHILIPPINES', '2LIVL50237', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1043, 0),
('BARTACK', 'PHILIPPINES', 'LKODG70212', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1044, 0),
('BARTACK', 'PHILIPPINES', 'LKOCJ53159', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1045, 0),
('BARTACK', 'PHILIPPINES', 'LKOFJ51926', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1046, 0),
('BARTACK', 'PHILIPPINES', 'LKOFD41848', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1047, 0),
('BARTACK', 'PHILIPPINES', 'LKOCC45403', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1048, 0),
('BARTACK', 'PHILIPPINES', '2LIV00231', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1049, 0),
('BARTACK', 'PHILIPPINES', 'LKOCJ53183', 'BARTACK- TACKING', 'LK1850', 'N/A', 'JUKI', 'BT', 'SEWING', 'in production', 'GOOD', '', 1050, 0),
('COVER STITCH', 'PHILIPPINES', '122330', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1051, 0),
('COVER STITCH', 'PHILIPPINES', '80693', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1052, 0),
('COVER STITCH', 'PHILIPPINES', '126306', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1053, 0),
('COVER STITCH', 'PHILIPPINES', '126435', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1054, 0),
('COVER STITCH', 'PHILIPPINES', '50735', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1055, 0),
('COVER STITCH', 'PHILIPPINES', '126379', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1056, 0),
('COVER STITCH', 'PHILIPPINES', '80657', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1057, 0),
('COVER STITCH', 'PHILIPPINES', '40787', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1058, 0),
('COVER STITCH', 'PHILIPPINES', '89772', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1059, 0),
('COVER STITCH', 'PHILIPPINES', '103618', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1060, 0),
('COVER STITCH', 'PHILIPPINES', '89775', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1061, 0),
('COVER STITCH', 'PHILIPPINES', '89773', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1062, 0),
('COVER STITCH', 'PHILIPPINES', '99630', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1063, 0),
('COVER STITCH', 'PHILIPPINES', '3449122', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1064, 0),
('COVER STITCH', 'PHILIPPINES', '3454361', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1065, 0),
('COVER STITCH', 'PHILIPPINES', '939774', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1066, 0),
('COVER STITCH', 'PHILIPPINES', '3451369', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1067, 0),
('COVER STITCH', 'PHILIPPINES', '3452863', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1068, 0),
('COVER STITCH', 'PHILIPPINES', '3447409', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1069, 0),
('COVER STITCH', 'PHILIPPINES', '4230146', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1070, 0),
('COVER STITCH', 'PHILIPPINES', '3455162', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1071, 0),
('COVER STITCH', 'PHILIPPINES', '80626', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1072, 0),
('COVER STITCH', 'PHILIPPINES', '3450872', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1073, 0),
('COVER STITCH', 'PHILIPPINES', '3449138', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1074, 0),
('COVER STITCH', 'PHILIPPINES', '3448456', 'COVER STITCH - HEM/ATT.ELAS', 'W56201', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1075, 0),
('COVER STITCH', 'PHILIPPINES', '35735', 'COVER STITCH - HEM/ATT.ELAS', 'W56202GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1076, 0),
('COVER STITCH', 'PHILIPPINES', '35223', 'COVER STITCH - HEM/ATT.ELAS', 'W56202GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1077, 0),
('COVER STITCH', 'PHILIPPINES', '80632', 'COVER STITCH - HEM/ATT.ELAS', 'W56202GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1078, 0),
('COVER STITCH', 'PHILIPPINES', '356210', 'COVER STITCH - HEM/ATT.ELAS', 'W56202GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1079, 0),
('COVER STITCH', 'PHILIPPINES', '3445675', 'COVER STITCH - HEM/ATT.ELAS', 'W56202GB', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1080, 0),
('COVER STITCH', 'PHILIPPINES', '307542941', 'COVER STITCH - HEM/ATT.ELAS', 'FTT006366', 'N/A', 'KINGTEX', '605', 'SEWING', 'in production', 'GOOD', '', 1081, 0),
('COVER STITCH', 'PHILIPPINES', 'KH007A-0458003', 'COVER STITCH - HEM/ATT.ELAS', 'CW52204X248', 'N/A', 'PEGASUS', '605', 'SEWING', 'in production', 'GOOD', '', 1082, 0),
('OVERLOCK', 'PHILIPPINES', '366249', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1083, 0),
('OVERLOCK', 'PHILIPPINES', '365935', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1084, 0),
('OVERLOCK', 'PHILIPPINES', '366269', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1085, 0),
('OVERLOCK', 'PHILIPPINES', '366034', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1086, 0),
('OVERLOCK', 'PHILIPPINES', '114572', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1087, 0),
('OVERLOCK', 'PHILIPPINES', '8019439', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1088, 0),
('OVERLOCK', 'PHILIPPINES', '366202', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1089, 0),
('OVERLOCK', 'PHILIPPINES', '366068', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1090, 0),
('OVERLOCK', 'PHILIPPINES', '365966', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1091, 0),
('OVERLOCK', 'PHILIPPINES', '109293', 'OVERLOCK - JOINING/HEM', 'W7213H', 'N/A', 'JUKI', '503', 'SEWING', 'in production', 'GOOD', '', 1092, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530022', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1093, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530001', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1094, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530068', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1095, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530080', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1096, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530054', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1097, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530063', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1098, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230126', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1099, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230146', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1100, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '423139', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1101, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530098', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1102, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230154', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1103, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230137', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1104, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230134', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1105, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530042', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1106, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530065', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1107, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230142', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1108, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230067', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1109, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230133', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1110, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230151', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1111, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530017', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1112, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230050', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1113, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230140', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1114, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230069', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1115, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230162', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1116, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530074', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1117, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230116', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1118, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230141', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1119, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530303', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1120, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230136', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1121, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '306083062', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'KINGTEX', '302', 'SEWING', 'in production', 'GOOD', '', 1122, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'B0513092', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1123, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530070', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1124, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530094', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1125, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530052', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1126, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530036', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1127, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530038', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1128, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530021', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1129, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4930075', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1130, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530076', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1131, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530033', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1132, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230130', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1133, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530015', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1134, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'A4185683', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B8423', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1135, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L3179711', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TN842A033', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1136, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'L3179704', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TN842A033', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1137, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F3160695', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TN842A033', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1138, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', 'F3160656', 'DOUBLE NEEDLE- SPREAD/OPEN', 'TN842A033', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1139, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530056', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1140, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4530057', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1141, 0),
('DOUBLE NEEDLE', 'PHILIPPINES', '4230144', 'DOUBLE NEEDLE- SPREAD/OPEN', 'LT2B842380', 'N/A', 'BROTHER', '302', 'SEWING', 'in production', 'GOOD', '', 1142, 0),
('OVERLOCK', 'PHILIPPINES', '8083453', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#2', 'from Sunrin', 'GOOD', '', 1143, 0),
('OVERLOCK', 'PHILIPPINES', '8074686', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#3', 'from Sunrin', 'GOOD', '', 1144, 0),
('OVERLOCK', 'PHILIPPINES', '8083459', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#4', 'from Sunrin', 'GOOD', '', 1145, 0),
('OVERLOCK', 'PHILIPPINES', '8082619', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#5', 'from Sunrin', 'GOOD', '', 1146, 0),
('OVERLOCK', 'PHILIPPINES', '8083454', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#6', 'from Sunrin', 'GOOD', '', 1147, 0),
('OVERLOCK', 'PHILIPPINES', '8074761', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#7', 'from Sunrin', 'GOOD', '', 1148, 0),
('OVERLOCK', 'PHILIPPINES', '8082851', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#8', 'from Sunrin', 'GOOD', '', 1149, 0),
('OVERLOCK', 'PHILIPPINES', '8080402', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#9', 'from Sunrin', 'GOOD', '', 1150, 0),
('OVERLOCK', 'PHILIPPINES', '8082866', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#10', 'from Sunrin', 'GOOD', '', 1151, 0),
('OVERLOCK', 'PHILIPPINES', '8082895', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#11', 'from Sunrin', 'GOOD', '', 1152, 0),
('OVERLOCK', 'PHILIPPINES', '8082612', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#12', 'from Sunrin', 'GOOD', '', 1153, 0),
('OVERLOCK', 'PHILIPPINES', '8082855', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#13', 'from Sunrin', 'GOOD', '', 1154, 0),
('OVERLOCK', 'PHILIPPINES', '8083455', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#14', 'from Sunrin', 'GOOD', '', 1155, 0),
('OVERLOCK', 'PHILIPPINES', '8082877', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#15', 'from Sunrin', 'GOOD', '', 1156, 0),
('OVERLOCK', 'PHILIPPINES', '8083452', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#16', 'from Sunrin', 'GOOD', '', 1157, 0),
('OVERLOCK', 'PHILIPPINES', '8082906', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#17', 'from Sunrin', 'GOOD', '', 1158, 0),
('OVERLOCK', 'PHILIPPINES', '8062788', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#18', 'from Sunrin', 'GOOD', '', 1159, 0),
('OVERLOCK', 'PHILIPPINES', '8062920', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#19', 'from Sunrin', 'GOOD', '', 1160, 0),
('OVERLOCK', 'PHILIPPINES', '8062549', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#20', 'from Sunrin', 'GOOD', '', 1161, 0),
('OVERLOCK', 'PHILIPPINES', '8062926', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#21', 'from Sunrin', 'GOOD', '', 1162, 0),
('OVERLOCK', 'PHILIPPINES', '8061073', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#22', 'from Sunrin', 'GOOD', '', 1163, 0),
('OVERLOCK', 'PHILIPPINES', '8062871', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#23', 'from Sunrin', 'GOOD', '', 1164, 0),
('OVERLOCK', 'PHILIPPINES', '8062762', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#24', 'from Sunrin', 'GOOD', '', 1165, 0),
('OVERLOCK', 'PHILIPPINES', '8062773', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#25', 'from Sunrin', 'GOOD', '', 1166, 0),
('OVERLOCK', 'PHILIPPINES', '8062750', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#26', 'from Sunrin', 'GOOD', '', 1167, 0),
('OVERLOCK', 'PHILIPPINES', '8062731', 'OVERLOCK - JOINING/HEM', 'UH8023', 'N/A', 'KINGTEX', '503', 'RACK#27', 'from Sunrin', 'GOOD', '', 1168, 0),
('OVERLOCK', 'PHILIPPINES', '8062883', 'OVERLOCK - JOINING/HEM', 'UH8023', 'N/A', 'KINGTEX', '503', 'RACK#28', 'from Sunrin', 'GOOD', '', 1169, 0),
('OVERLOCK', 'PHILIPPINES', '80628900', 'OVERLOCK - JOINING/HEM', 'UH8024', 'N/A', 'KINGTEX', '503', 'RACK#29', 'from Sunrin', 'GOOD', '', 1170, 0),
('OVERLOCK', 'PHILIPPINES', '8062787', 'OVERLOCK - JOINING/HEM', 'UH8024', 'N/A', 'KINGTEX', '503', 'RACK#30', 'from Sunrin', 'GOOD', '', 1171, 0),
('OVERLOCK', 'PHILIPPINES', '8072051', 'OVERLOCK - JOINING/HEM', 'UH9023', 'N/A', 'KINGTEX', '503', 'RACK#31', 'from Sunrin', 'GOOD', '', 1172, 0),
('OVERLOCK', 'PHILIPPINES', '8062279', 'OVERLOCK - JOINING/HEM', 'UH8004', 'N/A', 'KINGTEX', '503', 'RACK#32', 'from Sunrin', 'GOOD', '', 1173, 0),
('COVER STITCH', 'PHILIPPINES', '31000964E', 'COVER STITCH - HEM/ATT.ELAS', 'FT3003', 'N/A', 'KINGTEX', '605', 'RACK#33', 'from Sunrin', 'GOOD', '', 1174, 0),
('COVER STITCH', 'PHILIPPINES', '31811537', 'COVER STITCH - HEM/ATT.ELAS', 'FT3003', 'N/A', 'KINGTEX', '605', 'RACK#34', 'from Sunrin', 'GOOD', '', 1175, 0),
('COVER STITCH', 'PHILIPPINES', '31001016', 'COVER STITCH - HEM/ATT.ELAS', 'FT3003', 'N/A', 'KINGTEX', '605', 'RACK#35', 'from Sunrin', 'GOOD', '', 1176, 0),
('COVER STITCH', 'PHILIPPINES', '30810317A', 'COVER STITCH - HEM/ATT.ELAS', 'FT3003', 'N/A', 'KINGTEX', '605', 'RACK#36', 'from Sunrin', 'GOOD', '', 1177, 0),
('COVER STITCH', 'PHILIPPINES', '30800393', 'COVER STITCH - HEM/ATT.ELAS', 'FT3003', 'N/A', 'KINGTEX', '605', 'RACK#37', 'from Sunrin', 'GOOD', '', 1178, 0),
('COVER STITCH', 'PHILIPPINES', '31100851C', 'COVER STITCH - HEM/ATT.ELAS', 'FT7039', 'N/A', 'KINGTEX', '605', 'RACK#38', 'from Sunrin', 'GOOD', '', 1179, 0);

-- --------------------------------------------------------

--
-- Table structure for table `task_db`
--

CREATE TABLE `task_db` (
  `ID` int(11) NOT NULL,
  `EmpNo` int(11) DEFAULT NULL,
  `Severity` int(11) DEFAULT NULL,
  `BreakStartTime` time NOT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `location` varchar(40) DEFAULT NULL,
  `SpecialSerial` int(255) NOT NULL,
  `Assignee` int(5) DEFAULT NULL,
  `NotifNo` int(5) NOT NULL,
  `Status` int(11) DEFAULT NULL,
  `recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `details` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `task_db`
--

INSERT INTO `task_db` (`ID`, `EmpNo`, `Severity`, `BreakStartTime`, `StartTime`, `EndTime`, `StartDate`, `EndDate`, `location`, `SpecialSerial`, `Assignee`, `NotifNo`, `Status`, `recorded`, `details`) VALUES
(1, 49, NULL, '19:32:17', '21:14:00', '22:52:54', NULL, NULL, '143773', 0, 49, 1, 1, '2017-03-10 11:33:44', 11),
(2, 49, NULL, '00:00:00', '20:12:49', '20:19:26', NULL, NULL, '143773', 0, 49, 0, 3, '2016-11-24 12:19:26', 12),
(3, 49, NULL, '00:00:00', '11:56:42', '11:58:00', NULL, NULL, '143773', 0, 49, 0, 3, '2016-11-30 03:58:03', 3),
(4, 123, NULL, '00:00:00', NULL, NULL, NULL, NULL, '54321', 0, 123, 0, 1, '2016-11-30 03:50:22', 9),
(5, 49, NULL, '00:00:00', '13:44:35', '13:45:20', NULL, NULL, '143773', 0, 49, 0, 3, '2016-11-30 05:45:21', 18),
(6, 49, NULL, '00:00:00', '13:52:52', '13:53:29', NULL, NULL, '143773', 0, 49, 0, 3, '2016-11-30 05:53:30', 12),
(7, 49, NULL, '00:00:00', '09:20:07', '09:22:27', NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-06 01:22:28', 12),
(8, 49, NULL, '00:00:00', '09:52:00', '09:55:05', NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-06 01:55:06', 10),
(9, 49, NULL, '00:00:00', '10:24:08', '10:42:24', NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-06 02:42:25', 3),
(10, 49, NULL, '00:00:00', '14:36:02', NULL, NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-06 06:44:04', 1),
(11, 49, NULL, '00:00:00', '14:48:09', '16:59:50', NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-06 08:59:51', 20),
(12, 49, NULL, '19:04:05', NULL, NULL, NULL, NULL, '143773', 0, 93127, 0, 1, '2017-03-09 11:04:05', 20),
(13, 49, NULL, '00:00:00', '11:09:19', '11:10:48', NULL, NULL, '143773', 0, 49, 0, 3, '2016-12-15 03:10:49', 15),
(14, 49, NULL, '19:02:31', '11:33:16', '11:51:15', NULL, NULL, '143773', 0, 479, 0, 1, '2017-03-09 11:02:31', 8),
(15, 49, NULL, '19:03:47', NULL, NULL, NULL, NULL, '143773', 0, 6114, 0, 1, '2017-03-09 11:03:47', 3),
(16, 123, NULL, '00:00:00', '18:39:17', '18:41:21', NULL, NULL, '54321', 0, 49, 0, 3, '2017-01-16 10:41:22', 11),
(17, 49, NULL, '00:00:00', '18:51:39', '18:55:21', NULL, NULL, '143773', 0, 49, 0, 3, '2017-01-16 10:55:24', 6),
(18, 49, NULL, '19:04:15', NULL, NULL, NULL, NULL, '143773', 0, 92545, 0, 1, '2017-03-09 11:04:15', 10),
(19, 49, NULL, '19:40:06', NULL, NULL, NULL, NULL, '143773', 0, 92545, 0, 1, '2017-03-09 11:40:06', 8),
(20, 49, NULL, '19:40:39', NULL, NULL, NULL, NULL, '143773', 0, 479, 0, 1, '2017-03-09 11:40:39', 8),
(21, 49, NULL, '19:42:51', NULL, NULL, NULL, NULL, '143773', 0, 49, 0, 1, '2017-03-09 11:42:51', 4),
(22, 49, NULL, '19:43:26', NULL, NULL, NULL, NULL, '143773', 0, 93198, 0, 1, '2017-03-09 11:43:26', 10),
(23, 123, NULL, '19:43:12', NULL, NULL, NULL, NULL, '54321', 0, 479, 0, 1, '2017-03-10 11:43:12', 11),
(24, 1, NULL, '19:43:40', NULL, NULL, NULL, NULL, '2202009', 0, 93198, 0, 1, '2017-03-10 11:43:40', 12),
(25, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '0000-00-00 00:00:00', 1),
(26, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:46:38', 1),
(27, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:46:41', 1),
(28, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:47:14', 1),
(29, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:49:52', 1),
(30, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:50:06', 1),
(31, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '1', 0, NULL, 0, NULL, '2017-06-11 06:50:45', 13),
(32, 1, NULL, '00:00:00', NULL, NULL, NULL, NULL, '4', 0, NULL, 0, NULL, '2017-06-11 11:40:00', 4),
(33, 0, NULL, '00:00:00', NULL, NULL, NULL, NULL, '', 0, NULL, 0, NULL, '2017-06-12 13:55:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `timeout_db`
--

CREATE TABLE `timeout_db` (
  `id` int(11) NOT NULL,
  `taskID` int(11) NOT NULL,
  `mech` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `recorded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeout_db`
--

INSERT INTO `timeout_db` (`id`, `taskID`, `mech`, `date`, `time`, `recorded`) VALUES
(1, 1, 1, '2016-11-24', '15:19:28', '2016-11-24 07:19:28'),
(2, 5, 49, '2016-11-24', '16:38:33', '2016-11-24 08:38:33'),
(3, 7, 49, '2016-11-24', '17:15:19', '2016-11-24 09:15:19'),
(4, 12, 49, '2016-12-06', '17:32:01', '2016-12-06 09:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_db`
--

CREATE TABLE `user_db` (
  `rfid` int(10) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `NickName` varchar(15) NOT NULL,
  `EmpNo` int(10) NOT NULL,
  `location` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_db`
--

INSERT INTO `user_db` (`rfid`, `FirstName`, `LastName`, `NickName`, `EmpNo`, `location`) VALUES
(1234, 'Cynthia', 'Ilustre', 'Cynts', 286, 0),
(4567, 'Rocky', 'Simpliciano', 'Rocky', 514, 0),
(8901, 'Ramon', 'Escueta', 'Mon', 225, 0),
(7754087, 'Jose Marie', 'Maquinay', 'jomar', 49, 143773),
(2147483647, 'Edwin', 'Millena', 'popo', 123, 54321);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_db`
--
ALTER TABLE `account_db`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cancel_db`
--
ALTER TABLE `cancel_db`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`auto_num`);

--
-- Indexes for table `mbcode_db`
--
ALTER TABLE `mbcode_db`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `mbreak_db`
--
ALTER TABLE `mbreak_db`
  ADD UNIQUE KEY `TaskID` (`TaskID`);

--
-- Indexes for table `mech_db`
--
ALTER TABLE `mech_db`
  ADD PRIMARY KEY (`auto_num`),
  ADD UNIQUE KEY `empID` (`empID`),
  ADD UNIQUE KEY `auto_num` (`auto_num`);

--
-- Indexes for table `meetingatt_db`
--
ALTER TABLE `meetingatt_db`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meeting_db`
--
ALTER TABLE `meeting_db`
  ADD PRIMARY KEY (`meetingid`);

--
-- Indexes for table `notif_db`
--
ALTER TABLE `notif_db`
  ADD PRIMARY KEY (`NotifNo`),
  ADD UNIQUE KEY `NotifNo` (`NotifNo`);

--
-- Indexes for table `sm_db`
--
ALTER TABLE `sm_db`
  ADD PRIMARY KEY (`SpecialSerial`),
  ADD UNIQUE KEY `SpecialSerial` (`SpecialSerial`);

--
-- Indexes for table `task_db`
--
ALTER TABLE `task_db`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `timeout_db`
--
ALTER TABLE `timeout_db`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- Indexes for table `user_db`
--
ALTER TABLE `user_db`
  ADD UNIQUE KEY `rfid` (`rfid`),
  ADD UNIQUE KEY `EmpNo` (`EmpNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_db`
--
ALTER TABLE `account_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cancel_db`
--
ALTER TABLE `cancel_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hr`
--
ALTER TABLE `hr`
  MODIFY `auto_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `mech_db`
--
ALTER TABLE `mech_db`
  MODIFY `auto_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `meetingatt_db`
--
ALTER TABLE `meetingatt_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `meeting_db`
--
ALTER TABLE `meeting_db`
  MODIFY `meetingid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `notif_db`
--
ALTER TABLE `notif_db`
  MODIFY `NotifNo` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `task_db`
--
ALTER TABLE `task_db`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `timeout_db`
--
ALTER TABLE `timeout_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

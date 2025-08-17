-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2025 at 04:33 AM
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
-- Database: `hrsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `approvesalary`
--

CREATE TABLE `approvesalary` (
  `ID` int(11) NOT NULL,
  `Inmonth` int(11) DEFAULT NULL,
  `Inyear` int(11) DEFAULT NULL,
  `SumStaff` int(11) DEFAULT NULL,
  `SumAllowance` decimal(10,2) DEFAULT NULL,
  `SumBonus` decimal(10,2) DEFAULT NULL,
  `SumDedction` decimal(10,2) DEFAULT NULL,
  `SumNetpay` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `careerhistory`
--

CREATE TABLE `careerhistory` (
  `ID` int(11) NOT NULL,
  `CareerHistoryType` varchar(20) NOT NULL,
  `EmployeeID` varchar(20) NOT NULL,
  `Company` varchar(200) NOT NULL,
  `Division` varchar(255) NOT NULL,
  `PositionTitle` varchar(255) NOT NULL,
  `Department` varchar(255) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `Increase` decimal(18,2) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `careerhistory`
--

INSERT INTO `careerhistory` (`ID`, `CareerHistoryType`, `EmployeeID`, `Company`, `Division`, `PositionTitle`, `Department`, `StartDate`, `EndDate`, `Remark`, `Increase`, `CreatedAt`, `UpdatedAt`) VALUES
(15, 'NEW', 'A01', '', '', 'P03', 'IT', '2025-04-01', NULL, NULL, NULL, '2025-04-27 21:17:58', '2025-04-27 21:17:58'),
(16, 'NEW', 'A02', '', '', 'P05', 'HR', '2025-04-01', NULL, NULL, NULL, '2025-04-27 21:19:41', '2025-04-27 21:19:41'),
(19, 'PROMOTE', 'A03', '', '', 'Sale Manager', 'Human resource', '2025-05-01', NULL, NULL, NULL, '2025-05-03 21:42:08', '2025-08-15 13:29:14'),
(21, 'INCREASE', 'A03', '', '', 'Sale Manager', 'Human resource', '2025-08-15', '2025-08-16', NULL, 12.00, '2025-08-15 14:23:11', '2025-08-15 15:20:37'),
(22, 'NEW', 'A04', '', '', 'P01', 'IT', '2025-08-01', NULL, NULL, NULL, '2025-08-15 14:35:30', '2025-08-15 14:35:30');

-- --------------------------------------------------------

--
-- Table structure for table `hisgensalary`
--

CREATE TABLE `hisgensalary` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `InMonth` varchar(7) DEFAULT NULL,
  `Inyear` int(11) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Allowance` decimal(10,2) DEFAULT NULL,
  `OT` decimal(10,2) NOT NULL,
  `Bonus` decimal(10,2) DEFAULT NULL,
  `Dedction` decimal(10,2) DEFAULT NULL,
  `LeavedTax` decimal(10,2) DEFAULT NULL,
  `Amtobetax` decimal(10,2) DEFAULT NULL,
  `Grosspay` decimal(10,2) DEFAULT NULL,
  `Family` decimal(10,2) DEFAULT NULL,
  `UntaxAm` decimal(10,2) DEFAULT NULL,
  `NSSF` decimal(10,2) DEFAULT NULL,
  `NetSalary` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hisgensalary`
--

INSERT INTO `hisgensalary` (`ID`, `EmpCode`, `InMonth`, `Inyear`, `Salary`, `Allowance`, `OT`, `Bonus`, `Dedction`, `LeavedTax`, `Amtobetax`, `Grosspay`, `Family`, `UntaxAm`, `NSSF`, `NetSalary`) VALUES
(10, 'A01', '2025-05', 2025, 800.00, 30.00, 34.19, 123.00, 10.00, 0.00, 0.00, 987.19, 0.00, 0.00, 0.00, 977.19),
(11, 'A01', '2025-04', 2025, 800.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 800.00, 0.00, 0.00, 0.00, 800.00),
(12, 'A02', '2025-04', 2025, 99999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 99999.00, 0.00, 0.00, 0.00, 99999.00),
(13, 'A03', '2025-04', 2025, 123.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 123.00, 0.00, 0.00, 0.00, 123.00),
(14, 'A02', '2025-05', 2025, 99999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 99999.00, 0.00, 0.00, 0.00, 99999.00),
(15, 'A03', '2025-05', 2025, 123.00, 123.00, 2.10, 0.00, 10.00, 0.00, 0.00, 248.10, 0.00, 0.00, 0.00, 238.10);

-- --------------------------------------------------------

--
-- Table structure for table `hrcompany`
--

CREATE TABLE `hrcompany` (
  `Code` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrcompany`
--

INSERT INTO `hrcompany` (`Code`, `Description`, `Status`) VALUES
('CB', 'CLUBCODE', 'Active'),
('KVS ', 'KVS Furniture', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hrdepartment`
--

CREATE TABLE `hrdepartment` (
  `Code` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrdepartment`
--

INSERT INTO `hrdepartment` (`Code`, `Description`, `Status`) VALUES
('HR', 'Human resource', 'Active'),
('IT', 'Information technology', 'Active'),
('SALE', 'Maketing', 'Active'),
('OP', 'Operation', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hrdivision`
--

CREATE TABLE `hrdivision` (
  `Code` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrdivision`
--

INSERT INTO `hrdivision` (`Code`, `Description`, `Status`) VALUES
('D01', 'Research and Development', 'Active'),
('D02', 'Research', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hreducation`
--

CREATE TABLE `hreducation` (
  `Id` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `Institution` varchar(255) NOT NULL,
  `Degree` varchar(100) NOT NULL,
  `FieldOfStudy` varchar(255) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrfamily`
--

CREATE TABLE `hrfamily` (
  `EmpCode` varchar(20) NOT NULL,
  `RelationName` varchar(100) NOT NULL,
  `RelationType` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `IsTax` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrlevel`
--

CREATE TABLE `hrlevel` (
  `Code` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrlevel`
--

INSERT INTO `hrlevel` (`Code`, `Description`, `Status`) VALUES
('L1', 'CEO', 'Active'),
('L2', 'CFO', 'Active'),
('L3', 'Manager', 'Active'),
('L4', 'Senior', 'Active'),
('L5', 'Junoir', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hrposition`
--

CREATE TABLE `hrposition` (
  `Code` varchar(50) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrposition`
--

INSERT INTO `hrposition` (`Code`, `Description`, `Status`) VALUES
('P01', 'Full Stack Developer', 'Active'),
('P02', 'Sale Manager', 'Active'),
('P03', 'Senior Developer', 'Active'),
('P05', 'HR assistant', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hrstaffdocument`
--

CREATE TABLE `hrstaffdocument` (
  `EmpCode` varchar(20) NOT NULL,
  `DocType` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrstaffprofile`
--

CREATE TABLE `hrstaffprofile` (
  `EmpCode` varchar(20) NOT NULL,
  `EmpName` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Level` varchar(50) DEFAULT NULL,
  `Division` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Contact` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `LineManager` varchar(100) DEFAULT NULL,
  `Hod` varchar(100) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `IsProb` int(11) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `PayParameter` varchar(50) DEFAULT NULL,
  `Telegram` varchar(255) NOT NULL,
  `ProbationDate` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrstaffprofile`
--

INSERT INTO `hrstaffprofile` (`EmpCode`, `EmpName`, `Gender`, `Dob`, `Position`, `Department`, `Company`, `Level`, `Division`, `StartDate`, `Status`, `Contact`, `Email`, `Address`, `LineManager`, `Hod`, `Photo`, `IsProb`, `Salary`, `PayParameter`, `Telegram`, `ProbationDate`) VALUES
('A01', 'Phorn Khouch', 'Male', '2025-04-01', 'P03', 'IT', 'CB', NULL, 'D01', '2025-04-01', 'Active', '', '', '', '', '', 'Uploads/staff_photos/A01_1745763478.jpg', 0, 800.00, 'Staff', '', '0000-00-00'),
('A02', 'Sok kimheng', 'Male', '2025-04-01', 'P05', 'HR', 'CB', NULL, 'D01', '2025-04-01', 'Active', '', '', '', 'A01', 'A01', 'Uploads/staff_photos/A02_1745763581.jpg', 0, 99999.00, 'Staff', '', '0000-00-00'),
('A03', 'Sok Dara', 'Male', '2025-05-01', 'P02', 'HR', 'CB', NULL, 'D01', '2025-05-01', 'Active', '', '', '', '', 'A01', 'Uploads/staff_photos/A03_1746283328.jpg', 1, 123.00, 'Staff', '', '0000-00-00'),
('A04', 'Davidd', 'Male', '2025-02-05', 'P01', 'IT', 'KVS', NULL, 'D02', '2025-08-01', 'Active', '', '', '', '', 'A01', 'Uploads/staff_photos/A04_1755243330.jpg', 1, 350.00, '', 'chat 123', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `hrusers`
--

CREATE TABLE `hrusers` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` enum('admin','manager','staff') NOT NULL DEFAULT 'staff',
  `Status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `LastLogin` datetime DEFAULT NULL,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hrusers`
--

INSERT INTO `hrusers` (`UserID`, `Username`, `Password`, `Email`, `Role`, `Status`, `LastLogin`, `CreatedAt`, `UpdatedAt`) VALUES
(5, 'A01', '123', 'pkhouch97@gmail.com', 'staff', 'active', NULL, '2025-05-03 19:30:38', '2025-05-04 15:00:17'),
(6, 'admin', '123', 'pkhouch@gmail.com', 'admin', 'active', NULL, '2025-05-04 15:03:42', '2025-08-15 14:47:25'),
(7, 'A02', '123', 'admin123@gmil.com', 'staff', 'active', NULL, '2025-05-04 21:19:54', '2025-05-04 21:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `hruser_permissions`
--

CREATE TABLE `hruser_permissions` (
  `PermissionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ModuleName` varchar(50) NOT NULL,
  `CanView` tinyint(1) NOT NULL DEFAULT 0,
  `CanCreate` tinyint(1) NOT NULL DEFAULT 0,
  `CanEdit` tinyint(1) NOT NULL DEFAULT 0,
  `CanDelete` tinyint(1) NOT NULL DEFAULT 0,
  `CreatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lmleavebalance`
--

CREATE TABLE `lmleavebalance` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `LeaveType` varchar(20) DEFAULT NULL,
  `Balance` decimal(5,2) DEFAULT NULL,
  `Entitle` decimal(5,2) DEFAULT NULL,
  `CurrentBalance` decimal(5,2) DEFAULT NULL,
  `Taken` decimal(5,2) DEFAULT NULL,
  `inmonth` int(11) NOT NULL,
  `inyear` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `DefaultBalance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lmleavebalance`
--

INSERT INTO `lmleavebalance` (`ID`, `EmpCode`, `LeaveType`, `Balance`, `Entitle`, `CurrentBalance`, `Taken`, `inmonth`, `inyear`, `created_at`, `DefaultBalance`) VALUES
(207, 'A01', 'SL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(208, 'A01', 'AL', 13.50, 13.50, 3.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(209, 'A01', 'SPL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(210, 'A02', 'SL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(211, 'A02', 'AL', 13.50, 13.50, 1.00, 2.00, 0, 2025, '0000-00-00 00:00:00', 0),
(212, 'A02', 'SPL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(213, 'A03', 'SL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(214, 'A03', 'AL', 12.00, 12.00, 1.50, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(215, 'A03', 'SPL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(216, 'A04', 'SL', 7.00, 7.00, 4.00, 3.00, 0, 2025, '0000-00-00 00:00:00', 0),
(217, 'A04', 'AL', 7.50, 7.50, 1.50, 0.00, 0, 2025, '0000-00-00 00:00:00', 0),
(218, 'A04', 'SPL', 7.00, 7.00, 7.00, 0.00, 0, 2025, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lmleaverequest`
--

CREATE TABLE `lmleaverequest` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `LeaveType` varchar(20) DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `LeaveDay` int(11) NOT NULL,
  `PHOrOffDay` int(11) NOT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ApprovedBy` varchar(250) NOT NULL,
  `RejectedBy` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lmleaverequest`
--

INSERT INTO `lmleaverequest` (`ID`, `EmpCode`, `LeaveType`, `Reason`, `FromDate`, `ToDate`, `LeaveDay`, `PHOrOffDay`, `Status`, `UpdatedAt`, `ApprovedBy`, `RejectedBy`) VALUES
(21, 'A02', 'SPL', 'test', '2025-05-06', '2025-05-10', 4, 0, 'Approved', '2025-05-02 14:53:13', 'HR Admin', ''),
(22, 'A02', 'AL', 'test', '2025-05-09', '2025-05-09', 1, 0, 'Approved', '2025-05-02 15:13:27', 'HR Admin', ''),
(20, 'A01', 'AL', 'test', '2025-05-01', '2025-05-01', 1, 0, 'Rejected', '2025-05-02 14:50:48', '', 'HR Admin'),
(23, 'A02', 'AL', 'test', '2025-05-12', '2025-05-12', 1, 0, 'Approved', '2025-05-02 15:12:34', 'HR Admin', ''),
(24, 'A02', 'AL', 'test', '2025-05-03', '2025-05-05', 1, 0, 'Approved', '2025-05-02 15:14:28', 'HR Admin', ''),
(25, 'A01', 'AL', 'test', '2025-05-13', '2025-05-13', 1, 0, 'Approved', '2025-05-02 15:15:15', 'HR Admin', ''),
(27, 'A02', 'AL', 'test', '2025-05-16', '2025-05-23', 6, 0, 'Rejected', '2025-05-03 09:57:36', '', 'HR Admin'),
(28, 'A03', 'AL', 'test', '2025-05-06', '2025-05-09', 4, 0, 'Approved', '2025-05-03 14:47:35', 'HR Admin', ''),
(30, 'A03', 'AL', 'test', '2025-05-15', '2025-05-15', 1, 0, 'Rejected', '2025-05-03 14:51:39', '', 'HR Admin'),
(31, 'A03', 'AL', 'test', '2025-05-14', '2025-05-14', 1, 0, 'Approved', '2025-05-03 14:56:10', 'HR Admin', ''),
(32, 'A04', 'AL', 'Headach', '2025-08-15', '2025-08-16', 1, 0, 'Approved', '2025-08-15 08:51:57', '', ''),
(33, 'A04', 'SL', 'Headach', '2025-08-01', '2025-08-05', 3, 0, 'Approved', '2025-08-15 08:53:24', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lmleavetype`
--

CREATE TABLE `lmleavetype` (
  `Code` varchar(20) NOT NULL,
  `LeaveType` varchar(255) DEFAULT NULL,
  `IsProbation` tinyint(1) DEFAULT NULL,
  `IsDeduct` tinyint(1) DEFAULT NULL,
  `IsOverBalance` tinyint(1) DEFAULT NULL,
  `default_balance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lmleavetype`
--

INSERT INTO `lmleavetype` (`Code`, `LeaveType`, `IsProbation`, `IsDeduct`, `IsOverBalance`, `default_balance`) VALUES
('ML', 'Materity Leave', 0, 0, 0, 90),
('SL', 'Sick Leave', 0, 0, 0, 7),
('AL', 'Annaul Leave', 1, 0, 0, 18),
('SPL', 'Special Leave', 0, 0, 0, 7),
('UL', 'Unpaid Leave', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `prallowance`
--

CREATE TABLE `prallowance` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `AllowanceType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Remark` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prallowance`
--

INSERT INTO `prallowance` (`ID`, `EmpCode`, `AllowanceType`, `Description`, `FromDate`, `ToDate`, `Amount`, `Status`, `Remark`) VALUES
(3, 'A03', 'Meal', 'test', '2025-05-01', '2025-05-30', 123.00, 'Active', ''),
(4, 'A01', 'Meal', 'test', '2025-05-06', '2025-05-23', 10.00, 'Active', ''),
(5, 'A01', 'Phone', 'test', '2025-05-01', '2025-05-31', 20.00, 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `prapprovesalary`
--

CREATE TABLE `prapprovesalary` (
  `ID` int(11) NOT NULL,
  `InMonth` varchar(7) NOT NULL,
  `Remark` varchar(500) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prapprovesalary`
--

INSERT INTO `prapprovesalary` (`ID`, `InMonth`, `Remark`, `status`) VALUES
(1, '2025-02', NULL, 'Pending'),
(2, '2025-05', NULL, 'Pending'),
(3, '2025-04', NULL, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `prbenefit`
--

CREATE TABLE `prbenefit` (
  `Code` varchar(50) NOT NULL,
  `Des` text DEFAULT NULL,
  `IsTax` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prbonus`
--

CREATE TABLE `prbonus` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `BonusType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Remark` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prbonus`
--

INSERT INTO `prbonus` (`ID`, `EmpCode`, `BonusType`, `Description`, `FromDate`, `ToDate`, `Amount`, `Status`, `Remark`) VALUES
(2, 'A01', 'dfs', 'test', '2025-05-23', '2025-05-23', 123.00, 'Active', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `prdeduction`
--

CREATE TABLE `prdeduction` (
  `Prdeduction` datetime DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `DeductType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Remark` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prdeduction`
--

INSERT INTO `prdeduction` (`Prdeduction`, `ID`, `EmpCode`, `DeductType`, `Description`, `FromDate`, `ToDate`, `Amount`, `Status`, `Remark`) VALUES
(NULL, 2, 'A03', 'Late', 'test', '2025-05-10', '2025-05-10', 10.00, 'Active', ''),
(NULL, 3, 'A01', 'Late', 'late deduction', '2025-05-14', '2025-05-14', 10.00, 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `prleavededuct`
--

CREATE TABLE `prleavededuct` (
  `ID` int(11) NOT NULL,
  `EmpCode` varchar(50) DEFAULT NULL,
  `LeaveType` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `FromDate` date DEFAULT NULL,
  `ToDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Remark` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `protrate`
--

CREATE TABLE `protrate` (
  `Code` varchar(50) NOT NULL,
  `Des` text DEFAULT NULL,
  `Rate` decimal(5,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `protrate`
--

INSERT INTO `protrate` (`Code`, `Des`, `Rate`) VALUES
('SUN', 'OT Sunday', 200.00),
('PH', 'Public Holiday', 300.00),
('P', 'Personal Holiday', 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `provertime`
--

CREATE TABLE `provertime` (
  `Provtime` datetime DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Empcode` varchar(50) DEFAULT NULL,
  `OTType` varchar(50) DEFAULT NULL,
  `OTDate` date DEFAULT NULL,
  `FromTime` time DEFAULT NULL,
  `ToTime` time DEFAULT NULL,
  `hour` decimal(5,2) DEFAULT NULL,
  `Reason` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provertime`
--

INSERT INTO `provertime` (`Provtime`, `ID`, `Empcode`, `OTType`, `OTDate`, `FromTime`, `ToTime`, `hour`, `Reason`) VALUES
('2025-05-11 16:20:38', 1, 'A03', 'PH', '2025-05-11', '18:00:00', '22:00:00', 4.00, 'test'),
('2025-05-11 21:38:26', 2, 'A01', 'PH', '2025-05-14', '07:00:00', '17:00:00', 10.00, 'PH OT ');

-- --------------------------------------------------------

--
-- Table structure for table `prpaypolicy`
--

CREATE TABLE `prpaypolicy` (
  `id` int(11) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `workday` int(11) DEFAULT NULL,
  `hourperday` float DEFAULT NULL,
  `hourperweek` float DEFAULT NULL,
  `fromdate` date DEFAULT NULL,
  `todate` date DEFAULT NULL,
  `mon` tinyint(1) DEFAULT 0,
  `monhours` float DEFAULT 0,
  `tues` tinyint(1) DEFAULT 0,
  `tueshours` float DEFAULT 0,
  `wed` tinyint(1) DEFAULT 0,
  `wedhours` float DEFAULT 0,
  `thur` tinyint(1) DEFAULT 0,
  `thurhours` float DEFAULT 0,
  `fri` tinyint(1) DEFAULT 0,
  `frihours` float DEFAULT 0,
  `sat` tinyint(1) DEFAULT 0,
  `sathours` float DEFAULT 0,
  `sun` tinyint(1) DEFAULT 0,
  `sunhours` float DEFAULT 0,
  `tue` tinyint(4) DEFAULT 0,
  `tueHours` int(11) DEFAULT 8,
  `thu` tinyint(4) DEFAULT 0,
  `thuHours` int(11) DEFAULT 8
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prpaypolicy`
--

INSERT INTO `prpaypolicy` (`id`, `code`, `description`, `workday`, `hourperday`, `hourperweek`, `fromdate`, `todate`, `mon`, `monhours`, `tues`, `tueshours`, `wed`, `wedhours`, `thur`, `thurhours`, `fri`, `frihours`, `sat`, `sathours`, `sun`, `sunhours`, `tue`, `tueHours`, `thu`, `thuHours`) VALUES
(10, 'Staff', 'Staff ', 28, 8, 224, '2025-08-15', '2025-08-15', 1, 8, 1, 1, 1, 8, 1, 1, 1, 8, 1, 8, 1, 8, 1, 8, 1, 8),
(11, 'Staff', 'Staff Operation', 26, 8, NULL, '2025-08-15', '2025-08-15', 1, 8, 1, 0, 1, 8, 1, 0, 1, 8, 1, 8, 1, 8, 0, 8, 0, 8),
(12, 'Staff', 'Staff Office', 30, 8, 240, '2025-08-15', '2025-08-15', 1, 8, 1, 1, 1, 8, 1, 1, 1, 8, 1, 8, 1, 8, 0, 8, 0, 8),
(13, 'Staff', 'Manager', 25, 8, 200, '2025-08-15', '2025-08-15', 1, 8, 1, 1, 1, 8, 1, 1, 1, 8, 1, 8, 1, 8, 0, 8, 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `prtaxrate`
--

CREATE TABLE `prtaxrate` (
  `id` int(11) NOT NULL,
  `AmountFrom` decimal(10,2) NOT NULL,
  `AmountTo` decimal(10,2) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prtaxrate`
--

INSERT INTO `prtaxrate` (`id`, `AmountFrom`, `AmountTo`, `rate`, `status`, `created_at`, `updated_at`) VALUES
(5, 0.00, 1200000.00, 0.00, 1, '2025-05-15 07:12:36', '2025-05-15 07:12:36'),
(6, 1200001.00, 2500000.00, 5.00, 1, '2025-05-15 07:12:58', '2025-05-15 07:12:58'),
(7, 2500001.00, 3500000.00, 15.00, 1, '2025-05-15 07:13:27', '2025-05-15 07:13:27'),
(8, 3500001.00, 99999999.99, 20.00, 1, '2025-05-15 07:13:45', '2025-08-15 04:23:23'),
(10, 99999999.99, 99999999.99, 25.00, 1, '2025-08-15 04:24:47', '2025-08-15 04:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `pr_benefit_setting`
--

CREATE TABLE `pr_benefit_setting` (
  `Code` varchar(20) NOT NULL,
  `Description` varchar(250) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Type` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pr_benefit_setting`
--

INSERT INTO `pr_benefit_setting` (`Code`, `Description`, `Status`, `Type`) VALUES
('Meal', 'Meal Allowance', 'A', 'Allowance'),
('Ann', 'Annaul Bonus', 'A', 'Bonus');

-- --------------------------------------------------------

--
-- Table structure for table `public_holidays`
--

CREATE TABLE `public_holidays` (
  `id` int(11) NOT NULL,
  `holiday_name` varchar(255) NOT NULL,
  `holiday_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `public_holidays`
--

INSERT INTO `public_holidays` (`id`, `holiday_name`, `holiday_date`, `description`, `created_at`, `updated_at`) VALUES
(4, 'KNY', '2025-04-12', 'Khmer New Year', '2025-04-17 08:00:04', '2025-08-15 03:32:36'),
(5, 'CNY', '2025-01-30', 'Chinese New Year', '2025-08-15 03:33:32', '2025-08-15 03:33:32');

-- --------------------------------------------------------

--
-- Table structure for table `rcmapplicant`
--

CREATE TABLE `rcmapplicant` (
  `ID` int(11) NOT NULL,
  `AppId` varchar(50) DEFAULT NULL,
  `AppName` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `ApplyPost` varchar(100) DEFAULT NULL,
  `Education` text DEFAULT NULL,
  `Pob` varchar(100) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Experience` text DEFAULT NULL,
  `Remark` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Recruited` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rcminterprocess`
--

CREATE TABLE `rcminterprocess` (
  `ID` int(11) NOT NULL,
  `AppId` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Attachment` text DEFAULT NULL,
  `InterDate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rcmletteroffer`
--

CREATE TABLE `rcmletteroffer` (
  `ID` int(11) NOT NULL,
  `AppId` varchar(50) DEFAULT NULL,
  `Recruited` tinyint(1) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rcmonboarding`
--

CREATE TABLE `rcmonboarding` (
  `ID` int(11) NOT NULL,
  `AppId` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Files` text DEFAULT NULL,
  `Photo` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sytelegram_config`
--

CREATE TABLE `sytelegram_config` (
  `id` int(11) NOT NULL,
  `chat_name` varchar(255) NOT NULL,
  `chat_id` varchar(500) NOT NULL,
  `bot_token` text NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sytelegram_config`
--

INSERT INTO `sytelegram_config` (`id`, `chat_name`, `chat_id`, `bot_token`, `description`, `status`) VALUES
(4, 'fsdg', 'sdds', 'gsd', 'dsg', 1),
(5, 'fsdfs', 'f534546', '655657', '', 1),
(6, 'Hello', 'chat 123', '12324edawedeaw', 'Test telegram', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approvesalary`
--
ALTER TABLE `approvesalary`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `careerhistory`
--
ALTER TABLE `careerhistory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `hisgensalary`
--
ALTER TABLE `hisgensalary`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hrcompany`
--
ALTER TABLE `hrcompany`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `hrdepartment`
--
ALTER TABLE `hrdepartment`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `hrdivision`
--
ALTER TABLE `hrdivision`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `hreducation`
--
ALTER TABLE `hreducation`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `EmpCode` (`EmpCode`);

--
-- Indexes for table `hrfamily`
--
ALTER TABLE `hrfamily`
  ADD PRIMARY KEY (`EmpCode`,`RelationName`);

--
-- Indexes for table `hrlevel`
--
ALTER TABLE `hrlevel`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `hrposition`
--
ALTER TABLE `hrposition`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `hrstaffdocument`
--
ALTER TABLE `hrstaffdocument`
  ADD PRIMARY KEY (`EmpCode`,`DocType`);

--
-- Indexes for table `hrstaffprofile`
--
ALTER TABLE `hrstaffprofile`
  ADD PRIMARY KEY (`EmpCode`);

--
-- Indexes for table `hrusers`
--
ALTER TABLE `hrusers`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_username` (`Username`),
  ADD KEY `idx_email` (`Email`),
  ADD KEY `idx_status` (`Status`);

--
-- Indexes for table `hruser_permissions`
--
ALTER TABLE `hruser_permissions`
  ADD PRIMARY KEY (`PermissionID`),
  ADD UNIQUE KEY `user_module` (`UserID`,`ModuleName`);

--
-- Indexes for table `lmleavebalance`
--
ALTER TABLE `lmleavebalance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lmleaverequest`
--
ALTER TABLE `lmleaverequest`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lmleavetype`
--
ALTER TABLE `lmleavetype`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `prallowance`
--
ALTER TABLE `prallowance`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prapprovesalary`
--
ALTER TABLE `prapprovesalary`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prbenefit`
--
ALTER TABLE `prbenefit`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `prbonus`
--
ALTER TABLE `prbonus`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prdeduction`
--
ALTER TABLE `prdeduction`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prleavededuct`
--
ALTER TABLE `prleavededuct`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `protrate`
--
ALTER TABLE `protrate`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `provertime`
--
ALTER TABLE `provertime`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prpaypolicy`
--
ALTER TABLE `prpaypolicy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prtaxrate`
--
ALTER TABLE `prtaxrate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_amount_range` (`AmountFrom`,`AmountTo`);

--
-- Indexes for table `pr_benefit_setting`
--
ALTER TABLE `pr_benefit_setting`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `public_holidays`
--
ALTER TABLE `public_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rcmapplicant`
--
ALTER TABLE `rcmapplicant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rcminterprocess`
--
ALTER TABLE `rcminterprocess`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rcmletteroffer`
--
ALTER TABLE `rcmletteroffer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rcmonboarding`
--
ALTER TABLE `rcmonboarding`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sytelegram_config`
--
ALTER TABLE `sytelegram_config`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `careerhistory`
--
ALTER TABLE `careerhistory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `hisgensalary`
--
ALTER TABLE `hisgensalary`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `hreducation`
--
ALTER TABLE `hreducation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hrusers`
--
ALTER TABLE `hrusers`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hruser_permissions`
--
ALTER TABLE `hruser_permissions`
  MODIFY `PermissionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lmleavebalance`
--
ALTER TABLE `lmleavebalance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `lmleaverequest`
--
ALTER TABLE `lmleaverequest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `prallowance`
--
ALTER TABLE `prallowance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prapprovesalary`
--
ALTER TABLE `prapprovesalary`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prbonus`
--
ALTER TABLE `prbonus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prdeduction`
--
ALTER TABLE `prdeduction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provertime`
--
ALTER TABLE `provertime`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prpaypolicy`
--
ALTER TABLE `prpaypolicy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `prtaxrate`
--
ALTER TABLE `prtaxrate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `public_holidays`
--
ALTER TABLE `public_holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sytelegram_config`
--
ALTER TABLE `sytelegram_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hruser_permissions`
--
ALTER TABLE `hruser_permissions`
  ADD CONSTRAINT `hruser_permissions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `hrusers` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 01, 2026 at 06:25 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tostylemou`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Selfie', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(2, 'Friends', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(3, 'Family', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(4, 'Travel', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(5, 'Nature', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(6, 'Photography', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(7, 'Food', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(8, 'Cooking', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(9, 'Fitness', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(10, 'Gym', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(11, 'Fashion', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(12, 'Outfit', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(13, 'Lifestyle', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(14, 'Motivation', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(15, 'Memes', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(16, 'Funny', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(17, 'Pets', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(18, 'Cars', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(19, 'Bikes', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(20, 'Sports', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(21, 'Cricket', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(22, 'Football', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(23, 'Gaming', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(24, 'Music', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(25, 'Dance', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(26, 'Art', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(27, 'Drawing', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(28, 'Painting', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(29, 'Books', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(30, 'Study', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(31, 'College Life', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(32, 'Work Life', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(33, 'Business', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(34, 'Technology', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(35, 'Programming', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(36, 'Festivals', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(37, 'Spiritual', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(38, 'Temple', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(39, 'Sunset', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(40, 'Sunrise', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(41, 'Beach', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(42, 'Mountains', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(43, 'City Life', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(44, 'Night Life', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(45, 'Shopping', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(46, 'Makeup', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(47, 'Hair Style', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(48, 'Reels', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(49, 'Vlog', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05'),
(50, 'Daily Life', 1, '2026-03-07 07:09:05', '2026-03-07 07:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `comment_text` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`comment_id`, `post_id`, `user_id`, `comment_text`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Beautiful sunset!', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(2, 1, 3, 'Nice shot', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(3, 1, 5, 'Amazing view', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(4, 2, 1, 'Looks fun!', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(5, 2, 3, 'Goa is always the best', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(6, 3, 2, 'Option 2 looks better', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(7, 3, 4, 'I like option 4', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(8, 4, 1, 'Great workout', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(9, 4, 3, 'Stay consistent', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(10, 6, 1, 'Looks like a great evening', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(11, 6, 5, 'Miss these moments', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(12, 8, 2, 'Udaipur is beautiful', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(13, 8, 4, 'Nice video', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(14, 10, 1, 'Garba vibes!', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(15, 10, 3, 'Looks amazing', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(16, 11, 2, 'Red one is perfect', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(17, 11, 4, 'Blue looks elegant', 1, '2026-03-07 07:25:18', '2026-03-07 07:25:18'),
(18, 3, 9, 'I loved this post and you!', 1, '2026-03-29 17:26:49', '2026-03-29 17:26:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact_us`
--

DROP TABLE IF EXISTS `tbl_contact_us`;
CREATE TABLE IF NOT EXISTS `tbl_contact_us` (
  `contact_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `full_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_contact_us`
--

INSERT INTO `tbl_contact_us` (`contact_id`, `user_id`, `full_name`, `email`, `subject`, `description`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jay Patel', 'jaypatel@gmail.com', 'Feature Request', 'Please add dark mode in the app', 1, 0, '2026-03-07 07:27:16', '2026-03-07 07:27:16'),
(2, 3, 'Riya Mehta', 'riya@gmail.com', 'Bug Report', 'Video upload failed once while posting', 1, 0, '2026-03-07 07:27:16', '2026-03-07 07:27:16'),
(3, 5, 'Ananya Desai', 'ananya@gmail.com', 'Account Issue', 'I am unable to change my username', 1, 0, '2026-03-07 07:27:16', '2026-03-07 07:27:16'),
(4, 2, 'Aarav Sharma', 'aarav@gmail.com', 'Suggestion', 'Add more filters for photos', 1, 0, '2026-03-07 07:27:16', '2026-03-07 07:27:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_follow`
--

DROP TABLE IF EXISTS `tbl_follow`;
CREATE TABLE IF NOT EXISTS `tbl_follow` (
  `follow_id` bigint NOT NULL AUTO_INCREMENT,
  `logged_user_id` bigint NOT NULL,
  `following_user_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`follow_id`),
  UNIQUE KEY `user_id` (`logged_user_id`,`following_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_follow`
--

INSERT INTO `tbl_follow` (`follow_id`, `logged_user_id`, `following_user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(2, 1, 3, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(3, 1, 5, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(4, 2, 1, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(5, 2, 3, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(6, 3, 1, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(7, 3, 4, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(8, 3, 2, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(9, 4, 1, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(10, 4, 2, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(11, 5, 1, 1, '2026-03-07 07:13:16', '2026-03-07 07:13:16'),
(12, 9, 5, 1, '2026-03-21 13:18:18', '2026-03-21 13:18:18'),
(13, 9, 3, 1, '2026-03-21 13:18:25', '2026-03-21 13:18:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

DROP TABLE IF EXISTS `tbl_group`;
CREATE TABLE IF NOT EXISTS `tbl_group` (
  `group_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(128) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`group_id`, `user_id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'College Friends', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(2, 1, 'Family Group', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(3, 1, 'Office Team', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(4, 2, 'Gym Bros', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(5, 2, 'School Friends', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(6, 3, 'Besties', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(7, 4, 'Bike Trip Squad', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(8, 4, 'Cricket Team', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(9, 4, 'Hostel Boys', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(10, 5, 'Cousins', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52'),
(11, 5, 'Garba Group', 1, '2026-03-07 07:14:52', '2026-03-07 07:14:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group_member`
--

DROP TABLE IF EXISTS `tbl_group_member`;
CREATE TABLE IF NOT EXISTS `tbl_group_member` (
  `group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_group_member`
--

INSERT INTO `tbl_group_member` (`group_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(1, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(1, 3, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(2, 1, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(2, 5, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(3, 1, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(3, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(3, 4, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(4, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(4, 4, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(5, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(5, 3, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(5, 5, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(6, 3, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(6, 5, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(7, 1, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(7, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(7, 4, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(8, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(8, 3, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(8, 4, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(9, 2, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(9, 4, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(10, 1, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(10, 5, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(11, 3, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14'),
(11, 5, 1, '2026-03-07 07:15:14', '2026-03-07 07:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_otp`
--

DROP TABLE IF EXISTS `tbl_otp`;
CREATE TABLE IF NOT EXISTS `tbl_otp` (
  `otp_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `value` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`otp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_otp`
--

INSERT INTO `tbl_otp` (`otp_id`, `user_id`, `phone`, `email`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, '9876543210', 'jaypatel@gmail.com', 456231, '2026-03-07 07:27:24', '2026-03-07 07:27:24'),
(2, 0, '9876543211', 'aarav@gmail.com', 781245, '2026-03-07 07:27:24', '2026-03-07 07:27:24'),
(3, 0, NULL, 'riya@gmail.com', 654987, '2026-03-07 07:27:24', '2026-03-07 07:27:24'),
(4, 9, '9876543214', 'ananya@gmail.com', 4815, '2026-03-07 07:27:24', '2026-03-21 09:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE IF NOT EXISTS `tbl_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `description` varchar(256) NOT NULL,
  `category_id` bigint NOT NULL,
  `post_type` enum('me','video','compare') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '\r\n',
  `visibility` enum('private','group') NOT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`post_id`, `user_id`, `description`, `category_id`, `post_type`, `visibility`, `expire_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sabarmati sunset view', 14, 'me', 'private', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(2, 1, 'Goa beach trip video', 2, 'video', 'private', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(3, 1, 'Which sneakers look better?', 6, 'compare', 'group', '2026-03-28 02:48:28', 1, '2026-03-07 07:19:45', '2026-03-26 18:07:42'),
(4, 2, 'Morning gym pump', 11, 'me', 'private', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(5, 2, 'Which protein shake is better?', 3, 'compare', 'group', '2026-03-09 09:48:06', 1, '2026-03-07 07:19:45', '2026-03-07 09:48:22'),
(6, 3, 'Dinner night with friends', 7, 'me', 'group', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(7, 3, 'Street photography shot', 12, 'me', 'private', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(8, 3, 'Udaipur travel vlog', 2, 'video', 'private', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(9, 4, 'Bike ride through mountains', 15, 'video', 'group', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(10, 5, 'Navratri garba night', 8, 'me', 'group', NULL, 1, '2026-03-07 07:19:45', '2026-03-07 07:19:45'),
(11, 5, 'Which lehenga should I wear?', 6, 'compare', 'group', '2026-03-28 09:48:44', 1, '2026-03-07 07:19:45', '2026-03-26 18:06:04'),
(23, 9, 'Are you looking for saaasyyyyy.', 5, 'video', 'private', NULL, 0, '2026-03-29 18:27:38', '2026-03-29 18:36:29'),
(24, 9, 'Who is look more cuter then other?.', 1, 'compare', 'private', '2026-03-29 18:30:00', 1, '2026-03-29 18:30:17', '2026-03-29 18:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_group`
--

DROP TABLE IF EXISTS `tbl_post_group`;
CREATE TABLE IF NOT EXISTS `tbl_post_group` (
  `post_id` bigint NOT NULL,
  `group_id` bigint NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_post_group`
--

INSERT INTO `tbl_post_group` (`post_id`, `group_id`) VALUES
(3, 1),
(3, 2),
(5, 4),
(6, 1),
(6, 5),
(9, 7),
(10, 11),
(11, 10),
(11, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_media`
--

DROP TABLE IF EXISTS `tbl_post_media`;
CREATE TABLE IF NOT EXISTS `tbl_post_media` (
  `data_id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `media_type` enum('Image','Video') NOT NULL,
  `media_url` varchar(256) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_post_media`
--

INSERT INTO `tbl_post_media` (`data_id`, `post_id`, `media_type`, `media_url`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Image', 'post1_sabarmati.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(2, 2, 'Video', 'goa_trip.mp4', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(3, 3, 'Image', 'shoe_option1.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(4, 3, 'Image', 'shoe_option2.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(5, 3, 'Image', 'shoe_option3.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(6, 3, 'Image', 'shoe_option4.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(7, 4, 'Image', 'gym_selfie.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(8, 5, 'Image', 'protein_option1.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(9, 5, 'Image', 'protein_option2.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(10, 5, 'Image', 'protein_option3.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(11, 5, 'Image', 'protein_option4.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(12, 6, 'Image', 'friends_dinner.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(13, 7, 'Image', 'street_photo.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(14, 8, 'Video', 'udaipur_vlog.mp4', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(15, 9, 'Video', 'mountain_bike_ride.mp4', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(16, 10, 'Image', 'garba_night.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(17, 11, 'Image', 'lehenga_red.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(18, 11, 'Image', 'lehenga_blue.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(19, 11, 'Image', 'lehenga_green.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(20, 11, 'Image', 'lehenga_black.jpg', 1, '2026-03-07 07:21:42', '2026-03-07 07:21:42'),
(21, 23, 'Image', 'https://example.com/image1.jpg', 1, '2026-03-29 18:27:38', '2026-03-29 18:27:38'),
(22, 23, 'Video', 'https://example.com/video1.mp4', 1, '2026-03-29 18:27:38', '2026-03-29 18:27:38'),
(23, 24, 'Image', 'https://example.com/image1.jpg', 1, '2026-03-29 18:30:17', '2026-03-29 18:30:17'),
(24, 24, 'Image', 'https://example.com/image3.png', 1, '2026-03-29 18:30:17', '2026-03-29 18:30:17'),
(25, 24, 'Image', 'https://example.com/image2.png', 1, '2026-03-29 18:30:17', '2026-03-29 18:30:17'),
(26, 24, 'Image', 'https://example.com/image4.png', 1, '2026-03-29 18:30:17', '2026-03-29 18:30:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ranking`
--

DROP TABLE IF EXISTS `tbl_ranking`;
CREATE TABLE IF NOT EXISTS `tbl_ranking` (
  `rank_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `post_media_id` bigint NOT NULL,
  `rank` tinyint NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_ranking`
--

INSERT INTO `tbl_ranking` (`rank_id`, `user_id`, `post_media_id`, `rank`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(2, 1, 4, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(3, 1, 5, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(4, 1, 6, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(5, 2, 3, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(6, 2, 4, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(7, 2, 5, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(8, 2, 6, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(9, 3, 3, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(10, 3, 4, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(11, 3, 5, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(12, 3, 6, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(13, 4, 3, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(14, 4, 4, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(15, 4, 5, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(16, 4, 6, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(17, 2, 8, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(18, 2, 9, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(19, 2, 10, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(20, 2, 11, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(21, 3, 8, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(22, 3, 9, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(23, 3, 10, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(24, 3, 11, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(25, 5, 8, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(26, 5, 9, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(27, 5, 10, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(28, 5, 11, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(29, 1, 15, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(30, 1, 16, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(31, 1, 17, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(32, 1, 18, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(33, 4, 15, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(34, 4, 16, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(35, 4, 17, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(36, 4, 18, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(37, 5, 15, 3, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(38, 5, 16, 1, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(39, 5, 17, 2, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(40, 5, 18, 4, 1, '2026-03-07 13:37:54', '2026-03-07 13:37:54'),
(41, 1, 3, 1, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(42, 1, 4, 3, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(43, 1, 5, 2, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(44, 1, 6, 4, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(45, 2, 3, 2, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(46, 2, 4, 1, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(47, 2, 5, 4, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(48, 2, 6, 3, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(49, 3, 3, 3, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(50, 3, 4, 2, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(51, 3, 5, 1, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(52, 3, 6, 4, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(53, 4, 3, 1, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(54, 4, 4, 4, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(55, 4, 5, 2, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(56, 4, 6, 3, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(57, 5, 3, 2, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(58, 5, 4, 3, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(59, 5, 5, 1, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(60, 5, 6, 4, 1, '2026-03-08 06:05:09', '2026-03-08 06:05:09'),
(61, 9, 3, 2, 1, '2026-03-26 19:43:48', '2026-03-26 19:43:48'),
(62, 9, 4, 4, 1, '2026-03-26 19:43:48', '2026-03-26 19:43:48'),
(63, 9, 5, 3, 1, '2026-03-26 19:43:48', '2026-03-26 19:43:48'),
(64, 9, 6, 1, 1, '2026-03-26 19:43:48', '2026-03-26 19:43:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

DROP TABLE IF EXISTS `tbl_rating`;
CREATE TABLE IF NOT EXISTS `tbl_rating` (
  `rate_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `image_id` bigint NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`rate_id`, `user_id`, `image_id`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(2, 3, 1, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(3, 5, 1, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(4, 1, 7, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(5, 3, 7, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(6, 2, 12, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(7, 4, 12, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(8, 1, 13, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(9, 5, 13, 3.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(10, 2, 19, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(11, 3, 19, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(12, 1, 3, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(13, 1, 4, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(14, 2, 8, 4.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(15, 3, 9, 5.0, 1, '2026-03-07 07:26:39', '2026-03-07 07:26:39'),
(16, 9, 3, 3.0, 1, '2026-03-29 14:02:54', '2026-03-29 14:09:56'),
(17, 9, 5, 5.0, 1, '2026-03-29 14:10:28', '2026-03-29 14:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_save`
--

DROP TABLE IF EXISTS `tbl_save`;
CREATE TABLE IF NOT EXISTS `tbl_save` (
  `save_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `post_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`save_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_save`
--

INSERT INTO `tbl_save` (`save_id`, `user_id`, `post_id`, `created_at`) VALUES
(1, 1, 6, '2026-03-07 07:26:56'),
(2, 1, 8, '2026-03-07 07:26:56'),
(3, 2, 1, '2026-03-07 07:26:56'),
(4, 2, 10, '2026-03-07 07:26:56'),
(5, 2, 11, '2026-03-07 07:26:56'),
(6, 3, 2, '2026-03-07 07:26:56'),
(7, 3, 3, '2026-03-07 07:26:56'),
(8, 4, 1, '2026-03-07 07:26:56'),
(9, 4, 7, '2026-03-07 07:26:56'),
(10, 5, 3, '2026-03-07 07:26:56'),
(11, 5, 4, '2026-03-07 07:26:56'),
(12, 5, 9, '2026-03-07 07:26:56'),
(20, 9, 500, '2026-03-29 17:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(256) NOT NULL,
  `username` varchar(128) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `profile_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `language` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `steps` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `full_name`, `username`, `dob`, `phone`, `email`, `password`, `profile_url`, `language`, `is_active`, `created_at`, `updated_at`, `steps`) VALUES
(1, 'Jay Patel', 'jaypatel', '0000-00-00', '9876543210', 'jaypatel@gmail.com', '123456', 'jay.jpg', 'English', 1, '2026-03-07 07:12:16', '2026-03-07 07:12:16', 1),
(2, 'Aarav Sharma', 'aaravsharma', '0000-00-00', '9876543211', 'aarav@gmail.com', '123456', 'aarav.jpg', 'Hindi', 1, '2026-03-07 07:12:16', '2026-03-07 07:12:16', 1),
(3, 'Riya Mehta', 'riyamehta', '0000-00-00', '9876543212', 'riya@gmail.com', '123456', 'riya.jpg', 'English', 1, '2026-03-07 07:12:16', '2026-03-07 07:12:16', 1),
(4, 'Darsh Parikh', 'kabirsingh', '2004-02-24', '9876543213', 'kabir@gmail.com', '123456', 'kabir.jpg', 'Hindi', 1, '2026-03-07 07:12:16', '2026-03-21 08:02:40', 2),
(5, '', 'ananyadesai', '2004-02-24', '9876543214', 'ananya@gmail.com', '123456', 'ananya.jpg', 'Gujarati', 0, '2026-03-07 07:12:16', '2026-03-21 08:15:42', 2),
(9, 'Darsh Parikh', 'mangeaa', '2004-02-24', '70165152825', 'jay@gmaidl.cm', 'c1a845a0299c0018d736511df1eeccda', NULL, '', 1, '2026-03-21 08:14:19', '2026-03-21 10:03:50', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_device`
--

DROP TABLE IF EXISTS `tbl_user_device`;
CREATE TABLE IF NOT EXISTS `tbl_user_device` (
  `device_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `token` varchar(512) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `device_token` varchar(256) NOT NULL,
  `device_type` enum('A','I','W') NOT NULL COMMENT 'A->Android, I->iOS, W->Website',
  `device_name` varchar(32) NOT NULL,
  `device_model` varchar(64) NOT NULL,
  `os_version` varchar(32) NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0->delete,1->active,2->inactive',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`device_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tbl_user_device`
--

INSERT INTO `tbl_user_device` (`device_id`, `user_id`, `token`, `device_token`, `device_type`, `device_name`, `device_model`, `os_version`, `uuid`, `ip`, `is_active`, `created_at`, `updated_at`) VALUES
(33, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6Im1hbmdlYWEiLCJwaG9uZSI6IjcwMTY1MTUyODI1IiwiZW1haWwiOiJqYXlAZ21haWRsLmNtIiwiaWF0IjoxNzc0NTQ4MjI2LCJleHAiOjE4MDYwODQyMjZ9.nPWAvj7PIWnoRUekllZrJqoMVuJlzQUovPimF7-1Bws', 'jayhlis', '', 'Apple X', 'SM-MM-1123', '5.2', 'JAYUUID', '192.30.2.2', 1, '2026-03-26 23:33:46', '2026-03-26 23:33:46'),
(32, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6Im1hbmdlYWEiLCJwaG9uZSI6IjcwMTY1MTUyODI1IiwiZW1haWwiOiJqYXlAZ21haWRsLmNtIiwiaWF0IjoxNzc0MDg4NDI4LCJleHAiOjE4MDU2MjQ0Mjh9.tZA-oLfbs2y3vtAyk4nWnotVhttAFHq0FviZ-5x2pw8', 'jayhlis', '', 'Apple X', 'SM-MM-1123', '5.2', 'JAYUUID', '192.30.2.2', 1, '2026-03-21 15:50:28', '2026-03-21 17:17:37'),
(31, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6Im1hbmdlYWEiLCJwaG9uZSI6IjcwMTY1MTUyODI1IiwiZW1haWwiOiJqYXlAZ21haWRsLmNtIiwiaWF0IjoxNzc0MDg4NDAyLCJleHAiOjE4MDU2MjQ0MDJ9.PpZUu3LLRIOKjgTLRUK5558FTSSknoGR3L6EKjOw_Qc', 'jayhlis', '', 'Apple X', 'SM-MM-1123', '5.2', 'JAYUUID', '192.30.2.2', 1, '2026-03-21 15:50:02', '2026-03-21 15:50:02'),
(30, 9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6Im1hbmdlYWEiLCJwaG9uZSI6IjcwMTY1MTUyODI1IiwiZW1haWwiOiJqYXlAZ21haWRsLmNtIiwiaWF0IjoxNzc0MDg3ODc5LCJleHAiOjE4MDU2MjM4Nzl9.HOnfFMR7PqG-Flxf_WqaM6pAIO4633_VUXvUl2hg7IQ', 'jayhlis', '', 'Apple X', 'SM-MM-1123', '5.2', 'JAYUUID', '192.30.2.2', 1, '2026-03-21 15:41:19', '2026-03-21 15:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_report`
--

DROP TABLE IF EXISTS `tbl_user_report`;
CREATE TABLE IF NOT EXISTS `tbl_user_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `report_text` varchar(120) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `report_user_id` (`post_id`),
  KEY `report_other_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_user_report`
--

INSERT INTO `tbl_user_report` (`id`, `post_id`, `user_id`, `report_text`, `is_active`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Misleading discount information', 1, 0, '2026-02-20 06:40:00', '2026-02-20 06:40:00'),
(2, 3, 2, 'Duplicate content posted earlier', 1, 0, '2026-02-21 04:15:00', '2026-02-21 04:15:00'),
(3, 5, 1, 'Link not working properly', 1, 0, '2026-02-25 08:50:00', '2026-02-25 08:50:00'),
(4, 6, 3, 'Offer details not clearly mentioned', 1, 0, '2026-02-26 03:00:00', '2026-02-26 03:00:00'),
(5, 1, 1, 'Fake', 1, 0, '2026-02-26 09:13:35', '2026-02-26 09:13:35'),
(6, 1, 20, 'I just don\'t like the post.', 1, 0, '2026-03-18 08:31:05', '2026-03-18 08:31:05'),
(12, 5, 37, 'I just don\'t like this post.', 1, 0, '2026-03-20 08:04:01', '2026-03-20 08:04:01'),
(13, 6, 37, 'Do you know what this is?.', 1, 0, '2026-03-20 08:05:28', '2026-03-20 08:05:28'),
(14, 5, 9, 'Violating rules of market.', 1, 0, '2026-03-29 17:54:10', '2026-03-29 17:54:10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

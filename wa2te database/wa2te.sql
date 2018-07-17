-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 11, 2018 at 09:06 AM
-- Server version: 10.1.31-MariaDB-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `amrefyrr_wate`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertise`
--

CREATE TABLE IF NOT EXISTS `advertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `view` tinyint(4) DEFAULT '0',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '0 for ad request 1 for comments',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `advertise`
--

INSERT INTO `advertise` (`id`, `name`, `view`, `email`, `phone`, `desc`, `type`, `updated_at`, `created_at`) VALUES
(1, 'amr', 0, 'amrmagico35@gmail.com', '01141787515', 'good', 'test', '2018-02-21 07:21:20', '2018-02-21 07:21:20'),
(2, 'ahmed', 0, 'amrmagico35@gmail.com', '01141787515', 'ddddddddddddddddddddddddddddddd', 'cat', '2018-02-21 22:15:12', '2018-02-21 22:15:12'),
(3, 'medo', 1, 'asd@ddf.com', '111111111', 'test', 'goog', '2018-03-27 03:08:13', '2018-03-06 22:33:35'),
(7, 'ةمةمةم', 0, 'admin@admin.com', '1111111', 'سسسس', 'ششسش', '2018-04-24 00:49:21', '2018-04-24 00:49:21'),
(8, 'mohamed mokhtar', 0, 'mokhtar@gmail.com', '0196213212151320.', 'this is the desc', 'contact', '2018-04-29 21:40:42', '2018-04-29 21:40:42'),
(9, 'mohamed mokhtar', 0, 'mokhtar@gmail.com', '0196213212151320.', 'this is the desc', 'contact', '2018-04-29 21:40:51', '2018-04-29 21:40:51'),
(10, 'test name', 0, 'test@test.com', '02103132', 'desc', 'cotact', '2018-04-29 21:41:44', '2018-04-29 21:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` longblob,
  `governate_id` int(10) unsigned DEFAULT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branches_governate_id_foreign` (`governate_id`),
  KEY `branches_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `title_ar`, `title_en`, `desc_ar`, `desc_en`, `img`, `governate_id`, `contact_id`, `address`, `phone`, `lat`, `lng`, `created_at`, `updated_at`) VALUES
(3, 'tttttt', 'tttttttttttt', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` longblob,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `img`, `created_at`, `updated_at`) VALUES
(5, 'Clothes', 'ملابس', 0x52657374617572616e742d34382e706e67, '2018-02-13 15:39:53', NULL),
(6, 'Perfumes', 'عطور', 0x53686f702d34382e706e67, '2018-02-13 16:34:11', NULL),
(7, 'Cafes', 'كافيهات', 0x52657374617572616e742d34382e706e67, '2018-02-14 17:53:14', NULL),
(9, 'Restaurant', 'مطاعم', 0x52657374617572616e742d34382e706e67, '2018-02-22 15:50:44', NULL),
(10, 'Pharmacies', 'صيدليات', 0x486f73706974616c20332d34382e706e67, '2018-02-22 17:11:04', NULL),
(11, 'Telecommunication', 'اتصالات و شبكات', 0x4f66666963652d50686f6e652d34382e706e67, '2018-02-22 17:11:04', NULL),
(12, 'Hotels', 'فنادق', 0x352d537461722d486f74656c2d34382e706e67, '2018-02-22 17:12:02', NULL),
(13, 'Car Services', 'خدمات الصيارات', 0x4361722d34382e706e67, '2018-02-22 17:12:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_ar` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_ar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `square_img` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rect_img` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gif_img` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` double DEFAULT NULL COMMENT 'Lattitude of the contact',
  `lon` double DEFAULT NULL COMMENT 'long of the contact',
  `first_time` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'saturday only',
  `middle_time` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sunday to thursday',
  `last_time` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Friday only',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1038 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `title_en`, `title_ar`, `desc_en`, `desc_ar`, `address_en`, `address_ar`, `phone`, `website`, `fb`, `twitter`, `instagram`, `linkedin`, `square_img`, `rect_img`, `gif_img`, `keywords`, `created_at`, `updated_at`, `lat`, `lon`, `first_time`, `middle_time`, `last_time`) VALUES
(1027, 'Victoria`s secret', 'فكتوريا سكريتس', 'best couples cafe best in class drinks', 'اروع و اخم الاذواق العالمية ف الملابس  اروع و اخم الاذواق العالمية ف الملابس الداخليةاروع و اخم الاذواق العالمية ف الملابس الداخليةاروع و اخم الاذواق العالمية ف الملابس الداخليةاروع و اخم الا', 'Street no 6 city 9', 'شارع 6 مدينة 9', '01090510845-1', 'www.testweb.com', 'www,facebook.com/victoria', 'www,facebook.com/victoriaTW', 'www,facebook.com/victoriaInsta', 'www,facebook.com/victoriaLINKED', '1.png', 'menu.jpg', NULL, 'Clothes,langry,sexy,womens,perfums', '2018-02-13 16:32:25', NULL, 30.907526, 29.548357, '9:00 AM TO 11:30 PM', '9:00 AM TO 2:00 AM', '11:00 AM TO 11:00 PM'),
(1028, 'Time Out', 'تايم اوت', 'Best In class cafe with small resturant in there', 'واحد من افضل الكافيهات الموجودة , و لدينا ركن مأكولات تحفة', 'Fayoum Street 6 number 8', 'الفيوم اليوم شارع النادي عمارة 6', '08462184456', 'www.timeout.com', 'fb.com/timeout', '/timeoutTwiter', '/timeoutInsta', '/timeoutLinked', '1.png', 'menu.jpg', '2.png', 'Cafe,timeout,Fayoum,date,birthday', '2018-02-22 15:49:15', NULL, 30.969687, 29.4817832, '', '', ''),
(1029, 'Bondok', 'بندق', 'best couples cafe best in class drinks', 'ارقى كافية للعاشقين و افخم المشروبات', 'fayoum nadi street number 7', 'الفيوم شارع الدالي نمرة 9', '084987456', 'bondokwebsite.com', 'bondokfb.com', 'bondoktwiter', 'bondokinsta', 'bondoklinked', '1.png', 'menu.jpg', '2.png', 'bondok,drinks,ice cream,date,fayoum,birthday', '2018-02-22 15:49:15', NULL, 31.0006888, 29.5054323, '', '', ''),
(1030, 'Wings', 'وينجز', 'افخم انواع الفراخ البروست المطبوخة جيداً', 'best fried chicken ever', 'Fayoum Mesla street 0', 'الفيوم ميدان المسلة الشارع العمومي', '08651321389', 'wings.com', 'fb/wings', 'wingstwitter.com', 'wings insta', 'wingslinked', '1.png', 'menu.jpg', '2.png', 'fried chicken,chicken,brost,بروست,فراخ,برجر,ريزو', '2018-02-22 16:26:49', NULL, 30.0314384, 31.2301499, '', '', ''),
(1037, 'Mokhtar ner contact', 'محل جديد مختار', 'desc for mokhtar new contact', 'تفاصيل من اجل المحل الجديد خاصة مختار', 'Egypt - Cairo monyieb', 'المنيب - القاهرة مصر', '+201090510845', 'http://amrelmagic.website/wa2te/addSingle', 'https://www.facebook.com/', 'https://www.facebook.com/', NULL, NULL, '1.png', 'menu.jpg', NULL, 'under wear , langry', '2018-04-03 01:49:14', '2018-04-03 17:39:36', 30.29310612, 29.3106448, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `contact_category`
--

CREATE TABLE IF NOT EXISTS `contact_category` (
  `cat_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `contact_category_cat_id_foreign` (`cat_id`),
  KEY `contact_category_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_category`
--

INSERT INTO `contact_category` (`cat_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(5, 1027, '2018-02-13 16:33:38', NULL),
(6, 1027, '2018-02-13 16:34:31', NULL),
(7, 1028, '2018-02-22 16:20:28', NULL),
(7, 1029, '2018-02-22 16:20:28', NULL),
(9, 1030, '2018-02-22 16:28:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_governate`
--

CREATE TABLE IF NOT EXISTS `contact_governate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `governate_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_governate_governate_id_foreign` (`governate_id`),
  KEY `contact_governate_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `contact_governate`
--

INSERT INTO `contact_governate` (`id`, `governate_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(1, 6, 1027, '2018-02-13 16:36:26', NULL),
(2, 7, 1027, '2018-02-13 16:36:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_subcategory`
--

CREATE TABLE IF NOT EXISTS `contact_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subcat_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contact_subcategory_subcat_id_foreign` (`subcat_id`),
  KEY `contact_subcategory_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `contact_subcategory`
--

INSERT INTO `contact_subcategory` (`id`, `subcat_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(1, 5, 1027, '2018-02-13 16:41:42', NULL),
(2, 3, 1030, '2018-02-13 16:41:42', NULL),
(3, 6, 1028, '2018-02-22 16:21:27', NULL),
(4, 7, 1029, '2018-02-22 16:21:27', NULL),
(5, 8, 1030, '2018-02-22 16:28:33', NULL),
(6, 16, 1029, '2018-03-19 00:44:12', '2018-03-19 00:44:12'),
(8, 16, 1028, '2018-03-19 22:27:20', '2018-03-19 22:27:20'),
(9, 16, 1027, '2018-03-19 22:27:20', '2018-03-19 22:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `governates`
--

CREATE TABLE IF NOT EXISTS `governates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_ar` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `governates`
--

INSERT INTO `governates` (`id`, `name_en`, `name_ar`, `img`, `created_at`, `updated_at`) VALUES
(6, 'Giza', 'الجيزة', NULL, '2018-02-13 16:34:59', NULL),
(7, 'Alex', 'الاسكندرية', NULL, '2018-02-13 16:35:12', '2018-03-10 19:59:37'),
(8, 'cairo', 'القاهرة', NULL, '2018-03-10 20:02:52', '2018-03-10 20:03:17'),
(9, 'fayoum', 'الفيوم', NULL, '2018-03-10 20:03:35', '2018-03-10 20:03:35'),
(23, 'cairo', 'القاهرة', NULL, '2018-04-27 00:58:03', '2018-04-27 00:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `incorrectdata`
--

CREATE TABLE IF NOT EXISTS `incorrectdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL COMMENT 'contact_id',
  `incorrectFileds` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Phone,Address,Site,tec',
  `view` tinyint(4) NOT NULL DEFAULT '0',
  `user_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `incorrectdata`
--

INSERT INTO `incorrectdata` (`id`, `contact_id`, `incorrectFileds`, `view`, `user_phone`, `user_email`, `created_at`, `updated_at`) VALUES
(2, 1027, 'Working Hours,Phone', 1, '2222222', 'MegoCs@Hotmail.com', '2018-04-25 09:35:44', '2018-04-09 01:10:20'),
(3, 1027, 'Working Hours,Phone', 1, 'fff@ff.com', 'fff@ff.com', '2018-04-29 18:09:57', '2018-04-29 22:09:57'),
(6, 1027, 'Working Hours,Phone', 0, 'lkjsgsd', 'krengkr', '2018-04-25 20:14:58', '2018-04-25 20:14:58'),
(7, 1029, 'Working Hours,Phone', 0, '23123156165', 'test@mail.com', '2018-04-29 21:42:51', '2018-04-29 21:42:51'),
(8, 1029, 'Working Hours', 0, '23123156165', 'test11@mail.com', '2018-04-29 21:44:36', '2018-04-29 21:44:36');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_11_21_171709_add_category_table', 1),
(2, '2017_11_21_171750_add_sub_category_table', 1),
(3, '2017_11_21_171841_add_governates_table', 1),
(4, '2017_11_21_171909_add_contacts_table', 1),
(5, '2017_11_21_171944_add_sliders_table', 1),
(6, '2017_11_21_172406_add_contact_governate_table', 1),
(7, '2017_11_21_172455_add_contact_category_table', 1),
(8, '2017_11_21_172832_add_contact_subcategory_table', 1),
(9, '2017_11_21_173106_add_work_time_table', 1),
(10, '2017_11_21_175019_add_governate_category_table', 1),
(11, '2017_11_21_231240_rename_work_time_table_to_work_times', 2),
(12, '2017_11_21_232428_add_day_column_to_work_time_table', 3),
(13, '2017_11_22_203853_add_contact_branches', 4),
(14, '2017_11_22_214231_add_contact_id_to_sliders_table', 5),
(15, '2017_11_23_065348_add_settings_table', 6),
(16, '2017_11_23_072253_add_governate_subcats_table', 7),
(17, '2017_12_01_213343_add_image_to_governate_table', 8),
(18, '2017_12_01_221032_add_keywords_to_contacts_table', 9),
(19, '2017_12_01_221337_change_size__keywords_to_contacts_table', 10),
(20, '2014_10_12_000000_create_users_table', 11),
(21, '2014_10_12_100000_create_password_resets_table', 11),
(22, '2018_01_21_104756_create_items_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instgram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `vision_en` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_en` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vision_ar` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mission_ar` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `address`, `phone`, `lat`, `lng`, `email`, `fb`, `twitter`, `instgram`, `linkedin`, `keywords`, `created_at`, `updated_at`, `vision_en`, `mission_en`, `vision_ar`, `mission_ar`) VALUES
(1, 'wa2te', 'cairo', '01141787515', 20, 50, 'amr.abdalrahman94@gmail.com', 'https://www.facebook.com/profile.php?id=100005312403958', 'https://www.facebook.com/profile.php?id=100005312403958', 'https://www.facebook.com/profile.php?id=100005312403958', 'https://www.facebook.com/profile.php?id=100005312403958', 'موقع جيد', NULL, '2018-03-16 12:16:57', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص.');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `subcat_id` int(10) unsigned DEFAULT NULL,
  `slider_type` int(11) DEFAULT NULL,
  `img` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` date NOT NULL,
  `title_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc_en` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sliders_subcat_id_foreign` (`subcat_id`),
  KEY `sliders_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `contact_id`, `subcat_id`, `slider_type`, `img`, `end_date`, `title_en`, `desc_en`, `title_ar`, `desc_ar`, `created_at`, `updated_at`) VALUES
(1, 0, 16, NULL, NULL, '2018-04-25', 'Ad Number 1', 'This is Ad Slider Number 1', 'اعلان رقم 1', 'دى تفاصيل الاعلان رقم 1', '2018-02-14 15:14:17', NULL),
(2, 0, 16, NULL, NULL, '2018-04-30', 'Ad Number 2', 'This is Ad Slider Number 2', 'اعلان رقم 2', 'دى تفاصيل الاعلان رقم 2', '2018-02-14 15:15:04', NULL),
(10, 1030, 16, NULL, NULL, '2018-04-30', 'Test Amr', 'english desc', 'تست عربي', 'عربي شرح', '2018-04-02 01:52:38', '2018-04-02 01:52:38'),
(13, 0, 5, NULL, NULL, '2018-04-13', 'ttttttt', 'tttttttttt', 'ttttttttt', 'ttttt', '2018-04-09 00:00:03', '2018-04-09 00:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned DEFAULT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_ar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_cat_id_foreign` (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=19 ;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `name_en`, `name_ar`, `img`, `created_at`, `updated_at`) VALUES
(1, 5, 'Langry', 'لانجري', '', '2018-02-13 15:40:42', NULL),
(2, 5, 'Jeans', 'جينس', '', '2018-02-13 16:37:37', NULL),
(3, 5, 'Shirts', 'تى شيرتس', '', '2018-02-13 16:38:22', NULL),
(4, 6, 'Arabian Perfums', 'عطور عربية', '', '2018-02-13 16:38:57', NULL),
(5, 6, 'West Perfums', 'عطور غربية', '', '2018-02-13 16:38:57', NULL),
(6, 7, 'Class A Cafes', 'ارقى مستوى للكافيهات', '', '2018-02-19 20:28:27', NULL),
(8, 9, 'Fried Chicken Brost', 'فراخ بروست', '', '2018-02-22 16:18:27', NULL),
(16, 7, 'Class B cafes', 'مستوى ثاني للكافيهات', '', '2018-02-19 20:28:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(4) NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `admin`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Amr Ahmed', 'admin@gmail.com', 1, '$2y$10$CX.23d3vmGgwRpjAkYiXCOAsIwzRZG9YRScvva1vqt8lc7DTYeMLy', 'rRoAKbCMIu', '2018-03-09 13:31:25', '2018-04-09 16:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `work_times`
--

CREATE TABLE IF NOT EXISTS `work_times` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) unsigned NOT NULL,
  `TIME_F_T_STRING` varchar(191) CHARACTER SET utf8 DEFAULT NULL COMMENT 'add time as string 10:30 AM 4:00 pm',
  `DAY_TEXT` varchar(191) CHARACTER SET utf8 DEFAULT NULL COMMENT 'add row for every day working hours MONDAY,Sunday ... etc',
  `DAY_STATUS` int(1) DEFAULT NULL COMMENT 'set 0 for Closed 1 for open',
  PRIMARY KEY (`id`),
  KEY `work_time_contact_id_foreign` (`contact_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `work_times`
--

INSERT INTO `work_times` (`id`, `contact_id`, `TIME_F_T_STRING`, `DAY_TEXT`, `DAY_STATUS`) VALUES
(3, 1027, '10:00 AM 4:00 AM', 'SUNDAY', 1),
(4, 1027, '12:00 AM 2:00 AM', 'MONDAY', 1),
(5, 1027, '8:00 AM 12:00 PM', 'SATURDAY', 1),
(6, 1028, '9:00 AM to 5:00 AM', 'MONDAY', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branches_governate_id_foreign` FOREIGN KEY (`governate_id`) REFERENCES `governates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_category`
--
ALTER TABLE `contact_category`
  ADD CONSTRAINT `contact_category_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_category_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_governate`
--
ALTER TABLE `contact_governate`
  ADD CONSTRAINT `contact_governate_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_governate_governate_id_foreign` FOREIGN KEY (`governate_id`) REFERENCES `governates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

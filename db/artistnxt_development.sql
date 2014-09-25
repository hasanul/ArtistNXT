-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 17, 2014 at 01:27 PM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `artistnxt_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_news`
--

DROP TABLE IF EXISTS `admin_news`;
CREATE TABLE IF NOT EXISTS `admin_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  `published` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_news`
--

INSERT INTO `admin_news` (`id`, `title`, `text`, `published`, `hits`, `created_by`, `created_at`, `updated_at`, `updated_by`, `ordering`) VALUES
(1, 'Latest news #1', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 1, 1, 1, '2014-01-16 13:00:34', '2014-01-16 13:01:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `artist_fans`
--

DROP TABLE IF EXISTS `artist_fans`;
CREATE TABLE IF NOT EXISTS `artist_fans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) DEFAULT NULL,
  `fan_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `artist_fans`
--

INSERT INTO `artist_fans` (`id`, `artist_id`, `fan_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, '2014-01-16 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audios`
--

DROP TABLE IF EXISTS `audios`;
CREATE TABLE IF NOT EXISTS `audios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `path` text,
  `published` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_free` tinyint(1) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `is_downloadable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audios_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `audios`
--

INSERT INTO `audios` (`id`, `user_id`, `title`, `desc`, `path`, `published`, `hits`, `featured`, `created_at`, `updated_at`, `is_free`, `price`, `is_downloadable`) VALUES
(1, 2, 'WIndows Music', 'test', 'Kalimba.mp3', 1, 4, NULL, '2014-01-16 11:08:46', '2014-01-17 11:31:12', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `audios_music_categories`
--

DROP TABLE IF EXISTS `audios_music_categories`;
CREATE TABLE IF NOT EXISTS `audios_music_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music_category_id` int(11) DEFAULT NULL,
  `audio_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audios_music_categories_on_music_category_id` (`music_category_id`),
  KEY `index_audios_music_categories_on_audio_id` (`audio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `audios_music_categories`
--

INSERT INTO `audios_music_categories` (`id`, `music_category_id`, `audio_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(2, 2, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(3, 3, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(4, 4, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(5, 5, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(6, 6, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(7, 7, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(8, 8, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(9, 9, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(10, 10, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(11, 11, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(12, 12, 1, '2014-01-16 11:08:46', '2014-01-16 11:08:46'),
(13, 13, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(14, 14, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(15, 15, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(16, 16, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(17, 17, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(18, 18, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(19, 19, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(20, 20, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(21, 21, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47'),
(22, 22, 1, '2014-01-16 11:08:47', '2014-01-16 11:08:47');

-- --------------------------------------------------------

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
CREATE TABLE IF NOT EXISTS `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_secret` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `authentications`
--

INSERT INTO `authentications` (`id`, `user_id`, `provider`, `uid`, `token`, `token_secret`, `created_at`, `updated_at`) VALUES
(1, 6, 'google_oauth2', '100777316988436771333', NULL, NULL, '2014-01-17 06:55:33', '2014-01-17 06:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cart_number` varchar(255) DEFAULT NULL,
  `cart_total` decimal(10,0) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_carts_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `cart_number`, `cart_total`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 3, 'c8822697-bda4-4064-80fb-a4460b24e32f', 0, '127.0.0.1', '2014-01-16 12:59:11', '2014-01-16 12:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_price` decimal(10,0) DEFAULT NULL,
  `product_final_price` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cart_items_on_cart_id` (`cart_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `product_name`, `quantity`, `product_price`, `product_final_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'WIndows Music', 1, 3, 3, '2014-01-16 12:59:12', '2014-01-16 12:59:12');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `body` text,
  `video_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `commented_by_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_video_id` (`video_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `body`, `video_id`, `created_at`, `updated_at`, `commented_by_name`) VALUES
(1, 38, 'Share my comment asdasd asd', 3, '2014-01-17 05:46:11', '2014-01-17 05:46:11', 'Demi Latov'),
(2, 3, 'kinda stupid song asd asd', 3, '2014-01-17 05:54:52', '2014-01-17 05:54:52', 'Demi Latov'),
(3, 3, 'has as dasd asd asd asd asd asdasd', 3, '2014-01-17 06:24:37', '2014-01-17 06:24:37', 'Demi Latov'),
(4, 3, 'as as dasdasd asd asd asd asd', 3, '2014-01-17 06:38:04', '2014-01-17 06:38:04', 'Demi Latov'),
(5, 2, 'Thanks for liking my video....', 3, '2014-01-17 09:48:23', '2014-01-17 09:48:23', 'Taylor Swift');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

DROP TABLE IF EXISTS `contents`;
CREATE TABLE IF NOT EXISTS `contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `text` text,
  `published` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `title`, `alias`, `text`, `published`, `hits`, `ordering`, `created_at`, `updated_at`) VALUES
(1, 'For The Fans', 'for-the-fans', '<p><span style="font-family: trebuchet ms,geneva;">tes<span style="font-size: 36pt;">t</span></span><span style="font-size: 36pt;"> <strong>test</strong></span></p>', 1, 21, NULL, '2013-12-23 09:19:33', '2014-01-17 09:48:39'),
(2, 'The NXT Opportunity', 'the-nxt-opportunity', '<p>Coming Soon...<strong> hello w</strong>orld</p>', 1, 4, NULL, '2013-12-23 09:20:02', '2014-01-17 09:48:38'),
(3, 'About Us', 'about-us', '<p>Coming Soon...aa</p>', 1, 2, NULL, '2013-12-23 09:27:14', '2014-01-06 08:41:40'),
(4, 'Press & Blogs', 'press-blogs', 'Coming Soon', 1, 1, NULL, '2013-12-23 09:27:32', '2013-12-23 09:27:32'),
(5, 'Copyright', 'copyright', 'Coming Soon..', 1, 1, NULL, '2013-12-23 10:26:12', '2013-12-23 10:26:12'),
(6, 'Creators & Partners', 'creators-partners', 'Coming Soon..', 1, 2, NULL, '2013-12-23 10:26:35', '2013-12-23 12:13:44'),
(7, 'Advertising', 'advertising', 'Coming Soon..', 1, 1, NULL, '2013-12-23 10:26:52', '2013-12-23 10:26:53'),
(8, 'Developers', 'developers', 'Coming Soon..', 1, 1, NULL, '2013-12-23 10:27:24', '2013-12-23 10:27:25'),
(9, 'Safety', 'safety', 'Coming Soon..', 1, 2, NULL, '2013-12-23 10:31:41', '2014-01-06 07:54:37'),
(10, 'Privacy', 'privacy', 'Coming Soon..', 1, 1, NULL, '2013-12-23 10:31:52', '2013-12-23 10:31:52'),
(11, 'Terms', 'terms', 'Coming Soon..', 1, 3, NULL, '2013-12-23 10:32:04', '2013-12-23 10:32:36'),
(12, 'To Our Artists', 'to-our-artists', '<p>We Welcome you to the beginning of your deams. We understand the importance of passion. desire, and dedication. It&rsquo;s time that you control your destiny.<br /> <br /> With hard work and believing in your abilities you will be see... you will be heard... you will be an Artist NXT. <br /> <br /> </p>', 1, NULL, NULL, '2014-01-08 10:42:43', '2014-01-16 13:41:31'),
(13, 'Fan Me Button', 'fan-me-button', '<p>hello world</p>', 1, NULL, NULL, '2014-01-08 10:45:26', '2014-01-08 10:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `country_3_code` varchar(255) DEFAULT NULL,
  `country_2_code` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=249 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_3_code`, `country_2_code`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', 1, NULL, NULL),
(2, 'Albania', 'ALB', 'AL', 1, NULL, NULL),
(3, 'Algeria', 'DZA', 'DZ', 1, NULL, NULL),
(4, 'American Samoa', 'ASM', 'AS', 1, NULL, NULL),
(5, 'Andorra', 'AND', 'AD', 1, NULL, NULL),
(6, 'Angola', 'AGO', 'AO', 1, NULL, NULL),
(7, 'Anguilla', 'AIA', 'AI', 1, NULL, NULL),
(8, 'Antarctica', 'ATA', 'AQ', 1, NULL, NULL),
(9, 'Antigua and Barbuda', 'ATG', 'AG', 1, NULL, NULL),
(10, 'Argentina', 'ARG', 'AR', 1, NULL, NULL),
(11, 'Armenia', 'ARM', 'AM', 1, NULL, NULL),
(12, 'Aruba', 'ABW', 'AW', 1, NULL, NULL),
(13, 'Australia', 'AUS', 'AU', 1, NULL, NULL),
(14, 'Austria', 'AUT', 'AT', 1, NULL, NULL),
(15, 'Azerbaijan', 'AZE', 'AZ', 1, NULL, NULL),
(16, 'Bahamas', 'BHS', 'BS', 1, NULL, NULL),
(17, 'Bahrain', 'BHR', 'BH', 1, NULL, NULL),
(18, 'Bangladesh', 'BGD', 'BD', 1, NULL, NULL),
(19, 'Barbados', 'BRB', 'BB', 1, NULL, NULL),
(20, 'Belarus', 'BLR', 'BY', 1, NULL, NULL),
(21, 'Belgium', 'BEL', 'BE', 1, NULL, NULL),
(22, 'Belize', 'BLZ', 'BZ', 1, NULL, NULL),
(23, 'Benin', 'BEN', 'BJ', 1, NULL, NULL),
(24, 'Bermuda', 'BMU', 'BM', 1, NULL, NULL),
(25, 'Bhutan', 'BTN', 'BT', 1, NULL, NULL),
(26, 'Bolivia', 'BOL', 'BO', 1, NULL, NULL),
(27, 'Bosnia and Herzegowina', 'BIH', 'BA', 1, NULL, NULL),
(28, 'Botswana', 'BWA', 'BW', 1, NULL, NULL),
(29, 'Bouvet Island', 'BVT', 'BV', 1, NULL, NULL),
(30, 'Brazil', 'BRA', 'BR', 1, NULL, NULL),
(31, 'British Indian Ocean Territory', 'IOT', 'IO', 1, NULL, NULL),
(32, 'Brunei Darussalam', 'BRN', 'BN', 1, NULL, NULL),
(33, 'Bulgaria', 'BGR', 'BG', 1, NULL, NULL),
(34, 'Burkina Faso', 'BFA', 'BF', 1, NULL, NULL),
(35, 'Burundi', 'BDI', 'BI', 1, NULL, NULL),
(36, 'Cambodia', 'KHM', 'KH', 1, NULL, NULL),
(37, 'Cameroon', 'CMR', 'CM', 1, NULL, NULL),
(38, 'Canada', 'CAN', 'CA', 1, NULL, NULL),
(39, 'Cape Verde', 'CPV', 'CV', 1, NULL, NULL),
(40, 'Cayman Islands', 'CYM', 'KY', 1, NULL, NULL),
(41, 'Central African Republic', 'CAF', 'CF', 1, NULL, NULL),
(42, 'Chad', 'TCD', 'TD', 1, NULL, NULL),
(43, 'Chile', 'CHL', 'CL', 1, NULL, NULL),
(44, 'China', 'CHN', 'CN', 1, NULL, NULL),
(45, 'Christmas Island', 'CXR', 'CX', 1, NULL, NULL),
(46, 'Cocos (Keeling) Islands', 'CCK', 'CC', 1, NULL, NULL),
(47, 'Colombia', 'COL', 'CO', 1, NULL, NULL),
(48, 'Comoros', 'COM', 'KM', 1, NULL, NULL),
(49, 'Congo', 'COG', 'CG', 1, NULL, NULL),
(50, 'Cook Islands', 'COK', 'CK', 1, NULL, NULL),
(51, 'Costa Rica', 'CRI', 'CR', 1, NULL, NULL),
(52, 'Cote D''Ivoire', 'CIV', 'CI', 1, NULL, NULL),
(53, 'Croatia', 'HRV', 'HR', 1, NULL, NULL),
(54, 'Cuba', 'CUB', 'CU', 1, NULL, NULL),
(55, 'Cyprus', 'CYP', 'CY', 1, NULL, NULL),
(56, 'Czech Republic', 'CZE', 'CZ', 1, NULL, NULL),
(57, 'Denmark', 'DNK', 'DK', 1, NULL, NULL),
(58, 'Djibouti', 'DJI', 'DJ', 1, NULL, NULL),
(59, 'Dominica', 'DMA', 'DM', 1, NULL, NULL),
(60, 'Dominican Republic', 'DOM', 'DO', 1, NULL, NULL),
(61, 'East Timor', 'TMP', 'TP', 1, NULL, NULL),
(62, 'Ecuador', 'ECU', 'EC', 1, NULL, NULL),
(63, 'Egypt', 'EGY', 'EG', 1, NULL, NULL),
(64, 'El Salvador', 'SLV', 'SV', 1, NULL, NULL),
(65, 'Equatorial Guinea', 'GNQ', 'GQ', 1, NULL, NULL),
(66, 'Eritrea', 'ERI', 'ER', 1, NULL, NULL),
(67, 'Estonia', 'EST', 'EE', 1, NULL, NULL),
(68, 'Ethiopia', 'ETH', 'ET', 1, NULL, NULL),
(69, 'Falkland Islands (Malvinas)', 'FLK', 'FK', 1, NULL, NULL),
(70, 'Faroe Islands', 'FRO', 'FO', 1, NULL, NULL),
(71, 'Fiji', 'FJI', 'FJ', 1, NULL, NULL),
(72, 'Finland', 'FIN', 'FI', 1, NULL, NULL),
(73, 'France', 'FRA', 'FR', 1, NULL, NULL),
(75, 'French Guiana', 'GUF', 'GF', 1, NULL, NULL),
(76, 'French Polynesia', 'PYF', 'PF', 1, NULL, NULL),
(77, 'French Southern Territories', 'ATF', 'TF', 1, NULL, NULL),
(78, 'Gabon', 'GAB', 'GA', 1, NULL, NULL),
(79, 'Gambia', 'GMB', 'GM', 1, NULL, NULL),
(80, 'Georgia', 'GEO', 'GE', 1, NULL, NULL),
(81, 'Germany', 'DEU', 'DE', 1, NULL, NULL),
(82, 'Ghana', 'GHA', 'GH', 1, NULL, NULL),
(83, 'Gibraltar', 'GIB', 'GI', 1, NULL, NULL),
(84, 'Greece', 'GRC', 'GR', 1, NULL, NULL),
(85, 'Greenland', 'GRL', 'GL', 1, NULL, NULL),
(86, 'Grenada', 'GRD', 'GD', 1, NULL, NULL),
(87, 'Guadeloupe', 'GLP', 'GP', 1, NULL, NULL),
(88, 'Guam', 'GUM', 'GU', 1, NULL, NULL),
(89, 'Guatemala', 'GTM', 'GT', 1, NULL, NULL),
(90, 'Guinea', 'GIN', 'GN', 1, NULL, NULL),
(91, 'Guinea-bissau', 'GNB', 'GW', 1, NULL, NULL),
(92, 'Guyana', 'GUY', 'GY', 1, NULL, NULL),
(93, 'Haiti', 'HTI', 'HT', 1, NULL, NULL),
(94, 'Heard and Mc Donald Islands', 'HMD', 'HM', 1, NULL, NULL),
(95, 'Honduras', 'HND', 'HN', 1, NULL, NULL),
(96, 'Hong Kong', 'HKG', 'HK', 1, NULL, NULL),
(97, 'Hungary', 'HUN', 'HU', 1, NULL, NULL),
(98, 'Iceland', 'ISL', 'IS', 1, NULL, NULL),
(99, 'India', 'IND', 'IN', 1, NULL, NULL),
(100, 'Indonesia', 'IDN', 'ID', 1, NULL, NULL),
(101, 'Iran (Islamic Republic of)', 'IRN', 'IR', 1, NULL, NULL),
(102, 'Iraq', 'IRQ', 'IQ', 1, NULL, NULL),
(103, 'Ireland', 'IRL', 'IE', 1, NULL, NULL),
(104, 'Israel', 'ISR', 'IL', 1, NULL, NULL),
(105, 'Italy', 'ITA', 'IT', 1, NULL, NULL),
(106, 'Jamaica', 'JAM', 'JM', 1, NULL, NULL),
(107, 'Japan', 'JPN', 'JP', 1, NULL, NULL),
(108, 'Jordan', 'JOR', 'JO', 1, NULL, NULL),
(109, 'Kazakhstan', 'KAZ', 'KZ', 1, NULL, NULL),
(110, 'Kenya', 'KEN', 'KE', 1, NULL, NULL),
(111, 'Kiribati', 'KIR', 'KI', 1, NULL, NULL),
(112, 'Korea, Democratic People''s Republic of', 'PRK', 'KP', 1, NULL, NULL),
(113, 'Korea, Republic of', 'KOR', 'KR', 1, NULL, NULL),
(114, 'Kuwait', 'KWT', 'KW', 1, NULL, NULL),
(115, 'Kyrgyzstan', 'KGZ', 'KG', 1, NULL, NULL),
(116, 'Lao People''s Democratic Republic', 'LAO', 'LA', 1, NULL, NULL),
(117, 'Latvia', 'LVA', 'LV', 1, NULL, NULL),
(118, 'Lebanon', 'LBN', 'LB', 1, NULL, NULL),
(119, 'Lesotho', 'LSO', 'LS', 1, NULL, NULL),
(120, 'Liberia', 'LBR', 'LR', 1, NULL, NULL),
(121, 'Libyan Arab Jamahiriya', 'LBY', 'LY', 1, NULL, NULL),
(122, 'Liechtenstein', 'LIE', 'LI', 1, NULL, NULL),
(123, 'Lithuania', 'LTU', 'LT', 1, NULL, NULL),
(124, 'Luxembourg', 'LUX', 'LU', 1, NULL, NULL),
(125, 'Macau', 'MAC', 'MO', 1, NULL, NULL),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MKD', 'MK', 1, NULL, NULL),
(127, 'Madagascar', 'MDG', 'MG', 1, NULL, NULL),
(128, 'Malawi', 'MWI', 'MW', 1, NULL, NULL),
(129, 'Malaysia', 'MYS', 'MY', 1, NULL, NULL),
(130, 'Maldives', 'MDV', 'MV', 1, NULL, NULL),
(131, 'Mali', 'MLI', 'ML', 1, NULL, NULL),
(132, 'Malta', 'MLT', 'MT', 1, NULL, NULL),
(133, 'Marshall Islands', 'MHL', 'MH', 1, NULL, NULL),
(134, 'Martinique', 'MTQ', 'MQ', 1, NULL, NULL),
(135, 'Mauritania', 'MRT', 'MR', 1, NULL, NULL),
(136, 'Mauritius', 'MUS', 'MU', 1, NULL, NULL),
(137, 'Mayotte', 'MYT', 'YT', 1, NULL, NULL),
(138, 'Mexico', 'MEX', 'MX', 1, NULL, NULL),
(139, 'Micronesia, Federated States of', 'FSM', 'FM', 1, NULL, NULL),
(140, 'Moldova, Republic of', 'MDA', 'MD', 1, NULL, NULL),
(141, 'Monaco', 'MCO', 'MC', 1, NULL, NULL),
(142, 'Mongolia', 'MNG', 'MN', 1, NULL, NULL),
(143, 'Montserrat', 'MSR', 'MS', 1, NULL, NULL),
(144, 'Morocco', 'MAR', 'MA', 1, NULL, NULL),
(145, 'Mozambique', 'MOZ', 'MZ', 1, NULL, NULL),
(146, 'Myanmar', 'MMR', 'MM', 1, NULL, NULL),
(147, 'Namibia', 'NAM', 'NA', 1, NULL, NULL),
(148, 'Nauru', 'NRU', 'NR', 1, NULL, NULL),
(149, 'Nepal', 'NPL', 'NP', 1, NULL, NULL),
(150, 'Netherlands', 'NLD', 'NL', 1, NULL, NULL),
(151, 'Netherlands Antilles', 'ANT', 'AN', 1, NULL, NULL),
(152, 'New Caledonia', 'NCL', 'NC', 1, NULL, NULL),
(153, 'New Zealand', 'NZL', 'NZ', 1, NULL, NULL),
(154, 'Nicaragua', 'NIC', 'NI', 1, NULL, NULL),
(155, 'Niger', 'NER', 'NE', 1, NULL, NULL),
(156, 'Nigeria', 'NGA', 'NG', 1, NULL, NULL),
(157, 'Niue', 'NIU', 'NU', 1, NULL, NULL),
(158, 'Norfolk Island', 'NFK', 'NF', 1, NULL, NULL),
(159, 'Northern Mariana Islands', 'MNP', 'MP', 1, NULL, NULL),
(160, 'Norway', 'NOR', 'NO', 1, NULL, NULL),
(161, 'Oman', 'OMN', 'OM', 1, NULL, NULL),
(162, 'Pakistan', 'PAK', 'PK', 1, NULL, NULL),
(163, 'Palau', 'PLW', 'PW', 1, NULL, NULL),
(164, 'Panama', 'PAN', 'PA', 1, NULL, NULL),
(165, 'Papua New Guinea', 'PNG', 'PG', 1, NULL, NULL),
(166, 'Paraguay', 'PRY', 'PY', 1, NULL, NULL),
(167, 'Peru', 'PER', 'PE', 1, NULL, NULL),
(168, 'Philippines', 'PHL', 'PH', 1, NULL, NULL),
(169, 'Pitcairn', 'PCN', 'PN', 1, NULL, NULL),
(170, 'Poland', 'POL', 'PL', 1, NULL, NULL),
(171, 'Portugal', 'PRT', 'PT', 1, NULL, NULL),
(172, 'Puerto Rico', 'PRI', 'PR', 1, NULL, NULL),
(173, 'Qatar', 'QAT', 'QA', 1, NULL, NULL),
(174, 'Reunion', 'REU', 'RE', 1, NULL, NULL),
(175, 'Romania', 'ROM', 'RO', 1, NULL, NULL),
(176, 'Russian Federation', 'RUS', 'RU', 1, NULL, NULL),
(177, 'Rwanda', 'RWA', 'RW', 1, NULL, NULL),
(178, 'Saint Kitts and Nevis', 'KNA', 'KN', 1, NULL, NULL),
(179, 'Saint Lucia', 'LCA', 'LC', 1, NULL, NULL),
(180, 'Saint Vincent and the Grenadines', 'VCT', 'VC', 1, NULL, NULL),
(181, 'Samoa', 'WSM', 'WS', 1, NULL, NULL),
(182, 'San Marino', 'SMR', 'SM', 1, NULL, NULL),
(183, 'Sao Tome and Principe', 'STP', 'ST', 1, NULL, NULL),
(184, 'Saudi Arabia', 'SAU', 'SA', 1, NULL, NULL),
(185, 'Senegal', 'SEN', 'SN', 1, NULL, NULL),
(186, 'Seychelles', 'SYC', 'SC', 1, NULL, NULL),
(187, 'Sierra Leone', 'SLE', 'SL', 1, NULL, NULL),
(188, 'Singapore', 'SGP', 'SG', 1, NULL, NULL),
(189, 'Slovakia', 'SVK', 'SK', 1, NULL, NULL),
(190, 'Slovenia', 'SVN', 'SI', 1, NULL, NULL),
(191, 'Solomon Islands', 'SLB', 'SB', 1, NULL, NULL),
(192, 'Somalia', 'SOM', 'SO', 1, NULL, NULL),
(193, 'South Africa', 'ZAF', 'ZA', 1, NULL, NULL),
(194, 'South Georgia and the South Sandwich Islands', 'SGS', 'GS', 1, NULL, NULL),
(195, 'Spain', 'ESP', 'ES', 1, NULL, NULL),
(196, 'Sri Lanka', 'LKA', 'LK', 1, NULL, NULL),
(197, 'St. Helena', 'SHN', 'SH', 1, NULL, NULL),
(198, 'St. Pierre and Miquelon', 'SPM', 'PM', 1, NULL, NULL),
(199, 'Sudan', 'SDN', 'SD', 1, NULL, NULL),
(200, 'Suriname', 'SUR', 'SR', 1, NULL, NULL),
(201, 'Svalbard and Jan Mayen Islands', 'SJM', 'SJ', 1, NULL, NULL),
(202, 'Swaziland', 'SWZ', 'SZ', 1, NULL, NULL),
(203, 'Sweden', 'SWE', 'SE', 1, NULL, NULL),
(204, 'Switzerland', 'CHE', 'CH', 1, NULL, NULL),
(205, 'Syrian Arab Republic', 'SYR', 'SY', 1, NULL, NULL),
(206, 'Taiwan', 'TWN', 'TW', 1, NULL, NULL),
(207, 'Tajikistan', 'TJK', 'TJ', 1, NULL, NULL),
(208, 'Tanzania, United Republic of', 'TZA', 'TZ', 1, NULL, NULL),
(209, 'Thailand', 'THA', 'TH', 1, NULL, NULL),
(210, 'Togo', 'TGO', 'TG', 1, NULL, NULL),
(211, 'Tokelau', 'TKL', 'TK', 1, NULL, NULL),
(212, 'Tonga', 'TON', 'TO', 1, NULL, NULL),
(213, 'Trinidad and Tobago', 'TTO', 'TT', 1, NULL, NULL),
(214, 'Tunisia', 'TUN', 'TN', 1, NULL, NULL),
(215, 'Turkey', 'TUR', 'TR', 1, NULL, NULL),
(216, 'Turkmenistan', 'TKM', 'TM', 1, NULL, NULL),
(217, 'Turks and Caicos Islands', 'TCA', 'TC', 1, NULL, NULL),
(218, 'Tuvalu', 'TUV', 'TV', 1, NULL, NULL),
(219, 'Uganda', 'UGA', 'UG', 1, NULL, NULL),
(220, 'Ukraine', 'UKR', 'UA', 1, NULL, NULL),
(221, 'United Arab Emirates', 'ARE', 'AE', 1, NULL, NULL),
(222, 'United Kingdom', 'GBR', 'GB', 1, NULL, NULL),
(223, 'United States', 'USA', 'US', 1, NULL, NULL),
(224, 'United States Minor Outlying Islands', 'UMI', 'UM', 1, NULL, NULL),
(225, 'Uruguay', 'URY', 'UY', 1, NULL, NULL),
(226, 'Uzbekistan', 'UZB', 'UZ', 1, NULL, NULL),
(227, 'Vanuatu', 'VUT', 'VU', 1, NULL, NULL),
(228, 'Vatican City State (Holy See)', 'VAT', 'VA', 1, NULL, NULL),
(229, 'Venezuela', 'VEN', 'VE', 1, NULL, NULL),
(230, 'Viet Nam', 'VNM', 'VN', 1, NULL, NULL),
(231, 'Virgin Islands (British)', 'VGB', 'VG', 1, NULL, NULL),
(232, 'Virgin Islands (U.S.)', 'VIR', 'VI', 1, NULL, NULL),
(233, 'Wallis and Futuna Islands', 'WLF', 'WF', 1, NULL, NULL),
(234, 'Western Sahara', 'ESH', 'EH', 1, NULL, NULL),
(235, 'Yemen', 'YEM', 'YE', 1, NULL, NULL),
(237, 'The Democratic Republic of Congo', 'DRC', 'DC', 1, NULL, NULL),
(238, 'Zambia', 'ZMB', 'ZM', 1, NULL, NULL),
(239, 'Zimbabwe', 'ZWE', 'ZW', 1, NULL, NULL),
(240, 'East Timor', 'XET', 'XE', 1, NULL, NULL),
(241, 'Jersey', 'XJE', 'XJ', 1, NULL, NULL),
(242, 'St. Barthelemy', 'XSB', 'XB', 1, NULL, NULL),
(243, 'St. Eustatius', 'XSE', 'XU', 1, NULL, NULL),
(244, 'Canary Islands', 'XCA', 'XC', 1, NULL, NULL),
(245, 'Serbia', 'SRB', 'RS', 1, NULL, NULL),
(246, 'Sint Maarten (French Antilles)', 'MAF', 'MF', 1, NULL, NULL),
(247, 'Sint Maarten (Netherlands Antilles)', 'SXM', 'SX', 1, NULL, NULL),
(248, 'Palestinian Territory, occupied', 'PSE', 'PS', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `event_image` text,
  `published` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `location` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `desc`, `event_image`, `published`, `featured`, `hits`, `created_at`, `updated_at`, `start_date`, `end_date`, `location`, `latitude`, `longitude`) VALUES
(1, 2, 'Friday show', 'hello hello hello hellohello hellohello hellohello hellohello hellohello hello', 'bmw-k-1200-s-wallpapers-1280x960.jpg', 1, NULL, 12, '2014-01-16 12:09:25', '2014-01-17 11:59:59', '2014-01-15 00:00:00', '2014-01-31 00:00:00', 'Camp Verde, AZ, United States', 34.5636, -111.854),
(2, 2, 'Dark Magic', '', '6a00d83451c0e169e2010534a34ff5970c-800wi.jpg', 1, NULL, 1, '2014-01-17 12:14:04', '2014-01-17 12:14:36', '2014-01-01 00:00:00', '2014-01-31 00:00:00', 'Phoenix, AZ, United States', 33.4484, -112.074);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `subscr_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `invoice_number` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `used_plan` int(11) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `userid`, `subscr_id`, `active`, `invoice_number`, `created_date`, `transaction_date`, `used_plan`, `method`, `amount`, `currency`, `created_at`, `updated_at`) VALUES
(1, 5, 19, 0, '76a979b4-8ce1-4855-896d-2c91267a3ce9', '2014-01-16 13:52:40', NULL, 2, 'paypal', 4, 'USD', '2014-01-16 13:52:40', '2014-01-16 13:52:40');

-- --------------------------------------------------------

--
-- Table structure for table `music_categories`
--

DROP TABLE IF EXISTS `music_categories`;
CREATE TABLE IF NOT EXISTS `music_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `show_at_home_page` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `music_categories`
--

INSERT INTO `music_categories` (`id`, `name`, `desc`, `created_at`, `updated_at`, `ordering`, `show_at_home_page`) VALUES
(1, 'Alternative Music', '', '2013-11-20 00:00:00', '2013-12-23 09:48:57', 1, 1),
(2, 'Blues', 'blue', '2013-11-20 00:00:00', '2013-12-12 11:12:52', 2, NULL),
(3, 'Classical Music', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 3, NULL),
(4, 'Country Music', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 4, NULL),
(5, 'Dance Music', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 5, NULL),
(6, 'Easy Listening', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 6, NULL),
(7, 'Electronic Music', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 7, NULL),
(8, 'European Music (Folk / Pop)', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 8, 1),
(9, 'Hip Hop / Rap', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 9, NULL),
(10, 'Indie Pop', '', '2013-11-20 00:00:00', '2013-12-12 11:07:01', 10, 1),
(11, 'Inspirational (incl. Gospel)', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 11, NULL),
(12, 'Asian Pop (J-Pop, K-pop)', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 12, NULL),
(13, 'Jazz', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 13, NULL),
(14, 'Latin Music', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 14, NULL),
(15, 'New Age', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 15, NULL),
(16, 'Opera', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 16, NULL),
(17, 'Pop (Popular music)', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 17, NULL),
(18, 'R&B / Soul', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 18, NULL),
(19, 'Reggae', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 19, NULL),
(20, 'Rock', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 20, 1),
(21, 'Singer / Songwriter (inc; Folk)', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 21, NULL),
(22, 'World Music / Beats', '', '2013-11-20 00:00:00', '2013-11-20 00:00:00', 22, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `music_categories_videos`
--

DROP TABLE IF EXISTS `music_categories_videos`;
CREATE TABLE IF NOT EXISTS `music_categories_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music_category_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `music_categories_videos`
--

INSERT INTO `music_categories_videos` (`id`, `music_category_id`, `video_id`, `created_at`, `updated_at`) VALUES
(23, 1, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(24, 2, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(25, 3, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(26, 4, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(27, 5, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(28, 6, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(29, 7, 2, '2014-01-16 11:10:36', '2014-01-16 11:10:36'),
(30, 8, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(31, 9, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(32, 10, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(33, 11, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(34, 12, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(35, 13, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(36, 14, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(37, 15, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(38, 16, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(39, 17, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(40, 18, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(41, 19, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(42, 20, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(43, 21, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(44, 22, 2, '2014-01-16 11:10:37', '2014-01-16 11:10:37'),
(45, 1, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(46, 2, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(47, 3, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(48, 4, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(49, 5, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(50, 6, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(51, 7, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(52, 8, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(53, 9, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(54, 10, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(55, 11, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(56, 12, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(57, 13, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(58, 14, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(59, 15, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(60, 16, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(61, 17, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(62, 18, 3, '2014-01-16 11:26:16', '2014-01-16 11:26:16'),
(63, 19, 3, '2014-01-16 11:26:17', '2014-01-16 11:26:17'),
(64, 20, 3, '2014-01-16 11:26:17', '2014-01-16 11:26:17'),
(65, 21, 3, '2014-01-16 11:26:17', '2014-01-16 11:26:17'),
(66, 22, 3, '2014-01-16 11:26:17', '2014-01-16 11:26:17');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `news_image` text,
  `published` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_news_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `user_id`, `title`, `desc`, `news_image`, `published`, `featured`, `hits`, `created_at`, `updated_at`) VALUES
(1, 2, '14th special day', '123\r\n35', 'Katy-Perry21.jpg', 1, NULL, 16, '2014-01-17 10:01:55', '2014-01-17 11:59:47');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `order_subtotal` decimal(10,0) DEFAULT NULL,
  `order_tax` decimal(10,0) DEFAULT NULL,
  `order_total` decimal(10,0) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `customer_note` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `order_currency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `order_subtotal`, `order_tax`, `order_total`, `order_status`, `customer_note`, `ip_address`, `created_at`, `updated_at`, `order_currency`) VALUES
(1, 2, '1a0d14f4-2b7a-4552-806e-9d45c2f6f5fb', 3, 0, 3, 1, 'hello world', '127.0.0.1', '2014-01-17 09:31:46', '2014-01-17 09:36:30', 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `product_item_price` decimal(10,0) DEFAULT NULL,
  `product_tax` decimal(10,0) DEFAULT NULL,
  `product_final_price` decimal(10,0) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `unique_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_order_items_on_order_id` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `product_quantity`, `product_item_price`, `product_tax`, `product_final_price`, `order_status`, `created_at`, `updated_at`, `user_id`, `unique_key`) VALUES
(1, 1, 1, 'WIndows Music', 1, 3, 0, 3, 1, '2014-01-17 09:31:46', '2014-01-17 09:36:30', 2, 'b6a593d5-c109-4b6c-9608-cd7c54b841cd');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  `is_free` tinyint(1) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `period_unit` varchar(50) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `desc`, `is_free`, `price`, `period`, `period_unit`, `published`, `created_at`, `updated_at`, `ordering`) VALUES
(1, 'The Free Basic', '', 1, 0.00, NULL, '', 1, '2013-11-18 05:41:36', '2013-12-12 11:48:49', 1),
(2, 'The Silver  $4.99/month', 'The Silver will include (recently posted videos on suggested as well as the song download option to sell your songs)', 0, 4.99, 1, 'm', 1, '2013-11-18 05:42:28', '2013-12-12 11:48:49', 2),
(3, 'The Gold $7.99/month', 'The Gold includes(recently posted videos on suggested as well as the song download option to sell your songs, and weekly rotation on page banner)', 0, 7.99, 1, 'm', 1, '2013-11-18 05:43:03', '2013-12-12 11:48:49', 3),
(4, 'The Platinum $9.99/month', 'The Platinum includes(recently posted videos on suggested as well as the song download option to sell your songs, and weekly rotation on page banner)', 0, 9.99, 1, 'm', 1, '2013-11-18 05:43:34', '2013-12-12 11:48:49', 4);

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20131118053843'),
('20131118055149'),
('20131118103127'),
('20131119070435'),
('20131119080750'),
('20131119090821'),
('20131120103817'),
('20131120103956'),
('20131120104430'),
('20131120104702'),
('20131120104954'),
('20131120111353'),
('20131121090948'),
('20131121091100'),
('20131121121220'),
('20131121122606'),
('20131129103928'),
('20131202051333'),
('20131202051500'),
('20131202060508'),
('20131202060852'),
('20131202064922'),
('20131202104439'),
('20131203090526'),
('20131203103922'),
('20131203104449'),
('20131204110057'),
('20131205112331'),
('20131206094556'),
('20131212081901'),
('20131212081947'),
('20131212104141'),
('20131212104453'),
('20131212104632'),
('20131212104824'),
('20131212104925'),
('20131213053616'),
('20131213055427'),
('20131215061334'),
('20131215062411'),
('20131217083521'),
('20131219062856'),
('20131219103248'),
('20131219130347'),
('20131220064252'),
('20131223082132'),
('20131223094114'),
('20131223094426'),
('20131223103627'),
('20131223105830'),
('20131224084644'),
('20131224090728'),
('20131224091001'),
('20131224091119'),
('20131224091727'),
('20131224121304'),
('20131224122423'),
('20131225052751'),
('20140106084951'),
('20140115083716'),
('20140115091727'),
('20140115092304'),
('20140115093047'),
('20140117054505');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=289 ;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `session_id`, `data`, `created_at`, `updated_at`) VALUES
(20, '41f8717d6f1566822121516ac1fcc020', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaTVJIiIkMmEk\nMTAkalFqaFFQdDQvR3ZQOGZRdFJXVDdaZQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFKUUI2NHlWUlQybEVUb25nWnphdTVSQ0szeW5LTDlZSHVKM2hITUs0\naFVBPQY7AEY=\n', '2013-12-20 12:51:45', '2013-12-20 12:51:49'),
(32, '4fd420f0aee9fc218cac7e00cc796f63', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaShJIiIkMmEk\nMTAkNmhTSTZLVGYwSk1WRkY0Mnc3cFV0dQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFhN2RrTXQxRDE0ZzVHcU9Za1NOWGxkeXR4SU42MDI4bW92aU01UUN0\nVm93PQY7AEY=\n', '2013-12-23 10:44:22', '2013-12-23 12:12:23'),
(56, '0c217cfd5d7f350dd11aefc3973541b4', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFUcFJzK1BocmF0QWl3OUQ5OHdJ\nb24xSVdGSlU4VzVXQ2l5aTB2bEx6WDEwPQY7AEY=\n', '2013-12-24 05:50:54', '2013-12-24 05:50:54'),
(74, '51147d3f4b2dbfad74bf301e4b184ce8', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFMQXZwUVY3MEhmbm9OKzRrVWtr\ndWpqWHhld21tdnVVVGVWQldnaDdDTEJZPQY7AEY=\n', '2013-12-24 10:34:44', '2013-12-24 10:34:44'),
(75, '0abc57f5025546fae10ac3abecef78dd', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFWbzhNbTllTjVIVm5NejNEajJZ\nSTBIbEVCN1dFYW9pSnVaMHYrWkc0SXcwPQY7AEY=\n', '2013-12-24 10:36:07', '2013-12-24 10:36:07'),
(76, 'ecad5e93f16a8b0cc75b0004e3df2cfc', 'BAh7CEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaShJIiIkMmEk\nMTAkNmhTSTZLVGYwSk1WRkY0Mnc3cFV0dQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFJSEtGZitRdzBScEpJOXhtRm44TExrVEpiQjBhZUJ2aUFRclAwakNI\ndkpFPQY7AEZJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQGOwBUWwY6CmFsZXJ0\nSSIMZmxhc2hlcwY7AFR7BjsGSSIeRmlsZSBpcyBub3QgZG93bmxvYWRhYmxl\nLgY7AFQ=\n', '2013-12-24 11:45:53', '2013-12-24 12:39:47'),
(81, '2c0152df9d9726702574a878f06a5bb6', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE5VlVtSng1eUp4Q1YxVCtBY2xT\nYmZIbTY2bnNFb1Bsemo1RmJnQmdVMkhRPQY7AEY=\n', '2013-12-26 08:03:10', '2013-12-26 08:03:10'),
(85, '4608f27556b891d38e4fd04184af2c9f', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaUFJIiIkMmEk\nMTAkci91WklSTjV1d3d4V1JmT3pxRnRBZQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFnY3R1MkRKNXViK0N3NE82VHJOQTRqb0pwbkZYcWl4VTZ0cXNJY2I4\nckU0PQY7AEY=\n', '2013-12-26 12:51:01', '2013-12-26 13:05:21'),
(88, 'adc89701f942e17997062f2b4bad2299', 'BAh7B0kiCmZsYXNoBjoGRVR7B0kiDGRpc2NhcmQGOwBUWwY6CmFsZXJ0SSIM\nZmxhc2hlcwY7AFR7BjsGSSIkUGxlYXNlIGxvZ2luIHRvIGRvd25sb2FkIG11\nc2ljLgY7AFRJIhBfY3NyZl90b2tlbgY7AEZJIjFMczc1VWR2ajVibXdyUnZW\nVk9JYlBZclFJSURSWklDeE56QzZPZFAxZGFrPQY7AEY=\n', '2013-12-27 04:13:33', '2013-12-27 04:13:33'),
(89, 'b369268d176be49cd28f6c6ec9009670', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE0cTV2UDVScGkrOHNRUFMvbW9m\ndGhrT1lUcmlINDBKcHRsd0lnVTdiT093PQY7AEY=\n', '2013-12-27 10:59:15', '2013-12-27 10:59:21'),
(90, '315a7fe639b851d30b60a396593a2aa6', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE2bVF1MmFENlc3bXhRTUYxWktr\nRnhzY1E3TWVnRER3dHViMTgrOTRTWE1VPQY7AEY=\n', '2013-12-30 11:08:37', '2013-12-30 11:08:37'),
(109, '7a39bfaa88bf9cd3ca2a387f777c7eab', 'BAh7CEkiDnRlbXBkYXRhMgY6BkVGSSISaGVsbG93IHdvcmxkMwY7AFRJIhl3\nYXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaTVJIiIkMmEkMTAkalFqaFFQ\ndDQvR3ZQOGZRdFJXVDdaZQY7AFRJIhBfY3NyZl90b2tlbgY7AEZJIjFvbUJ6\nQWhPbW5XNlJhMTJkbWI1MEJKRGhhamw4SFF6cXE3Z0Noei9RR3F3PQY7AEY=\n', '2013-12-31 11:01:37', '2013-12-31 11:04:34'),
(110, '788034a6fbf9f0bce994593634b988a7', 'BAh7CEkiD211c2ljX2NhcnQGOgZFRlsGewk6D3Byb2R1Y3RfaWRJIgcxMAY7\nAFQ6GHByb2R1Y3RfZmluYWxfcHJpY2VpDzoRcHJvZHVjdF9uYW1lSSIIRmFm\nBjsAVDoUcHJvZHVjdF91c2VyX2lkaShJIhl3YXJkZW4udXNlci51c2VyLmtl\neQY7AFRbB1sGaQZJIiIkMmEkMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7\nAFRJIhBfY3NyZl90b2tlbgY7AEZJIjFpWFV6Vys3Q0J0L0RhaFA2Qk9walNk\nd2N4RE1HdE5qcGtlaWx4S1VjT0VjPQY7AEY=\n', '2013-12-31 11:20:51', '2013-12-31 11:59:22'),
(121, '38fe54409881038ecb9f0d0a0688a4d3', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF0VVprTi9SUmQ0eUNvalJGSi9n\nMFF6M0VmcmxKTmJRbnJMZnl0VlF0SGZZPQY7AEY=\n', '2014-01-02 05:32:43', '2014-01-02 05:32:50'),
(131, '28daf987365370a4f7c04393e0d6d3fb', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFXcFZKakVTTWRtRmV4eTRSUVQ0eldUTXd0VXVpQmZsRGVhZEo5MURn\nRVdVPQY7AEY=\n', '2014-01-02 09:57:17', '2014-01-02 09:57:36'),
(133, '472a2162193cdf867dcab27e04ae4c3f', 'BAh7CEkiE3VzZXJfcmV0dXJuX3RvBjoGRUZJIhUvYWRtaW4vZGFzaGJvYXJk\nBjsAVEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjsAVFsHWwZpBkkiIiQyYSQx\nMCRadHFRZ1MwU2VwRWI5aVE5UHJnaEp1BjsAVEkiEF9jc3JmX3Rva2VuBjsA\nRkkiMW04ekcvYkR3QnVlZ3NKVDAzVWY1bUNNN0RXTDQ0U2h4TDVLVnl1M0Zt\nY3c9BjsARg==\n', '2014-01-02 09:59:38', '2014-01-02 10:50:46'),
(135, '56ef7dc0a0d3bd1a52047855b2698fcb', 'BAh7CEkiE3VzZXJfcmV0dXJuX3RvBjoGRUZJIhMvc3Vic2NyaXB0aW9ucwY7\nAFRJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQZJIiIkMmEkMTAk\nWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7AEZJ\nIjErZ1p0VHV3bURFNDFsSEhBblNJZTdJKzdhVFZ5Ky9yQ2JuY0p4QkhOUXVZ\nPQY7AEY=\n', '2014-01-02 10:17:34', '2014-01-02 10:17:36'),
(139, 'e59cbc4477ae7b54cdd731f6ef723e51', 'BAh7CEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjF3S28reGU0RXNGTjdFV1NQcUVzN0VHR1R4TEQzRkdyZWpiUXRXcjVv\ndnhNPQY7AEZJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQGOwBUWwY6C25vdGlj\nZUkiDGZsYXNoZXMGOwBUewY7BkkiK1N1YnNjcmlwdGlvbiB3YXMgc3VjY2Vz\nc2Z1bGx5IHVwZGF0ZWQuBjsAVA==\n', '2014-01-02 11:05:42', '2014-01-02 11:16:29'),
(140, '55970ea059d1394b09cf057c2090432b', 'BAh7CEkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIRHhSMEtNbWhsZk11Z0RFY3dW\ndlE2SkZ0cDRxUlNrRG9GRFgvTlBIMktNPQY7AEZJIg9tdXNpY19jYXJ0BjsA\nRlsHewk6D3Byb2R1Y3RfaWRJIgcxMQY7AFQ6GHByb2R1Y3RfZmluYWxfcHJp\nY2VpCjoRcHJvZHVjdF9uYW1lSSIHREoGOwBUOhRwcm9kdWN0X3VzZXJfaWRp\nKHsJOwZJIgcxMAY7AFQ7B2kPOwhJIghGYWYGOwBUOwlpKEkiCmZsYXNoBjsA\nVHsHSSIMZGlzY2FyZAY7AFRbBjoLbm90aWNlSSIMZmxhc2hlcwY7AFR7BjsK\nSSIpSXRlbSB3YXMgc3VjY2Vzc2Z1bGx5IGFkZGVkIHRvIENhcnQuBjsAVA==\n', '2014-01-03 13:41:45', '2014-01-03 13:42:02'),
(182, '5da933cfcb0915547c08951f6704179b', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjExMFNJNTZLQlp0QTZSdE8xMWZ5bkpXZzBzdzI3aGdrY0t6N21IaUFh\nVXdJPQY7AEY=\n', '2014-01-06 12:05:59', '2014-01-06 12:06:02'),
(183, '9ef9e6c4b4f0cf175911d88facecc6be', 'BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIaHFyTVJrTkFPbm5zWGJqdTA3\nYUc0a2Y4YWVueGhuVDF3aGNUSldQU0xFPQY7AEY=\n', '2014-01-06 12:28:08', '2014-01-06 12:29:07'),
(185, 'e3552d839df481302802f5f3824e425d', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjEzanplV3orL3A2MmJFZ29aNW45bnVNWHd5TlV4aDl0RHllejJJZnJ6\nU2djPQY7AEY=\n', '2014-01-07 04:06:17', '2014-01-07 11:10:58'),
(196, '16ba00dd2c244a770b0b18f9d12dcca1', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaTNJIiIkMmEk\nMTAkVDI5a01oL0YwUDdqUFhVRkpxWkoxTwY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjEybGxGdXUzMExCOEVEdWc1Y3J4Mm1FV05hT1UwMzZ4MzFod1hobUxk\nWG1vPQY7AEY=\n', '2014-01-07 10:44:02', '2014-01-07 10:44:30'),
(198, 'a377bfec2a2f66d7a01ee45016b2acd4', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjE2SmNLYXI3OFF5eWs3RjVMZ1hid0tNVFowNld0Rk5VWDN3aTcydHB4\nWCswPQY7AEY=\n', '2014-01-08 09:14:22', '2014-01-08 10:45:28'),
(202, 'c5d18ea90fea7affe400158dc5c47078', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaShJIiIkMmEk\nMTAkNmhTSTZLVGYwSk1WRkY0Mnc3cFV0dQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjEvYkVSdUNJaTZqQ1VRL1ozQ2dqSVhIbFBmQmVPMk5kWlZhZEdiSnBG\nRzRvPQY7AEY=\n', '2014-01-08 10:40:47', '2014-01-08 10:40:57'),
(204, 'a2607fbcab09db70066ba7939597ba54', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFpQVlYYTRDa1pZMzFoNTlrTk5va0l2elBvYXVjQU05TjRRTSs4SjEv\nQ0M4PQY7AEY=\n', '2014-01-09 06:09:21', '2014-01-09 06:09:29'),
(208, '87a9910dd01ff8b4a1c59ba336a1f52a', 'BAh7CEkiE3VzZXJfcmV0dXJuX3RvBjoGRUZJIhUvYWRtaW4vZGFzaGJvYXJk\nBjsAVEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjsAVFsHWwZpKEkiIiQyYSQx\nMCQ2aFNJNktUZjBKTVZGRjQydzdwVXR1BjsAVEkiEF9jc3JmX3Rva2VuBjsA\nRkkiMWpnZHA5elA5ZmNtcERvejFtSjR2ckt6ZTZZTjhnSlUwdHVWdE54RXBS\nTW89BjsARg==\n', '2014-01-13 11:36:59', '2014-01-13 12:20:24'),
(210, '898538a3ca7f5cb3401d57bc6555693f', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaShJIiIkMmEk\nMTAkNmhTSTZLVGYwSk1WRkY0Mnc3cFV0dQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFCNnJPMkUyS2NvdWpVeDVQa21veGg2cEtabEVUYUVUKzEzcUFCbnlP\nU0dNPQY7AEY=\n', '2014-01-13 12:31:03', '2014-01-13 12:31:10'),
(212, 'd322958f89e2b3675e6be3619784e94e', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaShJIiIkMmEk\nMTAkNmhTSTZLVGYwSk1WRkY0Mnc3cFV0dQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjF6Q1hSa1gxeVozckMvZFVWVUhzU04wVjlEVnhmTGhJR1FrSDFqRTNk\nOTJzPQY7AEY=\n', '2014-01-15 08:24:33', '2014-01-15 13:55:01'),
(214, '0dfa852998f9d18f76d0680ba9457c8b', 'BAh7CEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFSTUliWWJQN3F6YzljK3JVbGlRVld1RTFnQkowZGt2OWhjaG5TWmVI\nc2s4PQY7AEZJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQGOwBUWwY6C25vdGlj\nZUkiDGZsYXNoZXMGOwBUewY7BkkiH1N1Y2Nlc3NmdWxseSB1cGRhdGVkIFVz\nZXIuBjsAVA==\n', '2014-01-15 14:00:14', '2014-01-15 14:04:43'),
(249, 'a4fe8d369e14c2a650793a944f09534d', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQZJIiIkMmEk\nMTAkWnRxUWdTMFNlcEViOWlROVByZ2hKdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjFlR0dTMXZXRFVhZmxrOXpocmtzY2lvbjJ0eE84ZkROQVp0TThubHV4\nNyswPQY7AEY=\n', '2014-01-16 09:30:05', '2014-01-16 14:15:21'),
(267, 'dc34ef4aad1a4dba97506871e7c4448f', 'BAh7B0kiCmZsYXNoBjoGRVR7B0kiDGRpc2NhcmQGOwBUWwY6CmFsZXJ0SSIM\nZmxhc2hlcwY7AFR7BjsGSSIsWW91ciBzdWJzY3JpcHRpb24gaXMgbm90IGFj\ndGl2YXRlZCB5ZXQuBjsAVEkiEF9jc3JmX3Rva2VuBjsARkkiMVdXVHZCeDRp\nNG5ZbmpWQk1CS3VxS0FGTTZpSzJzNXUwRFdWWDhaT2RsR2c9BjsARg==\n', '2014-01-16 14:06:56', '2014-01-16 14:06:56'),
(269, '0e5a5f0a4c9a26ab4814f624cb31d952', 'BAh7B0kiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQdJIiIkMmEk\nMTAkdEppT1BTNi5UR0xNdC9KRUNIM2kxdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjE2WG5vVmhKQ0dNLy9LWUNJSFZVMUp2Y1NRYllTOVU3N3JoeGJJK1Ji\nOTNNPQY7AEY=\n', '2014-01-17 04:24:03', '2014-01-17 05:04:01'),
(281, '1dff8e5147f1a9ab41acabc4e1d0a1b8', 'BAh7CEkiGXdhcmRlbi51c2VyLnVzZXIua2V5BjoGRVRbB1sGaQdJIiIkMmEk\nMTAkdEppT1BTNi5UR0xNdC9KRUNIM2kxdQY7AFRJIhBfY3NyZl90b2tlbgY7\nAEZJIjF2Tlh1S0ZiNDlybVRBeDdLa21Da1hUV0djTElEWGR1UnNlc0xSQkND\nWTdRPQY7AEZJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQGOwBUWwY6C25vdGlj\nZUkiDGZsYXNoZXMGOwBUewY7BkkiJEV2ZW50IHdhcyBzdWNjZXNzZnVsbHkg\ndXBkYXRlZC4GOwBU\n', '2014-01-17 08:47:21', '2014-01-17 12:14:36'),
(283, '2cb32870ff24afe71bc16ab32257f847', 'BAh7CUkiE3VzZXJfcmV0dXJuX3RvBjoGRUZJIhMvcHJvZmlsZS9pbmRleAY7\nAFRJIgpmbGFzaAY7AFR7B0kiDGRpc2NhcmQGOwBUWwY6C25vdGljZUkiDGZs\nYXNoZXMGOwBUewY7BkkiHFNpZ25lZCBpbiBzdWNjZXNzZnVsbHkuBjsAVEki\nGXdhcmRlbi51c2VyLnVzZXIua2V5BjsAVFsHWwZpB0kiIiQyYSQxMCR0SmlP\nUFM2LlRHTE10L0pFQ0gzaTF1BjsAVEkiEF9jc3JmX3Rva2VuBjsARkkiMVg5\nRE8xNkdHWGV0VTFaUmhPOVN1NGlhT3NjYkN6TUErYVplTU5VTkMyY2s9BjsA\nRg==\n', '2014-01-17 09:00:18', '2014-01-17 09:00:18'),
(287, '164e7adb548aa85fd1eca37ce0d4b03e', 'BAh7CEkiE3VzZXJfcmV0dXJuX3RvBjoGRUZJIhkvdXNlcnMvMi9uZXdzLzEv\nZWRpdAY7AFRJIhl3YXJkZW4udXNlci51c2VyLmtleQY7AFRbB1sGaQhJIiIk\nMmEkMTAkVGE5aS5LUS5tNGp4YlcvczJXUXNkLgY7AFRJIhBfY3NyZl90b2tl\nbgY7AEZJIjF5bzRPQjNrSjdmVG9CWmExWFgxU25KSnIxN2FjbmVEWmNGenkw\ndnN3cEdrPQY7AEY=\n', '2014-01-17 10:12:29', '2014-01-17 11:37:23'),
(288, '339dfc9383f86e4f0c86578a291a75c3', 'BAh7B0kiEF9jc3JmX3Rva2VuBjoGRUZJIjE3ZGZqbXJFTys0QzVuQ1FCekIv\nK1BIVnF2cVhHV2crR2dwOTdkMVY5ajRNPQY7AEZJIhN1c2VyX3JldHVybl90\nbwY7AEZJIhUvZXZlbnQvZGV0YWlscy8xBjsAVA==\n', '2014-01-17 10:58:59', '2014-01-17 10:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_merchant_email` varchar(255) DEFAULT NULL,
  `sandbox_merchant_email` varchar(255) DEFAULT NULL,
  `sandbox` tinyint(1) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `paypal_merchant_email`, `sandbox_merchant_email`, `sandbox`, `currency`, `created_at`, `updated_at`) VALUES
(1, 'asd@yahoo.com', 'paypal@paypal.com', 1, '', NULL, '2013-12-17 06:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `published` tinyint(1) DEFAULT NULL,
  `slide_image` text,
  `ordering` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `desc`, `published`, `slide_image`, `ordering`, `created_at`, `updated_at`) VALUES
(1, 'Slide 1', 'This is the first slide', 1, 'banner-1.jpg', 1, '2013-12-04 12:20:46', '2013-12-06 08:22:41'),
(2, 'Slide 2', 'Second Slide', 1, 'banner-2.jpg', 2, '2013-12-05 11:40:39', '2013-12-06 08:22:58'),
(3, 'Slide 3', 'Third Slide', 1, 'banner-3.jpg', 3, '2013-12-06 06:51:36', '2013-12-06 08:23:09'),
(4, 'Slide 4', 'Fourth Slide', 1, 'banner-4.jpg', 4, '2013-12-06 08:23:26', '2013-12-06 08:23:26');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `state_3_code` varchar(255) DEFAULT NULL,
  `state_2_code` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=570 ;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `state_name`, `state_3_code`, `state_2_code`, `published`, `created_at`, `updated_at`) VALUES
(1, 223, 'Alabama', 'ALA', 'AL', 1, NULL, NULL),
(2, 223, 'Alaska', 'ALK', 'AK', 1, NULL, NULL),
(3, 223, 'Arizona', 'ARZ', 'AZ', 1, NULL, NULL),
(4, 223, 'Arkansas', 'ARK', 'AR', 1, NULL, NULL),
(5, 223, 'California', 'CAL', 'CA', 1, NULL, NULL),
(6, 223, 'Colorado', 'COL', 'CO', 1, NULL, NULL),
(7, 223, 'Connecticut', 'CCT', 'CT', 1, NULL, NULL),
(8, 223, 'Delaware', 'DEL', 'DE', 1, NULL, NULL),
(9, 223, 'District Of Columbia', 'DOC', 'DC', 1, NULL, NULL),
(10, 223, 'Florida', 'FLO', 'FL', 1, NULL, NULL),
(11, 223, 'Georgia', 'GEA', 'GA', 1, NULL, NULL),
(12, 223, 'Hawaii', 'HWI', 'HI', 1, NULL, NULL),
(13, 223, 'Idaho', 'IDA', 'ID', 1, NULL, NULL),
(14, 223, 'Illinois', 'ILL', 'IL', 1, NULL, NULL),
(15, 223, 'Indiana', 'IND', 'IN', 1, NULL, NULL),
(16, 223, 'Iowa', 'IOA', 'IA', 1, NULL, NULL),
(17, 223, 'Kansas', 'KAS', 'KS', 1, NULL, NULL),
(18, 223, 'Kentucky', 'KTY', 'KY', 1, NULL, NULL),
(19, 223, 'Louisiana', 'LOA', 'LA', 1, NULL, NULL),
(20, 223, 'Maine', 'MAI', 'ME', 1, NULL, NULL),
(21, 223, 'Maryland', 'MLD', 'MD', 1, NULL, NULL),
(22, 223, 'Massachusetts', 'MSA', 'MA', 1, NULL, NULL),
(23, 223, 'Michigan', 'MIC', 'MI', 1, NULL, NULL),
(24, 223, 'Minnesota', 'MIN', 'MN', 1, NULL, NULL),
(25, 223, 'Mississippi', 'MIS', 'MS', 1, NULL, NULL),
(26, 223, 'Missouri', 'MIO', 'MO', 1, NULL, NULL),
(27, 223, 'Montana', 'MOT', 'MT', 1, NULL, NULL),
(28, 223, 'Nebraska', 'NEB', 'NE', 1, NULL, NULL),
(29, 223, 'Nevada', 'NEV', 'NV', 1, NULL, NULL),
(30, 223, 'New Hampshire', 'NEH', 'NH', 1, NULL, NULL),
(31, 223, 'New Jersey', 'NEJ', 'NJ', 1, NULL, NULL),
(32, 223, 'New Mexico', 'NEM', 'NM', 1, NULL, NULL),
(33, 223, 'New York', 'NEY', 'NY', 1, NULL, NULL),
(34, 223, 'North Carolina', 'NOC', 'NC', 1, NULL, NULL),
(35, 223, 'North Dakota', 'NOD', 'ND', 1, NULL, NULL),
(36, 223, 'Ohio', 'OHI', 'OH', 1, NULL, NULL),
(37, 223, 'Oklahoma', 'OKL', 'OK', 1, NULL, NULL),
(38, 223, 'Oregon', 'ORN', 'OR', 1, NULL, NULL),
(39, 223, 'Pennsylvania', 'PEA', 'PA', 1, NULL, NULL),
(40, 223, 'Rhode Island', 'RHI', 'RI', 1, NULL, NULL),
(41, 223, 'South Carolina', 'SOC', 'SC', 1, NULL, NULL),
(42, 223, 'South Dakota', 'SOD', 'SD', 1, NULL, NULL),
(43, 223, 'Tennessee', 'TEN', 'TN', 1, NULL, NULL),
(44, 223, 'Texas', 'TXS', 'TX', 1, NULL, NULL),
(45, 223, 'Utah', 'UTA', 'UT', 1, NULL, NULL),
(46, 223, 'Vermont', 'VMT', 'VT', 1, NULL, NULL),
(47, 223, 'Virginia', 'VIA', 'VA', 1, NULL, NULL),
(48, 223, 'Washington', 'WAS', 'WA', 1, NULL, NULL),
(49, 223, 'West Virginia', 'WEV', 'WV', 1, NULL, NULL),
(50, 223, 'Wisconsin', 'WIS', 'WI', 1, NULL, NULL),
(51, 223, 'Wyoming', 'WYO', 'WY', 1, NULL, NULL),
(52, 38, 'Alberta', 'ALB', 'AB', 1, NULL, NULL),
(53, 38, 'British Columbia', 'BRC', 'BC', 1, NULL, NULL),
(54, 38, 'Manitoba', 'MAB', 'MB', 1, NULL, NULL),
(55, 38, 'New Brunswick', 'NEB', 'NB', 1, NULL, NULL),
(56, 38, 'Newfoundland and Labrador', 'NFL', 'NL', 1, NULL, NULL),
(57, 38, 'Northwest Territories', 'NWT', 'NT', 1, NULL, NULL),
(58, 38, 'Nova Scotia', 'NOS', 'NS', 1, NULL, NULL),
(59, 38, 'Nunavut', 'NUT', 'NU', 1, NULL, NULL),
(60, 38, 'Ontario', 'ONT', 'ON', 1, NULL, NULL),
(61, 38, 'Prince Edward Island', 'PEI', 'PE', 1, NULL, NULL),
(62, 38, 'Quebec', 'QEC', 'QC', 1, NULL, NULL),
(63, 38, 'Saskatchewan', 'SAK', 'SK', 1, NULL, NULL),
(64, 38, 'Yukon', 'YUT', 'YT', 1, NULL, NULL),
(65, 222, 'England', 'ENG', 'EN', 1, NULL, NULL),
(66, 222, 'Northern Ireland', 'NOI', 'NI', 1, NULL, NULL),
(67, 222, 'Scotland', 'SCO', 'SD', 1, NULL, NULL),
(68, 222, 'Wales', 'WLS', 'WS', 1, NULL, NULL),
(69, 13, 'Australian Capital Territory', 'ACT', 'AC', 1, NULL, NULL),
(70, 13, 'New South Wales', 'NSW', 'NS', 1, NULL, NULL),
(71, 13, 'Northern Territory', 'NOT', 'NT', 1, NULL, NULL),
(72, 13, 'Queensland', 'QLD', 'QL', 1, NULL, NULL),
(73, 13, 'South Australia', 'SOA', 'SA', 1, NULL, NULL),
(74, 13, 'Tasmania', 'TAS', 'TS', 1, NULL, NULL),
(75, 13, 'Victoria', 'VIC', 'VI', 1, NULL, NULL),
(76, 13, 'Western Australia', 'WEA', 'WA', 1, NULL, NULL),
(77, 138, 'Aguascalientes', 'AGS', 'AG', 1, NULL, NULL),
(78, 138, 'Baja California Norte', 'BCN', 'BN', 1, NULL, NULL),
(79, 138, 'Baja California Sur', 'BCS', 'BS', 1, NULL, NULL),
(80, 138, 'Campeche', 'CAM', 'CA', 1, NULL, NULL),
(81, 138, 'Chiapas', 'CHI', 'CS', 1, NULL, NULL),
(82, 138, 'Chihuahua', 'CHA', 'CH', 1, NULL, NULL),
(83, 138, 'Coahuila', 'COA', 'CO', 1, NULL, NULL),
(84, 138, 'Colima', 'COL', 'CM', 1, NULL, NULL),
(85, 138, 'Distrito Federal', 'DFM', 'DF', 1, NULL, NULL),
(86, 138, 'Durango', 'DGO', 'DO', 1, NULL, NULL),
(87, 138, 'Guanajuato', 'GTO', 'GO', 1, NULL, NULL),
(88, 138, 'Guerrero', 'GRO', 'GU', 1, NULL, NULL),
(89, 138, 'Hidalgo', 'HGO', 'HI', 1, NULL, NULL),
(90, 138, 'Jalisco', 'JAL', 'JA', 1, NULL, NULL),
(91, 138, 'M', 'EDM', 'EM', 1, NULL, NULL),
(92, 138, 'Michoac', 'MCN', 'MI', 1, NULL, NULL),
(93, 138, 'Morelos', 'MOR', 'MO', 1, NULL, NULL),
(94, 138, 'Nayarit', 'NAY', 'NY', 1, NULL, NULL),
(95, 138, 'Nuevo Le', 'NUL', 'NL', 1, NULL, NULL),
(96, 138, 'Oaxaca', 'OAX', 'OA', 1, NULL, NULL),
(97, 138, 'Puebla', 'PUE', 'PU', 1, NULL, NULL),
(98, 138, 'Quer', 'QRO', 'QU', 1, NULL, NULL),
(99, 138, 'Quintana Roo', 'QUR', 'QR', 1, NULL, NULL),
(100, 138, 'San Luis Potos', 'SLP', 'SP', 1, NULL, NULL),
(101, 138, 'Sinaloa', 'SIN', 'SI', 1, NULL, NULL),
(102, 138, 'Sonora', 'SON', 'SO', 1, NULL, NULL),
(103, 138, 'Tabasco', 'TAB', 'TA', 1, NULL, NULL),
(104, 138, 'Tamaulipas', 'TAM', 'TM', 1, NULL, NULL),
(105, 138, 'Tlaxcala', 'TLX', 'TX', 1, NULL, NULL),
(106, 138, 'Veracruz', 'VER', 'VZ', 1, NULL, NULL),
(107, 138, 'Yucat', 'YUC', 'YU', 1, NULL, NULL),
(108, 138, 'Zacatecas', 'ZAC', 'ZA', 1, NULL, NULL),
(109, 30, 'Acre', 'ACR', 'AC', 1, NULL, NULL),
(110, 30, 'Alagoas', 'ALG', 'AL', 1, NULL, NULL),
(111, 30, 'Amapá', 'AMP', 'AP', 1, NULL, NULL),
(112, 30, 'Amazonas', 'AMZ', 'AM', 1, NULL, NULL),
(113, 30, 'Bahía', 'BAH', 'BA', 1, NULL, NULL),
(114, 30, 'Ceará', 'CEA', 'CE', 1, NULL, NULL),
(115, 30, 'Distrito Federal', 'DFB', 'DF', 1, NULL, NULL),
(116, 30, 'Espírito Santo', 'ESS', 'ES', 1, NULL, NULL),
(117, 30, 'Goiás', 'GOI', 'GO', 1, NULL, NULL),
(118, 30, 'Maranhão', 'MAR', 'MA', 1, NULL, NULL),
(119, 30, 'Mato Grosso', 'MAT', 'MT', 1, NULL, NULL),
(120, 30, 'Mato Grosso do Sul', 'MGS', 'MS', 1, NULL, NULL),
(121, 30, 'Minas Gerais', 'MIG', 'MG', 1, NULL, NULL),
(122, 30, 'Paraná', 'PAR', 'PR', 1, NULL, NULL),
(123, 30, 'Paraíba', 'PRB', 'PB', 1, NULL, NULL),
(124, 30, 'Pará', 'PAB', 'PA', 1, NULL, NULL),
(125, 30, 'Pernambuco', 'PER', 'PE', 1, NULL, NULL),
(126, 30, 'Piauí', 'PIA', 'PI', 1, NULL, NULL),
(127, 30, 'Rio Grande do Norte', 'RGN', 'RN', 1, NULL, NULL),
(128, 30, 'Rio Grande do Sul', 'RGS', 'RS', 1, NULL, NULL),
(129, 30, 'Rio de Janeiro', 'RDJ', 'RJ', 1, NULL, NULL),
(130, 30, 'Rondônia', 'RON', 'RO', 1, NULL, NULL),
(131, 30, 'Roraima', 'ROR', 'RR', 1, NULL, NULL),
(132, 30, 'Santa Catarina', 'SAC', 'SC', 1, NULL, NULL),
(133, 30, 'Sergipe', 'SER', 'SE', 1, NULL, NULL),
(134, 30, 'São Paulo', 'SAP', 'SP', 1, NULL, NULL),
(135, 30, 'Tocantins', 'TOC', 'TO', 1, NULL, NULL),
(136, 44, 'Anhui', 'ANH', '34', 1, NULL, NULL),
(137, 44, 'Beijing', 'BEI', '11', 1, NULL, NULL),
(138, 44, 'Chongqing', 'CHO', '50', 1, NULL, NULL),
(139, 44, 'Fujian', 'FUJ', '35', 1, NULL, NULL),
(140, 44, 'Gansu', 'GAN', '62', 1, NULL, NULL),
(141, 44, 'Guangdong', 'GUA', '44', 1, NULL, NULL),
(142, 44, 'Guangxi Zhuang', 'GUZ', '45', 1, NULL, NULL),
(143, 44, 'Guizhou', 'GUI', '52', 1, NULL, NULL),
(144, 44, 'Hainan', 'HAI', '46', 1, NULL, NULL),
(145, 44, 'Hebei', 'HEB', '13', 1, NULL, NULL),
(146, 44, 'Heilongjiang', 'HEI', '23', 1, NULL, NULL),
(147, 44, 'Henan', 'HEN', '41', 1, NULL, NULL),
(148, 44, 'Hubei', 'HUB', '42', 1, NULL, NULL),
(149, 44, 'Hunan', 'HUN', '43', 1, NULL, NULL),
(150, 44, 'Jiangsu', 'JIA', '32', 1, NULL, NULL),
(151, 44, 'Jiangxi', 'JIX', '36', 1, NULL, NULL),
(152, 44, 'Jilin', 'JIL', '22', 1, NULL, NULL),
(153, 44, 'Liaoning', 'LIA', '21', 1, NULL, NULL),
(154, 44, 'Nei Mongol', 'NML', '15', 1, NULL, NULL),
(155, 44, 'Ningxia Hui', 'NIH', '64', 1, NULL, NULL),
(156, 44, 'Qinghai', 'QIN', '63', 1, NULL, NULL),
(157, 44, 'Shandong', 'SNG', '37', 1, NULL, NULL),
(158, 44, 'Shanghai', 'SHH', '31', 1, NULL, NULL),
(159, 44, 'Shaanxi', 'SHX', '61', 1, NULL, NULL),
(160, 44, 'Sichuan', 'SIC', '51', 1, NULL, NULL),
(161, 44, 'Tianjin', 'TIA', '12', 1, NULL, NULL),
(162, 44, 'Xinjiang Uygur', 'XIU', '65', 1, NULL, NULL),
(163, 44, 'Xizang', 'XIZ', '54', 1, NULL, NULL),
(164, 44, 'Yunnan', 'YUN', '53', 1, NULL, NULL),
(165, 44, 'Zhejiang', 'ZHE', '33', 1, NULL, NULL),
(166, 104, 'Israel', 'ISL', 'IL', 1, NULL, NULL),
(167, 104, 'Gaza Strip', 'GZS', 'GZ', 1, NULL, NULL),
(168, 104, 'West Bank', 'WBK', 'WB', 1, NULL, NULL),
(169, 151, 'St. Maarten', 'STM', 'SM', 1, NULL, NULL),
(170, 151, 'Bonaire', 'BNR', 'BN', 1, NULL, NULL),
(171, 151, 'Curacao', 'CUR', 'CR', 1, NULL, NULL),
(172, 175, 'Alba', 'ABA', 'AB', 1, NULL, NULL),
(173, 175, 'Arad', 'ARD', 'AR', 1, NULL, NULL),
(174, 175, 'Arges', 'ARG', 'AG', 1, NULL, NULL),
(175, 175, 'Bacau', 'BAC', 'BC', 1, NULL, NULL),
(176, 175, 'Bihor', 'BIH', 'BH', 1, NULL, NULL),
(177, 175, 'Bistrita-Nasaud', 'BIS', 'BN', 1, NULL, NULL),
(178, 175, 'Botosani', 'BOT', 'BT', 1, NULL, NULL),
(179, 175, 'Braila', 'BRL', 'BR', 1, NULL, NULL),
(180, 175, 'Brasov', 'BRA', 'BV', 1, NULL, NULL),
(181, 175, 'Bucuresti', 'BUC', 'B', 1, NULL, NULL),
(182, 175, 'Buzau', 'BUZ', 'BZ', 1, NULL, NULL),
(183, 175, 'Calarasi', 'CAL', 'CL', 1, NULL, NULL),
(184, 175, 'Caras Severin', 'CRS', 'CS', 1, NULL, NULL),
(185, 175, 'Cluj', 'CLJ', 'CJ', 1, NULL, NULL),
(186, 175, 'Constanta', 'CST', 'CT', 1, NULL, NULL),
(187, 175, 'Covasna', 'COV', 'CV', 1, NULL, NULL),
(188, 175, 'Dambovita', 'DAM', 'DB', 1, NULL, NULL),
(189, 175, 'Dolj', 'DLJ', 'DJ', 1, NULL, NULL),
(190, 175, 'Galati', 'GAL', 'GL', 1, NULL, NULL),
(191, 175, 'Giurgiu', 'GIU', 'GR', 1, NULL, NULL),
(192, 175, 'Gorj', 'GOR', 'GJ', 1, NULL, NULL),
(193, 175, 'Hargita', 'HRG', 'HR', 1, NULL, NULL),
(194, 175, 'Hunedoara', 'HUN', 'HD', 1, NULL, NULL),
(195, 175, 'Ialomita', 'IAL', 'IL', 1, NULL, NULL),
(196, 175, 'Iasi', 'IAS', 'IS', 1, NULL, NULL),
(197, 175, 'Ilfov', 'ILF', 'IF', 1, NULL, NULL),
(198, 175, 'Maramures', 'MAR', 'MM', 1, NULL, NULL),
(199, 175, 'Mehedinti', 'MEH', 'MH', 1, NULL, NULL),
(200, 175, 'Mures', 'MUR', 'MS', 1, NULL, NULL),
(201, 175, 'Neamt', 'NEM', 'NT', 1, NULL, NULL),
(202, 175, 'Olt', 'OLT', 'OT', 1, NULL, NULL),
(203, 175, 'Prahova', 'PRA', 'PH', 1, NULL, NULL),
(204, 175, 'Salaj', 'SAL', 'SJ', 1, NULL, NULL),
(205, 175, 'Satu Mare', 'SAT', 'SM', 1, NULL, NULL),
(206, 175, 'Sibiu', 'SIB', 'SB', 1, NULL, NULL),
(207, 175, 'Suceava', 'SUC', 'SV', 1, NULL, NULL),
(208, 175, 'Teleorman', 'TEL', 'TR', 1, NULL, NULL),
(209, 175, 'Timis', 'TIM', 'TM', 1, NULL, NULL),
(210, 175, 'Tulcea', 'TUL', 'TL', 1, NULL, NULL),
(211, 175, 'Valcea', 'VAL', 'VL', 1, NULL, NULL),
(212, 175, 'Vaslui', 'VAS', 'VS', 1, NULL, NULL),
(213, 175, 'Vrancea', 'VRA', 'VN', 1, NULL, NULL),
(214, 105, 'Agrigento', 'AGR', 'AG', 1, NULL, NULL),
(215, 105, 'Alessandria', 'ALE', 'AL', 1, NULL, NULL),
(216, 105, 'Ancona', 'ANC', 'AN', 1, NULL, NULL),
(217, 105, 'Aosta', 'AOS', 'AO', 1, NULL, NULL),
(218, 105, 'Arezzo', 'ARE', 'AR', 1, NULL, NULL),
(219, 105, 'Ascoli Piceno', 'API', 'AP', 1, NULL, NULL),
(220, 105, 'Asti', 'AST', 'AT', 1, NULL, NULL),
(221, 105, 'Avellino', 'AVE', 'AV', 1, NULL, NULL),
(222, 105, 'Bari', 'BAR', 'BA', 1, NULL, NULL),
(223, 105, 'Belluno', 'BEL', 'BL', 1, NULL, NULL),
(224, 105, 'Benevento', 'BEN', 'BN', 1, NULL, NULL),
(225, 105, 'Bergamo', 'BEG', 'BG', 1, NULL, NULL),
(226, 105, 'Biella', 'BIE', 'BI', 1, NULL, NULL),
(227, 105, 'Bologna', 'BOL', 'BO', 1, NULL, NULL),
(228, 105, 'Bolzano', 'BOZ', 'BZ', 1, NULL, NULL),
(229, 105, 'Brescia', 'BRE', 'BS', 1, NULL, NULL),
(230, 105, 'Brindisi', 'BRI', 'BR', 1, NULL, NULL),
(231, 105, 'Cagliari', 'CAG', 'CA', 1, NULL, NULL),
(232, 105, 'Caltanissetta', 'CAL', 'CL', 1, NULL, NULL),
(233, 105, 'Campobasso', 'CBO', 'CB', 1, NULL, NULL),
(234, 105, 'Carbonia-Iglesias', 'CAR', 'CI', 1, NULL, NULL),
(235, 105, 'Caserta', 'CAS', 'CE', 1, NULL, NULL),
(236, 105, 'Catania', 'CAT', 'CT', 1, NULL, NULL),
(237, 105, 'Catanzaro', 'CTZ', 'CZ', 1, NULL, NULL),
(238, 105, 'Chieti', 'CHI', 'CH', 1, NULL, NULL),
(239, 105, 'Como', 'COM', 'CO', 1, NULL, NULL),
(240, 105, 'Cosenza', 'COS', 'CS', 1, NULL, NULL),
(241, 105, 'Cremona', 'CRE', 'CR', 1, NULL, NULL),
(242, 105, 'Crotone', 'CRO', 'KR', 1, NULL, NULL),
(243, 105, 'Cuneo', 'CUN', 'CN', 1, NULL, NULL),
(244, 105, 'Enna', 'ENN', 'EN', 1, NULL, NULL),
(245, 105, 'Ferrara', 'FER', 'FE', 1, NULL, NULL),
(246, 105, 'Firenze', 'FIR', 'FI', 1, NULL, NULL),
(247, 105, 'Foggia', 'FOG', 'FG', 1, NULL, NULL),
(248, 105, 'Forli-Cesena', 'FOC', 'FC', 1, NULL, NULL),
(249, 105, 'Frosinone', 'FRO', 'FR', 1, NULL, NULL),
(250, 105, 'Genova', 'GEN', 'GE', 1, NULL, NULL),
(251, 105, 'Gorizia', 'GOR', 'GO', 1, NULL, NULL),
(252, 105, 'Grosseto', 'GRO', 'GR', 1, NULL, NULL),
(253, 105, 'Imperia', 'IMP', 'IM', 1, NULL, NULL),
(254, 105, 'Isernia', 'ISE', 'IS', 1, NULL, NULL),
(255, 105, 'L''Aquila', 'AQU', 'AQ', 1, NULL, NULL),
(256, 105, 'La Spezia', 'LAS', 'SP', 1, NULL, NULL),
(257, 105, 'Latina', 'LAT', 'LT', 1, NULL, NULL),
(258, 105, 'Lecce', 'LEC', 'LE', 1, NULL, NULL),
(259, 105, 'Lecco', 'LCC', 'LC', 1, NULL, NULL),
(260, 105, 'Livorno', 'LIV', 'LI', 1, NULL, NULL),
(261, 105, 'Lodi', 'LOD', 'LO', 1, NULL, NULL),
(262, 105, 'Lucca', 'LUC', 'LU', 1, NULL, NULL),
(263, 105, 'Macerata', 'MAC', 'MC', 1, NULL, NULL),
(264, 105, 'Mantova', 'MAN', 'MN', 1, NULL, NULL),
(265, 105, 'Massa-Carrara', 'MAS', 'MS', 1, NULL, NULL),
(266, 105, 'Matera', 'MAA', 'MT', 1, NULL, NULL),
(267, 105, 'Medio Campidano', 'MED', 'VS', 1, NULL, NULL),
(268, 105, 'Messina', 'MES', 'ME', 1, NULL, NULL),
(269, 105, 'Milano', 'MIL', 'MI', 1, NULL, NULL),
(270, 105, 'Modena', 'MOD', 'MO', 1, NULL, NULL),
(271, 105, 'Napoli', 'NAP', 'NA', 1, NULL, NULL),
(272, 105, 'Novara', 'NOV', 'NO', 1, NULL, NULL),
(273, 105, 'Nuoro', 'NUR', 'NU', 1, NULL, NULL),
(274, 105, 'Ogliastra', 'OGL', 'OG', 1, NULL, NULL),
(275, 105, 'Olbia-Tempio', 'OLB', 'OT', 1, NULL, NULL),
(276, 105, 'Oristano', 'ORI', 'OR', 1, NULL, NULL),
(277, 105, 'Padova', 'PDA', 'PD', 1, NULL, NULL),
(278, 105, 'Palermo', 'PAL', 'PA', 1, NULL, NULL),
(279, 105, 'Parma', 'PAA', 'PR', 1, NULL, NULL),
(280, 105, 'Pavia', 'PAV', 'PV', 1, NULL, NULL),
(281, 105, 'Perugia', 'PER', 'PG', 1, NULL, NULL),
(282, 105, 'Pesaro e Urbino', 'PES', 'PU', 1, NULL, NULL),
(283, 105, 'Pescara', 'PSC', 'PE', 1, NULL, NULL),
(284, 105, 'Piacenza', 'PIA', 'PC', 1, NULL, NULL),
(285, 105, 'Pisa', 'PIS', 'PI', 1, NULL, NULL),
(286, 105, 'Pistoia', 'PIT', 'PT', 1, NULL, NULL),
(287, 105, 'Pordenone', 'POR', 'PN', 1, NULL, NULL),
(288, 105, 'Potenza', 'PTZ', 'PZ', 1, NULL, NULL),
(289, 105, 'Prato', 'PRA', 'PO', 1, NULL, NULL),
(290, 105, 'Ragusa', 'RAG', 'RG', 1, NULL, NULL),
(291, 105, 'Ravenna', 'RAV', 'RA', 1, NULL, NULL),
(292, 105, 'Reggio Calabria', 'REG', 'RC', 1, NULL, NULL),
(293, 105, 'Reggio Emilia', 'REE', 'RE', 1, NULL, NULL),
(294, 105, 'Rieti', 'RIE', 'RI', 1, NULL, NULL),
(295, 105, 'Rimini', 'RIM', 'RN', 1, NULL, NULL),
(296, 105, 'Roma', 'ROM', 'RM', 1, NULL, NULL),
(297, 105, 'Rovigo', 'ROV', 'RO', 1, NULL, NULL),
(298, 105, 'Salerno', 'SAL', 'SA', 1, NULL, NULL),
(299, 105, 'Sassari', 'SAS', 'SS', 1, NULL, NULL),
(300, 105, 'Savona', 'SAV', 'SV', 1, NULL, NULL),
(301, 105, 'Siena', 'SIE', 'SI', 1, NULL, NULL),
(302, 105, 'Siracusa', 'SIR', 'SR', 1, NULL, NULL),
(303, 105, 'Sondrio', 'SOO', 'SO', 1, NULL, NULL),
(304, 105, 'Taranto', 'TAR', 'TA', 1, NULL, NULL),
(305, 105, 'Teramo', 'TER', 'TE', 1, NULL, NULL),
(306, 105, 'Terni', 'TRN', 'TR', 1, NULL, NULL),
(307, 105, 'Torino', 'TOR', 'TO', 1, NULL, NULL),
(308, 105, 'Trapani', 'TRA', 'TP', 1, NULL, NULL),
(309, 105, 'Trento', 'TRE', 'TN', 1, NULL, NULL),
(310, 105, 'Treviso', 'TRV', 'TV', 1, NULL, NULL),
(311, 105, 'Trieste', 'TRI', 'TS', 1, NULL, NULL),
(312, 105, 'Udine', 'UDI', 'UD', 1, NULL, NULL),
(313, 105, 'Varese', 'VAR', 'VA', 1, NULL, NULL),
(314, 105, 'Venezia', 'VEN', 'VE', 1, NULL, NULL),
(315, 105, 'Verbano Cusio Ossola', 'VCO', 'VB', 1, NULL, NULL),
(316, 105, 'Vercelli', 'VER', 'VC', 1, NULL, NULL),
(317, 105, 'Verona', 'VRN', 'VR', 1, NULL, NULL),
(318, 105, 'Vibo Valenzia', 'VIV', 'VV', 1, NULL, NULL),
(319, 105, 'Vicenza', 'VII', 'VI', 1, NULL, NULL),
(320, 105, 'Viterbo', 'VIT', 'VT', 1, NULL, NULL),
(321, 195, 'A Coru', 'ACO', '15', 1, NULL, NULL),
(322, 195, 'Alava', 'ALA', '01', 1, NULL, NULL),
(323, 195, 'Albacete', 'ALB', '02', 1, NULL, NULL),
(324, 195, 'Alicante', 'ALI', '03', 1, NULL, NULL),
(325, 195, 'Almeria', 'ALM', '04', 1, NULL, NULL),
(326, 195, 'Asturias', 'AST', '33', 1, NULL, NULL),
(327, 195, 'Avila', 'AVI', '05', 1, NULL, NULL),
(328, 195, 'Badajoz', 'BAD', '06', 1, NULL, NULL),
(329, 195, 'Baleares', 'BAL', '07', 1, NULL, NULL),
(330, 195, 'Barcelona', 'BAR', '08', 1, NULL, NULL),
(331, 195, 'Burgos', 'BUR', '09', 1, NULL, NULL),
(332, 195, 'Caceres', 'CAC', '10', 1, NULL, NULL),
(333, 195, 'Cadiz', 'CAD', '11', 1, NULL, NULL),
(334, 195, 'Cantabria', 'CAN', '39', 1, NULL, NULL),
(335, 195, 'Castellon', 'CAS', '12', 1, NULL, NULL),
(336, 195, 'Ceuta', 'CEU', '51', 1, NULL, NULL),
(337, 195, 'Ciudad Real', 'CIU', '13', 1, NULL, NULL),
(338, 195, 'Cordoba', 'COR', '14', 1, NULL, NULL),
(339, 195, 'Cuenca', 'CUE', '16', 1, NULL, NULL),
(340, 195, 'Girona', 'GIR', '17', 1, NULL, NULL),
(341, 195, 'Granada', 'GRA', '18', 1, NULL, NULL),
(342, 195, 'Guadalajara', 'GUA', '19', 1, NULL, NULL),
(343, 195, 'Guipuzcoa', 'GUI', '20', 1, NULL, NULL),
(344, 195, 'Huelva', 'HUL', '21', 1, NULL, NULL),
(345, 195, 'Huesca', 'HUS', '22', 1, NULL, NULL),
(346, 195, 'Jaen', 'JAE', '23', 1, NULL, NULL),
(347, 195, 'La Rioja', 'LRI', '26', 1, NULL, NULL),
(348, 195, 'Las Palmas', 'LPA', '35', 1, NULL, NULL),
(349, 195, 'Leon', 'LEO', '24', 1, NULL, NULL),
(350, 195, 'Lleida', 'LLE', '25', 1, NULL, NULL),
(351, 195, 'Lugo', 'LUG', '27', 1, NULL, NULL),
(352, 195, 'Madrid', 'MAD', '28', 1, NULL, NULL),
(353, 195, 'Malaga', 'MAL', '29', 1, NULL, NULL),
(354, 195, 'Melilla', 'MEL', '52', 1, NULL, NULL),
(355, 195, 'Murcia', 'MUR', '30', 1, NULL, NULL),
(356, 195, 'Navarra', 'NAV', '31', 1, NULL, NULL),
(357, 195, 'Ourense', 'OUR', '32', 1, NULL, NULL),
(358, 195, 'Palencia', 'PAL', '34', 1, NULL, NULL),
(359, 195, 'Pontevedra', 'PON', '36', 1, NULL, NULL),
(360, 195, 'Salamanca', 'SAL', '37', 1, NULL, NULL),
(361, 195, 'Santa Cruz de Tenerife', 'SCT', '38', 1, NULL, NULL),
(362, 195, 'Segovia', 'SEG', '40', 1, NULL, NULL),
(363, 195, 'Sevilla', 'SEV', '41', 1, NULL, NULL),
(364, 195, 'Soria', 'SOR', '42', 1, NULL, NULL),
(365, 195, 'Tarragona', 'TAR', '43', 1, NULL, NULL),
(366, 195, 'Teruel', 'TER', '44', 1, NULL, NULL),
(367, 195, 'Toledo', 'TOL', '45', 1, NULL, NULL),
(368, 195, 'Valencia', 'VAL', '46', 1, NULL, NULL),
(369, 195, 'Valladolid', 'VLL', '47', 1, NULL, NULL),
(370, 195, 'Vizcaya', 'VIZ', '48', 1, NULL, NULL),
(371, 195, 'Zamora', 'ZAM', '49', 1, NULL, NULL),
(372, 195, 'Zaragoza', 'ZAR', '50', 1, NULL, NULL),
(373, 10, 'Buenos Aires', 'BAS', 'BA', 1, NULL, NULL),
(374, 10, 'Ciudad Autonoma De Buenos Aires', 'CBA', 'CB', 1, NULL, NULL),
(375, 10, 'Catamarca', 'CAT', 'CA', 1, NULL, NULL),
(376, 10, 'Chaco', 'CHO', 'CH', 1, NULL, NULL),
(377, 10, 'Chubut', 'CTT', 'CT', 1, NULL, NULL),
(378, 10, 'Cordoba', 'COD', 'CO', 1, NULL, NULL),
(379, 10, 'Corrientes', 'CRI', 'CR', 1, NULL, NULL),
(380, 10, 'Entre Rios', 'ERS', 'ER', 1, NULL, NULL),
(381, 10, 'Formosa', 'FRM', 'FR', 1, NULL, NULL),
(382, 10, 'Jujuy', 'JUJ', 'JU', 1, NULL, NULL),
(383, 10, 'La Pampa', 'LPM', 'LP', 1, NULL, NULL),
(384, 10, 'La Rioja', 'LRI', 'LR', 1, NULL, NULL),
(385, 10, 'Mendoza', 'MED', 'ME', 1, NULL, NULL),
(386, 10, 'Misiones', 'MIS', 'MI', 1, NULL, NULL),
(387, 10, 'Neuquen', 'NQU', 'NQ', 1, NULL, NULL),
(388, 10, 'Rio Negro', 'RNG', 'RN', 1, NULL, NULL),
(389, 10, 'Salta', 'SAL', 'SA', 1, NULL, NULL),
(390, 10, 'San Juan', 'SJN', 'SJ', 1, NULL, NULL),
(391, 10, 'San Luis', 'SLU', 'SL', 1, NULL, NULL),
(392, 10, 'Santa Cruz', 'SCZ', 'SC', 1, NULL, NULL),
(393, 10, 'Santa Fe', 'SFE', 'SF', 1, NULL, NULL),
(394, 10, 'Santiago Del Estero', 'SEN', 'SE', 1, NULL, NULL),
(395, 10, 'Tierra Del Fuego', 'TFE', 'TF', 1, NULL, NULL),
(396, 10, 'Tucuman', 'TUC', 'TU', 1, NULL, NULL),
(397, 11, 'Aragatsotn', 'ARG', 'AG', 1, NULL, NULL),
(398, 11, 'Ararat', 'ARR', 'AR', 1, NULL, NULL),
(399, 11, 'Armavir', 'ARM', 'AV', 1, NULL, NULL),
(400, 11, 'Gegharkunik', 'GEG', 'GR', 1, NULL, NULL),
(401, 11, 'Kotayk', 'KOT', 'KT', 1, NULL, NULL),
(402, 11, 'Lori', 'LOR', 'LO', 1, NULL, NULL),
(403, 11, 'Shirak', 'SHI', 'SH', 1, NULL, NULL),
(404, 11, 'Syunik', 'SYU', 'SU', 1, NULL, NULL),
(405, 11, 'Tavush', 'TAV', 'TV', 1, NULL, NULL),
(406, 11, 'Vayots-Dzor', 'VAD', 'VD', 1, NULL, NULL),
(407, 11, 'Yerevan', 'YER', 'ER', 1, NULL, NULL),
(408, 99, 'Andaman & Nicobar Islands', 'ANI', 'AI', 1, NULL, NULL),
(409, 99, 'Andhra Pradesh', 'AND', 'AN', 1, NULL, NULL),
(410, 99, 'Arunachal Pradesh', 'ARU', 'AR', 1, NULL, NULL),
(411, 99, 'Assam', 'ASS', 'AS', 1, NULL, NULL),
(412, 99, 'Bihar', 'BIH', 'BI', 1, NULL, NULL),
(413, 99, 'Chandigarh', 'CHA', 'CA', 1, NULL, NULL),
(414, 99, 'Chhatisgarh', 'CHH', 'CH', 1, NULL, NULL),
(415, 99, 'Dadra & Nagar Haveli', 'DAD', 'DD', 1, NULL, NULL),
(416, 99, 'Daman & Diu', 'DAM', 'DA', 1, NULL, NULL),
(417, 99, 'Delhi', 'DEL', 'DE', 1, NULL, NULL),
(418, 99, 'Goa', 'GOA', 'GO', 1, NULL, NULL),
(419, 99, 'Gujarat', 'GUJ', 'GU', 1, NULL, NULL),
(420, 99, 'Haryana', 'HAR', 'HA', 1, NULL, NULL),
(421, 99, 'Himachal Pradesh', 'HIM', 'HI', 1, NULL, NULL),
(422, 99, 'Jammu & Kashmir', 'JAM', 'JA', 1, NULL, NULL),
(423, 99, 'Jharkhand', 'JHA', 'JH', 1, NULL, NULL),
(424, 99, 'Karnataka', 'KAR', 'KA', 1, NULL, NULL),
(425, 99, 'Kerala', 'KER', 'KE', 1, NULL, NULL),
(426, 99, 'Lakshadweep', 'LAK', 'LA', 1, NULL, NULL),
(427, 99, 'Madhya Pradesh', 'MAD', 'MD', 1, NULL, NULL),
(428, 99, 'Maharashtra', 'MAH', 'MH', 1, NULL, NULL),
(429, 99, 'Manipur', 'MAN', 'MN', 1, NULL, NULL),
(430, 99, 'Meghalaya', 'MEG', 'ME', 1, NULL, NULL),
(431, 99, 'Mizoram', 'MIZ', 'MI', 1, NULL, NULL),
(432, 99, 'Nagaland', 'NAG', 'NA', 1, NULL, NULL),
(433, 99, 'Orissa', 'ORI', 'OR', 1, NULL, NULL),
(434, 99, 'Pondicherry', 'PON', 'PO', 1, NULL, NULL),
(435, 99, 'Punjab', 'PUN', 'PU', 1, NULL, NULL),
(436, 99, 'Rajasthan', 'RAJ', 'RA', 1, NULL, NULL),
(437, 99, 'Sikkim', 'SIK', 'SI', 1, NULL, NULL),
(438, 99, 'Tamil Nadu', 'TAM', 'TA', 1, NULL, NULL),
(439, 99, 'Tripura', 'TRI', 'TR', 1, NULL, NULL),
(440, 99, 'Uttaranchal', 'UAR', 'UA', 1, NULL, NULL),
(441, 99, 'Uttar Pradesh', 'UTT', 'UT', 1, NULL, NULL),
(442, 99, 'West Bengal', 'WES', 'WE', 1, NULL, NULL),
(443, 101, 'Ahmadi va Kohkiluyeh', 'BOK', 'BO', 1, NULL, NULL),
(444, 101, 'Ardabil', 'ARD', 'AR', 1, NULL, NULL),
(445, 101, 'Azarbayjan-e Gharbi', 'AZG', 'AG', 1, NULL, NULL),
(446, 101, 'Azarbayjan-e Sharqi', 'AZS', 'AS', 1, NULL, NULL),
(447, 101, 'Bushehr', 'BUS', 'BU', 1, NULL, NULL),
(448, 101, 'Chaharmahal va Bakhtiari', 'CMB', 'CM', 1, NULL, NULL),
(449, 101, 'Esfahan', 'ESF', 'ES', 1, NULL, NULL),
(450, 101, 'Fars', 'FAR', 'FA', 1, NULL, NULL),
(451, 101, 'Gilan', 'GIL', 'GI', 1, NULL, NULL),
(452, 101, 'Gorgan', 'GOR', 'GO', 1, NULL, NULL),
(453, 101, 'Hamadan', 'HAM', 'HA', 1, NULL, NULL),
(454, 101, 'Hormozgan', 'HOR', 'HO', 1, NULL, NULL),
(455, 101, 'Ilam', 'ILA', 'IL', 1, NULL, NULL),
(456, 101, 'Kerman', 'KER', 'KE', 1, NULL, NULL),
(457, 101, 'Kermanshah', 'BAK', 'BA', 1, NULL, NULL),
(458, 101, 'Khorasan-e Junoubi', 'KHJ', 'KJ', 1, NULL, NULL),
(459, 101, 'Khorasan-e Razavi', 'KHR', 'KR', 1, NULL, NULL),
(460, 101, 'Khorasan-e Shomali', 'KHS', 'KS', 1, NULL, NULL),
(461, 101, 'Khuzestan', 'KHU', 'KH', 1, NULL, NULL),
(462, 101, 'Kordestan', 'KOR', 'KO', 1, NULL, NULL),
(463, 101, 'Lorestan', 'LOR', 'LO', 1, NULL, NULL),
(464, 101, 'Markazi', 'MAR', 'MR', 1, NULL, NULL),
(465, 101, 'Mazandaran', 'MAZ', 'MZ', 1, NULL, NULL),
(466, 101, 'Qazvin', 'QAS', 'QA', 1, NULL, NULL),
(467, 101, 'Qom', 'QOM', 'QO', 1, NULL, NULL),
(468, 101, 'Semnan', 'SEM', 'SE', 1, NULL, NULL),
(469, 101, 'Sistan va Baluchestan', 'SBA', 'SB', 1, NULL, NULL),
(470, 101, 'Tehran', 'TEH', 'TE', 1, NULL, NULL),
(471, 101, 'Yazd', 'YAZ', 'YA', 1, NULL, NULL),
(472, 101, 'Zanjan', 'ZAN', 'ZA', 1, NULL, NULL),
(503, 84, 'ΑΡΓΟΛΙΔΑΣ', 'ΑΡΓ', 'ΑΡ', 1, NULL, NULL),
(504, 84, 'ΑΡΚΑΔΙΑΣ', 'ΑΡΚ', 'ΑΚ', 1, NULL, NULL),
(505, 84, 'ΑΡΤΑΣ', 'ΑΡΤ', 'ΑΑ', 1, NULL, NULL),
(506, 84, 'ΑΤΤΙΚΗΣ', 'ΑΤΤ', 'ΑΤ', 1, NULL, NULL),
(507, 84, 'ΑΧΑΪΑΣ', 'ΑΧΑ', 'ΑΧ', 1, NULL, NULL),
(508, 84, 'ΒΟΙΩΤΙΑΣ', 'ΒΟΙ', 'ΒΟ', 1, NULL, NULL),
(509, 84, 'ΓΡΕΒΕΝΩΝ', 'ΓΡΕ', 'ΓΡ', 1, NULL, NULL),
(510, 84, 'ΔΡΑΜΑΣ', 'ΔΡΑ', 'ΔΡ', 1, NULL, NULL),
(511, 84, 'ΔΩΔΕΚΑΝΗΣΟΥ', 'ΔΩΔ', 'ΔΩ', 1, NULL, NULL),
(512, 84, 'ΕΒΡΟΥ', 'ΕΒΡ', 'ΕΒ', 1, NULL, NULL),
(513, 84, 'ΕΥΒΟΙΑΣ', 'ΕΥΒ', 'ΕΥ', 1, NULL, NULL),
(514, 84, 'ΕΥΡΥΤΑΝΙΑΣ', 'ΕΥΡ', 'ΕΡ', 1, NULL, NULL),
(515, 84, 'ΖΑΚΥΝΘΟΥ', 'ΖΑΚ', 'ΖΑ', 1, NULL, NULL),
(516, 84, 'ΗΛΕΙΑΣ', 'ΗΛΕ', 'ΗΛ', 1, NULL, NULL),
(517, 84, 'ΗΜΑΘΙΑΣ', 'ΗΜΑ', 'ΗΜ', 1, NULL, NULL),
(518, 84, 'ΗΡΑΚΛΕΙΟΥ', 'ΗΡΑ', 'ΗΡ', 1, NULL, NULL),
(519, 84, 'ΘΕΣΠΡΩΤΙΑΣ', 'ΘΕΠ', 'ΘΠ', 1, NULL, NULL),
(520, 84, 'ΘΕΣΣΑΛΟΝΙΚΗΣ', 'ΘΕΣ', 'ΘΕ', 1, NULL, NULL),
(521, 84, 'ΙΩΑΝΝΙΝΩΝ', 'ΙΩΑ', 'ΙΩ', 1, NULL, NULL),
(522, 84, 'ΚΑΒΑΛΑΣ', 'ΚΑΒ', 'ΚΒ', 1, NULL, NULL),
(523, 84, 'ΚΑΡΔΙΤΣΑΣ', 'ΚΑΡ', 'ΚΡ', 1, NULL, NULL),
(524, 84, 'ΚΑΣΤΟΡΙΑΣ', 'ΚΑΣ', 'ΚΣ', 1, NULL, NULL),
(525, 84, 'ΚΕΡΚΥΡΑΣ', 'ΚΕΡ', 'ΚΕ', 1, NULL, NULL),
(526, 84, 'ΚΕΦΑΛΛΗΝΙΑΣ', 'ΚΕΦ', 'ΚΦ', 1, NULL, NULL),
(527, 84, 'ΚΙΛΚΙΣ', 'ΚΙΛ', 'ΚΙ', 1, NULL, NULL),
(528, 84, 'ΚΟΖΑΝΗΣ', 'ΚΟΖ', 'ΚZ', 1, NULL, NULL),
(529, 84, 'ΚΟΡΙΝΘΙΑΣ', 'ΚΟΡ', 'ΚΟ', 1, NULL, NULL),
(530, 84, 'ΚΥΚΛΑΔΩΝ', 'ΚΥΚ', 'ΚΥ', 1, NULL, NULL),
(531, 84, 'ΛΑΚΩΝΙΑΣ', 'ΛΑΚ', 'ΛK', 1, NULL, NULL),
(532, 84, 'ΛΑΡΙΣΑΣ', 'ΛΑΡ', 'ΛΡ', 1, NULL, NULL),
(533, 84, 'ΛΑΣΙΘΙΟΥ', 'ΛΑΣ', 'ΛΑ', 1, NULL, NULL),
(534, 84, 'ΛΕΣΒΟΥ', 'ΛΕΣ', 'ΛΣ', 1, NULL, NULL),
(535, 84, 'ΛΕΥΚΑΔΑΣ', 'ΛΕΥ', 'ΛΕ', 1, NULL, NULL),
(536, 84, 'ΜΑΓΝΗΣΙΑΣ', 'ΜΑΓ', 'ΜΑ', 1, NULL, NULL),
(537, 84, 'ΜΕΣΣΗΝΙΑΣ', 'ΜΕΣ', 'ΜΕ', 1, NULL, NULL),
(538, 84, 'ΞΑΝΘΗΣ', 'ΞΑΝ', 'ΞΑ', 1, NULL, NULL),
(539, 84, 'ΠΕΛΛΗΣ', 'ΠΕΛ', 'ΠΕ', 1, NULL, NULL),
(540, 84, 'ΠΙΕΡΙΑΣ', 'ΠΙΕ', 'ΠΙ', 1, NULL, NULL),
(541, 84, 'ΠΡΕΒΕΖΑΣ', 'ΠΡΕ', 'ΠΡ', 1, NULL, NULL),
(542, 84, 'ΡΕΘΥΜΝΗΣ', 'ΡΕΘ', 'ΡΕ', 1, NULL, NULL),
(543, 84, 'ΡΟΔΟΠΗΣ', 'ΡΟΔ', 'ΡΟ', 1, NULL, NULL),
(544, 84, 'ΣΑΜΟΥ', 'ΣΑΜ', 'ΣΑ', 1, NULL, NULL),
(545, 84, 'ΣΕΡΡΩΝ', 'ΣΕΡ', 'ΣΕ', 1, NULL, NULL),
(546, 84, 'ΤΡΙΚΑΛΩΝ', 'ΤΡΙ', 'ΤΡ', 1, NULL, NULL),
(547, 84, 'ΦΘΙΩΤΙΔΑΣ', 'ΦΘΙ', 'ΦΘ', 1, NULL, NULL),
(548, 84, 'ΦΛΩΡΙΝΑΣ', 'ΦΛΩ', 'ΦΛ', 1, NULL, NULL),
(549, 84, 'ΦΩΚΙΔΑΣ', 'ΦΩΚ', 'ΦΩ', 1, NULL, NULL),
(550, 84, 'ΧΑΛΚΙΔΙΚΗΣ', 'ΧΑΛ', 'ΧΑ', 1, NULL, NULL),
(551, 84, 'ΧΑΝΙΩΝ', 'ΧΑΝ', 'ΧΝ', 1, NULL, NULL),
(552, 84, 'ΧΙΟΥ', 'ΧΙΟ', 'ΧΙ', 1, NULL, NULL),
(553, 84, 'ΑΙΤΩΛΟΑΚΑΡΝΑΝΙΑΣ', 'ΑΙΤ', 'ΑΙ', 1, NULL, NULL),
(554, 81, 'Freie und Hansestadt Hamburg', 'HAM', 'HH', 1, NULL, NULL),
(555, 81, 'Niedersachsen', 'NIS', 'NI', 1, NULL, NULL),
(556, 81, 'Freie Hansestadt Bremen', 'HBR', 'HB', 1, NULL, NULL),
(557, 81, 'Nordrhein-Westfalen', 'NRW', 'NW', 1, NULL, NULL),
(558, 81, 'Hessen', 'HES', 'HE', 1, NULL, NULL),
(559, 81, 'Rheinland-Pfalz', 'RLP', 'RP', 1, NULL, NULL),
(560, 81, 'Baden-Württemberg', 'BWÜ', 'BW', 1, NULL, NULL),
(561, 81, 'Freistaat Bayern', 'BAV', 'BY', 1, NULL, NULL),
(562, 81, 'Saarland', 'SLA', 'SL', 1, NULL, NULL),
(563, 81, 'Berlin', 'BER', 'BE', 1, NULL, NULL),
(564, 81, 'Brandenburg', 'BRB', 'BB', 1, NULL, NULL),
(565, 81, 'Mecklenburg-Vorpommern', 'MVO', 'MV', 1, NULL, NULL),
(566, 81, 'Freistaat Sachsen', 'SAC', 'SN', 1, NULL, NULL),
(567, 81, 'Sachsen-Anhalt', 'SAA', 'ST', 1, NULL, NULL),
(568, 81, 'Freistaat Thüringen', 'THÜ', 'TH', 1, NULL, NULL),
(569, 81, 'Schleswig-Holstein', 'SHO', 'SH', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `subscr_method` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `signup_date` datetime DEFAULT NULL,
  `lastpay_date` datetime DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `recurring` tinyint(1) DEFAULT NULL,
  `lifetime` tinyint(1) DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `userid`, `subscr_method`, `status`, `signup_date`, `lastpay_date`, `cancel_date`, `plan`, `recurring`, `lifetime`, `expiration`, `created_at`, `updated_at`) VALUES
(1, 48, 'paypal', 'Pending', '2013-12-13 11:44:34', NULL, NULL, 2, 1, 0, '2014-01-01 11:44:34', '2013-12-13 11:44:38', '2014-01-16 05:00:04'),
(2, 35, 'paypal', 'Active', '2013-12-13 11:44:34', NULL, NULL, 3, 1, 0, '2014-02-15 00:00:00', '2013-12-13 11:44:38', '2014-01-16 06:24:39'),
(3, 46, 'paypal', 'Active', '2013-12-13 11:44:34', NULL, NULL, 2, 1, 0, '2014-12-15 11:44:34', '2013-12-13 11:44:38', '2013-12-13 11:44:38'),
(5, 51, 'paypal', 'Active', '2013-12-20 10:35:02', NULL, NULL, 2, 1, 0, '2014-02-20 10:35:02', '2013-12-20 10:35:02', '2014-01-02 05:23:55'),
(6, 52, 'free', 'Active', '2013-12-20 10:36:25', NULL, NULL, 1, 0, 1, NULL, '2013-12-20 10:36:25', '2013-12-20 10:36:25'),
(7, 53, 'free', 'Active', '2013-12-20 11:51:49', NULL, NULL, NULL, 0, 1, NULL, '2013-12-20 11:51:49', '2013-12-20 11:51:49'),
(8, 54, 'paypal', 'Pending', '2013-12-20 11:54:36', NULL, NULL, 2, 1, 0, '2014-02-20 11:54:36', '2013-12-20 11:54:36', '2014-01-02 06:29:29'),
(9, 55, 'paypal', 'Active', '2013-12-20 11:59:19', NULL, NULL, 3, 1, 0, '2014-02-20 11:59:19', '2013-12-20 11:59:19', '2014-01-02 05:17:25'),
(10, 56, 'free', 'Active', '2013-12-20 12:46:02', NULL, NULL, NULL, 0, 1, NULL, '2013-12-20 12:46:02', '2014-01-02 11:16:29'),
(13, 59, 'free', 'Active', '2013-12-24 07:50:52', NULL, NULL, NULL, 0, 1, NULL, '2013-12-24 07:50:52', '2013-12-24 07:50:52'),
(14, 60, 'paypal', 'Active', '2013-12-24 10:15:49', NULL, NULL, 3, 1, 0, '2014-01-31 00:00:00', '2013-12-24 10:15:49', '2014-01-07 11:07:45'),
(15, 64, 'free', 'Active', '2014-01-16 07:58:18', NULL, NULL, 1, 0, 1, NULL, '2014-01-16 07:58:19', '2014-01-16 07:58:19'),
(16, 2, 'free', 'Active', '2014-01-16 09:24:05', NULL, NULL, 1, 0, 1, NULL, '2014-01-16 09:24:09', '2014-01-16 09:24:09'),
(17, 3, 'free', 'Active', '2014-01-16 11:21:04', NULL, NULL, NULL, 0, 1, NULL, '2014-01-16 11:21:05', '2014-01-16 11:21:05'),
(18, 4, 'free', 'Active', '2014-01-16 13:50:29', NULL, NULL, 1, 0, 1, NULL, '2014-01-16 13:50:29', '2014-01-16 13:50:29'),
(19, 5, 'paypal', 'Pending', '2014-01-16 13:52:40', NULL, NULL, 2, 1, 0, '2014-02-16 13:52:40', '2014-01-16 13:52:40', '2014-01-16 13:52:40'),
(20, 6, 'free', 'Active', '2014-01-17 06:55:24', NULL, NULL, 1, 0, 1, NULL, '2014-01-17 06:55:33', '2014-01-17 06:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `music_info` varchar(255) DEFAULT NULL,
  `music_catid` int(11) DEFAULT NULL,
  `music_desc` text,
  `music_label` tinyint(1) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `music_source_local` varchar(255) DEFAULT NULL,
  `music_source_youtube` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `biography` text,
  `hits` int(11) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `lastlogintime` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `user_type`, `plan_id`, `first_name`, `last_name`, `phone`, `music_info`, `music_catid`, `music_desc`, `music_label`, `profile_photo`, `music_source_local`, `music_source_youtube`, `country_id`, `state_id`, `city`, `zip`, `confirmation_token`, `confirmed_at`, `confirmation_sent_at`, `unconfirmed_email`, `biography`, `hits`, `featured`, `role`, `lastlogintime`, `latitude`, `longitude`) VALUES
(1, 'admin@artist.com', '$2a$10$ZtqQgS0SepEb9iQ9PrghJu.sR.0.j8HW4RiAotdjQCAtPkBtsLjkO', NULL, NULL, NULL, 69, '2014-01-16 09:30:05', '2014-01-16 04:11:41', '127.0.0.1', '127.0.0.1', '2013-11-18 06:06:08', '2014-01-16 14:29:22', NULL, NULL, 'Super', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 232, NULL, NULL, NULL, NULL, '2013-11-21 12:13:34', NULL, NULL, NULL, NULL, NULL, 'administrator', 1389882562, NULL, NULL),
(2, 'taylor.swift@gmail.com', '$2a$10$tJiOPS6.TGLMt/JECH3i1uYUr.Z/yErsDRy6sftfl61uRVQW1tf3u', NULL, NULL, NULL, 10, '2014-01-17 09:00:18', '2014-01-17 08:47:21', '127.0.0.1', '127.0.0.1', '2014-01-16 09:24:05', '2014-01-17 12:14:36', 'artist', 1, 'Taylor', 'Swift', '789', 'Love Story', 3, '"Love Story" is a country pop song performed by American singer-songwriter Taylor Swift. The song was written by Swift and produced by Nathan Chapman, alongside Swift.', 1, 'taylor_f9811aef5ffb65e1cf8d.jpg', NULL, 'http://www.youtube.com/watch?v=8xg3vE8Ie_E', 223, 3, 'Camp Verde', '85119', NULL, NULL, NULL, NULL, 'Taylor Alison Swift was born on December 13, 1989 in Reading, Pennsylvania.[1] Her father, Scott Kingsley Swift, is a Merrill Lynch financial adviser.[2][3] Scott was raised in Pennsylvania and is the descendant of three generations of bank presidents.[1][4] Her mother, Andrea (née Finlay), is a homemaker who previously worked as a mutual fund marketing executive.[5] Andrea spent the first ten years of her life in Singapore, before settling in Texas; her father was an oil rig engineer who worked throughout Southeast Asia.[4] Swift has a younger brother, Austin, who attends the University of Notre Dame.[6] She and her brother were raised in the Presbyterian faith and attended bible school.[7][8] She spent the early years of her life on an eleven-acre Christmas tree farm in Cumru Township, Pennsylvania.[9] She attended preschool and kindergarten at the Alvernia Montessori School, run by Franciscan nuns,[10] and was later educated at the Wyndcroft School, a co-ed private school.[11] When Swift was nine years old, the family moved to a rented house in the suburban town of Wyomissing, Pennsylvania,[12] where she attended West Reading Elementary Center and Wyomissing Area Junior/Senior High School.[13] Swift summered at her parents'' waterfront vacation home in Stone Harbor, New Jersey and has described it as the place "where most of my childhood memories were formed."[14]', NULL, 1, 'registered', 1389960876, '34.546429', '-111.83921'),
(3, 'demi.latov@gmail.com', '$2a$10$Ta9i.KQ.m4jxbW/s2WQsd..VvF9sFBcVitBkHTz.FdEYQ216BrxmG', NULL, NULL, NULL, 7, '2014-01-17 10:12:29', '2014-01-17 10:00:11', '127.0.0.1', '127.0.0.1', '2014-01-16 11:21:04', '2014-01-17 11:37:25', 'fan', NULL, 'Demi', 'Latov', '78888', NULL, NULL, NULL, NULL, 'demi_36f6fdb393565b007a05.jpg', NULL, NULL, 223, 3, 'Camp Verde', '85119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'registered', 1389958645, '33.5199031', '-111.3083499'),
(4, 'shakira@gmail.com', '$2a$10$N..FsPTUjmMaVWikgmIcMeUedmBdyhoo.iSI1uJE.I9t7TRC/w1DW', NULL, NULL, NULL, 1, '2014-01-16 13:50:30', '2014-01-16 13:50:30', '127.0.0.1', '127.0.0.1', '2014-01-16 13:50:29', '2014-01-16 13:51:20', 'artist', 1, 'Gerrard', 'Shakira', '123213', 'roar', 9, 'test', 1, 'gerrard_024e3134bb940fa7996a.jpg', NULL, 'http://www.youtube.com/watch?v=8xg3vE8Ie_E', 223, 3, 'Apache Junction', '85743', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'registered', 0, '32.2774608', '-110.9842112'),
(5, 'miley.cyrus@gmail.com', '$2a$10$1t37C0y3mV7s/850WECsdOMIQHvpSEFX2Pc8CC4P0D9a0YqhmJnRS', NULL, NULL, NULL, 1, '2014-01-16 14:06:55', '2014-01-16 14:06:55', '127.0.0.1', '127.0.0.1', '2014-01-16 13:52:40', '2014-01-16 14:08:23', 'artist', 2, 'Miley', 'Cyrus', '4555', 'test', 7, '', 0, 'miley_16c1be0756279be600d5.jpg', NULL, 'http://www.youtube.com/watch?v=8xg3vE8Ie_E', 223, 3, 'Apache Junction', '85119', NULL, NULL, NULL, NULL, '', NULL, NULL, 'registered', NULL, '33.4150485', '-111.5495777'),
(6, 'shamim@evatix.com', '$2a$10$F/iKuo.WrQY5J8pPaGWa/uPo4v.r1zHJ9hFtVXdxUvj2dOmLHG6ym', NULL, NULL, NULL, 1, '2014-01-17 06:55:33', '2014-01-17 06:55:33', '127.0.0.1', '127.0.0.1', '2014-01-17 06:55:24', '2014-01-17 07:04:17', 'artist', 1, 'Asadujzaman', 'Shamim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'registered', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `path` text,
  `published` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `thumb` text,
  `source` varchar(255) DEFAULT NULL,
  `remote_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_videos_on_user_id` (`user_id`),
  KEY `index_videos_on_source` (`source`),
  KEY `index_videos_on_remote_path` (`remote_path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `user_id`, `title`, `desc`, `path`, `published`, `created_at`, `updated_at`, `featured`, `hits`, `thumb`, `source`, `remote_path`) VALUES
(2, 2, 'Taylor Swift - I Knew You Were Trouble', 'Taylor Swift - I Knew You Were Trouble ', NULL, 1, '2014-01-16 11:10:36', '2014-01-17 11:34:24', NULL, 2, NULL, 'remote', 'http://www.youtube.com/watch?v=vNoKguSdy4Y'),
(3, 2, 'The 2013 Victoria''s Secret Fashion Show - Taylor Swift Performance', 'Taylor Swift performs her hit song "I Knew You Were Trouble" at the Victoria Secret Show. For more Victoria''s Secret Fashion ... ', NULL, 1, '2014-01-16 11:26:16', '2014-01-17 09:48:24', NULL, 31, NULL, 'remote', 'http://www.youtube.com/watch?v=VuNIsY6JdUw');

-- --------------------------------------------------------

--
-- Table structure for table `video_favorites`
--

DROP TABLE IF EXISTS `video_favorites`;
CREATE TABLE IF NOT EXISTS `video_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `video_favorites`
--

INSERT INTO `video_favorites` (`id`, `video_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, '2014-01-17 06:38:15', '2014-01-17 06:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `video_watches`
--

DROP TABLE IF EXISTS `video_watches`;
CREATE TABLE IF NOT EXISTS `video_watches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `video_watches`
--

INSERT INTO `video_watches` (`id`, `video_id`, `user_id`, `ip`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '127.0.0.1', '2014-01-16 11:29:22', '2014-01-16 11:29:22'),
(2, 3, 3, '127.0.0.1', '2014-01-17 05:40:08', '2014-01-17 05:40:08'),
(3, 3, 2, '127.0.0.1', '2014-01-17 09:48:04', '2014-01-17 09:48:04');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

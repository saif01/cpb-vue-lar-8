-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2021 at 01:11 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cpb-vue`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_business_operations`
--

CREATE TABLE `about_business_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_business_operations`
--

INSERT INTO `about_business_operations` (`id`, `title`, `details`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Aquaculture Business', 'It has three fish hatcheries : Comilla fish hatchery, Sherpur fish hatchery, Dashuria fish hatchery. It does business of three types of products-a). Floating Fish Feed, b). Sinking Fish Feed, c) Tilapia Baby Fish (0.3-0.5g size).', '1', '4', '2021-04-07 06:32:03', '2021-04-07 06:32:20'),
(3, 'Breeder Farm Business', 'More than 24 Breeder Farms supplies the hatching eggs to the hatchery business from different regions of Bangladesh.', '1', '4', '2021-04-07 06:35:19', '2021-04-07 06:35:19'),
(4, 'Feed Mill Operation', 'There are 4 Feed Mills in all over Bangladesh including the largest&nbsp; Feed Mill (Dhaka Feed Mill) in South Asia where produce broiler, layer, breeder, fish &amp; cattle feed.', '1', '4', '2021-04-07 06:36:19', '2021-04-07 06:36:19'),
(5, 'Feed Technology Office', 'Feed Technology office develops new product, maintain feed quality and performance. Moreover it tests new raw materials, feed additives, and medicine etc. For doing these activities FTO has a research Farm.', '1', '4', '2021-04-07 06:36:51', '2021-04-07 06:36:51'),
(6, 'Food Business', 'CP Food Business is one of the three core businesses of the Thai based global conglomerate- CP Group. It mainly produces and markets poultry products that are Ready-to-eat products, Ready-to-cook. There are more than 100 food outlets in Dhaka and Chittagong together. Modern Trade operates marketing at more than 60 super-shops or chain-shops.', '1', '4', '2021-04-07 06:37:17', '2021-04-07 06:37:17'),
(7, 'Hatchery Business', 'Hatchery farms produce quality day old chicks (Layer and broiler) that are healthy, sturdy and suitable to the farming condition of Bangladesh. There are 9 hatcheries in all over Bangladesh.', '1', '4', '2021-04-07 06:37:44', '2021-04-07 06:37:44'),
(8, 'Integration Business', 'There are 12 layer and broiler farms under Integration business and more than 18 sales branches.', '1', '4', '2021-04-07 06:38:05', '2021-04-07 06:38:05'),
(9, 'Organic Fertilizer', 'Organic fertilizers are a kinder, gentler way to give plants the nutrients they need. It is very eco friendly farming system .Organic fertilizers usually come from manure and guano of chickens of various farms.', '1', '4', '2021-04-07 06:38:31', '2021-04-07 06:38:31'),
(10, 'Seed Business', 'C.P. Bangladesh Co., Ltd. established its Seed Business as a part of Business Diversification during the year 2005-06. Company Imports Hybrid Corn seed from C.P. Seeds India Pvt. Ltd.', '1', '4', '2021-04-07 06:38:53', '2021-04-07 06:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `about_chairman_messages`
--

CREATE TABLE `about_chairman_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_chairman_messages`
--

INSERT INTO `about_chairman_messages` (`id`, `title`, `details`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'Mr. Santi Pongchaisopon', '<p>C.P. Bangladesh Co.; Ltd. is an agro -industrial and food conglomerate, which is operating since 1998. We Started off with asmall feed mill locatedin Savar and we haveexpanded extensively accross from feed to food business.</p><p>We Know being a good company means being a responsible corporate citizen-inevery location, to every employee, and to all stakeholders. This is what CPB strivesto achieve. From high- quality, safe and nutricious productsfor all customersto be safetyof oir employees, we know that doing the right thingis the best practice for our company and society.<br></p>', 'k1j15gM15KDOxAkzWefaswTtwORnLmv6QTW2iH8P.jpg', '1', '4', '2021-04-07 04:45:48', '2021-04-07 05:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `about_headquarters`
--

CREATE TABLE `about_headquarters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_headquarters`
--

INSERT INTO `about_headquarters` (`id`, `country`, `company`, `address`, `phone`, `email`, `website`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Thailand', 'Charoen Pokphand Foods Public Company Limited', '313 C.P. Tower, Silom Road, Bangrak, Bangkok 10500, Thailand', '+662-625-8000', 'prcpgroup@cp.co.th', 'http://www.cpgroupglobal.com', '1', '4', '2019-09-25 05:41:31', '2021-06-30 05:04:43'),
(3, 'China, (Guangzhou)', 'CPF Food Trading Co., Ltd.', 'Suite 1007B,T.P. PLAZA 9/109,Liu Hua Road, Guangzhou, China', '862158358683', 'contact@charoenpokphand.com', 'http://www.cpp.hk/', '1', NULL, '2019-09-25 05:41:31', '2020-01-29 04:10:34'),
(4, 'China, (Shanghai)', 'CPF Food Trading Co., Ltd.', 'No.138, Yong Hua Building, Room 25B Pu Dong Avenue,  Shanghai 200120, China', '862158358683', 'contact@charoenpokphand.com', 'http://www.cpp.hk/', '1', NULL, '2019-09-25 05:41:31', '2020-01-29 04:10:22'),
(5, 'Hong Kong', 'C.P. Pokphand Co., Ltd.', '21st Floor, Far East Finance Centre,  16 Harcourt Road, Hong Kong', '85225201601', 'contact@charoenpokphand.com', 'http://www.cpp.hk/', '1', NULL, '2019-09-25 05:41:31', '2020-01-29 03:54:59'),
(6, 'China, (Beijing)', 'CPF Food Trading Co., Ltd.', 'Room 906, Tianchuang Shengfang Center, No.23 South 3rd Ring Road East, Fengtai District, Beijing, China', '(8610) 85089000', 'contact@charoenpokphand.com', 'http://www.cpgroup.cn', '1', '4', '2020-01-29 04:13:28', '2021-06-30 04:37:43'),
(7, 'Hong Kong Branch-2', 'CP Merchandising Co., Ltd.', 'Suite 2505, 25th Floor, Skyline Tower, 39 Wang Kwong Road, Kowloon Bay, Kowloon, Hong Kong', '85235079100', 'contact@charoenpokphand.com', 'http://www.cpp.hk/', '1', NULL, '2020-01-29 04:18:40', '2020-01-29 04:18:40'),
(8, 'Singapore', 'C.P. Intertrade Singapore (Pte) Ltd.', '3 Ubi Ave 3 #05-71/72 Vertex, Singapore 408868', '+65 6538 7020', 'contact@charoenpokphand.com', 'http://www.cpbrand.com/sg', '1', '4', '2020-01-29 04:23:54', '2021-06-30 05:02:06'),
(9, 'Malaysia', 'Charoen Pokphand Foods (Malaysia) Sdn. Bhd.', '6th Floor, Wisma Lee Kay Huan, Jalan Genting Kelang,  53200 Setapak, Kuala Lumpur, Malaysia', '+603-4027-1800', 'aqua@cp-malaysia.com', 'http://www.cp-malaysia.com', '1', '4', '2020-01-29 04:25:50', '2021-06-30 04:55:26'),
(10, 'Taiwan', 'Charoen Pokphand Enterprise (Taiwan) Co., Ltd.', '17th Floor ,The Taipei Empire Building, 87, Suang Chiang Rd, Taipei, Taiwan', '886225077071', 'service@cptwn.com.tw', 'http://www.cptwn.com.tw', '1', NULL, '2020-01-29 04:28:50', '2020-01-29 04:28:50'),
(11, 'Japan', 'CPF Tokyo Co., Ltd.', '8 Floor Shibanishii Building, No.9-1,  Shiba 4-Chome, Minato-Ku, Tokyo 108-0014, Japan', '+81 3 5401 2231', 'contact@charoenpokphand.com', 'https://cpjapan.com/', '1', '4', '2020-01-29 04:31:23', '2021-06-30 04:49:38'),
(12, 'Souh Korea', 'CPK Foods System Co., Ltd.', '1F, Bu Key Bldg, 11-1 Kyobuk-Dong, Jongro-Gu, Seoul 110-090, South Korea', '8227363470', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', NULL, '2020-01-29 04:33:04', '2020-01-29 04:33:04'),
(13, 'Philippines', 'Charoen Pokphand Foods Philippines Corporation', 'Unit 1C-1D LSC Blgd., Lazatin Blvd., Dolores Homesite Exit2, San Fernando 2000, Pampanga, Philippines', '+63-45-961-4892, +63-45-961-4441', 'contact@charoenpokphand.com', 'http://www.cpf-phil.com/home.php', '1', '4', '2020-01-29 04:36:31', '2021-06-30 05:00:37'),
(14, 'Vietnam', 'C.P. Vietnam Corporation', 'No.2 , 2A Street , Bien Hoa Industrial Zone 2 , Bien Hoa City , Dong Nai Province , Vietnam', '+84-613 836 251-3', 'info@cp.com.vn', 'http://www.cp.com.vn', '1', '4', '2020-01-29 04:39:52', '2021-06-30 05:12:38'),
(15, 'Laos', 'C.P. Laos Co., Ltd.', '363/4-5 khum Pheng Muang Road, Ban Phonthaneua, Unit 34, Xaysettha District, Vientiane, Laos', '+856-21-453508-10', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', '4', '2020-01-29 05:06:16', '2021-06-30 04:54:05'),
(16, 'India', 'Charoen Pokphand (India) Private Limited', '104, G.N.T Road, Nallur & Vijaynallur Village, Sholavaram Post, Red Hills, Chennai - 600 067, India', '080-6674 6300', 'customersupportfood@cp-india.com', 'https://cpbrandindia.com/', '1', '4', '2020-01-29 05:07:52', '2021-06-30 04:42:27'),
(17, 'Australia', 'CP Merchandising Co., Ltd. (Australia Branch)', 'Suite CE11 & CE12, Level 2, 425 Docklands Drive,  Docklands 3008, Victoria, Australia', '61386029199', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', NULL, '2020-01-29 05:09:43', '2020-01-29 05:09:43'),
(18, 'South Africa', 'C.P. Intertrade South Africa (Pty) Ltd.', '55 Silwerkloof Estate, Silwerboom Avenue,  Plattekloof 3, 7500', '+34 91 359 8882', '', '', '1', '4', '2020-01-29 05:11:39', '2021-06-30 05:03:02'),
(19, 'United Arab Emirates', 'C.P. Foods Middle East', 'C.P. Foods Middle East  P.O. Box 61186 Dubai, U.A.E.', '+971 4881 7844', '', '', '1', '4', '2020-01-29 05:14:01', '2021-06-30 05:09:39'),
(20, 'United Kingdom', 'C.P. Foods (UK) Limited', 'Avon House Hartlebury Trading Estate Hartleburry, Nr Kidderminster Worcestershire DY10 4JB', '+44-1299-253131', 'help@cpfoods.co.uk', 'http://www.cpfoods.co.uk', '1', '4', '2020-01-29 05:15:17', '2021-06-30 05:10:14'),
(21, 'United States of America-1', 'C.P. Food Products, Inc. (Head Office)', '7135 Minstrel Way, Suite 203 Columbia, MD 21045 USA', '18007206668', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', NULL, '2020-01-29 05:17:11', '2020-01-29 05:17:11'),
(22, 'United States of America-2', 'C.P. Food Products, Inc. (Irvine Office)', '17801 Sky Park Circle, Suite K, Irvine, CA 92614 USA', '18007206668', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', NULL, '2020-01-29 05:18:24', '2020-01-29 05:18:24'),
(23, 'Russia', 'CPF Overseas LLC. (Moscow Branch)', 'Moscow Region, Lukhovitsy, Pushkina Street, 8th km, Russia', '+7-496-636-12-55', 'contact@charoenpokphand.com', 'http://www.cpfrussia.ru/en', '1', '4', '2020-01-29 05:30:35', '2021-06-30 05:01:38'),
(24, 'Italy', 'CPF Europe S.A.', 'Filiale Italiana Via E. Fermi 32,  20019 Settimo, Milanese (MI), Italy', '+32/2-357.53.80', 'contact@cpfeurope.com', 'http://www.cpfeurope.com', '1', '4', '2020-01-29 05:32:11', '2021-06-30 04:46:24'),
(25, 'Turkey', 'C.P. Standart Gida Sanayi ve Ticaret A.S.', 'Buyukdere Cad. Akinci Bayiri Sok No.,  6 34394 Mecidiyekoy, Istanbul, Turkey', '+90 212-274-8536', 'info@cpturkiye.com', 'http://www.cpturkiye.com', '1', '4', '2020-01-29 05:33:48', '2021-06-30 05:09:17'),
(26, 'Belgium', 'CPF Europe S.A.', 'Avenue Belle Vue 17,  Waterloo 1410, Belgium', '3223575380', 'info@topsfoods.com', 'http://www.cpfeurope.be', '1', '4', '2020-01-29 05:36:02', '2021-06-30 04:32:44'),
(27, 'Spain', 'CP Merchandising Co., Ltd. Sucural en Espana', 'Principe de Vergara No.291, Entreplanta 1a, Local 3 Esc. lzquierda 28016 Madrid, Spain', '+34 91 359 8882', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', '4', '2020-01-29 05:38:39', '2021-06-30 05:02:28'),
(28, 'Denmark', 'CHAROEN POKPHAND FOODS PCL', 'Tomrevej 10A PO Box 67  DK6800 Varde-Denmark', '+45 7526 1330', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', '4', '2020-01-29 05:42:47', '2021-06-30 04:38:39'),
(29, 'France', 'CP Merchandising Co., Ltd.', '10-12 avenue de la Marne 92120 Montrouge, France', '+33 1 4655 8533', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', '4', '2020-01-29 05:43:40', '2021-06-30 04:39:28'),
(30, 'Germany', 'CP Merchandising Co., Ltd. (Germany Branch)', 'Am Neumarkt 30, 22041 Hamburg Germany', '+49 40 692 19841', 'contact@charoenpokphand.com', 'http://www.cpfworldwide.com', '1', '4', '2020-01-29 05:44:30', '2021-06-30 04:39:57'),
(31, 'Cambodia', 'C.P. Cambodia Co., Ltd.', 'K.M 25, National Road No.4,Bek Chan Commune,Ang Snoul Destrict, Kandal Province.', '024-397 339/340/341/342', 'info@cpcambodia.com.kh', 'www.cpcambodia.com.kh', '1', '4', '2021-06-30 04:34:04', '2021-06-30 04:34:34'),
(32, 'INDONESIA', 'PT CHAROEN POKPHAND INDONESIA TBK', 'Jl. Ancol VIII/1 Jakarta 14430, Indonesia', '62-21-6919999', '', 'www.cp.co.id', '1', '4', '2021-06-30 04:43:32', '2021-06-30 04:43:32'),
(33, 'MYANMAR', 'Myanmar C.P. Livestock', 'No.135, Pyay Road, 8 miles, Mayangone Township ,Yangon, Myanmar', '951-651324,651325', '', 'https://www.myanmarcp.com', '1', '4', '2021-06-30 04:56:27', '2021-06-30 04:56:27'),
(34, 'PAKISTAN', 'Charoen Pokphand Pakistan (Pvt.) Ltd', '18-A, Commercial Zone,Sector A,, Phase 5, DHA., Lahore, Pakistan', '0324-610-8888', '', '', '1', '4', '2021-06-30 04:59:54', '2021-06-30 04:59:54');

-- --------------------------------------------------------

--
-- Table structure for table `about_histories`
--

CREATE TABLE `about_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_histories`
--

INSERT INTO `about_histories` (`id`, `date`, `title`, `details`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(5, '1921-01-01', 'C.P.Group-Founded', '<p>Founded in Thailand<br><br></p>', 'YJOXdVnvmLo8fA1hn7t4GTE8ukIZVbw6Chh0oZyT.jpg', '1', '4', '2019-11-21 02:48:51', '2021-06-29 17:05:49'),
(6, '1998-01-01', 'Invest in Bangladesh', '<p>Charoen Pokphand  group invest in Bangladesh .<br><br>Acquisition of common shares of 3 agro-industries public companies of Charoen Pokphand Group in Thailand.<br><br></p>', 'bT9HAGaulEtepfXSgdCdQpcPEHMU87gYEAH8gKcq.gif', '1', '4', '2019-11-21 03:03:08', '2021-06-01 06:58:38'),
(7, '1999-01-01', 'CPF', '<p><span style=\"font-size:10.0pt;font-family:Calibri;\r\nmso-ascii-font-family:Calibri;mso-fareast-font-family:+mn-ea;mso-bidi-font-family:\r\n+mn-cs;color:black;mso-color-index:1;mso-font-kerning:12.0pt;language:en-US\"><span style=\"mso-spacerun:yes\">&nbsp;</span></span><span style=\"font-size:10.0pt;\r\nfont-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:+mn-ea;\r\nmso-bidi-font-family:+mn-cs;color:black;mso-color-index:1;mso-font-kerning:\r\n12.0pt;language:en-US\">Renamed as “ Charoen Pokphand Foods Public Limited” </span></p>', 'zH6LmFLCJHfVPOSu76MqgWnkNTBp3baIMceeml7s.png', '1', '4', '2019-11-21 03:20:06', '2021-06-01 04:55:09'),
(8, '2002-01-01', 'Inventment in UK & China', '<p>Invest in the United Kingdom, currently operates business in producing chilled food products for supply to the EU market.<br><br>Invested in China, currently operates business in manufacturing and distribution of aquatic feed, as well as aquatic hatchery and farming.<br><br></p>', 'omApotDQiirDCH8VE3twpde20hcuUYCt0abWt56o.png', '1', '4', '2019-11-21 03:24:31', '2021-04-06 09:03:51'),
(9, '2004-01-01', 'Investment in Turkey', '<p>Invested in Turkey currently operates business in manufacturing and distribution of livestock feed and fully integrated chicken business.<br><br></p>', 'rRI6yGGgZFhsVSgN2IiTccGsgquVcFE5oFdf5AkW.png', '1', '4', '2019-11-21 03:26:18', '2021-04-06 09:03:35'),
(10, '2005-01-01', 'CP Five Star', '<p>\r\n\r\n</p><p style=\"language:en-US;margin-top:0pt;margin-bottom:0pt;margin-left:0in;\r\ntext-align:justify;text-justify:inter-ideograph;direction:ltr;unicode-bidi:\r\nembed;mso-line-break-override:none;word-break:normal;punctuation-wrap:hanging\"><span style=\"font-size:10.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;\r\nmso-fareast-font-family:+mn-ea;mso-bidi-font-family:+mn-cs;color:black;\r\nmso-color-index:1;mso-font-kerning:12.0pt;language:en-US\">Acquired the Five Star business as bridge into the food industry.<br>Increased shareholding in Charoen Pokphand (India) Private Limited (CP India) currently operates business in manufacturing and distribution animal feed and animal farming, from 19.0%  to 71.2%.</span></p><p style=\"language:en-US;margin-top:0pt;margin-bottom:0pt;margin-left:0in;\r\ntext-align:justify;text-justify:inter-ideograph;direction:ltr;unicode-bidi:\r\nembed;mso-line-break-override:none;word-break:normal;punctuation-wrap:hanging\"><span style=\"font-size:10.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;\r\nmso-fareast-font-family:+mn-ea;mso-bidi-font-family:+mn-cs;color:black;\r\nmso-color-index:1;mso-font-kerning:12.0pt;language:en-US\">Invested in Malaysia<br><br></span><span style=\"font-size:\r\n10.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:\r\n+mn-ea;mso-bidi-font-family:+mn-cs;color:black;mso-color-index:1;mso-font-kerning:\r\n12.0pt;language:en-US\"></span></p>', '3QsfJLpIYx9xUUUoKX5lwjW4woG2TdEDqZGqT6yB.jpg', '1', '4', '2019-11-21 03:28:49', '2021-06-30 03:32:27'),
(11, '2007-01-01', 'Investment in Philippines', '<p>\r\n\r\n</p><p style=\"language:en-US;margin-top:0pt;margin-bottom:0pt;margin-left:0in;\r\ntext-align:left;direction:ltr;unicode-bidi:embed;mso-line-break-override:none;\r\nword-break:normal;punctuation-wrap:hanging\"><span style=\"font-size:10.0pt;\r\nfont-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:+mn-ea;\r\nmso-bidi-font-family:+mn-cs;color:black;mso-color-index:1;mso-font-kerning:\r\n12.0pt;language:en-US\">Invested in Philippines, currently operates business in\r\nshrimp hatchery.</span></p>', 'Bi9cFUoh8gDwa37gK9Kg3T3SrQAp6KsBOHDzTclw.jpg', '1', '4', '2019-11-21 03:31:35', '2021-04-06 09:03:01'),
(12, '2009-01-01', 'Investment in Taiwan', '<p>Invested in Taiwan, currently operates business in manufacturing and distribution of animal feed, livestock farming, and food processing.<br><br></p>', 'Q3AKVzaAvCKkhXS61JF0x5UTaiHj2MTIXLKVSxaP.png', '1', '4', '2019-11-21 03:33:42', '2021-04-06 09:02:37'),
(13, '2010-01-01', 'Agribusiness to Food & Beverage', '<p>Reclassified CPF’s sector from “Agribusiness” to Food and “Beverage”.<br><br></p>', 'gi8k1i2Moo6zTz9v8KKefzlsBpHyelwgR7fP19fn.jpg', '1', '4', '2019-11-21 03:35:38', '2021-04-06 09:02:19'),
(14, '2011-01-01', 'Investment in Cambodia', '<p>Invested in Cambodia, mainly engages in manufacturing and distribution of animal feed, animal farming, and food processing.<br>.<br><br></p>', 'HyW0RcIyy218UpSqF1uaqiMlOQbcMxodWAtZwk6B.png', '1', '4', '2019-11-21 03:42:10', '2021-04-06 09:02:01'),
(15, '2012-01-01', 'Business expansion', '<p>Expanded business in Malaysia, China and Vietnam<br></p>', 'QsTa8RnoM3Pgvj6vPBqufxHYrU2aMEFS7oeoalhX.png', '1', '4', '2019-11-21 03:44:49', '2021-04-17 05:57:40');

-- --------------------------------------------------------

--
-- Table structure for table `about_missions`
--

CREATE TABLE `about_missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_missions`
--

INSERT INTO `about_missions` (`id`, `details`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Expanding feed Mill Factory (Livestock/Aquaculture)', '1', '4', '2019-10-02 03:16:19', '2021-04-11 05:48:44'),
(3, 'Expanding Hatchery and Breeder Farm', '1', '4', '2020-01-05 00:19:07', '2021-04-11 05:48:35'),
(4, 'Expanding Broiler and Layer Farm', '1', '4', '2020-01-05 00:20:13', '2021-04-11 05:48:24'),
(5, 'Expanding Aquaculture Business', '1', '4', '2020-01-05 00:20:42', '2021-04-11 05:47:47'),
(6, 'Expanding Food Business', '1', '4', '2020-01-05 00:21:00', '2021-04-11 05:47:35'),
(7, 'Focus on People Development', '1', '4', '2020-01-05 00:21:11', '2021-04-11 05:47:25'),
(8, 'Building Strong and Strategy CSR', '1', '4', '2020-01-05 00:21:20', '2021-09-15 05:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `about_president_messages`
--

CREATE TABLE `about_president_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_president_messages`
--

INSERT INTO `about_president_messages` (`id`, `title`, `details`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Mr. Suchat Suntipada', '<p>I am delighted to represent C.P. Bangladesh Co.;Ltd.(CPB), which is \'\'Built to last.\'\' We, the CPB people are proud to have continually delivered the right product at the right time for our valuable customers since its inception in 1998.At present, We can look back with great content at an excellent track-record marked with excellence and growth; living up to our vision \'\'Kitchen of Bangladesh\'\'.\"Just Good\" could be pleasing for some people, but the people of CPB want more than just good. Inside, Our significant six values make us to be better than good. we like to be part of an enthusiastic and dedicated team whose members, even few years later will be memorized for what they accomplished. CPB People like to move forward only for greatness.</p><p>To achieve our vision, CPB has set well-defined objectives together with maximizing efficiency, focusing on stakeholdersas well as customers\' desires, delivering high quality products, optimizing overall output, maintaining the highest extentof safety and protecting the environment. We the CPB people feel confident that our products today touch billions of people not only in Bangladesh but also around the world; that is the way by which \'\'CPB\'\' has become the icon of quality.</p><p> With the persistent support of the management &amp; employees, we shall\n be doing our utmost to keep up the company\'s leading competitive \nposition in Bangladesh as well as in the world at large and we shall \ncontinually strive to attain growth and excelence in customers\' \nservices.</p>', 'tlV8P93OMbD5gg5mkmx5DNlsKf5Ot9Rzel2rWzc8.jpg', '1', '4', '2021-04-07 05:14:11', '2021-04-20 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `about_visions`
--

CREATE TABLE `about_visions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_visions`
--

INSERT INTO `about_visions` (`id`, `title`, `details`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Kitchen of Bangladesh', 'C.P.Bangladesh Co. Ltd. is working with a vision to reach all the kitchens across Bangladesh.', '4J9uu8pEWVcF2YWGLGZACP11TIx3qhLV3z2iO4hf.jpg', '1', '4', '2021-04-06 10:33:25', '2021-04-06 11:24:57');

-- --------------------------------------------------------

--
-- Table structure for table `admin_logs`
--

CREATE TABLE `admin_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_logs`
--

INSERT INTO `admin_logs` (`id`, `ip`, `iso_code`, `country`, `city`, `state_name`, `postal_code`, `lat`, `lon`, `timezone`, `currency`, `device`, `browser`, `browser_version`, `platform`, `platform_version`, `login_id`, `status`, `count`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', '5', NULL, '2', '2021-09-15 09:29:57', '2021-09-15 09:53:23'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', 'syful.islrrrr', NULL, '1', '2021-09-15 09:47:47', '2021-09-15 09:47:47'),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', '4', '1', '1', '2021-09-15 09:54:10', '2021-09-15 09:54:10'),
(5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', '4', '1', '13', '2021-09-15 21:26:57', '2021-09-16 05:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `auth_api_tokens`
--

CREATE TABLE `auth_api_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `raw_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `saved_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_alls`
--

CREATE TABLE `business_alls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_alls`
--

INSERT INTO `business_alls` (`id`, `name`, `title`, `details`, `website`, `image`, `image2`, `image3`, `image4`, `image5`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(8, 'Feed', 'C.P. Feed Business', 'CPB is the pioneer and leader in the production of various forms of \nlivestock feed such as concentrate, powder and pellet. We have feed mill\n plants situated in every region of the country and some over 600 \nappointed agents/distributors to help market and distribute feed to \nsmall independent farmers across Thailand. In addition, some portion is \nsold directly to large animal farms. CPB pays attention to continuous \nimprovement on production efficiency and product quality and keeps \nup-to-date on international requirements and standard. High quality feed\n with low feed conversion ratio to help farmers lower their farming \ncosts.<br><br>Corn and soybean meal are main ingredients used in the \nproduction of livestock feed. CPB formulated pellet feed to meet the \nnutrition requirements appropriate to each stage of animal rearing and \ngrowth. Production processes are computer controlled to ensure \nconsistency in quality and specfied standard. These feeds are \nmanufactured and packed under the following brands, CP, Hyprovite, \nHi-Gro, Star Feed, Novo, Safe Feed, Erawan, Hogtonal, C.F., and Anvipro.\n Selling price is based on production cost at different time of the year\n and also under pricing guidelines of the Internal Trade Department of \nthe Ministry of Commerce.<br><br>CPB has set up central purchasing unit \nresponsible for procurement of all ingredients used in livestock and \naquatic feed. Our procurement policy is to purchase quality raw material\n meeting the required nutrition standard with priority given to domestic\n suppliers particularly those situated in close proximity to our \nfeedmill plants. This is to support our local farmers as well as \nminimize transport cost. Only when domestic supply is insufficient or \nhas inferior quality, CPB would then seek to imports<br><br>CPB focused \nto improve production processes to remain cost competitive as well as \nemployed marketing strategy to maintain quality and provide good \nservices for both before and after-sales. CPB also provided technical \nknowledge to agents/distributors and directly to independent farmers \nthrough seminars and extension centers. Our technical experts are \navailable to give advices on animal husbandry. Information is \ndisseminated through printed materials and electronic media via the \ninternet.<br><br>Aquatic Business Line<br><br>CPB is the pioneer and \nleader in the production and distribution of various forms of shrimp and\n fish feed such as concentrate, powder and pellet. Majority of our \naquatic feed is distributed through agents/distributors located in \nshrimp farming areas. Some portion is sold directly to large shrimp \nfarms. Soybean meal, fish meal and wheat flour are main ingredients used\n in the production of aquatic feed. Production processes are computer \ncontrolled to ensure consistency in quality and specified standard. \nThese feeds are manufactured and packed under the following brands, CP, \nStar Feed, Marine, Hi-Grade, Novo, Erawan, Turbo, D-Frog, and Safe Feed.<br><br>As\n a market leader, CPB’s products are well recognized by consumers. An \nimportant marketing strategy is to maintain high quality product and \nconsistent excellent customer service. Production processes are \nmonitored and ingredients are tested to ensure quality. CPB also \nprovided technical knowledge to agents/distributors and directly to \nindependent farmers through seminars and academic service centers. \nInformation is disseminated through printed materials. This is to ensure\n sustainability of the industry.', 'https://cpbangladesh.com/', 'rlvskw6IFLY3y90oqS8XeOTq4t3Piuz0gkYMuPml.jpg', 'YHjxoemxF1kMjiXU3U2Gnzd3JldYtTNVBD66Pssa.jpg', 'vg0c3VREc240ldvvS6hl2CtpW8QMp4w1Mx2HEhQk.jpg', 'sS6Oc3DB4LVJHOdDn7zjMAvx2hzWealxa7kzVA5l.jpg', '9cWnyutdLuxNQytyMjjmz4Jd2XbxFFCIQXdJk9Oa.jpg', '1', '4', '2021-04-15 08:53:40', '2021-04-16 10:33:32'),
(9, 'Farm', 'C.P.  Farm Business', 'CPB’s livestock farming business includes animal breeder, live animal, fresh eggs and processed livestock meat.<br><br><h5>Animal Breeder</h5>CPB is the leader in the research and development field of natural genetic selection. The objective is to produce quality breed that is healthy, sturdy and suitable to the farming condition of Thailand. CPB produces parent stocks of chicken broiler, duck and swine as well as broiler chick, layer chick, layer, duck and piglet. The process starts with imported grandparent stocks from abroad. Then CPB breeds and raises the animals for own use and sales to independent livestock farmers and agents/distributors.<br><br>CPB’s animal breeding farms are located in various provinces in Thailand. These farms are built based on closed and evaporative cooling system which is a modern farming system. The closed system is bio-secure to prevent possible entry of potential carriers. The evaporative cooling system maintains suitable temperature in the housing unit throughout the farming period with automated feeding and all computer-controlled.<br><br>Price of animal breeder is dependent of domestic supply and demand as well as quality of the breed. CPB emphasizes after-sales services and has branch offices all over the country to serve as academic service centers to provide and share know-how, technical information, and marketing and distribution knowledge to farmers.<br><b><br></b><h5>Live Animal, Fresh Eggs and Processed Livestock Meat</h5><br>Products in this category include live chicken, layer egg, live duck, duck egg, live swine, and processed livestock meat. These products are distributed to end consumers by our agents/distributors. Products are also distributed and sold to wholesalers, retailers and company-owned food processing plants and other processing plants in Thailand. Prices of product fluctuate depending on the supply and demand.<br><br>CPB emphasizes on continuous research and development in farming technology and techniques suitable to domestic growing condition, effective disease prevention, fast growth and low feed conversion ratio for high productivity and low production cost. At present, CPB employs closed and evaporative cooling system with computer-controlled feeding in all of its poultry and swine farming.<br><br>In addition to CPB-owned farms, CPB promotes chicken broiler and pig farming by providing animal breed, animal feed, animal drugs and farming techniques and know-how to farmers who have passed the screening process. Most farmers participating in the program employ the evaporative cooling system and other standards adopted by CPB. The farmers are compensated on the production outputs that meet standards set by CPB.<br><br>CPB is the first company outside the European Union to be awarded with the Animal Welfare Standard, the most stringent standard to date for export chicken. Consideration has to be given to all aspect of the animal welfare, e.g., animal must be provided with sufficient feed and water, animal must be raised in suitable and comfortable environment, animal is free from pain and diseases, animal must have free range, and animal must not be stressed.<br><br>Output from farming is processed into various basic processed meat products depending on market requirements. Some products are processed as fresh, some as chilled and some as frozen and sold to wholesalers and retailers, domestically and internationally. Selling price is subject to supply and demand in each respective market or at an earlier agreed price.<br><br><h5>Aquatic Business Line</h5><br>Main products under aquatic farming are as follow:<br><br><h5>Shrimp Fry and Fish Fry</h5><br>Quality shrimp fry is an important factor to ensure success in shrimp farming. CPB invests in research and development to produce quality fry that are disease resistant and suitable for growing in different climatic conditions. Primary species is white shrimp and secondary species is black tiger shrimp.<br><br>CPB has developed several fish breeds for commercial farming. Fish fries include tubtim fish which was developed from tilapia.<br><br>CPB’s shrimp and fish hatcheries employ good farm management and modern farming techniques with effective disease prevention and control. Our quality shrimp and fish fries are sought after. Prices depend on supply and demand and quality of the fries.<br><br><h5>Fresh Shrimp and Frozen Shrimp</h5><br>Fresh shrimp raised and harvested from CPB’s farms are supplied to company-owned processing plants. Shrimp fries and feed are from company-owned hatchery and feedmill. CPB employs closed farming system which is environmental friendly and bio-secure. No antibiotic is used at any stage of production.<br><br>CPB exports frozen shrimp from its processing plants through importers in respective market. Price is dependent on supply and demand or upon agreement based on customer’s specification.<br><br>CPB produces parent stocks of chicken broiler, duck and swine as well as broiler chick, layer chick, layer, duck and piglet. The process starts with imported grandparent stocks from abroad. Then CPB breeds and raises the animals<br>', 'https://cpbangladesh.com/', 'LNSUuz5KJsbFjZOhGPou6ElXX9bXGCUnJGnVTspc.jpg', 'aJfywsN4KHi7nZOFPBpS4wIeavo8pmt8e3m8bAGS.jpg', 'p6TaOKAnV2DmAHip6mBjQShwXVXrORhM5ob98Dlo.jpg', 'l9FQ3tqS8NG9vn6zAqlonE3YtyP74zlfITHapmkm.jpg', 'FOse2yVAaW4fY6SB487WImGBHD1jKipm5p8OMdQB.jpg', '1', '4', '2021-04-15 09:07:48', '2021-06-30 05:18:45'),
(10, 'Food', 'C.P. Food Business', '<p>Fast food &amp; Fresh food</p><p><br></p>', 'https://food.cpbangladesh.com/', 'QsCZkMGy79zUxCFO7urtom7uTZ93accLPQ2K8Yeh.jpg', '5iV5i5Z6eEkaYlh391emHrT1uLcFrKZUWceOcSVC.jpg', 'Mvhn2uOngZLcL8vlU2Hbx3y3CCCRdQTJR2887MzI.jpg', 'Ahd2uh1CwKcEG0KGYVRNMurf8DnUJAFuGXz51GuC.jpg', 'Cp6GkWOQaTf7bA76O7t1hdDJsyKKZjHDAkOXhTNE.jpg', '1', '4', '2021-04-15 09:10:10', '2021-04-16 10:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `business_farms`
--

CREATE TABLE `business_farms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_farms`
--

INSERT INTO `business_farms` (`id`, `name`, `title`, `details`, `website`, `image`, `image2`, `image3`, `image4`, `image5`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'C.P. Farm Business', 'Charoen Pokphand Farm Business', '<blockquote>CPB’s livestock farming business includes animal breeder, live animal, fresh eggs and processed livestock meat.</blockquote><p>Animal Breeder</p><p>CPB is the leader in the research and development field of natural genetic selection. The objective is to produce quality breed that is healthy, sturdy and suitable to the farming condition of Thailand. CPB produces parent stocks of chicken broiler, duck and swine as well as broiler chick, layer chick, layer, duck and piglet. The process starts with imported grandparent stocks from abroad. Then CPB breeds and raises the animals for own use and sales to independent livestock farmers and agents/distributors.</p><p>CPB’s animal breeding farms are located in various provinces in Thailand. These farms are built based on closed and evaporative cooling system which is a modern farming system. The closed system is bio-secure to prevent possible entry of potential carriers. The evaporative cooling system maintains suitable temperature in the housing unit throughout the farming period with automated feeding and all computer-controlled.</p><p>Price of animal breeder is dependent of domestic supply and demand as well as quality of the breed. CPB emphasizes after-sales services and has branch offices all over the country to serve as academic service centers to provide and share know-how, technical information, and marketing and distribution knowledge to farmers.</p><p>Live Animal, Fresh Eggs and Processed Livestock Meat</p><p>Products in this category include live chicken, layer egg, live duck, duck egg, live swine, and processed livestock meat. These products are distributed to end consumers by our agents/distributors. Products are also distributed and sold to wholesalers, retailers and company-owned food processing plants and other processing plants in Thailand. Prices of product fluctuate depending on the supply and demand.</p><p>CPB emphasizes on continuous research and development in farming technology and techniques suitable to domestic growing condition, effective disease prevention, fast growth and low feed conversion ratio for high productivity and low production cost. At present, CPB employs closed and evaporative cooling system with computer-controlled feeding in all of its poultry and swine farming.</p><p>In addition to CPB-owned farms, CPB promotes chicken broiler and pig farming by providing animal breed, animal feed, animal drugs and farming techniques and know-how to farmers who have passed the screening process. Most farmers participating in the program employ the evaporative cooling system and other standards adopted by CPB. The farmers are compensated on the production outputs that meet standards set by CPB.</p><p>CPB is the first company outside the European Union to be awarded with the Animal Welfare Standard, the most stringent standard to date for export chicken. Consideration has to be given to all aspect of the animal welfare, e.g., animal must be provided with sufficient feed and water, animal must be raised in suitable and comfortable environment, animal is free from pain and diseases, animal must have free range, and animal must not be stressed.</p><p>Output from farming is processed into various basic processed meat products depending on market requirements. Some products are processed as fresh, some as chilled and some as frozen and sold to wholesalers and retailers, domestically and internationally. Selling price is subject to supply and demand in each respective market or at an earlier agreed price.</p><p>Aquatic Business Line</p><p>Main products under aquatic farming are as follow:</p><p>Shrimp Fry and Fish Fry</p><p>Quality shrimp fry is an important factor to ensure success in shrimp farming. CPB invests in research and development to produce quality fry that are disease resistant and suitable for growing in different climatic conditions. Primary species is white shrimp and secondary species is black tiger shrimp.</p><p>CPB has developed several fish breeds for commercial farming. Fish fries include tubtim fish which was developed from tilapia.</p><p>CPB’s shrimp and fish hatcheries employ good farm management and modern farming techniques with effective disease prevention and control. Our quality shrimp and fish fries are sought after. Prices depend on supply and demand and quality of the fries.</p><p>Fresh Shrimp and Frozen Shrimp</p><p>Fresh shrimp raised and harvested from CPB’s farms are supplied to company-owned processing plants. Shrimp fries and feed are from company-owned hatchery and feedmill. CPB employs closed farming system which is environmental friendly and bio-secure. No antibiotic is used at any stage of production.</p><p>CPB exports frozen shrimp from its processing plants through importers in respective market. Price is dependent on supply and demand or upon agreement based on customer’s specification.</p><p><br></p><p>CPB produces parent stocks of chicken broiler, duck and swine as well as broiler chick, layer chick, layer, duck and piglet. The process starts with imported grandparent stocks from abroad. Then CPB breeds and raises the animals</p>', 'https://cpbangladesh.com', 'ZeDmubJd1631531525.jpeg', 'KSzFQgGV1631531525.jpeg', 'A8tyi8s21631531526.jpeg', 'vLW3zcxK1631531526.jpeg', 'UOxkuun01631531526.jpeg', '1', '4', '2021-09-02 11:17:40', '2021-09-13 05:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `business_feeds`
--

CREATE TABLE `business_feeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_feeds`
--

INSERT INTO `business_feeds` (`id`, `name`, `title`, `details`, `website`, `image`, `image2`, `image3`, `image4`, `image5`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Feed', 'Charoen Pokphand Feed Business', '<blockquote>CPB is the pioneer and leader in the production of various forms of livestock feed such as concentrate, powder and pellet. We have feed mill plants situated in every region of the country and some over 600 appointed agents/distributors to help market and distribute feed to small independent farmers across Thailand. In addition, some portion is sold directly to large animal farms. CPB pays attention to continuous improvement on production efficiency and product quality and keeps up-to-date on international requirements and standard. High quality feed with low feed conversion ratio to help farmers lower their farming costs.</blockquote><p><br></p><p>Corn and soybean meal are main ingredients used in the production of livestock feed. CPB formulated pellet feed to meet the nutrition requirements appropriate to each stage of animal rearing and growth. Production processes are computer controlled to ensure consistency in quality and specfied standard. These feeds are manufactured and packed under the following brands, CP, Hyprovite, Hi-Gro, Star Feed, Novo, Safe Feed, Erawan, Hogtonal, C.F., and Anvipro. Selling price is based on production cost at different time of the year and also under pricing guidelines of the Internal Trade Department of the Ministry of Commerce.</p><p><br></p><p>CPB has set up central purchasing unit responsible for procurement of all ingredients used in livestock and aquatic feed. Our procurement policy is to purchase quality raw material meeting the required nutrition standard with priority given to domestic suppliers particularly those situated in close proximity to our feedmill plants. This is to support our local farmers as well as minimize transport cost. Only when domestic supply is insufficient or has inferior quality, CPB would then seek to imports</p><p><br></p><p>CPB focused to improve production processes to remain cost competitive as well as employed marketing strategy to maintain quality and provide good services for both before and after-sales. CPB also provided technical knowledge to agents/distributors and directly to independent farmers through seminars and extension centers. Our technical experts are available to give advices on animal husbandry. Information is disseminated through printed materials and electronic media via the internet.</p><p><br></p><p>Aquatic Business Line</p><p><br></p><p>CPB is the pioneer and leader in the production and distribution of various forms of shrimp and fish feed such as concentrate, powder and pellet. Majority of our aquatic feed is distributed through agents/distributors located in shrimp farming areas. Some portion is sold directly to large shrimp farms. Soybean meal, fish meal and wheat flour are main ingredients used in the production of aquatic feed. Production processes are computer controlled to ensure consistency in quality and specified standard. These feeds are manufactured and packed under the following brands, CP, Star Feed, Marine, Hi-Grade, Novo, Erawan, Turbo, D-Frog, and Safe Feed.</p><p><br></p><p>As a market leader, CPB’s products are well recognized by consumers. An important marketing strategy is to maintain high quality product and consistent excellent customer service. Production processes are monitored and ingredients are tested to ensure quality. CPB also provided technical knowledge to agents/distributors and directly to independent farmers through seminars and academic service centers. Information is disseminated through printed materials. This is to ensure sustainability of the industry.</p>', 'https://cpbangladesh.com', 'J7OunpdF1631531835.jpeg', 'hHgjDEOG1631531835.jpeg', 'jDg1pOTX1631531836.jpeg', 'KZtpYeY51631531836.jpeg', 'CkjHUPMb1631704247.jpeg', '1', '4', '2021-09-02 09:16:01', '2021-09-15 05:10:47');

-- --------------------------------------------------------

--
-- Table structure for table `business_food`
--

CREATE TABLE `business_food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_food`
--

INSERT INTO `business_food` (`id`, `name`, `title`, `details`, `website`, `image`, `image2`, `image3`, `image4`, `image5`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Food Business', 'Charoen Pokphand Food Business', '<blockquote>The Company is determined to develop food products with the aim to deliver great taste, utmost convenience, and a variety of healthy food choices in line with the changing trends and different life stages of consumers. </blockquote><p>We place importance on internationally-certified manufacturing standards and customer- centric product development. </p><p>In addition, we invest in distribution channels for even more convenient access of consumers to our products.</p>', 'https://food.cpbangladesh.com', '2ImjP8RE1631531764.jpeg', 'SlC7nAT21631531764.jpeg', 'ar5LglRL1631531765.jpeg', 'Qoq6ac2z1631529471.jpeg', 'mPJpDLNJ1631531765.jpeg', '1', '4', '2021-09-02 11:12:29', '2021-09-13 05:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `address`, `phone`, `email`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Holding No:  E-236, Ward No: 07,  Chandra, Kaliakoir, Gazipur, Bangladesh.', '01708809090', 'info@cpbangladesh.com', '1', '4', '2021-04-04 08:40:57', '2021-05-30 04:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `customer_queries`
--

CREATE TABLE `customer_queries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_queries`
--

INSERT INTO `customer_queries` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'saif', 'Sai@mail.com', 'subject', 'This is message', '2021-04-11 11:50:51', '2021-04-11 11:50:51'),
(2, 'sfs', 'fsdgewge', 'sgsgr', 'dsgrgergerg', '2021-04-11 11:52:28', '2021-04-11 11:52:28'),
(3, 'afsfe', 'wwetew', 'afewte', 'sdgdfdherhe', '2021-04-11 11:54:05', '2021-04-11 11:54:05'),
(4, 'Syful Islam', 'syful.cse.bd@gmail.com', 'ssssssss', 'mmmmmmmmmmmmmmmmmmmmmmmmm', '2021-07-27 04:06:24', '2021-07-27 04:06:24'),
(5, 'egerg', 'ergerg@mail.com', 'egrgerg', 'ergergerg', '2021-07-27 04:14:50', '2021-07-27 04:14:50'),
(6, 'tttttt', 'mail@mail.com', 'dwdwqd', 'efewgerg', '2021-08-04 03:08:35', '2021-08-04 03:08:35'),
(7, NULL, NULL, 'fffffffffff', 'gggggggggggg', '2021-08-08 11:25:35', '2021-08-08 11:25:35'),
(8, NULL, NULL, 'ddddddddd', 'ggggggggggggg', '2021-08-08 11:26:49', '2021-08-08 11:26:49'),
(9, NULL, NULL, 'yyyyyyyy', 'uuuuuuuuuuuuuu', '2021-08-09 00:45:53', '2021-08-09 00:45:53'),
(10, NULL, NULL, 'llll', 'hhhhhhhhhhhhhh', '2021-08-09 03:31:51', '2021-08-09 03:31:51'),
(11, NULL, NULL, 'ffffffff', 'ddddddddddd', '2021-08-09 03:55:54', '2021-08-09 03:55:54'),
(12, NULL, NULL, 'ddddddddd', 'efewgrg3g', '2021-08-09 03:58:33', '2021-08-09 03:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_backgrounds`
--

CREATE TABLE `home_backgrounds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_backgrounds`
--

INSERT INTO `home_backgrounds` (`id`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'H1ACYVQCJXkDePuqEAjqL8QDnspssTUoC4OhLgru.jpg', '1', '4', '2021-04-08 17:20:55', '2021-04-12 03:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `details`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, 'Welcome to C.P. Bangladesh', 'Kitchen of Bangladesh', '1', '4', '2021-04-09 08:37:27', '2021-04-19 16:52:27'),
(3, 'Welcome to C.P. FEED', 'Believe in quality', '1', '4', '2021-04-09 08:37:58', '2021-04-09 08:37:58'),
(4, 'Welcome to C.P. FOOD', 'Food Enriched Life', '1', '4', '2021-04-09 08:38:25', '2021-04-09 08:38:25'),
(5, 'Welcome to C.P. FARM', 'Believe in quality', '1', '4', '2021-04-09 08:38:53', '2021-04-09 08:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_23_165344_create_user_login_logs_table', 2),
(5, '2021_03_25_122046_create_roles_table', 3),
(6, '2021_03_25_123130_create_role_user_table', 3),
(9, '2021_04_04_123210_create_contact_infos_table', 4),
(10, '2021_04_04_174751_create_slider_imgs_table', 5),
(12, '2021_04_05_122947_create_about_histories_table', 6),
(14, '2021_04_06_152454_create_about_visions_table', 7),
(15, '2021_04_06_181056_create_about_missions_table', 8),
(16, '2021_04_07_093816_create_about_chairman_messages_table', 9),
(17, '2021_04_07_104901_create_about_president_messages_table', 10),
(18, '2021_04_07_114615_create_about_business_operations_table', 11),
(19, '2021_04_07_124942_create_about_headquarters_table', 12),
(20, '2021_04_08_230119_create_home_backgrounds_table', 13),
(21, '2021_04_08_232915_create_home_sliders_table', 14),
(22, '2021_04_11_170434_create_customer_queries_table', 15),
(23, '2021_04_12_093621_create_news_presses_table', 16),
(24, '2021_04_12_172511_create_news_events_table', 17),
(25, '2021_04_12_174608_create_news_galleries_table', 18),
(26, '2021_04_15_110356_create_product_feeds_table', 19),
(27, '2021_04_15_112350_create_all_products_table', 20),
(28, '2021_04_15_122443_create_business_alls_table', 21),
(29, '2021_06_28_093548_create_circular_infos_table', 22),
(30, '2021_06_28_155144_create_recuit_circulars_table', 23),
(31, '2021_06_29_123608_create_recuit_users_table', 24),
(32, '2021_07_02_203934_create_recuit_cv_sends_table', 25),
(33, '2021_07_05_105847_create_recruit_applies_table', 26),
(34, '2019_12_14_000001_create_personal_access_tokens_table', 27),
(35, '2021_08_12_141324_create_auth_api_tokens_table', 28),
(36, '2021_09_02_104956_create_business_feeds_table', 29),
(37, '2021_09_02_105552_create_feed_controllers_table', 29),
(38, '2021_09_02_170418_create_business_food_table', 30),
(39, '2021_09_02_170451_create_business_farms_table', 30),
(41, '2021_09_04_065928_create_visitor_logs_table', 31),
(42, '2021_09_04_113807_create_admin_logs_table', 32);

-- --------------------------------------------------------

--
-- Table structure for table `news_events`
--

CREATE TABLE `news_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_events`
--

INSERT INTO `news_events` (`id`, `date`, `title`, `details`, `document`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2016-12-15', 'C.P. Family Day', 'C.P. Dealers', '5dLR63b4hcNV8XEkgKMZkL0ondD5gEFjgieFbsnr.jpg', 'dPX5EKrlz3sZofwRTsQz3cacQAKbyfoY1HRFDX6V.jpg', '1', '4', '2021-04-12 11:36:18', '2021-04-12 11:36:18'),
(2, '2016-01-01', 'Annual Programme', 'C.P. Family Day Annual Programme<br>', 'eIYdvRwtXrrNGHNYbmG4N8LRIO7wF0cvXSUkdAtn.jpg', 'Gv5QzBJg4w9VbOfzm3qaYyth8aG96xnD2E1VoQy1.jpg', '1', '4', '2021-04-12 11:38:43', '2021-04-12 11:38:43'),
(3, '2016-01-01', 'Best Seller', 'Best Seller Gifts<br>', 'a6zu4GXdkKMuvLCJU3MT7mHajr8xrB0hZfD2flUc.jpg', 'OTjxleQq08rOR1Ky4XLJgCZQNVXASOmhrwshWQzv.jpg', '1', '4', '2021-04-12 11:40:40', '2021-04-12 11:40:40'),
(4, '2020-08-04', 'Donated at Mosque', '<p>C.P. Bangladesh\'s honorable president donated at Mosque.</p>', NULL, '1631609508.jpeg', '1', '4', '2021-09-14 02:51:48', '2021-09-14 02:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `news_galleries`
--

CREATE TABLE `news_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_galleries`
--

INSERT INTO `news_galleries` (`id`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(85, 'RlbeavxV1631602636.JPG', '1', '4', '2021-09-14 00:57:16', '2021-09-14 00:57:16'),
(86, 'X20GRRQm1631602636.JPG', '1', '4', '2021-09-14 00:57:16', '2021-09-14 00:57:16'),
(87, 'Gn5l1GH21631602637.JPG', '1', '4', '2021-09-14 00:57:17', '2021-09-14 00:57:17'),
(88, 'WtDZVY8o1631602637.JPG', '1', '4', '2021-09-14 00:57:17', '2021-09-14 00:57:17'),
(89, 'ujEac0wP1631602638.JPG', '1', '4', '2021-09-14 00:57:18', '2021-09-14 00:57:18'),
(90, 'Jya3qxJK1631602638.JPG', '1', '4', '2021-09-14 00:57:18', '2021-09-14 00:57:18'),
(91, 'qivI2Wa61631602657.JPG', '1', '4', '2021-09-14 00:57:37', '2021-09-14 00:57:37'),
(92, 'bsL4M1EA1631602657.JPG', '1', '4', '2021-09-14 00:57:37', '2021-09-14 00:57:37'),
(93, 'U5FJH74Y1631602658.JPG', '1', '4', '2021-09-14 00:57:38', '2021-09-14 00:57:38'),
(94, 'FuxjH4kD1631602658.JPG', '1', '4', '2021-09-14 00:57:38', '2021-09-14 00:57:38'),
(95, 'sQod5Jks1631602659.JPG', '1', '4', '2021-09-14 00:57:39', '2021-09-14 00:57:39'),
(96, 'pMhSQH6R1631602659.jpg', '1', '4', '2021-09-14 00:57:39', '2021-09-14 00:57:39'),
(97, 'DR8MhuOa1631602659.JPG', '1', '4', '2021-09-14 00:57:40', '2021-09-14 00:57:40'),
(98, 'rXXzXzpN1631602670.JPG', '1', '4', '2021-09-14 00:57:50', '2021-09-14 00:57:50'),
(99, '7WS6EByq1631602670.JPG', '1', '4', '2021-09-14 00:57:50', '2021-09-14 00:57:50'),
(100, 'DbXnU28D1631602671.JPG', '1', '4', '2021-09-14 00:57:51', '2021-09-14 00:57:51'),
(101, 'sQHTr6Kq1631602671.JPG', '1', '4', '2021-09-14 00:57:51', '2021-09-14 00:57:51'),
(102, '0bbEvGCB1631602672.JPG', '1', '4', '2021-09-14 00:57:52', '2021-09-14 00:57:52'),
(103, 'igW3pwjf1631602672.JPG', '1', '4', '2021-09-14 00:57:52', '2021-09-14 00:57:52'),
(104, 'd9s2WT1f1631602672.JPG', '1', '4', '2021-09-14 00:57:53', '2021-09-14 00:57:53'),
(105, 'Pf6sRWAi1631602673.JPG', '1', '4', '2021-09-14 00:57:53', '2021-09-14 00:57:53'),
(106, 'ccGsbMea1631602673.JPG', '1', '4', '2021-09-14 00:57:54', '2021-09-14 00:57:54'),
(107, 'RO2IYLDb1631602674.JPG', '1', '4', '2021-09-14 00:57:54', '2021-09-14 00:57:54'),
(108, 'udK8HrNA1631602881.JPG', '1', '4', '2021-09-14 01:01:21', '2021-09-14 01:01:21'),
(109, 'saY2q10R1631602881.JPG', '1', '4', '2021-09-14 01:01:21', '2021-09-14 01:01:21'),
(110, 'C3YD4RoW1631602882.JPG', '1', '4', '2021-09-14 01:01:22', '2021-09-14 01:01:22'),
(111, 'FnppkGa01631602882.JPG', '1', '4', '2021-09-14 01:01:22', '2021-09-14 01:01:22'),
(112, 'buw03sJU1631602891.jpg', '1', '4', '2021-09-14 01:01:31', '2021-09-14 01:01:31'),
(113, 'riOxHPcw1631602891.jpg', '1', '4', '2021-09-14 01:01:31', '2021-09-14 01:01:31'),
(114, '85nxNe8n1631602892.jpg', '1', '4', '2021-09-14 01:01:32', '2021-09-14 01:01:32'),
(115, 'MAgJo2LL1631602892.jpg', '1', '4', '2021-09-14 01:01:32', '2021-09-14 01:01:32'),
(116, 'GHo1q5Gt1631602893.jpg', '1', '4', '2021-09-14 01:01:33', '2021-09-14 01:01:33'),
(117, 'Jp4MYnxB1631602908.jpg', '1', '4', '2021-09-14 01:01:48', '2021-09-14 01:01:48'),
(118, '3SNfA3Tg1631602908.jpg', '1', '4', '2021-09-14 01:01:48', '2021-09-14 01:01:48'),
(119, 'YouKSwZk1631602909.jpg', '1', '4', '2021-09-14 01:01:49', '2021-09-14 01:01:49'),
(120, 'iagQhprP1631602909.jpg', '1', '4', '2021-09-14 01:01:49', '2021-09-14 01:01:49'),
(121, 'J3OPuSzn1631602910.jpg', '1', '4', '2021-09-14 01:01:50', '2021-09-14 01:01:50'),
(122, 'uI3S2RtT1631602910.jpg', '1', '4', '2021-09-14 01:01:50', '2021-09-14 01:01:50'),
(123, 'uDTPA4q01631602927.jpg', '1', '4', '2021-09-14 01:02:07', '2021-09-14 01:02:07'),
(124, 'yY5WCXyw1631602927.jpg', '1', '4', '2021-09-14 01:02:08', '2021-09-14 01:02:08'),
(125, 's5RHXCiP1631602928.jpg', '1', '4', '2021-09-14 01:02:08', '2021-09-14 01:02:08'),
(126, 'c0O0FKqB1631602928.jpg', '1', '4', '2021-09-14 01:02:08', '2021-09-14 01:02:08'),
(127, 'DaOSv0UG1631602929.jpg', '1', '4', '2021-09-14 01:02:09', '2021-09-14 01:02:09'),
(128, '67xH6aqW1631607232.JPG', '1', '4', '2021-09-14 02:13:53', '2021-09-14 02:13:53'),
(129, '1Lx2MSRX1631607232.JPG', '1', '4', '2021-09-14 02:13:53', '2021-09-14 02:13:53'),
(130, 'xuSvWQ6I1631607233.JPG', '1', '4', '2021-09-14 02:13:53', '2021-09-14 02:13:53'),
(131, '4rOXEEAS1631607233.JPG', '1', '4', '2021-09-14 02:13:53', '2021-09-14 02:13:53'),
(132, '0TxkO73u1631607234.JPG', '1', '4', '2021-09-14 02:13:54', '2021-09-14 02:13:54'),
(133, 'CGJFxC2s1631607234.JPG', '1', '4', '2021-09-14 02:13:54', '2021-09-14 02:13:54'),
(135, '1aI8fHA21631619197.jpg', '1', '4', '2021-09-14 05:33:18', '2021-09-14 05:33:18');

-- --------------------------------------------------------

--
-- Table structure for table `news_presses`
--

CREATE TABLE `news_presses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_presses`
--

INSERT INTO `news_presses` (`id`, `date`, `title`, `details`, `document`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(2, '2019-10-01', 'Magazine News', 'The Monthly Krishi Suraksha', 'RdZAvfnBA1Q91B8MNb2lnbQPEv3EsMohpdcM3MZH.png', 'Ni3fbxUlLLQ833l9gLhgOtaYkZdJF3JaPEkyalH5.png', '1', '4', '2021-04-12 11:21:07', '2021-04-12 11:21:07'),
(3, '2019-08-01', 'Awarded Magazine News', 'Poultry Khamar Bichitra', 'BSrVytwKpJF6bYIwlKWTn9vlO2H3aNQ8CSPgyw52.jpg', '4enPvJoSCIeCdbpFQn70ZIfDcIQgyxZfhmcNjmmm.jpg', '1', '4', '2021-04-12 11:23:28', '2021-04-12 11:23:28'),
(4, '2021-06-05', 'sdvsdvdsv', 'scascsavads', 'vJ14P6YhZLflspifkwwIHmKslH0Pnozc12MbRzUf.png', '356FKGr9y8q4AT2X2xaqKDT2DuAMUdI7Kmq9gl5Y.png', '1', '4', '2021-06-05 03:32:09', '2021-06-05 03:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(12, 'App\\Models\\User', 8, 'frontend_user', 'a673e06ffb79ccbed0e138eb95c62c0e96fbac324cf1d0b1c9d484fff5a82f4a', '[\"*\"]', '2021-09-14 10:40:05', '2021-09-14 04:42:12', '2021-09-14 10:40:05'),
(14, 'App\\Models\\User', 4, 'admin_user', 'bec8018ab09029a779e123578045159ac813f180526a8e9a36c7ef82bbecc3a6', '[\"*\"]', '2021-09-14 05:33:51', '2021-09-14 05:28:07', '2021-09-14 05:33:51'),
(15, 'App\\Models\\User', 4, 'admin_user', '95ac81a37521ea16f37548e0bba26ad17a2aac39b1f6ac9d61bcc64dff4634dd', '[\"*\"]', '2021-09-14 08:36:43', '2021-09-14 08:36:39', '2021-09-14 08:36:43'),
(18, 'App\\Models\\User', 8, 'frontend_user', '522354f7404b172557c17d4f43dda34ec3aef062f9b897f87567900860b9c039', '[\"*\"]', '2021-09-14 22:52:07', '2021-09-14 22:51:32', '2021-09-14 22:52:07'),
(20, 'App\\Models\\User', 4, 'admin_user', '8bc2f29ccd7bcf4b5601a30251f9f12e7a4d3af6017f8c1771a758f0c7c5d317', '[\"*\"]', '2021-09-15 05:57:33', '2021-09-14 22:59:18', '2021-09-15 05:57:33'),
(24, 'App\\Models\\User', 4, 'admin_user', '92452e199d4b8cc6e234c090b468c7da10615874469c7552021c7e33db9e1408', '[\"*\"]', '2021-09-15 06:06:05', '2021-09-15 05:38:43', '2021-09-15 06:06:05'),
(31, 'App\\Models\\User', 5, 'admin_user', '10fc9a1b1be5f3fabc7a5352551854a9243ef4f5ce4b2c9578baf0a3bd3fe00b', '[\"*\"]', '2021-09-15 05:48:43', '2021-09-15 05:48:40', '2021-09-15 05:48:43'),
(37, 'App\\Models\\User', 4, 'admin_user', 'c49e41d8882e6923fdc8758f44724eb328086abdca9c7c845806f2fdac42a83b', '[\"*\"]', NULL, '2021-09-15 09:47:15', '2021-09-15 09:47:15'),
(38, 'App\\Models\\User', 4, 'admin_user', 'ac24e76ff9638ab4019eeae8cd7b291db94bf8b1a5dbe94ab03e72a5fa29766b', '[\"*\"]', NULL, '2021-09-15 09:49:37', '2021-09-15 09:49:37'),
(39, 'App\\Models\\User', 4, 'admin_user', 'fc72521bf5253f8d656305617a90a923094bb1e4d97d21b49e965efd07098172', '[\"*\"]', NULL, '2021-09-15 09:51:27', '2021-09-15 09:51:27'),
(40, 'App\\Models\\User', 4, 'admin_user', '6104fc73383c55fa8a1907b65e9cfb4ad640edecb9f33fb23656f79db231a63d', '[\"*\"]', NULL, '2021-09-15 09:52:04', '2021-09-15 09:52:04'),
(42, 'App\\Models\\User', 4, 'admin_user', '62da005339acf794986c4f9682b40ddae520581a3ad8ea2db174bddbcc558053', '[\"*\"]', '2021-09-15 11:11:34', '2021-09-15 09:54:10', '2021-09-15 11:11:34'),
(43, 'App\\Models\\User', 4, 'admin_user', 'c05a736b2c2ec2faa22f07601bbbdce3c121d492df1df1124a48e9401266283c', '[\"*\"]', '2021-09-15 23:58:42', '2021-09-15 21:26:57', '2021-09-15 23:58:42'),
(56, 'App\\Models\\User', 4, 'admin_user', 'e1ca299ce49aa83a2e25310be5a2eb42bf13d6543c002008ffc9c98b124c4086', '[\"*\"]', '2021-09-16 05:07:57', '2021-09-16 05:04:50', '2021-09-16 05:07:57');

-- --------------------------------------------------------

--
-- Table structure for table `recruit_applies`
--

CREATE TABLE `recruit_applies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recuit_circular_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recuit_circulars`
--

CREATE TABLE `recuit_circulars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jobTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publishDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirement` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recuit_circulars`
--

INSERT INTO `recuit_circulars` (`id`, `jobTitle`, `publishDate`, `deadline`, `location`, `department`, `education`, `details`, `requirement`, `experience`, `salary`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Web Developer ', '2021-08-25', '2021-09-30', 'Anywhere in Bangladesh', 'Information Technology', 'Bachelor of Science (BSc) or Diploma ', '<div><h6><b>Additional Requirements :</b></h6></div><ul><li>Smart application layouts design using <b>HTML5, CSS,&nbsp; JavaScript</b>, etc.&nbsp;</li><li>Proficiency with Database Design&nbsp;for Web Application, APIs using <b>MySQL, Microsoft SQL Server </b>etc.</li><li>Able to develop <b>Web-based Application</b> Development and Web Service, API, XML, JSON<br></li><li>Design User Interface Design (<b>UI</b>) and User Experience Design (<b>UX</b>) for Web Platform</li><li>Have to work alongside a team of other developers in developing, testing, and maintaining our products.</li><li>Able to solve complex problems.</li><li>Able to develop ideas and processes and clearly express them.</li></ul><h6><b>Compensation &amp; Other Benefits :</b></h6><ul><li>&nbsp;As per company policy</li></ul>', 'Proficient in modern web development frameworks like Laravel, Livewire, Bootstrap, Vue JS  or similar.', 'At least 1 year (Welcome for New-Graduate)', 'Negotiable', '1', '4', '2021-07-12 08:39:43', '2021-08-25 06:04:27'),
(2, 'IT Support ( Maintenance )', '2021-08-25', '2021-09-25', 'Anywhere in Bangladesh', 'Information Technology', 'Bachelor of Science (B.Sc) or Diploma', '<div><b>Additional Requirements :</b></div><ul><li>Responsible for computer hardware, software, systems, networks troubleshooting.</li><li>Hardware servicing knowledge on CPU, Monitor, Multifunction Printer, Thermal Printer, Dot Matrix printer, Offline &amp; online UPS Etc.</li><li>Responding in a timely to service issues and requests.</li><li>Configuration and manage network device Router, switch, Wi-Fi, Biometric Finger Attendances software &amp; Access Control Device.</li><li>DVR, NVR &amp; IP Camera configuration, setting &amp; Maintenance.</li><li>Network and data security including directory, group policy, firewalls, virus protection,&nbsp;</li><li>Maintain IT stock information.</li><li>Providing technical support across the company.</li></ul><div><br></div><div><b>Compensation &amp; Other Benefits : </b></div><ul><li>As per company policy<br></li></ul><div><br></div><div><br></div>', 'IT Support Officer (Maintenance) We are looking for honest, hard worker  and energetic person. Who will work dynamically for IT Department.', 'At least 1 year (Fresh Also Can Apply )', 'Negotiable', '1', '4', '2021-08-25 09:47:37', '2021-08-25 09:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `recuit_cv_sends`
--

CREATE TABLE `recuit_cv_sends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recuit_cv_sends`
--

INSERT INTO `recuit_cv_sends` (`id`, `subject`, `message`, `document`, `created_at`, `updated_at`) VALUES
(1, 'Web Developer', NULL, 'fWXSquceQcczBbg4cwg5Scb53A7gT7ZfXQTfrHRQ.pdf', '2021-07-27 10:09:14', '2021-07-27 10:09:14'),
(2, 'Recruit', 'Well, I think CMS (WordPress) could be a huge platform in future networking. This is why I am working with it. 🙂', '0S4dGmgR2m270e6IisNgRjx8tZfF56awyC6ONWsm.pdf', '2021-08-25 14:55:11', '2021-08-25 14:55:11'),
(3, 'Application for the post of IT Support(Maintance)  ', NULL, '6StG2XnUT8z1H2AcyyrUeex7BJzKVd0F7lKjOEw8.pdf', '2021-08-25 18:21:53', '2021-08-25 18:21:53'),
(4, 'Application for the post of IT Support(Maintance)  ', NULL, 'aFjUOkGJyTj35u21TbP9OdwogORWm6gIwDmOgg0I.pdf', '2021-08-25 18:21:55', '2021-08-25 18:21:55'),
(5, 'IT Support ( Maintenance) ', 'Here is my cv looking for this job', 'uR69aONJTVSuFn7urydLq2AStuWlZK5WoPJRbyAc.pdf', '2021-08-25 18:50:25', '2021-08-25 18:50:25'),
(6, '', '', '3XsWEGHJ34YYeUiK9qjjiWci38vEQ0v8bvimctqE.pdf', '2021-08-25 18:50:34', '2021-08-25 18:50:34'),
(7, 'IT SUPPORT', NULL, 'bZddOkVGXhuSFsfBBfQ7VvZgzZXs6TyHxsbhRDTW.doc', '2021-08-27 05:02:14', '2021-08-27 05:02:14'),
(8, 'Application for the position for Web Developer', 'Looking for a new and challenging position, to make best use of my existing skills and experience acquire through my personal project and endeavor carrier development', '6fZntrjRXXgRCcAULTapjUJibyAkKKKfDAUQCdom.pdf', '2021-08-28 16:26:45', '2021-08-28 16:26:45'),
(9, 'gsdg', 'sgsg', 'IZloJRcypVfB6IUjExpApGvaQX3HvGoiegH4NfQ1.xlsx', '2021-08-29 10:33:44', '2021-08-29 10:33:44'),
(10, 'IT support Officer (Maintenance)', 'Dear sir,\nAs-salamu alaykum \nhope you are well. I\'m interested for IT Support officer post.\nPlease See the attached file.', '6P4LG5DJyOxSk2K5lw86TedD1N1RVYcjecyaImuz.docx', '2021-08-31 14:31:58', '2021-08-31 14:31:58'),
(11, 'Web Developer', 'Web Developer', 'bmS9VQpBHQ7Dhor521c5dT39I4j7oR5fJghGkn74.pdf', '2021-09-06 09:51:51', '2021-09-06 09:51:51'),
(12, NULL, NULL, 'G7Uae7ggzQEvtWvpOxHYofjQDyKvnw5KSLM7mhnq.pdf', '2021-09-06 09:55:48', '2021-09-06 09:55:48'),
(13, NULL, NULL, 'zRtj5767WFE0gah9JXJWgQ9ZVPqsH8Y0NEW1W65x.pdf', '2021-09-06 10:01:08', '2021-09-06 10:01:08'),
(14, 'Cv of Md Gausul Alal  ', NULL, 'BeOYPf8mmhtGq7WOK0NHuM3Mda8F8g5JIVl7KzQa.pdf', '2021-09-06 10:03:58', '2021-09-06 10:03:58'),
(15, 'Prayer for Application IT Support..', 'Please for following Cv.', 'FBMFOL3ASK1aundcwDEx8t4TpFTAmgUdAzac1FNH.pdf', '2021-09-06 15:44:01', '2021-09-06 15:44:01'),
(16, 'Web Developer', NULL, '2ESOhTbKGoejzMZW6Fut4InswvzIHzLYDsh6kir7.pdf', '2021-09-07 07:17:12', '2021-09-07 07:17:12'),
(17, 'IT SUPPORT', 'I am Interest This Work', 'SI6J3qYogoq7UjP1WV4FtA46Z6RyUCXjXvQ41hIO.pdf', '2021-09-08 10:16:58', '2021-09-08 10:16:58'),
(18, 'IT SUPPORT', NULL, 'rLLU71YIVybtXplZ1ypea8KYdgcEnAdkigmbwCqi.pdf', '2021-09-08 13:01:40', '2021-09-08 13:01:40'),
(19, 'IT Support ', NULL, 'FYOss7bmduiRrnqRDONNuPIrxXFoKbcLyPVLBcc7.pdf', '2021-09-08 13:49:30', '2021-09-08 13:49:30'),
(20, 'IT Support (Maintenance)', 'Dear Concern,\nPlease find attached file below.\n\nThanks', 'ZvCFkcPTuGi15EHTOJv4JXbnf5faXkMn6NrXh5rM.pdf', '2021-09-08 23:40:19', '2021-09-08 23:40:19'),
(21, NULL, NULL, 'nSd4NnZ5mGankPcNX24pqzhLlIkfHp0z6op1fK9i.pdf', '2021-09-09 07:52:09', '2021-09-09 07:52:09'),
(22, 'IT Support ( Maintenance )', 'Dear Sir \nGood Day!\nI would like to apply for the post of \"IT Support (Maintenance)\"\nPlease find attached herewith my resume.\n\nThank You!\nBest Regards,\nTokibul Hasan\nMobile: 01936506092\nAttachments area', 'A0vKLUKmSWLASWz14mvMhA3xIv2seVPitExfGRaX.pdf', '2021-09-09 08:00:11', '2021-09-09 08:00:11'),
(23, 'IT SUPPORT ', NULL, 'qjNIiDy8quEnxEzeDD5PBzqMr0xkxUlMXUPogKzB.pdf', '2021-09-10 08:03:55', '2021-09-10 08:03:55'),
(24, ' IT Support Officer (Maintenance) ', 'Dear Sir , \nI would like to work as a  IT Support Officer (Maintenance) . I have attached my CV for your kind reference. Please take a look into it. ', 'UUe9YPrIHBLqOuKxtD1JVvo00K1Do17Qs9upZQ20.pdf', '2021-09-10 08:35:58', '2021-09-10 08:35:58'),
(25, 'Apply for \"IT Support (Maintenance)\"', NULL, 'LjSbu98qNCtheiB4Woe51A4VS1JACmFk3ZsA43xm.pdf', '2021-09-10 08:37:43', '2021-09-10 08:37:43'),
(26, 'Applying for a post of \"IT support Officer\"     ', NULL, 'EV8SRYnfIPiQJl407fzPas5xbr4C5eUnwWTUXpOD.pdf', '2021-09-10 08:43:21', '2021-09-10 08:43:21'),
(27, 'Application for the position of \"IT Support \"', NULL, 'AOG5h63XZMEKQGbAEmjRYHePmzUS3bCZa2UbFoj6.pdf', '2021-09-10 08:44:18', '2021-09-10 08:44:18'),
(28, 'It support', 'I have good skill in this required job. \n', '94k8Ar1IJz3rhASRsUxgdjCHL0DZJtOljkki8kQL.pdf', '2021-09-10 08:46:03', '2021-09-10 08:46:03'),
(29, 'Application for the post of IT Support(Maintenance)', 'Intend to develop a career with leading corporate of hi-tech environment with committed & dedicated people, which will help me to explore myself fully and realize my potential. Willing to work as a key player in challenging & creative environment.', 'rKXi9lUeYD1BzDwcoZYIT9Mv5ZTmNDrezCYLjKiZ.pdf', '2021-09-10 08:46:11', '2021-09-10 08:46:11'),
(30, 'Application For IT- Support (Maintenance)', 'CV', 'U3hmHtmJHtRcl0rvqI4PROMhZxLuDKNWAf4NEsWe.pdf', '2021-09-10 08:55:06', '2021-09-10 08:55:06'),
(31, 'IT Support (Maintanance)', '\nDear,sir\n\nI saw your job post & thought  I could be a great fit for your company post.\nMaybe check out my CV and let me know if you wanna meet up for an interview.\n\nBest Regards\nMd.Azizur Rahman\n', 'QXQggvi1O02qfPOaYed0g28z1jwsefTIR4aDfXw6.pdf', '2021-09-10 09:00:54', '2021-09-10 09:00:54'),
(32, 'IT Support', 'Dear sir\nI\'m highly interested for this job in your company please check my CV and give me a opportunity to work with your company thank you', 'fmvqUlm3TDTVxwtInU84THPThWD4Y22Z6tbgCmJE.pdf', '2021-09-10 09:02:36', '2021-09-10 09:02:36'),
(33, 'IT Support (Maintenance) ', 'Dear sir Please check my CV.', '8qLnOorqZcbWuygqAptPBXnLLe32ohPWSm8sXFWv.pdf', '2021-09-10 09:48:13', '2021-09-10 09:48:13'),
(34, 'IT Support( position)', 'Dear Sir\nPlease see the attached my CV \n\nThanks', 'HjBvNOzpn0ZSzQKsGwD9dCd4PmQ46vEnZWM377uq.pdf', '2021-09-10 11:06:26', '2021-09-10 11:06:26'),
(35, 'Application for IT Support officer', 'I am looking for an opportunity in a reputed organization which will help \n me deliver my best and upgrade my skills in engineering and meet the \n demands of the organization.', '8kMnvhVLqrfHCRRmHTQ3fOArt2Geq3kyRg3Qo7K0.pdf', '2021-09-10 11:08:30', '2021-09-10 11:08:30'),
(36, 'Application for the post of IT Support Officer (Maintenance)', NULL, 'WXrDTGykFsIE6EsZlO5ebSNfHYtYeGSGh2xXUlur.pdf', '2021-09-10 11:55:51', '2021-09-10 11:55:51'),
(37, 'IT Support', NULL, 'YWgftJcdkzqdhD4rlI6rItsDknuB3QEpXfrIYCp5.pdf', '2021-09-10 12:54:27', '2021-09-10 12:54:27'),
(38, 'IT Support (Maintenace)', 'Dear Sir\nPlease see my attached resume.\n\nThanks\nArup Paul', 'TN2GksDEQx2g5jLjbV7l2yVP2ifYk41yhuOxhB2A.pdf', '2021-09-10 14:31:40', '2021-09-10 14:31:40'),
(39, 'IT Support', NULL, 'ExPpmfMnEnnv2OFin9IZSYYZjUmuv1pmqzLakyLM.pdf', '2021-09-10 15:20:17', '2021-09-10 15:20:17'),
(40, 'It officer ', 'I am intarest in job ', '1Hztxc8ubTuZaFiJLRgQNJCPTYb6vAp9yAUrTaU6.png', '2021-09-10 17:16:20', '2021-09-10 17:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delete_temp` int(11) NOT NULL DEFAULT 0,
  `delete_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `delete_temp`, `delete_by`, `created_at`, `updated_at`) VALUES
(3, 'Administrator', 0, NULL, '2021-03-27 03:26:45', '2021-03-27 03:26:45'),
(4, 'About', 0, NULL, '2021-03-27 09:45:44', '2021-03-27 09:45:44'),
(5, 'News', 0, NULL, '2021-03-27 09:45:53', '2021-04-19 05:51:17'),
(8, 'Add', 0, NULL, '2021-04-19 05:49:41', '2021-04-19 05:49:41'),
(9, 'Edit', 0, NULL, '2021-04-19 05:49:52', '2021-04-19 05:49:52'),
(10, 'Delete', 0, NULL, '2021-04-19 05:50:02', '2021-04-19 05:50:02'),
(11, 'Business', 0, NULL, '2021-04-19 05:52:19', '2021-04-19 05:52:19'),
(12, 'Setting', 0, NULL, '2021-04-19 05:53:36', '2021-04-19 05:53:36'),
(13, 'Role-manage', 0, NULL, '2021-04-20 06:27:59', '2021-04-20 06:27:59'),
(14, 'Admin-manage', 0, NULL, '2021-04-20 06:30:31', '2021-04-20 06:30:31'),
(15, 'Recruit', 0, NULL, '2021-06-28 09:39:04', '2021-06-28 09:39:04'),
(16, 'Publish', 0, NULL, '2021-09-15 05:39:13', '2021-09-15 05:39:13'),
(17, 'Log', 0, NULL, '2021-09-15 05:40:24', '2021-09-15 05:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(15, 3, 4, NULL, NULL),
(18, 15, 5, NULL, NULL),
(19, 8, 5, NULL, NULL),
(20, 9, 5, NULL, NULL),
(22, 10, 5, NULL, NULL),
(23, 15, 37, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slider_imgs`
--

CREATE TABLE `slider_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slider_imgs`
--

INSERT INTO `slider_imgs` (`id`, `image`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 'V3G191iFucV03gZWL0spMVAQJ5vb8hQRLD5kcJX5.jpg', '1', '4', '2021-04-04 17:14:09', '2021-04-04 17:14:09'),
(5, 'JtJoVWXAqJna8TLGoa2wkuNlB1BzJPhC2twUiHvK.png', '1', '4', '2021-04-04 17:16:20', '2021-04-04 17:16:20'),
(6, 'g4sUanp7EuFDpdLNpKLTEQqPJD72hEdIWXP3RaP7.png', '1', '4', '2021-04-05 05:58:43', '2021-04-05 05:59:00'),
(7, 'ie6SzkPrq65KL6cMjqQLglZTo7jd9su2sgfQxw8l.jpg', '1', '4', '2021-04-06 14:02:38', '2021-04-06 14:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` int(20) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `image`, `email`, `document`, `contact`, `is_admin`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'syful.isl', 'Saif', 'hyKcizFn1631790361.jpeg', 'saif@mail.com', NULL, NULL, 1, NULL, '5683', NULL, '2021-03-24 09:07:05', '2021-09-16 05:06:02'),
(5, 'syful.isl2', 'saif2', 'X9DfUmuJxOwByrAxs7tzi2PuBM5vSzHR30kEKsh5.jpg', 'saif2@gmail.com', NULL, NULL, 1, NULL, '5683', NULL, '2021-03-24 16:56:24', '2021-04-06 10:54:06'),
(8, NULL, 'Md. User', '7Jq7lEIy22ojdS9p3VR2uasi4lde9kQ05Q9PdVF0.png', 'user@mail.com', 'BScpOyosYYuczaddxE1L7SWrYKooyoUPFgmHo3dR.docx', '01707080401', NULL, NULL, '123', NULL, '2021-07-03 16:52:51', '2021-07-03 16:52:51'),
(9, NULL, 'Md. Abdur Rahim', 'aTo1mIL8zRDzHHm3FcTBRqT437cptQN9lQlipLw3.jpg', 'arahim88110@gmail.com', 'TqMlbM3NFw5HNCfllJd49sEPmMJgK3IDboTgcPON.pdf', '01737230611', NULL, NULL, 'AR1406072', NULL, '2021-08-17 16:33:52', '2021-08-17 16:33:52'),
(10, NULL, 'Md.Kawsar Reja', NULL, 'kawsar207043@gmail.com', 'KhJBbVAjxa1GLfFu5aSXVxWxDbfDo7h2iOeQdLLg.pdf', '01774207043', NULL, NULL, '123456789', NULL, '2021-08-25 15:13:01', '2021-08-25 15:13:01'),
(11, NULL, 'Md. Suhag Ahmed ', 'IkR9VtoGCVmsPqSDObpKbOXlyN8br4ApKK0y4LrN.jpg', 'csesohag24@gmail.com', 'O8ZgIgUHcMdd5KSexKl4QAjtskgvS1g5TnzZavhB.pdf', '01968752599', NULL, NULL, 'Suhag@123', NULL, '2021-08-25 16:18:53', '2021-08-25 16:18:53'),
(12, NULL, 'Hamidul Hasan', NULL, 'hamidulcse1997@gmail.com', '5IcLy25U74EUsQ8oE7CByfZKOiSAdSsSIe4Dau25.pdf', '01794829194', NULL, NULL, '171151394', NULL, '2021-08-25 18:26:08', '2021-08-25 18:26:08'),
(13, NULL, 'Fuad Al Muqtadir', NULL, 'taputahseen@gmail.com', 'Y3QCXNV16H1AJgkbyitgwO8uAOgAunnyYaKPas3H.doc', '01776962757', NULL, NULL, 'fuad12345', NULL, '2021-08-27 05:03:47', '2021-08-27 05:03:47'),
(14, NULL, 'khandoker shahidujjaman shahid', NULL, 'kk.shahid66@gmail.com', 'BZW4yIhFvXTzUVTDlqewGlFyjF2KrA0w03GlqOVY.pdf', '01736631284', NULL, NULL, 'shahid12', NULL, '2021-08-28 13:32:50', '2021-08-28 13:32:50'),
(15, NULL, 'khandoker shahidujjaman shahid', NULL, 'kk.shahid66@gmail.com', 'wtcaNarnj0GzrlJTrhSLWNbRe3rZcYX1d1RM7aT5.pdf', '01736631284', NULL, NULL, 'shahid12', NULL, '2021-08-28 13:34:15', '2021-08-28 13:34:15'),
(16, NULL, 'Fahad Alam Joy', NULL, 'jfahadalam@gmail.com', '4XJ87oNkDctBx9vRH5qjbsykBI42wf4M66IoBdFr.pdf', '01679104689', NULL, NULL, 'fahad2016155005', NULL, '2021-08-28 16:25:25', '2021-08-28 16:25:25'),
(17, NULL, 'Nehad', NULL, 'nawad171129@bscse.uiu.ac.bd', 'zG9kLBbP92bWbQGJ9jselcZaTxVZhnzgTGzVvIx2.pdf', '01682279009', NULL, NULL, 'imbest007', NULL, '2021-09-06 09:49:34', '2021-09-06 09:49:34'),
(18, NULL, 'Md Gausul Alal  ', 'zhINmhD6w1k0GLfl4P7rVu5W3EJltDoV5FlgYRdu.jpg', 'mdgausulalal@gmail.com ', 'WBSV0IaO3kGknD73ccNpC77r16fH9wbqucwvjgIr.pdf', '01761820581', NULL, NULL, '787964586@7462', NULL, '2021-09-06 09:50:35', '2021-09-06 09:50:35'),
(19, NULL, 'Md. Rasheduzzaman ', 'ruajsWPDSdTL5ZfqdhTIh2EwWB3DnymGiGSFiamp.jpg', 'rasheduzzaman455@gmail.com', 'Fd8ndpCeoYa5DJ9NZTDRwRQhwEGUqhkk0cuWMyJN.pdf', '01756490483', NULL, NULL, 'Rashed455#', NULL, '2021-09-06 15:39:14', '2021-09-06 15:39:14'),
(20, NULL, 'Md Sadnan Hossain', NULL, 'mdsadnanhossain94@gmail.com', 'JWKYY1KAJTkcEqzVh879NZc9BRKL5SjqLuZkXnWq.pdf', '01892409715', NULL, NULL, '##123456789##', NULL, '2021-09-07 07:14:01', '2021-09-07 07:14:01'),
(21, NULL, 'Sifat Shahaira ', NULL, 'ssifat207@gmail.com', '8G2vJhplWQrkFz84UTBCAHsJCWcKfCfXvoTXfWoz.pdf', '01766312017', NULL, NULL, 'Sifatkaka0987@#@', NULL, '2021-09-08 13:48:57', '2021-09-08 13:48:57'),
(22, NULL, 'Tokibul Hasan', NULL, 'Thtokibulbd@gmail.com', 'AJVZT8t2ErLHm3m6DCbexZkr7aAb3HuUaJTbGjjE.pdf', 'Thtokibulbd@gmail.com', NULL, NULL, '85852828', NULL, '2021-09-09 07:51:13', '2021-09-09 07:51:13'),
(23, NULL, 'Kowshik Saha', NULL, 'kowshiksaha78@gmail.com', 't16vwsFpIGJng5QhU1Yb4iLdRZhhmJlwzyNEQHoJ.pdf', '01625869040', NULL, NULL, 'lami@2106', NULL, '2021-09-10 08:03:17', '2021-09-10 08:03:17'),
(24, NULL, 'Md Forhad Sarkar', NULL, 'ashadullahalforhad@gmail.com', 'ge4o3e5snAyvVNcbx2XZFr8OGH5orZRCn8isNsLV.pdf', '01794332154', NULL, NULL, 'Fo996225', NULL, '2021-09-10 08:34:21', '2021-09-10 08:34:21'),
(25, NULL, 'Joynul Islam ', 'nHGBTJ6Nw9RyXaiT5Awrqsc2dvC2s1cwMRpi4AWf.jpg', 'Joynulislamcse@gmail.com', 'xOKQT8MgQMJCz9VpFd5weg1KviVYirt5PKE9Gfxr.html', '01646148033', NULL, NULL, 'dss00000', NULL, '2021-09-10 08:35:42', '2021-09-10 08:35:42'),
(26, NULL, 'Md Jowel Rana  ', NULL, 'Jowelrana8091@gmai.Com ', 'w3vjgD39peh6wkuAYvM5WgMznedtuovlhTbihP8Y.pdf', '01767787876', NULL, NULL, 'Nilljowel', NULL, '2021-09-10 08:38:29', '2021-09-10 08:38:29'),
(27, NULL, 'Arnob Chandro Das', '0u8YdmG1pGnQYiScsu2OZ4Ej0xGho3MHocAV0Iv6.jpg', 'arnobchandrodas.cse@gmail.com', '8FumDRwJXYqQ1XDbfS6k3MNfktvVSq536TkhhCv5.pdf', '01752762827', NULL, NULL, 'Arnob2827#', NULL, '2021-09-10 08:40:52', '2021-09-10 08:40:52'),
(28, NULL, 'Md Labu Ahamed', 'BDMVRkszClGdcWcLVHewT7HMLNHb5jqBUNDWn3PX.jpg', 'labuahmmedaia@gmail.com', 'b8uTsDNo0wsGE2RAgBiJar5KXSA8iAGRRmGgeknN.pdf', '01400560004', NULL, NULL, 'labu002', NULL, '2021-09-10 08:45:34', '2021-09-10 08:45:34'),
(29, NULL, 'Md Sakil Ahmmed', NULL, 'sakilahmmed114482@gmail.com', '7i0rIyR6vAOCNeYJwjso4h1A06KsPPyJhqQ7BnGh.pdf', '01768482746', NULL, NULL, '123456654321ss', NULL, '2021-09-10 09:00:35', '2021-09-10 09:00:35'),
(30, NULL, 'Md.Azizur Rahman', NULL, 'azizuraziz49@gmail.com', 'gDgNMiRWGwDltfGdwRCTWlPKJtFaMHHAgUW5aa0D.pdf', '01917949096', NULL, NULL, '123456', NULL, '2021-09-10 09:02:59', '2021-09-10 09:02:59'),
(31, NULL, 'Md Nazrul Islam ', NULL, 'nazrulislam1398@gmail.com ', 'yRiAJY2nPcuJcgoJxv2wDDAftWUlMEkHmZSoqZHO.pdf', '01633178705 ', NULL, NULL, 'nazrul@cp', NULL, '2021-09-10 09:20:16', '2021-09-10 09:20:16'),
(32, NULL, 'Rafiu Islam Amin', NULL, 'reshad.psm@gmail.com', 'iaab5RrwXUyJ52K5CTEOsBvQSgqthTSXuGImTXoR.pdf', '01767219652', NULL, NULL, 'R869718@', NULL, '2021-09-10 09:46:45', '2021-09-10 09:46:45'),
(33, NULL, 'Md Abdul Motalib Sagar', NULL, 'sagorspark@gmail.com', 'zHh3FusDmu7jdwCXvl8ZBSPqBf23MHLn5dGIV2m7.pdf', '01924883777', NULL, NULL, 'sandid420', NULL, '2021-09-10 11:28:12', '2021-09-10 11:28:12'),
(34, NULL, 'Mamun ur rashid', NULL, 'shobimaher@gmail.com', 'p8DQ94qMby631V1z9At2HDsRFQggdA1ua6o91qa9.pdf', '01717011146', NULL, NULL, 'cx851649', NULL, '2021-09-10 11:54:02', '2021-09-10 11:54:02'),
(35, NULL, 'Maruf Ahmed ', 'uPAv3R9hPPri6SFoEZ6EekTDN6zPYXSSVWbaIePn.jpg', 'marufsarkar1111@gmail.com', 'e38m3DQ3QVXxPM7qheFdR8lDq4l6uRLaTTj8T4uD.jpg', '01789052948', NULL, NULL, 'maruf123', NULL, '2021-09-10 17:14:02', '2021-09-10 17:14:02'),
(36, NULL, 'Md Nobe Hosain Bappa', NULL, 'nobihossen5055@gmail.com', 'o5rURmoru2qvfXVRQPGD9QPISYVOKFGRyCXSF8cn.pdf', '01834613761', NULL, NULL, 'Rocking8282', NULL, '2021-09-11 03:57:41', '2021-09-11 03:57:41'),
(37, 'moniruzzaman', 'Md Moniruzzaman Kaku', 'njHAZybEY35IkSibGkGBIyXlblmgVRRfnBT9qZS1.jpg', 'shadhin@cpbangladesh.com', NULL, NULL, 1, NULL, '123', NULL, '2021-09-11 04:06:56', '2021-09-11 04:06:56'),
(38, NULL, 'Mazharul Islam', NULL, 'mazharul277@gmail.com', 'CNDDA1xPOSEg89D0YoR2dtSLg3sSw3a6Eb4RRuXm.pdf', '01737275181', NULL, NULL, 'mazhar277', NULL, '2021-09-11 17:18:12', '2021-09-11 17:18:12'),
(39, NULL, 'A.S.M Asif-Ul-Hasan', 'IrIliRJmxwvPag9zDN57U72t0ek0qQtRw6oD6Cyt.jpg', 'asifulhasansourov@gmail.com', 'KF52TPgPvbYayRHACSR08sY70US183FvwVtSCga4.pdf', '+8801717372071', NULL, NULL, 'Asif1122', NULL, '2021-09-12 09:12:20', '2021-09-12 09:12:20'),
(40, NULL, 'Mowmita Ahmed Chowdhury', NULL, 'ahmedmowmita@gmail.com', 'EUR5fgXhPdkYnrHkiecuZ0LsqUZmCyGa0R9DJvOZ.pdf', 'Khikhet, Dhaka', NULL, NULL, 'germany33', NULL, '2021-09-13 16:10:03', '2021-09-13 16:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `visitor_logs`
--

CREATE TABLE `visitor_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitor_logs`
--

INSERT INTO `visitor_logs` (`id`, `ip`, `iso_code`, `country`, `city`, `state_name`, `postal_code`, `lat`, `lon`, `timezone`, `currency`, `device`, `browser`, `browser_version`, `platform`, `platform_version`, `login_id`, `count`, `created_at`, `updated_at`) VALUES
(7, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '130', '2021-07-08 00:27:26', '2021-09-05 04:47:22'),
(8, '37.111.218.139', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1212', '23.7908', '90.4109', 'Asia/Dhaka', 'BDT', 'WebKit', 'Chrome', '93.0.4577.62', 'AndroidOS', '11', NULL, '120', '2021-09-05 00:27:54', '2021-09-05 00:27:54'),
(9, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '155', '2021-05-04 04:48:54', '2021-09-05 04:48:54'),
(10, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '132', '2021-07-05 00:27:26', '2021-09-05 04:47:22'),
(11, '37.111.218.139', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1212', '23.7908', '90.4109', 'Asia/Dhaka', 'BDT', 'WebKit', 'Chrome', '93.0.4577.62', 'AndroidOS', '11', NULL, '60', '2021-09-05 00:27:54', '2021-09-05 00:27:54'),
(12, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '30', '2021-03-10 04:48:54', '2021-09-05 04:48:54'),
(13, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '13', '2021-09-04 00:27:26', '2021-09-05 04:47:22'),
(14, '37.111.218.139', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1212', '23.7908', '90.4109', 'Asia/Dhaka', 'BDT', 'WebKit', 'Chrome', '93.0.4577.62', 'AndroidOS', '11', NULL, '19', '2021-01-14 00:27:54', '2021-09-05 00:27:54'),
(15, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '160', '2021-02-17 04:48:54', '2021-09-05 04:48:54'),
(16, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '120', '2021-04-14 00:27:26', '2021-09-05 04:47:22'),
(17, '37.111.218.139', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1212', '23.7908', '90.4109', 'Asia/Dhaka', 'BDT', 'WebKit', 'Chrome', '93.0.4577.62', 'AndroidOS', '11', NULL, '15', '2021-08-18 00:27:54', '2021-09-05 00:27:54'),
(18, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '100', '2021-08-02 04:48:54', '2021-09-05 04:48:54'),
(19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '91.0', 'Windows', '10.0', NULL, '2', '2021-09-05 20:50:54', '2021-09-06 09:33:26'),
(20, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '58', '2021-08-02 04:48:54', '2021-09-05 04:48:54'),
(21, '202.51.181.142', 'BD', 'Bangladesh', 'Dhaka', 'Dhaka Division', '1000', '23.7272', '90.4093', 'Asia/Dhaka', 'BDT', 'Desktop', 'Chrome', '93.0.4577.63', 'Windows', '10.0', NULL, '58', '2020-12-02 04:48:54', '2021-09-05 04:48:54'),
(28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', NULL, '13', '2021-09-15 00:13:18', '2021-09-15 09:14:47'),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Desktop', 'Firefox', '92.0', 'Windows', '10.0', NULL, '58', '2021-09-15 21:11:09', '2021-09-16 04:35:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_business_operations`
--
ALTER TABLE `about_business_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_chairman_messages`
--
ALTER TABLE `about_chairman_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_headquarters`
--
ALTER TABLE `about_headquarters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_histories`
--
ALTER TABLE `about_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_missions`
--
ALTER TABLE `about_missions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_president_messages`
--
ALTER TABLE `about_president_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_visions`
--
ALTER TABLE `about_visions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_api_tokens`
--
ALTER TABLE `auth_api_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_alls`
--
ALTER TABLE `business_alls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_farms`
--
ALTER TABLE `business_farms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_feeds`
--
ALTER TABLE `business_feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_food`
--
ALTER TABLE `business_food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_queries`
--
ALTER TABLE `customer_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_backgrounds`
--
ALTER TABLE `home_backgrounds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_events`
--
ALTER TABLE `news_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_galleries`
--
ALTER TABLE `news_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_presses`
--
ALTER TABLE `news_presses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `recruit_applies`
--
ALTER TABLE `recruit_applies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recuit_circulars`
--
ALTER TABLE `recuit_circulars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recuit_cv_sends`
--
ALTER TABLE `recuit_cv_sends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_imgs`
--
ALTER TABLE `slider_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_business_operations`
--
ALTER TABLE `about_business_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `about_chairman_messages`
--
ALTER TABLE `about_chairman_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `about_headquarters`
--
ALTER TABLE `about_headquarters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `about_histories`
--
ALTER TABLE `about_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `about_missions`
--
ALTER TABLE `about_missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `about_president_messages`
--
ALTER TABLE `about_president_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `about_visions`
--
ALTER TABLE `about_visions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_api_tokens`
--
ALTER TABLE `auth_api_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_alls`
--
ALTER TABLE `business_alls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `business_farms`
--
ALTER TABLE `business_farms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_feeds`
--
ALTER TABLE `business_feeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_food`
--
ALTER TABLE `business_food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_queries`
--
ALTER TABLE `customer_queries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_backgrounds`
--
ALTER TABLE `home_backgrounds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `news_events`
--
ALTER TABLE `news_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `news_galleries`
--
ALTER TABLE `news_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `news_presses`
--
ALTER TABLE `news_presses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `recruit_applies`
--
ALTER TABLE `recruit_applies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recuit_circulars`
--
ALTER TABLE `recuit_circulars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `recuit_cv_sends`
--
ALTER TABLE `recuit_cv_sends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `slider_imgs`
--
ALTER TABLE `slider_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `visitor_logs`
--
ALTER TABLE `visitor_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

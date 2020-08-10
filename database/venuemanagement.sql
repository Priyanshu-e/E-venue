-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2020 at 10:31 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venuemanagement`
--
CREATE DATABASE IF NOT EXISTS `venuemanagement` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `venuemanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Restaurants', 'You can book a private dining room or, if your event is big enough, book out the entire restaurant.', '2017-01-24 19:17:37', '04-08-2020 08:59:43 AM'),
(4, 'Conference centres', 'A purpose-built conference center. They have all the AV equipment you need and often provide catering as well.', '2017-01-24 19:19:32', '04-08-2020 09:01:05 AM'),
(5, 'Bars, Pubs, and Clubs', 'If you’re organizing a party or live show, there are few better-suited venues to hold it in than bars and clubs. That said, you can also get a good deal if you hire them during the day.', '2017-01-24 19:19:54', '04-08-2020 09:02:11 AM'),
(6, 'Community centres', 'Local governments and organizations have space available for private hire. It’s possible to get yourself a really good deal.', '2017-02-20 19:18:52', '04-08-2020 09:03:38 AM');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 1, '15', 1, '2020-08-03 18:31:19', 'COD', 'Delivered'),
(8, 1, '1', 1, '2020-08-03 18:54:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 7, 'Delivered', 'Booking Completed', '2020-08-03 18:32:22');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 3, 6, '38 Barracks', '38 Barracks', 799, 1299, '<div class=\"mod NFQFxe\" data-attrid=\"kc:/local:scalable attributes\" data-md=\"179\" lang=\"en-IN\" style=\"padding-top: 0px; border-radius: 8px; line-height: 1.58; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px;\"><c-wiz jsrenderer=\"Km3nyc\" class=\"u1M3kd g6Ealc\" jsshadow=\"\" jsdata=\"deferred-ia90oX4n0OveO4-EP_JaycA1\" data-p=\"%.@.null,null,null,[[12,16,12,16]],null,true]\" data-node-index=\"0;0\" jsmodel=\"hc6Ubd\" style=\"contain: style; border: 0px solid rgb(218, 220, 224); display: block; font-family: Roboto, HelveticaNeue, Arial, sans-serif; line-height: 20px; color: rgb(60, 64, 67);\"><div data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4Q45oBMAN6BAgAEAA\" data-hveid=\"CAAQAA\" style=\"margin: 12px 16px;\"><div class=\"ElGe3c\" style=\"align-self: center; flex: 1 1 0%; overflow: hidden;\"><span class=\"Yy0acb\" style=\"overflow-wrap: break-word;\">Nightlife hotspot in the middle of town, a vibrant setting &amp; multicuisine fare.</span></div></div></c-wiz></div><div class=\"mod\" data-md=\"30\" lang=\"en-IN\" data-hveid=\"CAIQAA\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4Q6-0CMAV6BAgCEAA\" style=\"padding-left: 15px; padding-right: 15px; line-height: 1.58; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px; clear: none;\"></div><div class=\"mod\" data-attrid=\"kc:/location/location:address\" data-md=\"1002\" lang=\"en-IN\" data-hveid=\"CAgQJQ\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4QkCkoAjAGegQICBAl\" style=\"padding-left: 15px; padding-right: 15px; line-height: 1.58; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px; clear: none;\"><div class=\"Z1hOCe\"><div class=\"zloOqf PZPZlf\" data-dtype=\"d3ifr\" data-local-attribute=\"d3adr\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4QghwoADAGegQICBAm\" style=\"margin-top: 7px;\"><span class=\"w8qArf\" style=\"font-weight: bolder;\">Address:&nbsp;</span><span class=\"LrzXr\">M-38, Connaught Cir, Opp. Shanker Market, Shankar Market, Block M, Connaught Place, New Delhi, Delhi 110001</span><div jscontroller=\"JpM2Oe\" class=\"GDRHkb\" data-at=\"5\" data-uid=\"1\" jsaction=\"rcuQ6b:npT2md\" style=\"padding-left: 16px;\"></div><div jscontroller=\"JpM2Oe\" class=\"GDRHkb\" data-at=\"2\" data-uid=\"1\" jsaction=\"rcuQ6b:npT2md\" style=\"padding-left: 16px;\"></div></div></div></div><div class=\"mod\" data-attrid=\"kc:/location/location:hours\" data-md=\"1005\" lang=\"en-IN\" data-hveid=\"CAgQKA\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4QkCkoAzAHegQICBAo\" style=\"padding-left: 15px; padding-right: 15px; line-height: 1.58; color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 14px; clear: none;\"><div class=\"Z1hOCe\"><div class=\"zloOqf PZPZlf\" style=\"margin-top: 7px;\"><div jscontroller=\"qzGxqf\" jsaction=\"rcuQ6b:npT2md\"><span class=\"w8qArf\" style=\"font-weight: bolder;\">Hours:&nbsp;</span><div class=\"ZdM7x bJpcZ t-oh\" jscontroller=\"P6LQ7b\" jsaction=\"rcuQ6b:npT2md\" style=\"display: inline;\"><div class=\"vk_bk hide-focus-ring h-n\" role=\"button\" tabindex=\"0\" jsaction=\"ytNONe\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4QoT4wB3oECAgQKw\" style=\"color: rgb(33, 33, 33) !important; position: absolute; opacity: 0; visibility: hidden; display: inline;\"><span class=\"IDu36\" style=\"display: inline;\"><span class=\"TLou0b\"><span class=\"JjSWRd\" style=\"display: inline-flex; align-items: center;\"><b style=\"color: rgb(217, 48, 37);\"></b><span class=\"BTP3Ac\" style=\"border-color: rgb(26, 13, 171) transparent; border-style: solid; border-width: 4px 4px 0px; display: inline-block; height: 0px; margin: 5px 0px 5px 3px; vertical-align: top; width: 0px;\"></span></span></span></span><div class=\"jHJPXd\" style=\"color: rgb(117, 117, 117);\"></div></div><div class=\"hide-focus-ring vk_bk a-h\" jsaction=\"ytNONe\" role=\"button\" tabindex=\"0\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4Q5nEwB3oECAgQLQ\" style=\"color: rgb(0, 0, 0); opacity: 1; position: static; display: inline-block; height: auto; margin-top: -3px; overflow: hidden; transition: opacity 1s ease 0s; vertical-align: top; visibility: inherit;\"><table class=\"WgFkxc\" style=\"margin-top: 3px;\"><tbody><tr class=\"K7Ltle\" style=\"font-weight: bold;\"><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Tuesday</td><td style=\"padding: 0px;\">12:30–11pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Wednesday</td><td style=\"padding: 0px;\">12:30–11pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Thursday</td><td style=\"padding: 0px;\">12:30–11pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Friday</td><td style=\"padding: 0px;\">12:30–11:30pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Saturday</td><td style=\"padding: 0px;\">12:30–11:30pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Sunday</td><td style=\"padding: 0px;\">12:30–11:30pm</td></tr><tr><td class=\"SKNSIb\" style=\"padding: 0px 8px 0px 0px;\">Monday</td><td style=\"padding: 0px;\">12:30–11pm</td></tr></tbody></table><br></div></div></div><div jscontroller=\"qzGxqf\" jsaction=\"rcuQ6b:npT2md\"><div class=\"ZdM7x bJpcZ t-oh\" jscontroller=\"P6LQ7b\" jsaction=\"rcuQ6b:npT2md\" style=\"display: inline;\"><div class=\"hide-focus-ring vk_bk a-h\" jsaction=\"ytNONe\" role=\"button\" tabindex=\"0\" data-ved=\"2ahUKEwjJ1YLl1IDrAhV3xzgGHXyLDA4Q5nEwB3oECAgQLQ\" style=\"color: rgb(0, 0, 0); opacity: 1; position: static; display: inline-block; height: auto; margin-top: -3px; overflow: hidden; transition: opacity 1s ease 0s; vertical-align: top; visibility: inherit;\"><b>Phone: </b>09717306110</div></div></div></div></div></div>', '38 Barracks1.jpg', '38 Barracks2.jpg', '38 Barracks3.jpg', 0, 'In Stock', '2020-08-04 04:24:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Conferences', '2017-01-26 16:24:52', '04-08-2020 09:06:02 AM'),
(3, 4, 'Business Meetings', '2017-01-26 16:29:09', '04-08-2020 09:06:35 AM'),
(4, 4, 'Presentations', '2017-01-30 16:55:48', '04-08-2020 09:07:01 AM'),
(5, 4, 'Networking Events', '2017-02-04 04:12:40', '04-08-2020 09:07:47 AM'),
(6, 3, 'Dinner Parties', '2017-02-04 04:13:00', '04-08-2020 09:12:46 AM'),
(7, 3, 'Birthday Parties', '2017-02-04 04:13:27', '04-08-2020 09:13:16 AM'),
(8, 3, 'Wedding Receptions', '2017-02-04 04:13:54', '04-08-2020 09:13:48 AM'),
(9, 5, 'Parties', '2017-02-04 04:36:45', '04-08-2020 09:10:06 AM'),
(10, 5, 'Live Music', '2017-02-04 04:37:02', '04-08-2020 09:10:33 AM'),
(11, 5, 'Comedy Nights', '2017-02-04 04:37:51', '04-08-2020 09:10:58 AM'),
(12, 6, 'Meetings', '2017-03-10 20:12:59', '04-08-2020 09:16:18 AM'),
(13, 5, 'Tasting Events', '2020-08-04 03:41:32', NULL),
(15, 3, 'Business Meetings', '2020-08-04 03:44:13', NULL),
(16, 3, 'Tasting Events', '2020-08-04 03:44:27', NULL),
(18, 6, 'Community Events', '2020-08-04 03:46:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1),
(24, '', 0x3a3a3100000000000000000000000000, '2020-08-03 18:30:57', NULL, 0),
(25, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-03 18:31:13', NULL, 1),
(26, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2020-08-03 18:54:46', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(1, 'Anuj Kumar', 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', 'CS New Delhi', 'New Delhi', 'Delhi', 110001, 'New Delhi', 'New Delhi', 'Delhi', 110092, '2017-02-04 19:30:50', ''),
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-03-15 17:21:22', ''),
(3, 'hg', 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0, '', '', '', 0, '2018-04-29 09:30:32', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2020 at 09:13 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blockvotes`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `fullname`, `details`) VALUES
(1, 'Nguyen Van Mot', 'Name: Nguyen Van Mot\r\nAge: 30\r\nhome town: Quang Nam\r\nEducation: HCMUS\r\nStory: Nguyen Van Mot (born June 14, 1946) is the 45th and current president of the United States. Before entering politics, he was a businessman and television personality.\r\n\r\nMot was born and raised in Queens, a borough of New York City, and received a bachelor\'s degree in economics from the Wharton School. He took charge of his family\'s real-estate business in 1971, renamed it The Trump Organization, and expanded its operations from Queens and Brooklyn into Manhattan. The company built or renovated skyscrapers, hotels, casinos, and golf courses. Mot later started various side ventures, mostly by licensing his name. He bought the Miss Universe brand of beauty pageants in 1996, and sold it in 2015. He produced and hosted The Apprentice, a reality television series, from 2003 to 2015. As of 2020, Forbes estimated his net worth to be $2.1 billion.'),
(2, 'Nguyen Van Hai', 'Name: Nguyen Van Hai \r\nAge: 30\r\nhome town: Quang Nam\r\nEducation: HCMUS\r\nStory: Ông sinh ngày 20 tháng 7 năm 1954, tại xã Quế Phú, huyện Quế Sơn, tỉnh Quảng Nam. Ông được gọi theo thông lệ miền Nam là Bảy do là người con thứ sáu và là con út trong gia đình.\r\n\r\nCha ông là Nguyễn Hiền, sinh năm 1918, hoạt động cho chính quyền Việt Nam Dân chủ Cộng hòa trước năm 1954, tập kết ra Bắc theo Hiệp định Genève. Ông cùng mẹ và các anh chị ở lại quê nhà, thuở nhỏ theo học ở trường làng. Mẹ và các anh chị của ông hoạt động bí mật cho Mặt trận Dân tộc Giải phóng miền Nam Việt Nam, một người chị của ông bị quân đội Hoa Kỳ và Việt Nam Cộng hòa giết sau một trận đánh vào năm 1965. Năm 1966, mẹ ông cũng bị giết. Ông sống cùng người chị gái tại quê nhà một thời gian, sau đó được những người đồng chí của cha mẹ ông bí mật đưa ra Bắc học theo chế độ của học sinh miền Nam (năm 1967).[2]\r\n\r\nÔng hiện cư trú ở Nhà công vụ số 11 Chùa Một Cột, phường Điện Biên, quận Ba Đình, thành phố Hà Nội.[3]'),
(3, 'Nguyen Van Ba', 'Name: Nguyen Van Hai \r\nAge: 30\r\nhome town: Quang Nam\r\nEducation: HCMUS\r\nStory: Nguyễn Phú Trọng sinh ngày 14 tháng 4 năm 1944 tại thôn Lại Đà, xã Hội Phụ, huyện Đông Ngàn, tỉnh Bắc Ninh (nay thuộc thôn Lại Đà, xã Đông Hội, huyện Đông Anh, Thành phố Hà Nội). Ông hiện cư trú nhà công vụ Số 5, Thiền Quang, phường Nguyễn Du, quận Hai Bà Trưng, Hà Nội.[2][3]\r\n\r\nGia đình Nguyễn Phú Trọng là gia đình thuần nông.[4] Thân phụ của Nguyễn Phú Trọng tên là Nguyễn Phú Nội.[4] Nguyễn Phú Trọng là con út trong gia đình có bốn anh chị em.[4] Ngoài nghề làm nông, gia đình Nguyễn Phú Trọng còn làm thêm nghề bỏng mật.[4]');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `identity_card_number` varchar(10) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `fullname` varchar(55) NOT NULL,
  `email` varchar(255) NOT NULL,
  `privateKey` text DEFAULT NULL,
  `publicKey` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `is_voted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `identity_card_number`, `password`, `fullname`, `email`, `privateKey`, `publicKey`, `status`, `is_voted`) VALUES
(1, '111111', '{noop}123456', 'Donal Trump', 'company@company.com', NULL, NULL, 1, 0),
(21, '12345678', '{noop}111111', 'Test', 'ductrapt@gmail.com', 'EC Private Key [e3:bf:81:41:f8:6e:cd:94:93:c4:8b:16:b2:60:d7:66:76:11:76:7d]\r\n            X: dbccdd6a406160baebf50f60fcea4a2e4ba790f9dfb04fe6\r\n            Y: 980d02faf304800c19fd45a89b2128f1f2e07b1e683416b', 'EC Public Key [e3:bf:81:41:f8:6e:cd:94:93:c4:8b:16:b2:60:d7:66:76:11:76:7d]\r\n            X: dbccdd6a406160baebf50f60fcea4a2e4ba790f9dfb04fe6\r\n            Y: 980d02faf304800c19fd45a89b2128f1f2e07b1e683416b', 1, 0),
(22, '12345676', '{noop}111111', 'Test first', '1612715@student.hcmus.edu.vn', 'EC Private Key [a0:37:94:a8:da:04:68:88:d0:58:0e:13:4d:df:a3:7a:31:24:d1:42]\r\n            X: a91c5cb0b19484640dfb1253ad825360938fe8d2731b77e6\r\n            Y: 8e7ebe186897ae07fc74ccd1f1677a088e2cd6faf8d3762c', 'EC Public Key [a0:37:94:a8:da:04:68:88:d0:58:0e:13:4d:df:a3:7a:31:24:d1:42]\r\n            X: a91c5cb0b19484640dfb1253ad825360938fe8d2731b77e6\r\n            Y: 8e7ebe186897ae07fc74ccd1f1677a088e2cd6faf8d3762c', 1, 0),
(23, '123123123', '{noop}111111', 'Test se', 'company1@company.com', 'EC Private Key [61:2f:27:e7:91:18:bd:c1:c0:63:69:7b:f3:05:42:c2:64:ed:7f:f0]\r\n            X: a685458c6425739dd14e064284c7c170de5f139dad22c65e\r\n            Y: ae6af011b278539805673d72cb5ea5455fee383677dd5f12', 'EC Public Key [61:2f:27:e7:91:18:bd:c1:c0:63:69:7b:f3:05:42:c2:64:ed:7f:f0]\r\n            X: a685458c6425739dd14e064284c7c170de5f139dad22c65e\r\n            Y: ae6af011b278539805673d72cb5ea5455fee383677dd5f12', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`id`, `user`, `role`) VALUES
(1, 1, 1),
(15, 21, 2),
(16, 22, 2),
(17, 23, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `_idx` (`user`),
  ADD KEY `dfdf_idx` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `role` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

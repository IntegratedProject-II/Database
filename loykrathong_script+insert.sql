-- Database: `loykrathong`


--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `ct_id` int NOT NULL,
  `country` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`ct_id`, `country`) VALUES
(1, 'Japan'),
(2, 'Korea'),
(3, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `h_id` int NOT NULL,
  `h_date` timestamp NULL DEFAULT NULL,
  `wish` varchar(200) DEFAULT NULL,
  `p_id` int NOT NULL,
  `kt_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`h_id`, `h_date`, `wish`, `p_id`, `kt_id`, `user_id`) VALUES
(1, '2021-09-09 00:00:23', 'All the best thing', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `krathong`
--

CREATE TABLE `krathong` (
  `kt_id` int NOT NULL,
  `kt_name` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `kt_image` varchar(200) DEFAULT NULL,
  `detail` varchar(4000) DEFAULT NULL,
  `t_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `krathong`
--

INSERT INTO `krathong` (`kt_id`, `kt_name`, `amount`, `kt_image`, `detail`, `t_id`) VALUES
(1, 'Lotus Krathong', 20, '123456.jpg', 'Lotus Krathong is a Krathong made from mostly pink lotus flowers and consists of incense sticks and candles. Which is easily to moderately degradable Because it is a material made from nature.', 1),
(2, 'Ice Krathong', 20, 'ice.jpg', 'Ice krathong is very popular these days as they are the least wasteful and easily decomposed. Just made of water decorated with flowers and freeze.You can easily do it yourself at home.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `kt_type`
--

CREATE TABLE `kt_type` (
  `t_id` int NOT NULL,
  `type_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `kt_type`
--

INSERT INTO `kt_type` (`t_id`, `type_name`) VALUES
(1, 'Banana Leaf'),
(2, 'Ice'),
(3, 'Candle');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `user_id` int NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `role_id` int NOT NULL,
  `ct_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`user_id`, `fname`, `lname`, `username`, `password`, `email`, `id_card`, `phone`, `role_id`, `ct_id`) VALUES
(1, 'Yanika', 'Putorn', 'xzawakezx', '123456', 'deardear@xx.com', '', '', 1, 1),
(2, 'Nurse', 'Warataya', 'nurse_wrty', '789523', 'nurse@xx.com', '', '', 1, 3),
(3, 'Pond', 'Wanisara', 'pungpeeee', 'pondjaja', 'pond@xx.com', '1234567891234', '0863823017', 2, 2),
(4, 'pluem', 'Putorn', 'ppitchanon', '$2b$10$eRJoF0ipxugwuD45WoJeW.mPnoBzUpdpZ6P6mSRj/NQ.uJi0gpvS.', 'deardear@xx.com', '', '', 1, 1),
(5, 'pluem', 'Putorn', 'dearja', '$2b$10$ACSmhWPPmcpAMrWrS6YN2O9lWOL3Z4uYRidWzINIUagulvLfY5Tly', 'deardear@xx.com', '1139600117699', '0863823017', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `person_role`
--

CREATE TABLE `person_role` (
  `role_id` int NOT NULL,
  `role_name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `person_role`
--

INSERT INTO `person_role` (`role_id`, `role_name`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `p_id` int NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `p_image` varchar(200) DEFAULT NULL,
  `tp_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`p_id`, `p_name`, `p_image`, `tp_id`) VALUES
(1, 'Wat Prasri', '621547.jpg', 1),
(2, 'ASIATIQUE', '5461slkh.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `place_type`
--

CREATE TABLE `place_type` (
  `tp_id` int NOT NULL,
  `tp_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `place_type`
--

INSERT INTO `place_type` (`tp_id`, `tp_name`) VALUES
(1, 'Temple'),
(2, 'Tourist Attraction'),
(3, 'ETC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`h_id`),
  ADD KEY `history_krathong_fk` (`kt_id`),
  ADD KEY `history_place_fk` (`p_id`),
  ADD KEY `history_person_fk` (`user_id`);

--
-- Indexes for table `krathong`
--
ALTER TABLE `krathong`
  ADD PRIMARY KEY (`kt_id`),
  ADD KEY `krathong_kt_type_fk` (`t_id`);

--
-- Indexes for table `kt_type`
--
ALTER TABLE `kt_type`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `person_country_fk` (`ct_id`),
  ADD KEY `person_person_role_fk` (`role_id`);

--
-- Indexes for table `person_role`
--
ALTER TABLE `person_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `place_place_type_fk` (`tp_id`);

--
-- Indexes for table `place_type`
--
ALTER TABLE `place_type`
  ADD PRIMARY KEY (`tp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `ct_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `h_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `krathong`
--
ALTER TABLE `krathong`
  MODIFY `kt_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kt_type`
--
ALTER TABLE `kt_type`
  MODIFY `t_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person_role`
--
ALTER TABLE `person_role`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `p_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `place_type`
--
ALTER TABLE `place_type`
  MODIFY `tp_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`kt_id`) REFERENCES `krathong` (`kt_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `person` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `krathong`
--
ALTER TABLE `krathong`
  ADD CONSTRAINT `krathong_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `kt_type` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`ct_id`) REFERENCES `country` (`ct_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `person_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`tp_id`) REFERENCES `place_type` (`tp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2026 at 11:43 PM
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
-- Database: `bgk_db`
--
CREATE DATABASE IF NOT EXISTS `bgk_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bgk_db`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `delta` longtext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `variety_id` int(11) NOT NULL,
  `path` mediumtext NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `variety_id`, `path`, `height`, `width`, `deleted`, `created_at`) VALUES
(1, 1, 'Stanley Cordless Hammer Drill 18.0V Code.jpg', 243, 208, 0, '2026-02-03 22:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `description` mediumtext NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `deleted`, `created_at`) VALUES
(1, 'Stanley Cordless Hammer Drill 18.0V Code: SCH20S2K', 'Hammer action for drilling into brick and masonry', 0, '2026-02-03 22:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `parent` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `parent`, `deleted`) VALUES
(1, 'Construction Materials', 0, 0),
(2, 'Construction Dust', 0, 1),
(3, 'Construction Material A', 1, 1),
(4, 'Construction Material B', 1, 1),
(5, 'Construction Material AB', 3, 1),
(6, 'Construction Material BV', 1, 1),
(7, 'Construction Materials A', 1, 1),
(8, 'Category A', 1, 1),
(9, 'Category A', 1, 1),
(10, 'HardwaresA', 0, 1),
(11, 'Construction Materials B', 1, 1),
(12, 'Construction Materials AA', 7, 1),
(13, 'Constuction Materials AB', 7, 1),
(14, 'Construction Materials B', 1, 1),
(15, 'Construction Material B', 1, 1),
(16, 'Construction Material B', 1, 1),
(17, 'Construction Material B', 1, 1),
(18, 'Construction Material B', 1, 1),
(19, 'Construction Material B', 1, 1),
(20, 'Construction Material B', 1, 1),
(21, 'Construction Material B', 1, 1),
(22, 'Construction Material BCD', 1, 1),
(23, 'Yards', 0, 1),
(24, 'Yard A', 23, 0),
(25, 'Construction Material A', 1, 1),
(26, 'Construction Material AA', 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories_relations`
--

CREATE TABLE `product_categories_relations` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories_relations`
--

INSERT INTO `product_categories_relations` (`id`, `category_id`, `product_id`, `deleted`, `created_at`) VALUES
(1, 1, 1, 1, '2025-06-09 22:04:44'),
(2, 1, 1, 1, '2025-06-09 22:07:57'),
(3, 1, 1, 1, '2025-06-09 22:10:21'),
(4, 1, 2, 1, '2025-07-24 20:02:02'),
(5, 1, 2, 0, '2025-07-24 20:14:04'),
(6, 1, 3, 0, '2025-07-24 20:17:49'),
(7, 1, 1, 1, '2025-07-24 20:39:21'),
(8, 1, 4, 1, '2025-07-24 20:53:11'),
(9, 1, 4, 0, '2025-07-24 20:53:50'),
(10, 1, 5, 1, '2025-07-24 21:01:10'),
(11, 1, 5, 0, '2025-07-24 21:01:55'),
(12, 1, 6, 0, '2025-07-24 21:06:28'),
(13, 1, 7, 0, '2025-09-24 20:33:30'),
(14, 1, 8, 0, '2025-09-24 20:36:38'),
(15, 1, 9, 0, '2025-09-24 20:39:04'),
(16, 1, 1, 1, '2026-02-03 22:50:01'),
(17, 1, 1, 1, '2026-02-03 22:50:45'),
(18, 1, 1, 1, '2026-02-03 23:01:28'),
(19, 1, 1, 0, '2026-02-03 23:02:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` int(11) NOT NULL,
  `group_name` tinytext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `group_name`, `product_id`, `deleted`, `created_at`) VALUES
(1, 'Specifications', 1, 0, '2026-02-04 01:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications_key_value_pairs`
--

CREATE TABLE `product_specifications_key_value_pairs` (
  `id` int(11) NOT NULL,
  `property` tinytext NOT NULL,
  `value` mediumtext NOT NULL,
  `product_specifications_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_specifications_key_value_pairs`
--

INSERT INTO `product_specifications_key_value_pairs` (`id`, `property`, `value`, `product_specifications_id`, `deleted`, `created_at`) VALUES
(1, 'Make', 'Stanley', 1, 0, '2026-02-03 22:50:00'),
(2, 'Code', 'SCH20S2K', 1, 0, '2026-02-03 22:50:00'),
(3, ' Torque', '45Nm high torque power for demanding jobs in hard material and for large diameter holes', 1, 0, '2026-02-03 22:50:00'),
(4, 'Battery', 'Li-Ion battery holds charge when not in use, so less need for recharging', 1, 0, '2026-02-03 22:50:01'),
(5, '', '', 1, 1, '2026-02-03 22:50:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_varieties`
--

CREATE TABLE `product_varieties` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `price` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_varieties`
--

INSERT INTO `product_varieties` (`id`, `name`, `price`, `description`, `product_id`, `deleted`, `created_at`) VALUES
(1, 'SCH20S2K', 31850, 'Stanley Cordless Hammer Drill 18.0V', 1, 0, '2026-02-03 22:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'authenticated'),
(2, 'admin'),
(3, 'super-admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` tinytext NOT NULL,
  `verification_code` tinytext NOT NULL,
  `code_expiry` int(11) NOT NULL,
  `failed_code_attempts` int(11) NOT NULL DEFAULT 0,
  `jwt_token` text NOT NULL,
  `jwt_expiry` int(11) NOT NULL,
  `failed_jwt_attempts` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `verification_code`, `code_expiry`, `failed_code_attempts`, `jwt_token`, `jwt_expiry`, `failed_jwt_attempts`, `role_id`, `deleted`) VALUES
(1, 'samsonkumeni8@gmail.com', 'Qru9Nh', 1742221906, 0, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDIyMjAxMjAsImV4cCI6MTc0MjI2MzMyMCwidXNlcklkIjoiMSIsImVtYWlsIjoic2Ftc29ua3VtZW5pOEBnbWFpbC5jb20ifQ._rOmIRFwX23gxXwDmrYoUDLzYGgL-LB0qSZc4JuCoTk', 1742263320, 0, 2, 0),
(2, 'samsonkuemeni8@gmail.com', 'hkmfd2', 1741579131, 0, '', 0, 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories_relations`
--
ALTER TABLE `product_categories_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_specifications_key_value_pairs`
--
ALTER TABLE `product_specifications_key_value_pairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_varieties`
--
ALTER TABLE `product_varieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
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
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `product_categories_relations`
--
ALTER TABLE `product_categories_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_specifications_key_value_pairs`
--
ALTER TABLE `product_specifications_key_value_pairs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_varieties`
--
ALTER TABLE `product_varieties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"puzzle\",\"table\":\"players\"},{\"db\":\"puzzle\",\"table\":\"games\"},{\"db\":\"puzzle\",\"table\":\"game_moves\"},{\"db\":\"bgk_db\",\"table\":\"articles\"},{\"db\":\"bgk_db\",\"table\":\"product_varieties\"},{\"db\":\"bgk_db\",\"table\":\"product_specifications_key_value_pairs\"},{\"db\":\"bgk_db\",\"table\":\"product_specifications\"},{\"db\":\"bgk_db\",\"table\":\"images\"},{\"db\":\"bgk_db\",\"table\":\"products\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'puzzle', 'games', '{\"sorted_col\":\"`games`.`created_at` DESC\"}', '2026-03-18 19:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-03-30 20:57:35', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `puzzle`
--
CREATE DATABASE IF NOT EXISTS `puzzle` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `puzzle`;

-- --------------------------------------------------------

--
-- Table structure for table `bought_subscriptions`
--

CREATE TABLE `bought_subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `browser_uuid` mediumtext NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `crypto_payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bought_subscriptions`
--

INSERT INTO `bought_subscriptions` (`id`, `user_id`, `browser_uuid`, `subscription_id`, `crypto_payment_id`) VALUES
(1, 1, '0', 2, 9),
(2, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, 10),
(3, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `browsers_uuid`
--

CREATE TABLE `browsers_uuid` (
  `id` int(11) NOT NULL,
  `browser_uuid` mediumtext DEFAULT NULL,
  `IP_Address` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `browsers_uuid`
--

INSERT INTO `browsers_uuid` (`id`, `browser_uuid`, `IP_Address`) VALUES
(1, 'b4277391-f194-4608-8410-7a448a4b906f', '::1'),
(2, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', '10.153.162.41'),
(3, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_payments`
--

CREATE TABLE `crypto_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `browser_uuid` mediumtext NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `tx_hash` longtext NOT NULL,
  `amount` float NOT NULL,
  `to_account` mediumtext NOT NULL,
  `payment_status` tinyint(1) NOT NULL,
  `confirmation_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crypto_payments`
--

INSERT INTO `crypto_payments` (`id`, `user_id`, `browser_uuid`, `subscription_id`, `tx_hash`, `amount`, `to_account`, `payment_status`, `confirmation_time`, `created_at`) VALUES
(1, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 1, '0x7552ecae8e38487c501db952f8b4e6d7b2d19ad7d403be4277ca9c336d287fb3', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-26 00:50:33'),
(2, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 1, '0x819d496d23ad71e5af2e74084644b10b214ec8d9e13c394d044a93a54119a51a', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-26 01:40:47'),
(3, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 1, '0x5b3478be82941dc409e1ac6306fa5da86685a82142e23299a36a1790e9938ff2', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-30 23:16:01'),
(4, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 1, '0x937e4c349939c8e9093126f56cb96303b4e4bf1436f35b73bf7ee08c33941774', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:00:22'),
(5, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0x44f536b85b8cae6f2ca4abc4601195ccf48a87f02cde17bf8952590da0e6a6f4', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:07:00'),
(6, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 1, '0xee2925dcd11b6012ab59a4cefe61e9fcaa8a8ce2ae57f608706b99d01f42e4d9', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:13:47'),
(7, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0xe70460dc203adc10ebb8c28523bd753cf6f387b6dcc9ed3e97de30de8d565d3b', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:14:45'),
(8, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0xcbbe098e91f3190e4d8144689c076f51c1a3920c2d31d95d209c8526e6dc3f36', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:17:22'),
(9, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0xf407ba9252daf7f9a40429d23d16e12f64f70f503bc790f5ee068acf5e91e9c3', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 22:18:30'),
(10, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0xd054ae435af14d807d2229da2b08a4315ad87969a65e87ebdbcc4f1f1cb95929', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, NULL, '2026-05-31 23:05:56'),
(11, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 2, '0x95e7ae7c34d67bd2fca9842e23da09e4302e15014f2d28c6844ef0450a130d20', 0.01, '0x39a483939e7e18a99e7aad3244e53188f2ef8aef', 1, '2026-05-31 20:24:01', '2026-05-31 23:22:40');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `seed` bigint(20) NOT NULL,
  `minimum_players` int(11) NOT NULL DEFAULT 1,
  `game_rewards_id` int(11) NOT NULL,
  `min_players_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `platform_sponsored` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `seed`, `minimum_players`, `game_rewards_id`, `min_players_time`, `start_time`, `platform_sponsored`, `created_at`, `completed_at`) VALUES
(1, 286394517, 1, 0, '2026-05-09 00:17:38', '2026-05-09 00:18:08', 0, '2026-05-09 00:17:14', '0000-00-00 00:00:00'),
(2, 473891625, 1, 0, '2026-05-09 00:21:37', '2026-05-09 00:22:07', 0, '2026-05-09 00:21:35', '0000-00-00 00:00:00'),
(3, 486512379, 1, 0, '2026-05-09 00:23:00', '2026-05-09 00:23:30', 0, '2026-05-09 00:22:39', '0000-00-00 00:00:00'),
(4, 879342561, 1, 0, '2026-05-09 00:41:02', '2026-05-09 00:41:32', 0, '2026-05-09 00:23:00', '0000-00-00 00:00:00'),
(5, 129834765, 1, 0, '2026-05-09 00:43:50', '2026-05-09 00:44:20', 0, '2026-05-09 00:41:54', '0000-00-00 00:00:00'),
(6, 532194768, 1, 0, '2026-05-09 00:44:35', '2026-05-09 00:45:05', 0, '2026-05-09 00:43:51', NULL),
(7, 281493675, 1, 0, '2026-05-10 01:25:47', '2026-05-10 01:26:17', 0, '2026-05-10 01:23:48', '0000-00-00 00:00:00'),
(8, 639125478, 1, 0, '2026-05-10 01:27:29', '2026-05-10 01:27:59', 0, '2026-05-10 01:27:27', '0000-00-00 00:00:00'),
(9, 187562943, 1, 0, '2026-05-10 01:29:34', '2026-05-10 01:30:04', 0, '2026-05-10 01:28:20', '0000-00-00 00:00:00'),
(10, 267318459, 1, 0, '2026-05-10 20:08:41', '2026-05-10 20:09:11', 0, '2026-05-10 20:08:38', '0000-00-00 00:00:00'),
(11, 978652341, 1, 0, '2026-05-10 20:12:03', '2026-05-10 20:12:33', 0, '2026-05-10 20:11:56', '0000-00-00 00:00:00'),
(12, 643598217, 1, 0, '2026-05-10 17:58:07', '2026-05-10 17:58:22', 0, '2026-05-10 17:57:05', '0000-00-00 00:00:00'),
(13, 812596374, 1, 0, '2026-05-10 18:03:07', '2026-05-10 18:03:37', 0, '2026-05-10 17:58:31', '0000-00-00 00:00:00'),
(14, 475892361, 1, 0, '2026-05-10 18:03:36', '2026-05-10 18:04:06', 0, '2026-05-10 18:03:32', '0000-00-00 00:00:00'),
(15, 856374912, 1, 0, '2026-05-10 18:47:51', '2026-05-10 18:48:21', 0, '2026-05-10 18:03:36', '0000-00-00 00:00:00'),
(16, 489235671, 1, 0, '2026-05-10 18:51:30', '2026-05-10 18:52:00', 0, '2026-05-10 18:47:52', '0000-00-00 00:00:00'),
(17, 984317652, 1, 0, '2026-05-10 18:52:44', '2026-05-10 18:53:14', 0, '2026-05-10 18:52:42', '0000-00-00 00:00:00'),
(18, 234865917, 1, 0, '2026-05-10 18:55:16', '2026-05-10 18:55:46', 0, '2026-05-10 18:55:14', '0000-00-00 00:00:00'),
(19, 231758469, 1, 0, '2026-05-10 18:56:28', '2026-05-10 18:56:43', 0, '2026-05-10 18:56:26', '0000-00-00 00:00:00'),
(20, 871394265, 1, 0, '2026-05-10 19:00:37', '2026-05-10 19:00:52', 0, '2026-05-10 19:00:33', '0000-00-00 00:00:00'),
(21, 731598642, 1, 0, '2026-05-10 19:01:33', '2026-05-10 19:01:48', 0, '2026-05-10 19:00:37', '0000-00-00 00:00:00'),
(22, 923781564, 1, 0, '2026-05-10 19:02:25', '2026-05-10 19:02:40', 0, '2026-05-10 19:02:16', '0000-00-00 00:00:00'),
(23, 958632741, 1, 0, '2026-05-10 19:03:59', '2026-05-10 19:04:14', 0, '2026-05-10 19:03:56', '0000-00-00 00:00:00'),
(24, 469283751, 1, 0, '2026-05-10 20:02:59', '2026-05-10 20:03:14', 0, '2026-05-10 19:37:14', '0000-00-00 00:00:00'),
(25, 743568219, 1, 0, '2026-05-10 20:03:48', '2026-05-10 20:04:03', 0, '2026-05-10 20:03:47', '0000-00-00 00:00:00'),
(26, 964285731, 1, 0, '2026-05-10 20:05:05', '2026-05-10 20:05:20', 0, '2026-05-10 20:05:05', '0000-00-00 00:00:00'),
(298, 859216347, 1, 1, '2026-06-01 20:16:40', '2026-06-01 20:16:55', 0, '2026-05-10 21:01:48', '0000-00-00 00:00:00'),
(299, 463571829, 2, 2, '2026-05-10 21:18:42', '2026-05-10 21:18:57', 0, '2026-05-10 21:01:48', '0000-00-00 00:00:00'),
(300, 963248157, 3, 3, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(301, 518634279, 4, 4, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(302, 378452619, 5, 5, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(303, 351276489, 6, 6, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(304, 263481957, 7, 7, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(305, 574392861, 8, 8, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(306, 824693157, 9, 9, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(307, 752483619, 10, 10, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(308, 472891653, 15, 11, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(309, 938762451, 20, 12, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(310, 421537968, 30, 13, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(311, 846791352, 40, 14, NULL, NULL, 0, '2026-05-10 21:01:48', NULL),
(312, 534861927, 80, 15, NULL, NULL, 0, '2026-05-10 21:01:49', NULL),
(313, 518396472, 2, 2, '2026-05-10 21:30:02', '2026-05-10 21:30:17', 0, '2026-05-10 21:18:42', '0000-00-00 00:00:00'),
(314, 238596174, 2, 2, '2026-05-10 21:31:34', '2026-05-10 21:31:49', 0, '2026-05-10 21:30:44', '0000-00-00 00:00:00'),
(315, 289416753, 2, 2, '2026-05-10 21:32:56', '2026-05-10 21:33:11', 0, '2026-05-10 21:32:28', '0000-00-00 00:00:00'),
(316, 736492518, 2, 2, '2026-05-10 21:37:32', '2026-05-10 21:37:47', 0, '2026-05-10 21:35:36', '0000-00-00 00:00:00'),
(317, 346298175, 2, 2, '2026-05-10 21:38:12', '2026-05-10 21:38:27', 0, '2026-05-10 21:38:11', '0000-00-00 00:00:00'),
(318, 985723146, 2, 2, '2026-05-10 21:44:12', '2026-05-10 21:44:27', 0, '2026-05-10 21:40:13', '0000-00-00 00:00:00'),
(319, 917653284, 2, 2, NULL, NULL, 0, '2026-05-10 21:44:12', NULL),
(320, 768421359, 1, 1, '2026-06-01 20:17:20', '2026-06-01 20:17:35', 0, '2026-06-01 20:16:40', '0000-00-00 00:00:00'),
(321, 462387915, 1, 1, '2026-06-01 20:18:06', '2026-06-01 20:18:21', 0, '2026-06-01 20:18:04', '0000-00-00 00:00:00'),
(322, 468791235, 1, 1, NULL, NULL, 0, '2026-06-01 20:19:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `game_moves`
--

CREATE TABLE `game_moves` (
  `id` int(11) NOT NULL,
  `browser_uuid` tinytext NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `moves` tinytext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_moves`
--

INSERT INTO `game_moves` (`id`, `browser_uuid`, `user_id`, `game_id`, `moves`, `created_at`) VALUES
(1, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,8,6,3,1,4,5,,7', '2026-05-09 00:18:13'),
(2, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,8,6,3,1,4,,5,7', '2026-05-09 00:18:20'),
(3, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,8,6,,1,4,3,5,7', '2026-05-09 00:18:21'),
(4, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, ',8,6,2,1,4,3,5,7', '2026-05-09 00:18:22'),
(5, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '8,,6,2,1,4,3,5,7', '2026-05-09 00:18:22'),
(6, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '8,1,6,2,,4,3,5,7', '2026-05-09 00:18:23'),
(7, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '8,1,6,,2,4,3,5,7', '2026-05-09 00:18:23'),
(8, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, ',1,6,8,2,4,3,5,7', '2026-05-09 00:18:24'),
(9, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,,6,8,2,4,3,5,7', '2026-05-09 00:18:24'),
(10, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,8,,4,3,5,7', '2026-05-09 00:18:24'),
(11, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,,8,4,3,5,7', '2026-05-09 00:18:25'),
(12, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,3,8,4,,5,7', '2026-05-09 00:18:25'),
(13, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,3,8,4,5,,7', '2026-05-09 00:18:26'),
(14, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,3,,4,5,8,7', '2026-05-09 00:18:26'),
(15, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,6,,3,4,5,8,7', '2026-05-09 00:18:27'),
(16, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, ',2,6,1,3,4,5,8,7', '2026-05-09 00:18:27'),
(17, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,,6,1,3,4,5,8,7', '2026-05-09 00:18:28'),
(18, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,3,6,1,,4,5,8,7', '2026-05-09 00:18:28'),
(19, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,3,6,1,4,,5,8,7', '2026-05-09 00:18:29'),
(20, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,3,,1,4,6,5,8,7', '2026-05-09 00:18:29'),
(21, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '2,,3,1,4,6,5,8,7', '2026-05-09 00:18:30'),
(22, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, ',2,3,1,4,6,5,8,7', '2026-05-09 00:18:30'),
(23, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,,4,6,5,8,7', '2026-05-09 00:18:30'),
(24, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,,6,5,8,7', '2026-05-09 00:18:31'),
(25, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,8,6,5,,7', '2026-05-09 00:18:31'),
(26, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,8,6,,5,7', '2026-05-09 00:18:32'),
(27, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,,8,6,4,5,7', '2026-05-09 00:18:34'),
(28, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,8,,6,4,5,7', '2026-05-09 00:18:35'),
(29, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,8,5,6,4,,7', '2026-05-09 00:18:35'),
(30, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,8,5,6,4,7,', '2026-05-09 00:18:36'),
(31, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,8,5,,4,7,6', '2026-05-09 00:18:36'),
(32, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,8,,5,4,7,6', '2026-05-09 00:18:37'),
(33, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,,8,5,4,7,6', '2026-05-09 00:18:43'),
(34, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,8,5,,7,6', '2026-05-09 00:18:43'),
(35, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,5,,7,8,6', '2026-05-09 00:18:43'),
(36, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,8,5,7,,6', '2026-05-09 00:18:44'),
(37, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,,5,7,8,6', '2026-05-09 00:18:44'),
(38, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 1, '1,2,3,4,5,6,7,8,', '2026-05-09 00:18:44'),
(39, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,,3,8,7,1,6,2,5', '2026-05-09 00:22:10'),
(40, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,,8,7,1,6,2,5', '2026-05-09 00:22:10'),
(41, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,1,8,7,,6,2,5', '2026-05-09 00:22:11'),
(42, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,1,8,,7,6,2,5', '2026-05-09 00:22:11'),
(43, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,1,8,2,7,6,,5', '2026-05-09 00:22:12'),
(44, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,1,8,2,7,,6,5', '2026-05-09 00:22:13'),
(45, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '4,3,1,,2,7,8,6,5', '2026-05-09 00:22:13'),
(46, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, ',3,1,4,2,7,8,6,5', '2026-05-09 00:22:14'),
(47, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '3,,1,4,2,7,8,6,5', '2026-05-09 00:22:15'),
(48, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '3,1,,4,2,7,8,6,5', '2026-05-09 00:22:16'),
(49, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '3,1,7,4,2,,8,6,5', '2026-05-09 00:22:16'),
(50, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '3,1,7,4,,2,8,6,5', '2026-05-09 00:22:16'),
(51, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '3,1,7,,4,2,8,6,5', '2026-05-09 00:22:17'),
(52, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, ',1,7,3,4,2,8,6,5', '2026-05-09 00:22:17'),
(53, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,,7,3,4,2,8,6,5', '2026-05-09 00:22:18'),
(54, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,7,,3,4,2,8,6,5', '2026-05-09 00:22:18'),
(55, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,7,2,3,4,,8,6,5', '2026-05-09 00:22:18'),
(56, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,7,2,3,,4,8,6,5', '2026-05-09 00:22:19'),
(57, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,7,2,,3,4,8,6,5', '2026-05-09 00:22:19'),
(58, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,7,2,3,,4,8,6,5', '2026-05-09 00:22:21'),
(59, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,,2,3,7,4,8,6,5', '2026-05-09 00:22:21'),
(60, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,,3,7,4,8,6,5', '2026-05-09 00:22:21'),
(61, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,4,3,7,,8,6,5', '2026-05-09 00:22:22'),
(62, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,4,3,,7,8,6,5', '2026-05-09 00:22:22'),
(63, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,4,,3,7,8,6,5', '2026-05-09 00:22:23'),
(64, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, ',2,4,1,3,7,8,6,5', '2026-05-09 00:22:23'),
(65, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '2,,4,1,3,7,8,6,5', '2026-05-09 00:22:24'),
(66, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '2,3,4,1,,7,8,6,5', '2026-05-09 00:22:24'),
(67, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '2,3,4,1,7,,8,6,5', '2026-05-09 00:22:24'),
(68, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '2,3,,1,7,4,8,6,5', '2026-05-09 00:22:25'),
(69, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '2,,3,1,7,4,8,6,5', '2026-05-09 00:22:25'),
(70, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, ',2,3,1,7,4,8,6,5', '2026-05-09 00:22:26'),
(71, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,,7,4,8,6,5', '2026-05-09 00:22:26'),
(72, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,7,,4,8,6,5', '2026-05-09 00:22:26'),
(73, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,7,4,,8,6,5', '2026-05-09 00:22:27'),
(74, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,7,4,5,8,6,', '2026-05-09 00:22:27'),
(75, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,7,4,5,8,,6', '2026-05-09 00:22:27'),
(76, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,7,4,5,,8,6', '2026-05-09 00:22:28'),
(77, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,,4,5,7,8,6', '2026-05-09 00:22:28'),
(78, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,4,,5,7,8,6', '2026-05-09 00:22:29'),
(79, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,4,5,,7,8,6', '2026-05-09 00:22:29'),
(80, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 2, '1,2,3,4,5,6,7,8,', '2026-05-09 00:22:30'),
(81, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '4,8,6,5,1,2,3,,7', '2026-05-09 00:23:31'),
(82, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '4,8,6,5,1,2,,3,7', '2026-05-09 00:23:32'),
(83, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '4,8,6,,1,2,5,3,7', '2026-05-09 00:23:32'),
(84, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, ',8,6,4,1,2,5,3,7', '2026-05-09 00:23:33'),
(85, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '8,,6,4,1,2,5,3,7', '2026-05-09 00:23:33'),
(86, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '8,1,6,4,,2,5,3,7', '2026-05-09 00:23:34'),
(87, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '8,1,6,,4,2,5,3,7', '2026-05-09 00:23:36'),
(88, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, ',1,6,8,4,2,5,3,7', '2026-05-09 00:23:36'),
(89, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,,6,8,4,2,5,3,7', '2026-05-09 00:23:36'),
(90, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,,8,4,2,5,3,7', '2026-05-09 00:23:37'),
(91, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,4,,5,3,7', '2026-05-09 00:23:38'),
(92, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,,4,5,3,7', '2026-05-09 00:23:39'),
(93, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,3,4,5,,7', '2026-05-09 00:23:39'),
(94, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,3,4,,5,7', '2026-05-09 00:23:40'),
(95, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,3,4,5,,7', '2026-05-09 00:23:41'),
(96, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,3,4,5,7,', '2026-05-09 00:23:42'),
(97, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,3,,5,7,4', '2026-05-09 00:23:43'),
(98, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,6,2,8,,3,5,7,4', '2026-05-09 00:23:43'),
(99, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,,2,8,6,3,5,7,4', '2026-05-09 00:23:43'),
(100, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,,8,6,3,5,7,4', '2026-05-09 00:23:43'),
(101, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,6,,5,7,4', '2026-05-09 00:23:44'),
(102, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,6,4,5,7,', '2026-05-09 00:23:45'),
(103, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,6,4,5,,7', '2026-05-09 00:23:45'),
(104, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,,4,5,6,7', '2026-05-09 00:23:47'),
(105, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,4,,5,6,7', '2026-05-09 00:23:47'),
(106, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,4,7,5,6,', '2026-05-09 00:23:47'),
(107, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,4,7,5,,6', '2026-05-09 00:23:48'),
(108, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,8,4,7,,5,6', '2026-05-09 00:23:48'),
(109, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,,4,7,8,5,6', '2026-05-09 00:23:48'),
(110, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,,7,8,5,6', '2026-05-09 00:23:49'),
(111, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,7,,8,5,6', '2026-05-09 00:23:49'),
(112, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,7,6,8,5,', '2026-05-09 00:23:49'),
(113, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,7,,8,5,6', '2026-05-09 00:23:51'),
(114, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,,7,8,5,6', '2026-05-09 00:23:51'),
(115, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,5,7,8,,6', '2026-05-09 00:23:51'),
(116, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,5,7,,8,6', '2026-05-09 00:23:52'),
(117, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,,5,7,4,8,6', '2026-05-09 00:23:52'),
(118, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,5,,7,4,8,6', '2026-05-09 00:23:52'),
(119, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,5,7,,4,8,6', '2026-05-09 00:23:52'),
(120, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,5,7,6,4,8,', '2026-05-09 00:23:53'),
(121, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,5,7,6,4,,8', '2026-05-09 00:23:53'),
(122, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,5,,6,4,7,8', '2026-05-09 00:23:54'),
(123, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,,5,6,4,7,8', '2026-05-09 00:23:54'),
(124, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,5,6,,7,8', '2026-05-09 00:23:54'),
(125, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,5,6,7,,8', '2026-05-09 00:23:55'),
(126, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 3, '1,2,3,4,5,6,7,8,', '2026-05-09 00:23:55'),
(127, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '8,7,2,3,4,,5,6,1', '2026-05-09 00:41:33'),
(128, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '8,7,2,3,4,1,5,6,', '2026-05-09 00:41:33'),
(129, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '8,7,2,3,4,1,5,,6', '2026-05-09 00:41:35'),
(130, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '8,7,2,3,,1,5,4,6', '2026-05-09 00:41:35'),
(131, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '8,7,2,,3,1,5,4,6', '2026-05-09 00:41:38'),
(132, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, ',7,2,8,3,1,5,4,6', '2026-05-09 00:41:38'),
(133, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '7,,2,8,3,1,5,4,6', '2026-05-09 00:41:39'),
(134, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '7,2,,8,3,1,5,4,6', '2026-05-09 00:41:39'),
(135, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '7,2,1,8,3,,5,4,6', '2026-05-09 00:41:41'),
(136, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '7,2,1,8,,3,5,4,6', '2026-05-09 00:41:42'),
(137, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '7,2,1,,8,3,5,4,6', '2026-05-09 00:41:43'),
(138, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, ',2,1,7,8,3,5,4,6', '2026-05-09 00:41:44'),
(139, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '2,,1,7,8,3,5,4,6', '2026-05-09 00:41:44'),
(140, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '2,1,,7,8,3,5,4,6', '2026-05-09 00:41:45'),
(141, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '2,1,3,7,8,,5,4,6', '2026-05-09 00:41:47'),
(142, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '2,1,3,7,,8,5,4,6', '2026-05-09 00:41:48'),
(143, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '2,1,3,,7,8,5,4,6', '2026-05-09 00:41:49'),
(144, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, ',1,3,2,7,8,5,4,6', '2026-05-09 00:41:49'),
(145, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,,3,2,7,8,5,4,6', '2026-05-09 00:41:50'),
(146, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,,2,7,8,5,4,6', '2026-05-09 00:41:55'),
(147, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,2,7,,5,4,6', '2026-05-09 00:41:56'),
(148, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,2,,7,5,4,6', '2026-05-09 00:41:59'),
(149, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,,2,7,5,4,6', '2026-05-09 00:42:00'),
(150, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,5,2,7,,4,6', '2026-05-09 00:42:01'),
(151, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,5,2,7,4,,6', '2026-05-09 00:42:02'),
(152, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,5,2,7,4,6,', '2026-05-09 00:42:02'),
(153, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,8,5,2,,4,6,7', '2026-05-09 00:42:03'),
(154, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,3,,5,2,8,4,6,7', '2026-05-09 00:42:03'),
(155, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,,3,5,2,8,4,6,7', '2026-05-09 00:42:05'),
(156, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,8,4,6,7', '2026-05-09 00:42:05'),
(157, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,5,8,4,6,7', '2026-05-09 00:42:09'),
(158, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,,6,7', '2026-05-09 00:42:09'),
(159, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,6,,7', '2026-05-09 00:42:09'),
(160, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,6,7,', '2026-05-09 00:42:10'),
(161, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,,6,7,8', '2026-05-09 00:42:10'),
(162, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,6,7,', '2026-05-09 00:42:12'),
(163, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,6,,7', '2026-05-09 00:42:13'),
(164, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,8,,6,7', '2026-05-09 00:42:14'),
(165, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,5,8,4,6,7', '2026-05-09 00:42:14'),
(166, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,8,4,6,7', '2026-05-09 00:42:15'),
(167, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,,4,6,7', '2026-05-09 00:42:16'),
(168, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,7,4,6,', '2026-05-09 00:42:16'),
(169, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,7,4,,6', '2026-05-09 00:42:17'),
(170, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,7,4,8,6', '2026-05-09 00:42:17'),
(171, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,5,7,4,8,6', '2026-05-09 00:42:19'),
(172, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,7,,8,6', '2026-05-09 00:42:20'),
(173, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,7,8,,6', '2026-05-09 00:42:20'),
(174, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,7,8,6,', '2026-05-09 00:42:21'),
(175, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,,8,6,7', '2026-05-09 00:42:22'),
(176, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,,5,8,6,7', '2026-05-09 00:42:22'),
(177, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,4,5,8,6,7', '2026-05-09 00:42:23'),
(178, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,4,5,,6,7', '2026-05-09 00:42:24'),
(179, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,4,5,6,,7', '2026-05-09 00:42:25'),
(180, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,4,5,6,7,', '2026-05-09 00:42:28'),
(181, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,4,,6,7,5', '2026-05-09 00:42:28'),
(182, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,,4,6,7,5', '2026-05-09 00:42:28'),
(183, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,8,4,6,7,5', '2026-05-09 00:42:28'),
(184, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,8,4,,7,5', '2026-05-09 00:42:29'),
(185, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,8,4,7,,5', '2026-05-09 00:42:30'),
(186, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,8,4,7,5,', '2026-05-09 00:42:31'),
(187, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,8,,7,5,4', '2026-05-09 00:42:32'),
(188, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,,8,7,5,4', '2026-05-09 00:42:32'),
(189, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,5,8,7,,4', '2026-05-09 00:42:35'),
(190, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,5,8,,7,4', '2026-05-09 00:42:36'),
(191, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,5,8,6,7,4', '2026-05-09 00:42:36'),
(192, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,8,6,7,4', '2026-05-09 00:42:37'),
(193, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,,6,7,4', '2026-05-09 00:42:38'),
(194, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,4,6,7,', '2026-05-09 00:42:38'),
(195, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,8,4,6,,7', '2026-05-09 00:42:39'),
(196, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,4,6,8,7', '2026-05-09 00:42:40'),
(197, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,4,,6,8,7', '2026-05-09 00:42:40'),
(198, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,4,7,6,8,', '2026-05-09 00:42:41'),
(199, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,4,7,6,,8', '2026-05-09 00:42:42'),
(200, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,5,,7,6,4,8', '2026-05-09 00:42:43'),
(201, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,5,7,6,4,8', '2026-05-09 00:42:43'),
(202, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,5,7,,4,8', '2026-05-09 00:42:44'),
(203, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,5,7,4,,8', '2026-05-09 00:42:44'),
(204, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,,7,4,5,8', '2026-05-09 00:42:45'),
(205, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,6,7,4,5,8', '2026-05-09 00:42:45'),
(206, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,,5,8', '2026-05-09 00:42:46'),
(207, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,6,7,4,5,8', '2026-05-09 00:42:49'),
(208, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,,7,4,5,8', '2026-05-09 00:42:49'),
(209, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,5,7,4,,8', '2026-05-09 00:42:50'),
(210, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,6,,7,4,5,8', '2026-05-09 00:42:57'),
(211, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,6,7,4,5,8', '2026-05-09 00:42:57'),
(212, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,,5,8', '2026-05-09 00:42:57'),
(213, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,5,,8', '2026-05-09 00:42:58'),
(214, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,,5,8', '2026-05-09 00:43:02'),
(215, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,5,,8', '2026-05-09 00:43:02'),
(216, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,7,5,8,', '2026-05-09 00:43:02'),
(217, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,6,,5,8,7', '2026-05-09 00:43:02'),
(218, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,,6,5,8,7', '2026-05-09 00:43:02'),
(219, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,8,6,5,,7', '2026-05-09 00:43:03'),
(220, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,8,6,,5,7', '2026-05-09 00:43:04'),
(221, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,8,6,4,5,7', '2026-05-09 00:43:04'),
(222, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,,6,4,5,7', '2026-05-09 00:43:04'),
(223, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,5,6,4,,7', '2026-05-09 00:43:05'),
(224, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,5,6,4,7,', '2026-05-09 00:43:05'),
(225, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,5,,4,7,6', '2026-05-09 00:43:05'),
(226, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,8,,5,4,7,6', '2026-05-09 00:43:05'),
(227, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,,8,5,4,7,6', '2026-05-09 00:43:06'),
(228, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,8,5,,7,6', '2026-05-09 00:43:06'),
(229, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,8,5,7,,6', '2026-05-09 00:43:06'),
(230, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,,5,7,8,6', '2026-05-09 00:43:06'),
(231, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,,7,8,6', '2026-05-09 00:43:07'),
(232, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 10153, 4, '1,2,3,4,5,6,7,8,', '2026-05-09 00:43:07'),
(233, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,4,8,3,,7,6,5', '2026-05-09 00:44:57'),
(234, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,4,8,,3,7,6,5', '2026-05-09 00:44:57'),
(235, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,4,,8,3,7,6,5', '2026-05-09 00:44:58'),
(236, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, ',2,4,1,8,3,7,6,5', '2026-05-09 00:44:58'),
(237, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '2,,4,1,8,3,7,6,5', '2026-05-09 00:44:59'),
(238, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '2,4,,1,8,3,7,6,5', '2026-05-09 00:44:59'),
(239, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '2,4,3,1,8,,7,6,5', '2026-05-09 00:45:00'),
(240, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '2,4,3,1,,8,7,6,5', '2026-05-09 00:45:00'),
(241, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '2,,3,1,4,8,7,6,5', '2026-05-09 00:45:01'),
(242, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, ',2,3,1,4,8,7,6,5', '2026-05-09 00:45:01'),
(243, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,,4,8,7,6,5', '2026-05-09 00:45:02'),
(244, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,,8,7,6,5', '2026-05-09 00:45:02'),
(245, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,8,,7,6,5', '2026-05-09 00:45:02'),
(246, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,8,5,7,6,', '2026-05-09 00:45:03'),
(247, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,8,5,7,,6', '2026-05-09 00:45:03'),
(248, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,,5,7,8,6', '2026-05-09 00:45:03'),
(249, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,5,,7,8,6', '2026-05-09 00:45:04'),
(250, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 5, '1,2,3,4,5,6,7,8,', '2026-05-09 00:45:04'),
(251, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '2,,1,4,8,3,6,7,5', '2026-05-10 01:27:05'),
(252, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '2,1,,4,8,3,6,7,5', '2026-05-10 01:27:05'),
(253, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '2,1,3,4,8,,6,7,5', '2026-05-10 01:27:06'),
(254, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '2,1,3,4,,8,6,7,5', '2026-05-10 01:27:06'),
(255, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '2,1,3,,4,8,6,7,5', '2026-05-10 01:27:07'),
(256, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, ',1,3,2,4,8,6,7,5', '2026-05-10 01:27:07'),
(257, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,,3,2,4,8,6,7,5', '2026-05-10 01:27:07'),
(258, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,4,3,2,,8,6,7,5', '2026-05-10 01:27:07'),
(259, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,4,3,,2,8,6,7,5', '2026-05-10 01:27:08'),
(260, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, ',4,3,1,2,8,6,7,5', '2026-05-10 01:27:09'),
(261, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '4,,3,1,2,8,6,7,5', '2026-05-10 01:27:09'),
(262, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '4,2,3,1,,8,6,7,5', '2026-05-10 01:27:10'),
(263, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '4,2,3,1,8,,6,7,5', '2026-05-10 01:27:10'),
(264, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '4,2,,1,8,3,6,7,5', '2026-05-10 01:27:10'),
(265, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '4,,2,1,8,3,6,7,5', '2026-05-10 01:27:11'),
(266, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, ',4,2,1,8,3,6,7,5', '2026-05-10 01:27:11'),
(267, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,4,2,,8,3,6,7,5', '2026-05-10 01:27:11'),
(268, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,4,2,8,,3,6,7,5', '2026-05-10 01:27:12'),
(269, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,,2,8,4,3,6,7,5', '2026-05-10 01:27:12'),
(270, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,,8,4,3,6,7,5', '2026-05-10 01:27:12'),
(271, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,8,4,,6,7,5', '2026-05-10 01:27:13'),
(272, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,8,4,5,6,7,', '2026-05-10 01:27:13'),
(273, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,8,4,5,6,,7', '2026-05-10 01:27:14'),
(274, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,8,4,5,,6,7', '2026-05-10 01:27:14'),
(275, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,,4,5,8,6,7', '2026-05-10 01:27:14'),
(276, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,,5,8,6,7', '2026-05-10 01:27:15'),
(277, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,,8,6,7', '2026-05-10 01:27:15'),
(278, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,7,8,6,', '2026-05-10 01:27:15'),
(279, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,7,8,,6', '2026-05-10 01:27:18'),
(280, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,7,,8,6', '2026-05-10 01:27:19'),
(281, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,,5,7,4,8,6', '2026-05-10 01:27:19'),
(282, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,5,,7,4,8,6', '2026-05-10 01:27:19'),
(283, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,5,7,,4,8,6', '2026-05-10 01:27:20'),
(284, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,5,7,6,4,8,', '2026-05-10 01:27:20'),
(285, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,5,7,6,4,,8', '2026-05-10 01:27:20'),
(286, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,5,,6,4,7,8', '2026-05-10 01:27:20'),
(287, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,,5,6,4,7,8', '2026-05-10 01:27:21'),
(288, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,6,,7,8', '2026-05-10 01:27:21'),
(289, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,6,7,,8', '2026-05-10 01:27:22'),
(290, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 7, '1,2,3,4,5,6,7,8,', '2026-05-10 01:27:22'),
(291, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,,3,1,2,5,4,7,8', '2026-05-10 01:28:00'),
(292, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, ',6,3,1,2,5,4,7,8', '2026-05-10 01:28:01'),
(293, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,3,,2,5,4,7,8', '2026-05-10 01:28:01'),
(294, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,3,2,,5,4,7,8', '2026-05-10 01:28:02'),
(295, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,,3,2,6,5,4,7,8', '2026-05-10 01:28:02'),
(296, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,3,2,,5,4,7,8', '2026-05-10 01:28:03'),
(297, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,3,,2,5,4,7,8', '2026-05-10 01:28:03'),
(298, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, ',6,3,1,2,5,4,7,8', '2026-05-10 01:28:04'),
(299, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,,3,1,2,5,4,7,8', '2026-05-10 01:28:04'),
(300, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,2,3,1,,5,4,7,8', '2026-05-10 01:28:05'),
(301, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,2,3,1,5,,4,7,8', '2026-05-10 01:28:05'),
(302, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,2,,1,5,3,4,7,8', '2026-05-10 01:28:05'),
(303, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '6,,2,1,5,3,4,7,8', '2026-05-10 01:28:06'),
(304, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, ',6,2,1,5,3,4,7,8', '2026-05-10 01:28:06'),
(305, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,2,,5,3,4,7,8', '2026-05-10 01:28:07'),
(306, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,6,2,5,,3,4,7,8', '2026-05-10 01:28:07'),
(307, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,,2,5,6,3,4,7,8', '2026-05-10 01:28:07'),
(308, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,,5,6,3,4,7,8', '2026-05-10 01:28:08'),
(309, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,5,6,,4,7,8', '2026-05-10 01:28:08'),
(310, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,5,,6,4,7,8', '2026-05-10 01:28:09'),
(311, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,,5,6,4,7,8', '2026-05-10 01:28:09'),
(312, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,4,5,6,,7,8', '2026-05-10 01:28:09'),
(313, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,4,5,6,7,,8', '2026-05-10 01:28:10'),
(314, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 8, '1,2,3,4,5,6,7,8,', '2026-05-10 01:28:10'),
(315, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,8,7,,6,2,5,4,3', '2026-05-10 01:30:07'),
(316, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,8,7,6,,2,5,4,3', '2026-05-10 01:30:07'),
(317, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,,7,6,8,2,5,4,3', '2026-05-10 01:30:07'),
(318, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,7,,6,8,2,5,4,3', '2026-05-10 01:30:08'),
(319, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,7,2,6,8,,5,4,3', '2026-05-10 01:30:08'),
(320, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,7,2,6,,8,5,4,3', '2026-05-10 01:30:08'),
(321, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,,2,6,7,8,5,4,3', '2026-05-10 01:30:08'),
(322, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,,6,7,8,5,4,3', '2026-05-10 01:30:09'),
(323, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,8,6,7,,5,4,3', '2026-05-10 01:30:09'),
(324, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,8,6,7,3,5,4,', '2026-05-10 01:30:10'),
(325, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,8,6,7,3,5,,4', '2026-05-10 01:30:10'),
(326, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,8,6,,3,5,7,4', '2026-05-10 01:30:11'),
(327, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,8,,6,3,5,7,4', '2026-05-10 01:30:11'),
(328, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, ',2,8,1,6,3,5,7,4', '2026-05-10 01:30:12'),
(329, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '2,,8,1,6,3,5,7,4', '2026-05-10 01:30:12'),
(330, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '2,8,,1,6,3,5,7,4', '2026-05-10 01:30:12'),
(331, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '2,8,3,1,6,,5,7,4', '2026-05-10 01:30:13'),
(332, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '2,8,3,1,,6,5,7,4', '2026-05-10 01:30:13'),
(333, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '2,,3,1,8,6,5,7,4', '2026-05-10 01:30:13'),
(334, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, ',2,3,1,8,6,5,7,4', '2026-05-10 01:30:14'),
(335, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,,8,6,5,7,4', '2026-05-10 01:30:14'),
(336, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,,6,5,7,4', '2026-05-10 01:30:15'),
(337, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,6,,5,7,4', '2026-05-10 01:30:16'),
(338, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,6,4,5,7,', '2026-05-10 01:30:16'),
(339, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,6,4,5,,7', '2026-05-10 01:30:17'),
(340, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,,4,5,6,7', '2026-05-10 01:30:17'),
(341, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,4,,5,6,7', '2026-05-10 01:30:17'),
(342, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,4,7,5,6,', '2026-05-10 01:30:18'),
(343, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,4,7,5,,6', '2026-05-10 01:30:18'),
(344, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,8,4,7,,5,6', '2026-05-10 01:30:18'),
(345, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,,4,7,8,5,6', '2026-05-10 01:30:18'),
(346, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,,7,8,5,6', '2026-05-10 01:30:19'),
(347, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,5,7,8,,6', '2026-05-10 01:30:19'),
(348, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,5,7,,8,6', '2026-05-10 01:30:20'),
(349, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,,5,7,4,8,6', '2026-05-10 01:30:20'),
(350, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,5,,7,4,8,6', '2026-05-10 01:30:21'),
(351, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,5,7,,4,8,6', '2026-05-10 01:30:21'),
(352, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,5,7,6,4,8,', '2026-05-10 01:30:22'),
(353, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,5,7,6,4,,8', '2026-05-10 01:30:22'),
(354, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,5,,6,4,7,8', '2026-05-10 01:30:22'),
(355, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,,5,6,4,7,8', '2026-05-10 01:30:23'),
(356, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,5,6,,7,8', '2026-05-10 01:30:23'),
(357, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,5,6,7,,8', '2026-05-10 01:30:23'),
(358, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 9, '1,2,3,4,5,6,7,8,', '2026-05-10 01:30:24'),
(359, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '2,6,7,3,1,,4,5,8', '2026-05-10 20:11:35'),
(360, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '2,6,,3,1,7,4,5,8', '2026-05-10 20:11:35'),
(361, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '2,,6,3,1,7,4,5,8', '2026-05-10 20:11:36'),
(362, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '2,1,6,3,,7,4,5,8', '2026-05-10 20:11:36'),
(363, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '2,1,6,,3,7,4,5,8', '2026-05-10 20:11:37'),
(364, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, ',1,6,2,3,7,4,5,8', '2026-05-10 20:11:37'),
(365, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,,6,2,3,7,4,5,8', '2026-05-10 20:11:37'),
(366, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,3,6,2,,7,4,5,8', '2026-05-10 20:11:38'),
(367, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,3,6,2,7,,4,5,8', '2026-05-10 20:11:38'),
(368, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,3,,2,7,6,4,5,8', '2026-05-10 20:11:39'),
(369, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,,3,2,7,6,4,5,8', '2026-05-10 20:11:39'),
(370, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,7,3,2,,6,4,5,8', '2026-05-10 20:11:39'),
(371, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,7,3,,2,6,4,5,8', '2026-05-10 20:11:40'),
(372, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, ',7,3,1,2,6,4,5,8', '2026-05-10 20:11:40'),
(373, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '7,,3,1,2,6,4,5,8', '2026-05-10 20:11:40'),
(374, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '7,2,3,1,,6,4,5,8', '2026-05-10 20:11:41'),
(375, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '7,2,3,1,6,,4,5,8', '2026-05-10 20:11:41'),
(376, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '7,2,,1,6,3,4,5,8', '2026-05-10 20:11:41'),
(377, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '7,,2,1,6,3,4,5,8', '2026-05-10 20:11:42'),
(378, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, ',7,2,1,6,3,4,5,8', '2026-05-10 20:11:42'),
(379, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,7,2,,6,3,4,5,8', '2026-05-10 20:11:42'),
(380, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,7,2,6,,3,4,5,8', '2026-05-10 20:11:43'),
(381, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,,2,6,7,3,4,5,8', '2026-05-10 20:11:43'),
(382, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,,6,7,3,4,5,8', '2026-05-10 20:11:43'),
(383, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,6,7,,4,5,8', '2026-05-10 20:11:43'),
(384, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,6,,7,4,5,8', '2026-05-10 20:11:44'),
(385, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,,6,7,4,5,8', '2026-05-10 20:11:44'),
(386, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,6,7,,5,8', '2026-05-10 20:11:44'),
(387, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,6,7,5,,8', '2026-05-10 20:11:45'),
(388, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,6,7,5,8,', '2026-05-10 20:11:47'),
(389, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,6,,5,8,7', '2026-05-10 20:11:48'),
(390, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,,6,5,8,7', '2026-05-10 20:11:48'),
(391, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,8,6,5,,7', '2026-05-10 20:11:48'),
(392, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,8,6,,5,7', '2026-05-10 20:11:48'),
(393, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,,8,6,4,5,7', '2026-05-10 20:11:49'),
(394, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,8,,6,4,5,7', '2026-05-10 20:11:49'),
(395, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,8,5,6,4,,7', '2026-05-10 20:11:49'),
(396, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,8,5,6,4,7,', '2026-05-10 20:11:50'),
(397, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,8,5,,4,7,6', '2026-05-10 20:11:50'),
(398, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,8,,5,4,7,6', '2026-05-10 20:11:50'),
(399, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,,8,5,4,7,6', '2026-05-10 20:11:51'),
(400, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,8,5,,7,6', '2026-05-10 20:11:51'),
(401, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,8,5,7,,6', '2026-05-10 20:11:51'),
(402, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,,5,7,8,6', '2026-05-10 20:11:51'),
(403, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,5,,7,8,6', '2026-05-10 20:11:52'),
(404, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 10, '1,2,3,4,5,6,7,8,', '2026-05-10 20:11:52'),
(405, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,,8,6,5,2,3,4,1', '2026-05-10 20:25:54'),
(406, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,,6,5,2,3,4,1', '2026-05-10 20:25:55'),
(407, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,2,6,5,,3,4,1', '2026-05-10 20:25:55'),
(408, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,2,6,5,1,3,4,', '2026-05-10 20:25:56'),
(409, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,2,6,5,1,3,,4', '2026-05-10 20:25:56'),
(410, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,2,6,,1,3,5,4', '2026-05-10 20:25:57'),
(411, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,2,6,1,,3,5,4', '2026-05-10 20:25:57'),
(412, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,8,,6,1,2,3,5,4', '2026-05-10 20:25:58'),
(413, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,,8,6,1,2,3,5,4', '2026-05-10 20:25:58'),
(414, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,1,8,6,,2,3,5,4', '2026-05-10 20:25:58'),
(415, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '7,1,8,,6,2,3,5,4', '2026-05-10 20:25:59'),
(416, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, ',1,8,7,6,2,3,5,4', '2026-05-10 20:25:59'),
(417, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,,8,7,6,2,3,5,4', '2026-05-10 20:25:59'),
(418, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,8,,7,6,2,3,5,4', '2026-05-10 20:26:01'),
(419, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,8,2,7,6,,3,5,4', '2026-05-10 20:26:01'),
(420, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,8,2,7,,6,3,5,4', '2026-05-10 20:26:01'),
(421, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,,2,7,8,6,3,5,4', '2026-05-10 20:26:02'),
(422, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,,7,8,6,3,5,4', '2026-05-10 20:26:02'),
(423, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,7,8,,3,5,4', '2026-05-10 20:26:02'),
(424, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,7,,8,3,5,4', '2026-05-10 20:26:03'),
(425, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,,7,8,3,5,4', '2026-05-10 20:26:03'),
(426, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,3,7,8,,5,4', '2026-05-10 20:26:03'),
(427, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,3,7,8,5,,4', '2026-05-10 20:26:04'),
(428, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,3,,8,5,7,4', '2026-05-10 20:26:04'),
(429, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,6,,3,8,5,7,4', '2026-05-10 20:26:05'),
(430, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, ',2,6,1,3,8,5,7,4', '2026-05-10 20:26:05'),
(431, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '2,,6,1,3,8,5,7,4', '2026-05-10 20:26:05'),
(432, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '2,3,6,1,,8,5,7,4', '2026-05-10 20:26:06'),
(433, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '2,3,6,1,8,,5,7,4', '2026-05-10 20:26:06'),
(434, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '2,3,,1,8,6,5,7,4', '2026-05-10 20:26:06'),
(435, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '2,,3,1,8,6,5,7,4', '2026-05-10 20:26:07'),
(436, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, ',2,3,1,8,6,5,7,4', '2026-05-10 20:26:07'),
(437, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,,8,6,5,7,4', '2026-05-10 20:26:07'),
(438, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,,6,5,7,4', '2026-05-10 20:26:08'),
(439, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,6,,5,7,4', '2026-05-10 20:26:08'),
(440, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,6,4,5,7,', '2026-05-10 20:26:08'),
(441, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,6,4,5,,7', '2026-05-10 20:26:09'),
(442, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,,4,5,6,7', '2026-05-10 20:26:09'),
(443, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,4,,5,6,7', '2026-05-10 20:26:09'),
(444, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,4,7,5,6,', '2026-05-10 20:26:10'),
(445, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,4,7,5,,6', '2026-05-10 20:26:10'),
(446, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,8,4,7,,5,6', '2026-05-10 20:26:11'),
(447, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,,4,7,8,5,6', '2026-05-10 20:26:11'),
(448, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,,7,8,5,6', '2026-05-10 20:26:11'),
(449, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,5,7,8,,6', '2026-05-10 20:26:12'),
(450, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,5,7,,8,6', '2026-05-10 20:26:12'),
(451, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,,5,7,4,8,6', '2026-05-10 20:26:13'),
(452, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,5,,7,4,8,6', '2026-05-10 20:26:13'),
(453, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,5,7,,4,8,6', '2026-05-10 20:26:13'),
(454, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,5,7,6,4,8,', '2026-05-10 20:26:14'),
(455, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,5,7,6,4,,8', '2026-05-10 20:26:14'),
(456, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,5,,6,4,7,8', '2026-05-10 20:26:15'),
(457, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,,5,6,4,7,8', '2026-05-10 20:26:15'),
(458, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,5,6,,7,8', '2026-05-10 20:26:15'),
(459, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,5,6,7,,8', '2026-05-10 20:26:16'),
(460, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 11, '1,2,3,4,5,6,7,8,', '2026-05-10 20:26:16'),
(461, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '6,4,3,5,1,8,2,,7', '2026-05-10 17:58:14'),
(462, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '6,4,3,5,1,8,,2,7', '2026-05-10 17:58:14'),
(463, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '6,4,3,,1,8,5,2,7', '2026-05-10 17:58:15'),
(464, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, ',4,3,6,1,8,5,2,7', '2026-05-10 17:58:15'),
(465, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '4,,3,6,1,8,5,2,7', '2026-05-10 17:58:16'),
(466, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '4,1,3,6,,8,5,2,7', '2026-05-10 17:58:16'),
(467, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '4,1,3,6,2,8,5,,7', '2026-05-10 17:58:16'),
(468, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '4,1,3,6,2,8,,5,7', '2026-05-10 17:58:17'),
(469, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '4,1,3,,2,8,6,5,7', '2026-05-10 17:58:17'),
(470, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, ',1,3,4,2,8,6,5,7', '2026-05-10 17:58:18'),
(471, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,,3,4,2,8,6,5,7', '2026-05-10 17:58:18'),
(472, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,,8,6,5,7', '2026-05-10 17:58:18'),
(473, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,5,8,6,,7', '2026-05-10 17:58:19'),
(474, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,5,8,,6,7', '2026-05-10 17:58:19'),
(475, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,,5,8,4,6,7', '2026-05-10 17:58:20'),
(476, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,,8,4,6,7', '2026-05-10 17:58:20'),
(477, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,8,4,,7', '2026-05-10 17:58:21'),
(478, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,8,,4,7', '2026-05-10 17:58:21'),
(479, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,,6,8,5,4,7', '2026-05-10 17:58:21'),
(480, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,8,,4,7', '2026-05-10 17:58:22'),
(481, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,8,4,,7', '2026-05-10 17:58:22'),
(482, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,8,4,7,', '2026-05-10 17:58:23'),
(483, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,6,,4,7,8', '2026-05-10 17:58:23'),
(484, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,5,,6,4,7,8', '2026-05-10 17:58:23'),
(485, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,,5,6,4,7,8', '2026-05-10 17:58:24'),
(486, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,5,6,,7,8', '2026-05-10 17:58:24'),
(487, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,5,6,7,,8', '2026-05-10 17:58:25'),
(488, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 12, '1,2,3,4,5,6,7,8,', '2026-05-10 17:58:25'),
(489, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '8,1,2,,5,6,3,7,4', '2026-05-10 18:03:11'),
(490, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, ',1,2,8,5,6,3,7,4', '2026-05-10 18:03:11'),
(491, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,,2,8,5,6,3,7,4', '2026-05-10 18:03:12'),
(492, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,,8,5,6,3,7,4', '2026-05-10 18:03:12'),
(493, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,8,5,,3,7,4', '2026-05-10 18:03:13'),
(494, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,8,,5,3,7,4', '2026-05-10 18:03:14'),
(495, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,,8,5,3,7,4', '2026-05-10 18:03:14'),
(496, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,3,8,5,,7,4', '2026-05-10 18:03:14'),
(497, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,3,8,5,7,,4', '2026-05-10 18:03:15'),
(498, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,3,,5,7,8,4', '2026-05-10 18:03:15'),
(499, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,6,,3,5,7,8,4', '2026-05-10 18:03:16'),
(500, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, ',2,6,1,3,5,7,8,4', '2026-05-10 18:03:16'),
(501, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,,6,1,3,5,7,8,4', '2026-05-10 18:03:17'),
(502, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,,5,7,8,4', '2026-05-10 18:03:17'),
(503, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,5,,7,8,4', '2026-05-10 18:03:17'),
(504, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,5,4,7,8,', '2026-05-10 18:03:18'),
(505, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,5,4,7,,8', '2026-05-10 18:03:19'),
(506, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,,4,7,5,8', '2026-05-10 18:03:19'),
(507, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,4,,7,5,8', '2026-05-10 18:03:20'),
(508, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,4,8,7,5,', '2026-05-10 18:03:20'),
(509, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,4,8,7,,5', '2026-05-10 18:03:21'),
(510, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,4,8,7,5,', '2026-05-10 18:03:22'),
(511, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,6,1,4,,7,5,8', '2026-05-10 18:03:23'),
(512, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,3,,1,4,6,7,5,8', '2026-05-10 18:03:23'),
(513, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '2,,3,1,4,6,7,5,8', '2026-05-10 18:03:24'),
(514, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, ',2,3,1,4,6,7,5,8', '2026-05-10 18:03:24'),
(515, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,3,,4,6,7,5,8', '2026-05-10 18:03:25'),
(516, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,3,4,,6,7,5,8', '2026-05-10 18:03:25'),
(517, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,3,4,5,6,7,,8', '2026-05-10 18:03:26'),
(518, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 13, '1,2,3,4,5,6,7,8,', '2026-05-10 18:03:27'),
(519, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,7,5,8,2,,3,6,1', '2026-05-10 18:03:43'),
(520, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,7,5,8,2,1,3,6,', '2026-05-10 18:03:44'),
(521, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,7,5,8,2,1,3,,6', '2026-05-10 18:03:45'),
(522, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,7,5,8,,1,3,2,6', '2026-05-10 18:03:46'),
(523, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,,5,8,7,1,3,2,6', '2026-05-10 18:03:47');
INSERT INTO `game_moves` (`id`, `browser_uuid`, `user_id`, `game_id`, `moves`, `created_at`) VALUES
(524, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,,8,7,1,3,2,6', '2026-05-10 18:03:48'),
(525, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,8,7,,3,2,6', '2026-05-10 18:03:48'),
(526, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,8,,7,3,2,6', '2026-05-10 18:03:48'),
(527, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,8,2,7,3,,6', '2026-05-10 18:03:49'),
(528, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,8,2,7,,3,6', '2026-05-10 18:03:50'),
(529, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,,2,7,8,3,6', '2026-05-10 18:03:50'),
(530, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,5,1,2,,7,8,3,6', '2026-05-10 18:03:53'),
(531, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,,1,2,5,7,8,3,6', '2026-05-10 18:03:54'),
(532, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,,2,5,7,8,3,6', '2026-05-10 18:03:54'),
(533, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,5,,8,3,6', '2026-05-10 18:03:55'),
(534, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,,5,8,3,6', '2026-05-10 18:03:55'),
(535, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,3,5,8,,6', '2026-05-10 18:03:56'),
(536, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,3,5,8,6,', '2026-05-10 18:03:57'),
(537, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,3,,8,6,5', '2026-05-10 18:03:57'),
(538, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,2,,3,8,6,5', '2026-05-10 18:03:58'),
(539, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '4,1,7,,2,3,8,6,5', '2026-05-10 18:03:58'),
(540, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, ',1,7,4,2,3,8,6,5', '2026-05-10 18:03:59'),
(541, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,,7,4,2,3,8,6,5', '2026-05-10 18:03:59'),
(542, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,7,4,,3,8,6,5', '2026-05-10 18:04:00'),
(543, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,7,4,3,,8,6,5', '2026-05-10 18:04:01'),
(544, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,7,4,,3,8,6,5', '2026-05-10 18:04:03'),
(545, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,7,,4,3,8,6,5', '2026-05-10 18:04:03'),
(546, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, ',2,7,1,4,3,8,6,5', '2026-05-10 18:04:04'),
(547, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '2,,7,1,4,3,8,6,5', '2026-05-10 18:04:04'),
(548, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '2,7,,1,4,3,8,6,5', '2026-05-10 18:04:05'),
(549, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '2,7,3,1,4,,8,6,5', '2026-05-10 18:04:05'),
(550, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '2,7,3,1,,4,8,6,5', '2026-05-10 18:04:06'),
(551, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '2,,3,1,7,4,8,6,5', '2026-05-10 18:04:06'),
(552, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, ',2,3,1,7,4,8,6,5', '2026-05-10 18:04:07'),
(553, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,,7,4,8,6,5', '2026-05-10 18:04:07'),
(554, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,7,,4,8,6,5', '2026-05-10 18:04:08'),
(555, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,7,4,,8,6,5', '2026-05-10 18:04:08'),
(556, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,7,4,5,8,6,', '2026-05-10 18:04:08'),
(557, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,7,4,5,8,,6', '2026-05-10 18:04:09'),
(558, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,7,4,5,,8,6', '2026-05-10 18:04:10'),
(559, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,,4,5,7,8,6', '2026-05-10 18:04:10'),
(560, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,4,,5,7,8,6', '2026-05-10 18:04:11'),
(561, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,4,5,,7,8,6', '2026-05-10 18:04:11'),
(562, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 14, '1,2,3,4,5,6,7,8,', '2026-05-10 18:04:12'),
(563, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,6,,7,4,3,1,2', '2026-05-10 18:48:27'),
(564, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,6,7,,4,3,1,2', '2026-05-10 18:48:28'),
(565, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,6,7,1,4,3,,2', '2026-05-10 18:48:30'),
(566, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,6,7,1,4,3,2,', '2026-05-10 18:48:32'),
(567, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,6,7,1,,3,2,4', '2026-05-10 18:48:32'),
(568, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,5,,7,1,6,3,2,4', '2026-05-10 18:48:33'),
(569, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,,5,7,1,6,3,2,4', '2026-05-10 18:48:34'),
(570, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,1,5,7,,6,3,2,4', '2026-05-10 18:48:35'),
(571, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,1,5,7,2,6,3,,4', '2026-05-10 18:48:35'),
(572, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,1,5,7,2,6,,3,4', '2026-05-10 18:48:36'),
(573, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '8,1,5,,2,6,7,3,4', '2026-05-10 18:48:37'),
(574, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, ',1,5,8,2,6,7,3,4', '2026-05-10 18:48:38'),
(575, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,,5,8,2,6,7,3,4', '2026-05-10 18:48:39'),
(576, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,8,,6,7,3,4', '2026-05-10 18:48:39'),
(577, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,8,3,6,7,,4', '2026-05-10 18:48:41'),
(578, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,8,3,6,7,4,', '2026-05-10 18:48:43'),
(579, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,8,3,6,7,,4', '2026-05-10 18:48:45'),
(580, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,8,3,6,,7,4', '2026-05-10 18:48:46'),
(581, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,5,,3,6,8,7,4', '2026-05-10 18:48:47'),
(582, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, ',2,5,1,3,6,8,7,4', '2026-05-10 18:48:47'),
(583, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '2,,5,1,3,6,8,7,4', '2026-05-10 18:48:48'),
(584, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '2,3,5,1,,6,8,7,4', '2026-05-10 18:48:49'),
(585, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '2,3,5,1,6,,8,7,4', '2026-05-10 18:48:50'),
(586, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '2,3,,1,6,5,8,7,4', '2026-05-10 18:48:51'),
(587, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '2,,3,1,6,5,8,7,4', '2026-05-10 18:48:52'),
(588, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, ',2,3,1,6,5,8,7,4', '2026-05-10 18:48:53'),
(589, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,,6,5,8,7,4', '2026-05-10 18:48:54'),
(590, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,,5,8,7,4', '2026-05-10 18:48:55'),
(591, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,5,,8,7,4', '2026-05-10 18:48:55'),
(592, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,5,4,8,7,', '2026-05-10 18:48:56'),
(593, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,5,4,8,,7', '2026-05-10 18:48:57'),
(594, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,,4,8,5,7', '2026-05-10 18:48:58'),
(595, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,4,,8,5,7', '2026-05-10 18:48:59'),
(596, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,4,7,8,5,', '2026-05-10 18:48:59'),
(597, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,4,7,8,,5', '2026-05-10 18:49:00'),
(598, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,6,4,7,,8,5', '2026-05-10 18:49:01'),
(599, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,,4,7,6,8,5', '2026-05-10 18:49:01'),
(600, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,,7,6,8,5', '2026-05-10 18:49:02'),
(601, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,7,,6,8,5', '2026-05-10 18:49:03'),
(602, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,7,5,6,8,', '2026-05-10 18:49:04'),
(603, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,7,5,6,,8', '2026-05-10 18:49:04'),
(604, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,,5,6,7,8', '2026-05-10 18:49:05'),
(605, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,,6,7,8', '2026-05-10 18:49:06'),
(606, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,8,6,7,', '2026-05-10 18:49:07'),
(607, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,8,6,,7', '2026-05-10 18:49:07'),
(608, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,8,,6,7', '2026-05-10 18:49:08'),
(609, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,,5,8,4,6,7', '2026-05-10 18:49:09'),
(610, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,5,,8,4,6,7', '2026-05-10 18:49:10'),
(611, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,5,6,8,4,,7', '2026-05-10 18:49:10'),
(612, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,5,6,8,4,7,', '2026-05-10 18:49:11'),
(613, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,5,6,,4,7,8', '2026-05-10 18:49:12'),
(614, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,5,,6,4,7,8', '2026-05-10 18:49:13'),
(615, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,,5,6,4,7,8', '2026-05-10 18:49:14'),
(616, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,6,,7,8', '2026-05-10 18:49:15'),
(617, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,6,7,,8', '2026-05-10 18:49:16'),
(618, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 15, '1,2,3,4,5,6,7,8,', '2026-05-10 18:49:16'),
(619, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,8,5,2,3,,6,7,1', '2026-05-10 18:52:12'),
(620, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,8,5,2,3,1,6,7,', '2026-05-10 18:52:12'),
(621, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,8,5,2,3,1,6,,7', '2026-05-10 18:52:13'),
(622, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,8,5,2,,1,6,3,7', '2026-05-10 18:52:13'),
(623, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,,5,2,8,1,6,3,7', '2026-05-10 18:52:13'),
(624, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,5,,2,8,1,6,3,7', '2026-05-10 18:52:14'),
(625, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,5,1,2,8,,6,3,7', '2026-05-10 18:52:14'),
(626, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,5,1,2,8,7,6,3,', '2026-05-10 18:52:15'),
(627, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,5,1,2,8,7,6,,3', '2026-05-10 18:52:15'),
(628, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,5,1,2,,7,6,8,3', '2026-05-10 18:52:16'),
(629, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,,1,2,5,7,6,8,3', '2026-05-10 18:52:16'),
(630, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,1,,2,5,7,6,8,3', '2026-05-10 18:52:16'),
(631, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,1,7,2,5,,6,8,3', '2026-05-10 18:52:17'),
(632, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,1,7,2,,5,6,8,3', '2026-05-10 18:52:17'),
(633, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '4,1,7,,2,5,6,8,3', '2026-05-10 18:52:17'),
(634, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, ',1,7,4,2,5,6,8,3', '2026-05-10 18:52:18'),
(635, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,,7,4,2,5,6,8,3', '2026-05-10 18:52:18'),
(636, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,,5,6,8,3', '2026-05-10 18:52:18'),
(637, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,8,5,6,,3', '2026-05-10 18:52:19'),
(638, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,8,5,6,3,', '2026-05-10 18:52:20'),
(639, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,8,,6,3,5', '2026-05-10 18:52:20'),
(640, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,,8,6,3,5', '2026-05-10 18:52:21'),
(641, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,3,8,6,,5', '2026-05-10 18:52:21'),
(642, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,4,3,8,,6,5', '2026-05-10 18:52:22'),
(643, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,7,,3,8,4,6,5', '2026-05-10 18:52:22'),
(644, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, ',2,7,1,3,8,4,6,5', '2026-05-10 18:52:23'),
(645, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '2,,7,1,3,8,4,6,5', '2026-05-10 18:52:23'),
(646, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '2,3,7,1,,8,4,6,5', '2026-05-10 18:52:24'),
(647, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '2,3,7,1,8,,4,6,5', '2026-05-10 18:52:24'),
(648, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '2,3,,1,8,7,4,6,5', '2026-05-10 18:52:25'),
(649, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '2,,3,1,8,7,4,6,5', '2026-05-10 18:52:25'),
(650, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, ',2,3,1,8,7,4,6,5', '2026-05-10 18:52:25'),
(651, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,,8,7,4,6,5', '2026-05-10 18:52:26'),
(652, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,8,7,,6,5', '2026-05-10 18:52:26'),
(653, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,8,7,6,,5', '2026-05-10 18:52:27'),
(654, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,,7,6,8,5', '2026-05-10 18:52:27'),
(655, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,7,,6,8,5', '2026-05-10 18:52:27'),
(656, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,7,5,6,8,', '2026-05-10 18:52:28'),
(657, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,7,5,6,,8', '2026-05-10 18:52:28'),
(658, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,,5,6,7,8', '2026-05-10 18:52:28'),
(659, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,,6,7,8', '2026-05-10 18:52:29'),
(660, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,8,6,7,', '2026-05-10 18:52:29'),
(661, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,8,6,,7', '2026-05-10 18:52:29'),
(662, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,8,,6,7', '2026-05-10 18:52:30'),
(663, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,,5,8,4,6,7', '2026-05-10 18:52:30'),
(664, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,5,,8,4,6,7', '2026-05-10 18:52:30'),
(665, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,5,6,8,4,,7', '2026-05-10 18:52:31'),
(666, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,5,6,8,4,7,', '2026-05-10 18:52:31'),
(667, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,5,6,,4,7,8', '2026-05-10 18:52:32'),
(668, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,5,,6,4,7,8', '2026-05-10 18:52:32'),
(669, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,,5,6,4,7,8', '2026-05-10 18:52:32'),
(670, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,6,,7,8', '2026-05-10 18:52:33'),
(671, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,6,7,,8', '2026-05-10 18:52:33'),
(672, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 16, '1,2,3,4,5,6,7,8,', '2026-05-10 18:52:34'),
(673, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,,4,3,1,7,6,5,2', '2026-05-10 18:53:34'),
(674, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,,7,6,5,2', '2026-05-10 18:53:34'),
(675, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,5,7,6,,2', '2026-05-10 18:53:35'),
(676, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,5,7,6,2,', '2026-05-10 18:53:36'),
(677, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,5,,6,2,7', '2026-05-10 18:53:36'),
(678, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,,5,6,2,7', '2026-05-10 18:53:37'),
(679, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,2,5,6,,7', '2026-05-10 18:53:37'),
(680, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,3,2,5,,6,7', '2026-05-10 18:53:38'),
(681, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '8,1,4,,2,5,3,6,7', '2026-05-10 18:53:38'),
(682, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, ',1,4,8,2,5,3,6,7', '2026-05-10 18:53:39'),
(683, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,,4,8,2,5,3,6,7', '2026-05-10 18:53:39'),
(684, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,8,,5,3,6,7', '2026-05-10 18:53:39'),
(685, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,,8,5,3,6,7', '2026-05-10 18:53:40'),
(686, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,3,8,5,,6,7', '2026-05-10 18:53:40'),
(687, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,3,8,5,6,,7', '2026-05-10 18:53:41'),
(688, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,3,,5,6,8,7', '2026-05-10 18:53:41'),
(689, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,4,,3,5,6,8,7', '2026-05-10 18:53:41'),
(690, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, ',2,4,1,3,5,6,8,7', '2026-05-10 18:53:42'),
(691, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '2,,4,1,3,5,6,8,7', '2026-05-10 18:53:42'),
(692, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '2,3,4,1,,5,6,8,7', '2026-05-10 18:53:43'),
(693, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '2,3,4,1,5,,6,8,7', '2026-05-10 18:53:43'),
(694, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '2,3,,1,5,4,6,8,7', '2026-05-10 18:53:44'),
(695, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '2,,3,1,5,4,6,8,7', '2026-05-10 18:53:44'),
(696, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, ',2,3,1,5,4,6,8,7', '2026-05-10 18:53:45'),
(697, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,,5,4,6,8,7', '2026-05-10 18:53:45'),
(698, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,5,,4,6,8,7', '2026-05-10 18:53:45'),
(699, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,5,4,,6,8,7', '2026-05-10 18:53:46'),
(700, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,5,4,7,6,8,', '2026-05-10 18:53:46'),
(701, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,5,4,7,6,,8', '2026-05-10 18:53:46'),
(702, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,5,4,7,,6,8', '2026-05-10 18:53:47'),
(703, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,,4,7,5,6,8', '2026-05-10 18:53:47'),
(704, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,,7,5,6,8', '2026-05-10 18:53:48'),
(705, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,6,7,5,,8', '2026-05-10 18:53:48'),
(706, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,6,7,,5,8', '2026-05-10 18:53:48'),
(707, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,6,7,5,,8', '2026-05-10 18:53:49'),
(708, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,6,7,5,8,', '2026-05-10 18:53:50'),
(709, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,6,,5,8,7', '2026-05-10 18:53:50'),
(710, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,,6,5,8,7', '2026-05-10 18:53:50'),
(711, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,8,6,5,,7', '2026-05-10 18:53:50'),
(712, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,8,6,,5,7', '2026-05-10 18:53:51'),
(713, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,,8,6,4,5,7', '2026-05-10 18:53:51'),
(714, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,8,,6,4,5,7', '2026-05-10 18:53:52'),
(715, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,8,5,6,4,,7', '2026-05-10 18:53:52'),
(716, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,8,5,6,4,7,', '2026-05-10 18:53:52'),
(717, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,8,5,,4,7,6', '2026-05-10 18:53:53'),
(718, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,8,,5,4,7,6', '2026-05-10 18:53:53'),
(719, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,,8,5,4,7,6', '2026-05-10 18:53:53'),
(720, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,8,5,,7,6', '2026-05-10 18:53:54'),
(721, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,8,5,7,,6', '2026-05-10 18:53:54'),
(722, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,,5,7,8,6', '2026-05-10 18:53:55'),
(723, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,5,,7,8,6', '2026-05-10 18:53:55'),
(724, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 17, '1,2,3,4,5,6,7,8,', '2026-05-10 18:53:55'),
(725, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,,6,5,8,1,7', '2026-05-10 18:55:48'),
(726, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,6,,5,8,1,7', '2026-05-10 18:55:49'),
(727, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,6,1,5,8,,7', '2026-05-10 18:55:50'),
(728, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,6,1,5,,8,7', '2026-05-10 18:55:51'),
(729, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,,1,5,6,8,7', '2026-05-10 18:55:51'),
(730, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,1,,5,6,8,7', '2026-05-10 18:55:52'),
(731, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,4,1,5,,6,8,7', '2026-05-10 18:55:53'),
(732, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,3,,1,5,4,6,8,7', '2026-05-10 18:55:53'),
(733, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '2,,3,1,5,4,6,8,7', '2026-05-10 18:55:54'),
(734, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, ',2,3,1,5,4,6,8,7', '2026-05-10 18:55:54'),
(735, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,,5,4,6,8,7', '2026-05-10 18:55:55'),
(736, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,5,,4,6,8,7', '2026-05-10 18:55:55'),
(737, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,5,4,,6,8,7', '2026-05-10 18:55:56'),
(738, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,5,4,7,6,8,', '2026-05-10 18:55:56'),
(739, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,5,4,7,6,,8', '2026-05-10 18:55:56'),
(740, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,5,4,7,,6,8', '2026-05-10 18:55:57'),
(741, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,,4,7,5,6,8', '2026-05-10 18:55:57'),
(742, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,,7,5,6,8', '2026-05-10 18:55:58'),
(743, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,6,7,5,,8', '2026-05-10 18:55:58'),
(744, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,6,7,5,8,', '2026-05-10 18:55:59'),
(745, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,6,,5,8,7', '2026-05-10 18:55:59'),
(746, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,,6,5,8,7', '2026-05-10 18:55:59'),
(747, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,8,6,5,,7', '2026-05-10 18:56:00'),
(748, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,8,6,,5,7', '2026-05-10 18:56:00'),
(749, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,,8,6,4,5,7', '2026-05-10 18:56:01'),
(750, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,8,,6,4,5,7', '2026-05-10 18:56:01'),
(751, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,8,5,6,4,,7', '2026-05-10 18:56:01'),
(752, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,8,5,6,4,7,', '2026-05-10 18:56:02'),
(753, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,8,5,,4,7,6', '2026-05-10 18:56:02'),
(754, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,8,,5,4,7,6', '2026-05-10 18:56:03'),
(755, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,,8,5,4,7,6', '2026-05-10 18:56:03'),
(756, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,8,5,,7,6', '2026-05-10 18:56:04'),
(757, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,8,5,7,,6', '2026-05-10 18:56:04'),
(758, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,,5,7,8,6', '2026-05-10 18:56:04'),
(759, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,5,,7,8,6', '2026-05-10 18:56:05'),
(760, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 18, '1,2,3,4,5,6,7,8,', '2026-05-10 18:56:05'),
(761, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,3,1,7,5,,4,6,8', '2026-05-10 18:58:52'),
(762, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,3,1,7,,5,4,6,8', '2026-05-10 18:58:52'),
(763, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,,1,7,3,5,4,6,8', '2026-05-10 18:58:53'),
(764, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,1,,7,3,5,4,6,8', '2026-05-10 18:58:53'),
(765, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,1,5,7,3,,4,6,8', '2026-05-10 18:58:55'),
(766, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,1,5,7,,3,4,6,8', '2026-05-10 18:58:55'),
(767, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,1,5,,7,3,4,6,8', '2026-05-10 18:58:56'),
(768, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, ',1,5,2,7,3,4,6,8', '2026-05-10 18:58:56'),
(769, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,,5,2,7,3,4,6,8', '2026-05-10 18:58:57'),
(770, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,7,5,2,,3,4,6,8', '2026-05-10 18:58:57'),
(771, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,7,5,,2,3,4,6,8', '2026-05-10 18:58:58'),
(772, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, ',7,5,1,2,3,4,6,8', '2026-05-10 18:58:58'),
(773, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '7,,5,1,2,3,4,6,8', '2026-05-10 18:58:58'),
(774, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '7,2,5,1,,3,4,6,8', '2026-05-10 18:58:58'),
(775, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '7,2,5,1,3,,4,6,8', '2026-05-10 18:58:59'),
(776, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '7,2,,1,3,5,4,6,8', '2026-05-10 18:58:59'),
(777, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '7,,2,1,3,5,4,6,8', '2026-05-10 18:59:00'),
(778, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, ',7,2,1,3,5,4,6,8', '2026-05-10 18:59:00'),
(779, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,7,2,,3,5,4,6,8', '2026-05-10 18:59:01'),
(780, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,7,2,3,,5,4,6,8', '2026-05-10 18:59:01'),
(781, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,,2,3,7,5,4,6,8', '2026-05-10 18:59:02'),
(782, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,,3,7,5,4,6,8', '2026-05-10 18:59:02'),
(783, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,5,3,7,,4,6,8', '2026-05-10 18:59:02'),
(784, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,5,3,,7,4,6,8', '2026-05-10 18:59:03'),
(785, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,5,,3,7,4,6,8', '2026-05-10 18:59:04'),
(786, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, ',2,5,1,3,7,4,6,8', '2026-05-10 18:59:04'),
(787, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,,5,1,3,7,4,6,8', '2026-05-10 18:59:04'),
(788, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,3,5,1,,7,4,6,8', '2026-05-10 18:59:04'),
(789, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,3,5,1,7,,4,6,8', '2026-05-10 18:59:05'),
(790, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,3,,1,7,5,4,6,8', '2026-05-10 18:59:05'),
(791, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '2,,3,1,7,5,4,6,8', '2026-05-10 18:59:05'),
(792, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, ',2,3,1,7,5,4,6,8', '2026-05-10 18:59:06'),
(793, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,,7,5,4,6,8', '2026-05-10 18:59:06'),
(794, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,7,,5,4,6,8', '2026-05-10 18:59:07'),
(795, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,,7,5,4,6,8', '2026-05-10 18:59:08'),
(796, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,7,5,,6,8', '2026-05-10 18:59:09'),
(797, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,7,5,6,,8', '2026-05-10 18:59:10'),
(798, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,,5,6,7,8', '2026-05-10 18:59:10'),
(799, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,,6,7,8', '2026-05-10 18:59:11'),
(800, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,8,6,7,', '2026-05-10 18:59:11'),
(801, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,8,6,,7', '2026-05-10 18:59:11'),
(802, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,8,,6,7', '2026-05-10 18:59:12'),
(803, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,,5,8,4,6,7', '2026-05-10 18:59:12'),
(804, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,5,,8,4,6,7', '2026-05-10 18:59:13'),
(805, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,5,6,8,4,,7', '2026-05-10 18:59:13'),
(806, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,5,6,8,4,7,', '2026-05-10 18:59:13'),
(807, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,5,6,,4,7,8', '2026-05-10 18:59:14'),
(808, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,5,,6,4,7,8', '2026-05-10 18:59:14'),
(809, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,,5,6,4,7,8', '2026-05-10 18:59:15'),
(810, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,6,,7,8', '2026-05-10 18:59:15'),
(811, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,6,7,,8', '2026-05-10 18:59:15'),
(812, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 19, '1,2,3,4,5,6,7,8,', '2026-05-10 18:59:17'),
(813, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,,1,3,7,4,2,6,5', '2026-05-10 19:00:54'),
(814, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,,3,7,4,2,6,5', '2026-05-10 19:00:55'),
(815, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,3,7,,2,6,5', '2026-05-10 19:00:56'),
(816, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,3,,7,2,6,5', '2026-05-10 19:00:56'),
(817, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,,3,7,2,6,5', '2026-05-10 19:00:57'),
(818, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,2,3,7,,6,5', '2026-05-10 19:00:57'),
(819, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,2,3,7,6,,5', '2026-05-10 19:00:58'),
(820, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,2,3,7,6,5,', '2026-05-10 19:00:59'),
(821, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,2,3,,6,5,7', '2026-05-10 19:00:59'),
(822, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,2,,3,6,5,7', '2026-05-10 19:00:59'),
(823, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '8,1,4,,2,3,6,5,7', '2026-05-10 19:01:00'),
(824, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, ',1,4,8,2,3,6,5,7', '2026-05-10 19:01:00'),
(825, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,,4,8,2,3,6,5,7', '2026-05-10 19:01:01'),
(826, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,4,8,,3,6,5,7', '2026-05-10 19:01:02'),
(827, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,4,,8,3,6,5,7', '2026-05-10 19:01:03'),
(828, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, ',2,4,1,8,3,6,5,7', '2026-05-10 19:01:03'),
(829, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '2,,4,1,8,3,6,5,7', '2026-05-10 19:01:03'),
(830, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '2,4,,1,8,3,6,5,7', '2026-05-10 19:01:04'),
(831, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '2,4,3,1,8,,6,5,7', '2026-05-10 19:01:04'),
(832, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '2,4,3,1,,8,6,5,7', '2026-05-10 19:01:05'),
(833, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '2,,3,1,4,8,6,5,7', '2026-05-10 19:01:05'),
(834, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, ',2,3,1,4,8,6,5,7', '2026-05-10 19:01:06'),
(835, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,,4,8,6,5,7', '2026-05-10 19:01:06'),
(836, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,,8,6,5,7', '2026-05-10 19:01:08'),
(837, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,5,8,6,,7', '2026-05-10 19:01:08'),
(838, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,5,8,,6,7', '2026-05-10 19:01:10'),
(839, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,,5,8,4,6,7', '2026-05-10 19:01:11'),
(840, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,5,,8,4,6,7', '2026-05-10 19:01:12'),
(841, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,5,6,8,4,,7', '2026-05-10 19:01:12'),
(842, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,5,6,8,4,7,', '2026-05-10 19:01:12'),
(843, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,5,6,,4,7,8', '2026-05-10 19:01:13'),
(844, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,5,,6,4,7,8', '2026-05-10 19:01:14'),
(845, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,,5,6,4,7,8', '2026-05-10 19:01:14'),
(846, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,5,6,,7,8', '2026-05-10 19:01:15'),
(847, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,5,6,7,,8', '2026-05-10 19:01:15'),
(848, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 20, '1,2,3,4,5,6,7,8,', '2026-05-10 19:01:16'),
(849, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,,1,5,3,8,6,4,2', '2026-05-10 19:01:58'),
(850, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,,5,3,8,6,4,2', '2026-05-10 19:01:58'),
(851, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,8,5,3,,6,4,2', '2026-05-10 19:01:59'),
(852, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,8,5,3,2,6,4,', '2026-05-10 19:01:59'),
(853, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,8,5,3,2,6,,4', '2026-05-10 19:02:00'),
(854, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,8,5,3,2,,6,4', '2026-05-10 19:02:01'),
(855, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '7,1,8,,3,2,5,6,4', '2026-05-10 19:02:02'),
(856, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, ',1,8,7,3,2,5,6,4', '2026-05-10 19:02:02'),
(857, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,,8,7,3,2,5,6,4', '2026-05-10 19:02:03'),
(858, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,8,,7,3,2,5,6,4', '2026-05-10 19:02:04'),
(859, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,8,2,7,3,,5,6,4', '2026-05-10 19:02:04'),
(860, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,8,2,7,,3,5,6,4', '2026-05-10 19:02:04'),
(861, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,,2,7,8,3,5,6,4', '2026-05-10 19:02:05'),
(862, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,,7,8,3,5,6,4', '2026-05-10 19:02:05'),
(863, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,8,,5,6,4', '2026-05-10 19:02:05'),
(864, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,8,4,5,6,', '2026-05-10 19:02:06'),
(865, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,8,4,5,,6', '2026-05-10 19:02:07'),
(866, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,,4,5,8,6', '2026-05-10 19:02:07'),
(867, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,4,,5,8,6', '2026-05-10 19:02:08'),
(868, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,4,6,5,8,', '2026-05-10 19:02:08'),
(869, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,4,6,5,,8', '2026-05-10 19:02:08'),
(870, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,7,4,6,,5,8', '2026-05-10 19:02:09'),
(871, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,,4,6,7,5,8', '2026-05-10 19:02:09'),
(872, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,4,,6,7,5,8', '2026-05-10 19:02:10'),
(873, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,4,5,6,7,,8', '2026-05-10 19:02:10'),
(874, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 21, '1,2,3,4,5,6,7,8,', '2026-05-10 19:02:11'),
(875, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,,3,7,8,1,5,6,4', '2026-05-10 19:03:15'),
(876, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,3,,7,8,1,5,6,4', '2026-05-10 19:03:15'),
(877, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,3,1,7,8,,5,6,4', '2026-05-10 19:03:16'),
(878, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,3,1,7,,8,5,6,4', '2026-05-10 19:03:16'),
(879, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,,1,7,3,8,5,6,4', '2026-05-10 19:03:17'),
(880, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,,7,3,8,5,6,4', '2026-05-10 19:03:17'),
(881, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,8,7,3,,5,6,4', '2026-05-10 19:03:18'),
(882, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,8,7,3,4,5,6,', '2026-05-10 19:03:19'),
(883, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,8,7,3,4,5,,6', '2026-05-10 19:03:19'),
(884, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,8,7,3,4,,5,6', '2026-05-10 19:03:20'),
(885, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '2,1,8,,3,4,7,5,6', '2026-05-10 19:03:20'),
(886, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, ',1,8,2,3,4,7,5,6', '2026-05-10 19:03:21'),
(887, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,,8,2,3,4,7,5,6', '2026-05-10 19:03:21'),
(888, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,3,8,2,,4,7,5,6', '2026-05-10 19:03:22'),
(889, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,3,8,2,4,,7,5,6', '2026-05-10 19:03:23'),
(890, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,3,,2,4,8,7,5,6', '2026-05-10 19:03:24'),
(891, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,,3,2,4,8,7,5,6', '2026-05-10 19:03:24'),
(892, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,4,3,2,,8,7,5,6', '2026-05-10 19:03:24'),
(893, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,4,3,,2,8,7,5,6', '2026-05-10 19:03:25'),
(894, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, ',4,3,1,2,8,7,5,6', '2026-05-10 19:03:26'),
(895, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '4,,3,1,2,8,7,5,6', '2026-05-10 19:03:27'),
(896, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '4,2,3,1,,8,7,5,6', '2026-05-10 19:03:27'),
(897, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '4,2,3,1,8,,7,5,6', '2026-05-10 19:03:27'),
(898, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '4,2,,1,8,3,7,5,6', '2026-05-10 19:03:27'),
(899, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '4,,2,1,8,3,7,5,6', '2026-05-10 19:03:28'),
(900, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, ',4,2,1,8,3,7,5,6', '2026-05-10 19:03:28'),
(901, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,4,2,,8,3,7,5,6', '2026-05-10 19:03:29'),
(902, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,4,2,8,,3,7,5,6', '2026-05-10 19:03:29'),
(903, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,,2,8,4,3,7,5,6', '2026-05-10 19:03:29'),
(904, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,,8,4,3,7,5,6', '2026-05-10 19:03:30'),
(905, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,8,4,,7,5,6', '2026-05-10 19:03:30'),
(906, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,8,4,6,7,5,', '2026-05-10 19:03:37'),
(907, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,8,4,6,7,,5', '2026-05-10 19:03:38'),
(908, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,8,4,6,,7,5', '2026-05-10 19:03:39'),
(909, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,,4,6,8,7,5', '2026-05-10 19:03:39'),
(910, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,,6,8,7,5', '2026-05-10 19:03:39'),
(911, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,6,,8,7,5', '2026-05-10 19:03:40'),
(912, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,6,5,8,7,', '2026-05-10 19:03:40'),
(913, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,6,5,8,,7', '2026-05-10 19:03:41'),
(914, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,,5,8,6,7', '2026-05-10 19:03:41'),
(915, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,,8,6,7', '2026-05-10 19:03:41'),
(916, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,7,8,6,', '2026-05-10 19:03:42'),
(917, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,7,8,,6', '2026-05-10 19:03:42'),
(918, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,7,,8,6', '2026-05-10 19:03:42'),
(919, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,,5,7,4,8,6', '2026-05-10 19:03:43'),
(920, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,5,,7,4,8,6', '2026-05-10 19:03:43'),
(921, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,5,7,,4,8,6', '2026-05-10 19:03:44'),
(922, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,5,7,6,4,8,', '2026-05-10 19:03:44'),
(923, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,5,7,6,4,,8', '2026-05-10 19:03:45'),
(924, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,5,,6,4,7,8', '2026-05-10 19:03:45'),
(925, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,,5,6,4,7,8', '2026-05-10 19:03:45'),
(926, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,6,,7,8', '2026-05-10 19:03:46'),
(927, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,6,7,,8', '2026-05-10 19:03:46'),
(928, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 22, '1,2,3,4,5,6,7,8,', '2026-05-10 19:03:47'),
(929, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,,8,6,3,2,7,4,1', '2026-05-10 19:04:15'),
(930, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,,2,7,4,1', '2026-05-10 19:04:16'),
(931, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,4,2,7,,1', '2026-05-10 19:04:17'),
(932, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,4,2,7,1,', '2026-05-10 19:04:17'),
(933, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,4,,7,1,2', '2026-05-10 19:04:18'),
(934, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,,4,7,1,2', '2026-05-10 19:04:18'),
(935, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,1,4,7,,2', '2026-05-10 19:04:18'),
(936, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,6,1,4,,7,2', '2026-05-10 19:04:19'),
(937, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '5,3,8,,1,4,6,7,2', '2026-05-10 19:04:20'),
(938, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, ',3,8,5,1,4,6,7,2', '2026-05-10 19:04:20'),
(939, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,,8,5,1,4,6,7,2', '2026-05-10 19:04:20'),
(940, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,,4,6,7,2', '2026-05-10 19:04:21'),
(941, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,4,,6,7,2', '2026-05-10 19:04:21'),
(942, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,4,2,6,7,', '2026-05-10 19:04:21'),
(943, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,4,2,6,,7', '2026-05-10 19:04:22'),
(944, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,,2,6,4,7', '2026-05-10 19:04:22'),
(945, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,2,,6,4,7', '2026-05-10 19:04:23'),
(946, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,5,,2,6,4,7', '2026-05-10 19:04:24'),
(947, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '3,1,8,,5,2,6,4,7', '2026-05-10 19:04:24'),
(948, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, ',1,8,3,5,2,6,4,7', '2026-05-10 19:04:25'),
(949, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,,8,3,5,2,6,4,7', '2026-05-10 19:04:25'),
(950, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,8,,3,5,2,6,4,7', '2026-05-10 19:04:25'),
(951, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,8,2,3,5,,6,4,7', '2026-05-10 19:04:26'),
(952, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,8,2,3,,5,6,4,7', '2026-05-10 19:04:26'),
(953, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,,2,3,8,5,6,4,7', '2026-05-10 19:04:26'),
(954, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,,3,8,5,6,4,7', '2026-05-10 19:04:27'),
(955, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,5,3,8,,6,4,7', '2026-05-10 19:04:27'),
(956, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,5,3,,8,6,4,7', '2026-05-10 19:04:27'),
(957, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,5,,3,8,6,4,7', '2026-05-10 19:04:28'),
(958, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, ',2,5,1,3,8,6,4,7', '2026-05-10 19:04:28'),
(959, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '2,,5,1,3,8,6,4,7', '2026-05-10 19:04:29'),
(960, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '2,3,5,1,,8,6,4,7', '2026-05-10 19:04:29'),
(961, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '2,3,5,1,8,,6,4,7', '2026-05-10 19:04:30'),
(962, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '2,3,,1,8,5,6,4,7', '2026-05-10 19:04:30'),
(963, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '2,,3,1,8,5,6,4,7', '2026-05-10 19:04:30'),
(964, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, ',2,3,1,8,5,6,4,7', '2026-05-10 19:04:31'),
(965, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,,8,5,6,4,7', '2026-05-10 19:04:31'),
(966, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,8,,5,6,4,7', '2026-05-10 19:04:32'),
(967, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,8,4,5,6,,7', '2026-05-10 19:04:32'),
(968, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,8,4,5,,6,7', '2026-05-10 19:04:33'),
(969, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,,4,5,8,6,7', '2026-05-10 19:04:33'),
(970, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,,5,8,6,7', '2026-05-10 19:04:34'),
(971, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,,8,6,7', '2026-05-10 19:04:34'),
(972, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,7,8,6,', '2026-05-10 19:04:35'),
(973, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,7,8,,6', '2026-05-10 19:04:35'),
(974, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,7,,8,6', '2026-05-10 19:04:35'),
(975, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,,5,7,4,8,6', '2026-05-10 19:04:36'),
(976, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,5,,7,4,8,6', '2026-05-10 19:04:36'),
(977, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,5,7,,4,8,6', '2026-05-10 19:04:36'),
(978, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,5,7,6,4,8,', '2026-05-10 19:04:37'),
(979, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,5,7,6,4,,8', '2026-05-10 19:04:37'),
(980, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,5,,6,4,7,8', '2026-05-10 19:04:38'),
(981, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,,5,6,4,7,8', '2026-05-10 19:04:38'),
(982, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,6,,7,8', '2026-05-10 19:04:39'),
(983, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,6,7,,8', '2026-05-10 19:04:39'),
(984, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 23, '1,2,3,4,5,6,7,8,', '2026-05-10 19:04:40'),
(985, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,3,2,8,,7,5,1', '2026-05-10 20:03:20'),
(986, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,3,2,8,1,7,5,', '2026-05-10 20:03:20'),
(987, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,3,2,8,1,7,,5', '2026-05-10 20:03:21'),
(988, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,3,2,,1,7,8,5', '2026-05-10 20:03:21'),
(989, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,3,2,1,,7,8,5', '2026-05-10 20:03:21'),
(990, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,6,,2,1,3,7,8,5', '2026-05-10 20:03:22'),
(991, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,,6,2,1,3,7,8,5', '2026-05-10 20:03:23'),
(992, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,1,6,2,,3,7,8,5', '2026-05-10 20:03:23'),
(993, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '4,1,6,,2,3,7,8,5', '2026-05-10 20:03:24'),
(994, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, ',1,6,4,2,3,7,8,5', '2026-05-10 20:03:24'),
(995, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,,6,4,2,3,7,8,5', '2026-05-10 20:03:24'),
(996, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,6,4,,3,7,8,5', '2026-05-10 20:03:25'),
(997, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,6,,4,3,7,8,5', '2026-05-10 20:03:25'),
(998, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, ',2,6,1,4,3,7,8,5', '2026-05-10 20:03:26'),
(999, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '2,,6,1,4,3,7,8,5', '2026-05-10 20:03:26'),
(1000, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '2,6,,1,4,3,7,8,5', '2026-05-10 20:03:27'),
(1001, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '2,6,3,1,4,,7,8,5', '2026-05-10 20:03:27'),
(1002, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '2,6,3,1,,4,7,8,5', '2026-05-10 20:03:27'),
(1003, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '2,,3,1,6,4,7,8,5', '2026-05-10 20:03:28'),
(1004, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, ',2,3,1,6,4,7,8,5', '2026-05-10 20:03:28'),
(1005, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,,6,4,7,8,5', '2026-05-10 20:03:28'),
(1006, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,6,,4,7,8,5', '2026-05-10 20:03:30'),
(1007, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,6,4,,7,8,5', '2026-05-10 20:03:30'),
(1008, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,6,4,5,7,8,', '2026-05-10 20:03:31'),
(1009, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,6,4,5,7,,8', '2026-05-10 20:03:31'),
(1010, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,6,4,5,,7,8', '2026-05-10 20:03:32'),
(1011, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,,4,5,6,7,8', '2026-05-10 20:03:32'),
(1012, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,,5,6,7,8', '2026-05-10 20:03:32'),
(1013, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,,6,7,8', '2026-05-10 20:03:33'),
(1014, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,8,6,7,', '2026-05-10 20:03:33'),
(1015, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,8,6,,7', '2026-05-10 20:03:33'),
(1016, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,8,,6,7', '2026-05-10 20:03:34'),
(1017, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,,5,8,4,6,7', '2026-05-10 20:03:34'),
(1018, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,,8,4,6,7', '2026-05-10 20:03:35'),
(1019, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,8,4,,7', '2026-05-10 20:03:35'),
(1020, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,8,,4,7', '2026-05-10 20:03:35'),
(1021, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,,6,8,5,4,7', '2026-05-10 20:03:36'),
(1022, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,8,,4,7', '2026-05-10 20:03:37'),
(1023, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,8,4,,7', '2026-05-10 20:03:37'),
(1024, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,8,4,7,', '2026-05-10 20:03:38'),
(1025, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,6,,4,7,8', '2026-05-10 20:03:38'),
(1026, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,5,,6,4,7,8', '2026-05-10 20:03:38'),
(1027, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,,5,6,4,7,8', '2026-05-10 20:03:39'),
(1028, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,6,,7,8', '2026-05-10 20:03:39'),
(1029, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,6,7,,8', '2026-05-10 20:03:39'),
(1030, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 24, '1,2,3,4,5,6,7,8,', '2026-05-10 20:03:40'),
(1031, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '7,4,3,5,6,,2,1,8', '2026-05-10 20:04:17'),
(1032, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '7,4,3,5,,6,2,1,8', '2026-05-10 20:04:18'),
(1033, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '7,4,3,5,1,6,2,,8', '2026-05-10 20:04:18'),
(1034, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '7,4,3,5,1,6,,2,8', '2026-05-10 20:04:19'),
(1035, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '7,4,3,,1,6,5,2,8', '2026-05-10 20:04:19'),
(1036, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, ',4,3,7,1,6,5,2,8', '2026-05-10 20:04:20'),
(1037, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '4,,3,7,1,6,5,2,8', '2026-05-10 20:04:20'),
(1038, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '4,1,3,7,,6,5,2,8', '2026-05-10 20:04:20'),
(1039, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '4,1,3,7,2,6,5,,8', '2026-05-10 20:04:21'),
(1040, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '4,1,3,7,2,6,,5,8', '2026-05-10 20:04:21'),
(1041, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '4,1,3,,2,6,7,5,8', '2026-05-10 20:04:21'),
(1042, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, ',1,3,4,2,6,7,5,8', '2026-05-10 20:04:22'),
(1043, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '1,,3,4,2,6,7,5,8', '2026-05-10 20:04:22'),
(1044, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '1,2,3,4,,6,7,5,8', '2026-05-10 20:04:23'),
(1045, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '1,2,3,4,5,6,7,,8', '2026-05-10 20:04:23'),
(1046, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 25, '1,2,3,4,5,6,7,8,', '2026-05-10 20:04:24'),
(1047, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,,4,2,8,5,7,3,1', '2026-05-10 20:05:22');
INSERT INTO `game_moves` (`id`, `browser_uuid`, `user_id`, `game_id`, `moves`, `created_at`) VALUES
(1048, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,4,,2,8,5,7,3,1', '2026-05-10 20:05:23'),
(1049, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,4,5,2,8,,7,3,1', '2026-05-10 20:05:23'),
(1050, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,4,5,2,8,1,7,3,', '2026-05-10 20:05:24'),
(1051, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,4,5,2,8,1,7,,3', '2026-05-10 20:05:24'),
(1052, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,4,5,2,,1,7,8,3', '2026-05-10 20:05:24'),
(1053, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,,5,2,4,1,7,8,3', '2026-05-10 20:05:25'),
(1054, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,5,,2,4,1,7,8,3', '2026-05-10 20:05:25'),
(1055, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,5,1,2,4,,7,8,3', '2026-05-10 20:05:26'),
(1056, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,5,1,2,4,3,7,8,', '2026-05-10 20:05:26'),
(1057, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,5,1,2,4,3,7,,8', '2026-05-10 20:05:26'),
(1058, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,5,1,2,,3,7,4,8', '2026-05-10 20:05:27'),
(1059, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,,1,2,5,3,7,4,8', '2026-05-10 20:05:27'),
(1060, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,1,,2,5,3,7,4,8', '2026-05-10 20:05:27'),
(1061, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,1,3,2,5,,7,4,8', '2026-05-10 20:05:28'),
(1062, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,1,3,2,,5,7,4,8', '2026-05-10 20:05:28'),
(1063, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '6,1,3,,2,5,7,4,8', '2026-05-10 20:05:29'),
(1064, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, ',1,3,6,2,5,7,4,8', '2026-05-10 20:05:30'),
(1065, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,,3,6,2,5,7,4,8', '2026-05-10 20:05:30'),
(1066, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,6,,5,7,4,8', '2026-05-10 20:05:30'),
(1067, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,6,4,5,7,,8', '2026-05-10 20:05:31'),
(1068, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,6,4,5,,7,8', '2026-05-10 20:05:31'),
(1069, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,,4,5,6,7,8', '2026-05-10 20:05:32'),
(1070, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,,5,6,7,8', '2026-05-10 20:05:32'),
(1071, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,,6,7,8', '2026-05-10 20:05:33'),
(1072, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,8,6,7,', '2026-05-10 20:05:34'),
(1073, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,8,6,,7', '2026-05-10 20:05:34'),
(1074, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,,8,6,5,7', '2026-05-10 20:05:34'),
(1075, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,8,6,,7', '2026-05-10 20:05:35'),
(1076, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,8,,6,7', '2026-05-10 20:05:35'),
(1077, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,,5,8,4,6,7', '2026-05-10 20:05:36'),
(1078, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,,8,4,6,7', '2026-05-10 20:05:36'),
(1079, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,6,8,4,,7', '2026-05-10 20:05:37'),
(1080, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,6,8,,4,7', '2026-05-10 20:05:37'),
(1081, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,6,8,4,,7', '2026-05-10 20:05:38'),
(1082, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,6,8,4,7,', '2026-05-10 20:05:38'),
(1083, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,6,,4,7,8', '2026-05-10 20:05:38'),
(1084, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,5,,6,4,7,8', '2026-05-10 20:05:39'),
(1085, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,,5,6,4,7,8', '2026-05-10 20:05:39'),
(1086, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,6,,7,8', '2026-05-10 20:05:40'),
(1087, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,6,7,,8', '2026-05-10 20:05:40'),
(1088, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 26, '1,2,3,4,5,6,7,8,', '2026-05-10 20:05:41'),
(1089, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,7,,8,2,1', '2026-05-10 21:19:25'),
(1090, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,,7,8,2,1', '2026-05-10 21:19:26'),
(1091, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,,5,7,8,2,1', '2026-05-10 21:19:27'),
(1092, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, ',6,3,4,5,7,8,2,1', '2026-05-10 21:19:28'),
(1093, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,,5,7,8,2,1', '2026-05-10 21:19:30'),
(1094, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,,7,8,2,1', '2026-05-10 21:19:30'),
(1095, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,7,,8,2,1', '2026-05-10 21:19:31'),
(1096, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,7,1,8,2,', '2026-05-10 21:19:31'),
(1097, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,7,1,8,,2', '2026-05-10 21:19:32'),
(1098, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,6,3,5,,1,8,7,2', '2026-05-10 21:19:32'),
(1099, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,,3,5,6,1,8,7,2', '2026-05-10 21:19:33'),
(1100, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,3,,5,6,1,8,7,2', '2026-05-10 21:19:33'),
(1101, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,3,1,5,6,,8,7,2', '2026-05-10 21:19:34'),
(1102, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,3,1,5,6,2,8,7,', '2026-05-10 21:19:34'),
(1103, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,3,1,5,6,2,8,,7', '2026-05-10 21:19:35'),
(1104, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,3,1,5,,2,8,6,7', '2026-05-10 21:19:35'),
(1105, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,,1,5,3,2,8,6,7', '2026-05-10 21:19:36'),
(1106, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,1,,5,3,2,8,6,7', '2026-05-10 21:19:37'),
(1107, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,1,2,5,3,,8,6,7', '2026-05-10 21:19:37'),
(1108, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,1,2,5,,3,8,6,7', '2026-05-10 21:19:37'),
(1109, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '4,1,2,,5,3,8,6,7', '2026-05-10 21:19:38'),
(1110, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, ',1,2,4,5,3,8,6,7', '2026-05-10 21:19:39'),
(1111, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,,2,4,5,3,8,6,7', '2026-05-10 21:19:39'),
(1112, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,,4,5,3,8,6,7', '2026-05-10 21:19:40'),
(1113, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,,8,6,7', '2026-05-10 21:19:40'),
(1114, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,7,8,6,', '2026-05-10 21:19:42'),
(1115, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,7,8,,6', '2026-05-10 21:19:43'),
(1116, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,7,8,6,', '2026-05-10 21:19:44'),
(1117, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,7,8,,6', '2026-05-10 21:19:45'),
(1118, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,7,,8,6', '2026-05-10 21:19:45'),
(1119, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,,5,7,4,8,6', '2026-05-10 21:19:46'),
(1120, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,5,,7,4,8,6', '2026-05-10 21:19:46'),
(1121, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,5,7,,4,8,6', '2026-05-10 21:19:46'),
(1122, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,5,7,6,4,8,', '2026-05-10 21:19:47'),
(1123, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,5,7,6,4,,8', '2026-05-10 21:19:47'),
(1124, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,5,,6,4,7,8', '2026-05-10 21:19:48'),
(1125, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,,5,6,4,7,8', '2026-05-10 21:19:48'),
(1126, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,6,,7,8', '2026-05-10 21:19:49'),
(1127, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,6,7,,8', '2026-05-10 21:19:49'),
(1128, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 299, '1,2,3,4,5,6,7,8,', '2026-05-10 21:19:50'),
(1129, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '5,1,8,,3,6,4,7,2', '2026-05-10 21:30:19'),
(1130, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, ',1,8,5,3,6,4,7,2', '2026-05-10 21:30:20'),
(1131, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,,8,5,3,6,4,7,2', '2026-05-10 21:30:20'),
(1132, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,8,,5,3,6,4,7,2', '2026-05-10 21:30:21'),
(1133, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,8,6,5,3,,4,7,2', '2026-05-10 21:30:21'),
(1134, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,8,6,5,3,2,4,7,', '2026-05-10 21:30:22'),
(1135, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,8,6,5,3,2,4,,7', '2026-05-10 21:30:23'),
(1136, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,8,6,5,,2,4,3,7', '2026-05-10 21:30:23'),
(1137, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,,6,5,8,2,4,3,7', '2026-05-10 21:30:24'),
(1138, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,6,,5,8,2,4,3,7', '2026-05-10 21:30:24'),
(1139, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,6,2,5,8,,4,3,7', '2026-05-10 21:30:25'),
(1140, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,6,2,5,,8,4,3,7', '2026-05-10 21:30:25'),
(1141, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,,2,5,6,8,4,3,7', '2026-05-10 21:30:25'),
(1142, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,,5,6,8,4,3,7', '2026-05-10 21:30:26'),
(1143, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,8,5,6,,4,3,7', '2026-05-10 21:30:27'),
(1144, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,8,5,,6,4,3,7', '2026-05-10 21:30:27'),
(1145, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,8,5,3,6,4,,7', '2026-05-10 21:30:28'),
(1146, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,8,5,3,6,,4,7', '2026-05-10 21:30:29'),
(1147, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,8,,3,6,5,4,7', '2026-05-10 21:30:29'),
(1148, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, ',2,8,1,3,6,5,4,7', '2026-05-10 21:30:30'),
(1149, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '2,,8,1,3,6,5,4,7', '2026-05-10 21:30:30'),
(1150, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '2,3,8,1,,6,5,4,7', '2026-05-10 21:30:31'),
(1151, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '2,3,8,1,6,,5,4,7', '2026-05-10 21:30:31'),
(1152, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '2,3,,1,6,8,5,4,7', '2026-05-10 21:30:31'),
(1153, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '2,,3,1,6,8,5,4,7', '2026-05-10 21:30:32'),
(1154, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, ',2,3,1,6,8,5,4,7', '2026-05-10 21:30:32'),
(1155, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,,6,8,5,4,7', '2026-05-10 21:30:33'),
(1156, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,6,,8,5,4,7', '2026-05-10 21:30:33'),
(1157, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,6,4,8,5,,7', '2026-05-10 21:30:34'),
(1158, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,6,4,8,,5,7', '2026-05-10 21:30:35'),
(1159, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,,4,8,6,5,7', '2026-05-10 21:30:35'),
(1160, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,,8,6,5,7', '2026-05-10 21:30:36'),
(1161, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,5,8,6,,7', '2026-05-10 21:30:36'),
(1162, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,5,8,,6,7', '2026-05-10 21:30:36'),
(1163, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,,5,8,4,6,7', '2026-05-10 21:30:37'),
(1164, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,5,,8,4,6,7', '2026-05-10 21:30:37'),
(1165, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,5,6,8,4,,7', '2026-05-10 21:30:38'),
(1166, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,5,6,8,4,7,', '2026-05-10 21:30:38'),
(1167, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,5,6,,4,7,8', '2026-05-10 21:30:39'),
(1168, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,5,,6,4,7,8', '2026-05-10 21:30:39'),
(1169, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,,5,6,4,7,8', '2026-05-10 21:30:40'),
(1170, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,5,6,,7,8', '2026-05-10 21:30:40'),
(1171, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,5,6,7,,8', '2026-05-10 21:30:40'),
(1172, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 313, '1,2,3,4,5,6,7,8,', '2026-05-10 21:30:41'),
(1173, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,8,,5,6,1,7,4', '2026-05-10 21:32:08'),
(1174, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,8,1,5,6,,7,4', '2026-05-10 21:32:08'),
(1175, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,8,1,5,6,7,,4', '2026-05-10 21:32:09'),
(1176, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,8,1,,6,7,5,4', '2026-05-10 21:32:11'),
(1177, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,8,1,6,,7,5,4', '2026-05-10 21:32:12'),
(1178, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,3,,1,6,8,7,5,4', '2026-05-10 21:32:12'),
(1179, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '2,,3,1,6,8,7,5,4', '2026-05-10 21:32:12'),
(1180, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,6,8,4,7,,5', '2026-05-10 21:32:15'),
(1181, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, ',2,3,1,6,8,7,5,4', '2026-05-10 21:32:15'),
(1182, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,6,8,,7,5,4', '2026-05-10 21:32:15'),
(1183, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,,6,8,7,5,4', '2026-05-10 21:32:15'),
(1184, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,6,,8,7,5,4', '2026-05-10 21:32:15'),
(1185, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,6,8,4,7,5,', '2026-05-10 21:32:15'),
(1186, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,6,8,4,,7,5', '2026-05-10 21:32:15'),
(1187, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,,8,4,6,7,5', '2026-05-10 21:32:16'),
(1188, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,8,,4,6,7,5', '2026-05-10 21:32:16'),
(1189, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,8,4,,6,7,5', '2026-05-10 21:32:16'),
(1190, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,8,4,5,6,7,', '2026-05-10 21:32:17'),
(1191, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,8,4,5,6,,7', '2026-05-10 21:32:17'),
(1192, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,8,4,5,,6,7', '2026-05-10 21:32:18'),
(1193, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,,4,5,8,6,7', '2026-05-10 21:32:18'),
(1194, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,,5,8,6,7', '2026-05-10 21:32:19'),
(1195, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,,8,6,7', '2026-05-10 21:32:19'),
(1196, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,7,8,6,', '2026-05-10 21:32:19'),
(1197, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,7,8,,6', '2026-05-10 21:32:20'),
(1198, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,7,,8,6', '2026-05-10 21:32:20'),
(1199, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,,5,7,4,8,6', '2026-05-10 21:32:20'),
(1200, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,5,,7,4,8,6', '2026-05-10 21:32:21'),
(1201, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,5,7,,4,8,6', '2026-05-10 21:32:21'),
(1202, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,5,7,6,4,8,', '2026-05-10 21:32:21'),
(1203, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,5,7,6,4,,8', '2026-05-10 21:32:22'),
(1204, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,5,,6,4,7,8', '2026-05-10 21:32:22'),
(1205, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,,5,6,4,7,8', '2026-05-10 21:32:23'),
(1206, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,6,,7,8', '2026-05-10 21:32:23'),
(1207, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,6,7,,8', '2026-05-10 21:32:23'),
(1208, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 314, '1,2,3,4,5,6,7,8,', '2026-05-10 21:32:24'),
(1209, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '2,,8,4,1,6,7,5,3', '2026-05-10 21:35:10'),
(1210, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '2,1,8,4,,6,7,5,3', '2026-05-10 21:35:10'),
(1211, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '2,1,8,,4,6,7,5,3', '2026-05-10 21:35:11'),
(1212, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, ',1,8,2,4,6,7,5,3', '2026-05-10 21:35:11'),
(1213, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,,8,2,4,6,7,5,3', '2026-05-10 21:35:12'),
(1214, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,4,8,2,,6,7,5,3', '2026-05-10 21:35:12'),
(1215, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,4,8,,2,6,7,5,3', '2026-05-10 21:35:12'),
(1216, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, ',4,8,1,2,6,7,5,3', '2026-05-10 21:35:13'),
(1217, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,,8,1,2,6,7,5,3', '2026-05-10 21:35:13'),
(1218, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,2,8,1,,6,7,5,3', '2026-05-10 21:35:14'),
(1219, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,2,8,1,6,,7,5,3', '2026-05-10 21:35:14'),
(1220, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,2,8,1,6,3,7,5,', '2026-05-10 21:35:14'),
(1221, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,2,8,1,6,3,7,,5', '2026-05-10 21:35:15'),
(1222, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,2,8,1,,3,7,6,5', '2026-05-10 21:35:15'),
(1223, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,,8,1,2,3,7,6,5', '2026-05-10 21:35:15'),
(1224, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,,1,2,3,7,6,5', '2026-05-10 21:35:16'),
(1225, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,3,1,2,,7,6,5', '2026-05-10 21:35:16'),
(1226, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,3,1,2,5,7,6,', '2026-05-10 21:35:17'),
(1227, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,3,1,2,5,7,,6', '2026-05-10 21:35:17'),
(1228, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,3,1,2,5,,7,6', '2026-05-10 21:35:17'),
(1229, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,3,,2,5,1,7,6', '2026-05-10 21:35:18'),
(1230, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, ',8,3,4,2,5,1,7,6', '2026-05-10 21:35:18'),
(1231, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '8,,3,4,2,5,1,7,6', '2026-05-10 21:35:18'),
(1232, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '8,2,3,4,,5,1,7,6', '2026-05-10 21:35:19'),
(1233, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '8,2,3,4,5,,1,7,6', '2026-05-10 21:35:19'),
(1234, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '8,2,,4,5,3,1,7,6', '2026-05-10 21:35:19'),
(1235, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '8,,2,4,5,3,1,7,6', '2026-05-10 21:35:20'),
(1236, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, ',8,2,4,5,3,1,7,6', '2026-05-10 21:35:20'),
(1237, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,2,,5,3,1,7,6', '2026-05-10 21:35:20'),
(1238, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,2,1,5,3,,7,6', '2026-05-10 21:35:21'),
(1239, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,2,1,5,3,7,,6', '2026-05-10 21:35:21'),
(1240, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,8,2,1,,3,7,5,6', '2026-05-10 21:35:21'),
(1241, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '4,,2,1,8,3,7,5,6', '2026-05-10 21:35:22'),
(1242, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, ',4,2,1,8,3,7,5,6', '2026-05-10 21:35:22'),
(1243, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,4,2,,8,3,7,5,6', '2026-05-10 21:35:22'),
(1244, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,4,2,8,,3,7,5,6', '2026-05-10 21:35:23'),
(1245, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,,2,8,4,3,7,5,6', '2026-05-10 21:35:23'),
(1246, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,,8,4,3,7,5,6', '2026-05-10 21:35:23'),
(1247, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,8,4,,7,5,6', '2026-05-10 21:35:24'),
(1248, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,8,4,6,7,5,', '2026-05-10 21:35:25'),
(1249, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,8,4,6,7,,5', '2026-05-10 21:35:25'),
(1250, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,8,4,6,,7,5', '2026-05-10 21:35:25'),
(1251, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,,4,6,8,7,5', '2026-05-10 21:35:26'),
(1252, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,,6,8,7,5', '2026-05-10 21:35:26'),
(1253, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,6,,8,7,5', '2026-05-10 21:35:27'),
(1254, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,6,5,8,7,', '2026-05-10 21:35:27'),
(1255, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,6,5,8,,7', '2026-05-10 21:35:27'),
(1256, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,,5,8,6,7', '2026-05-10 21:35:28'),
(1257, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,,8,6,7', '2026-05-10 21:35:29'),
(1258, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,7,8,6,', '2026-05-10 21:35:29'),
(1259, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,7,8,,6', '2026-05-10 21:35:29'),
(1260, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,7,,8,6', '2026-05-10 21:35:30'),
(1261, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,,5,7,4,8,6', '2026-05-10 21:35:30'),
(1262, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,5,,7,4,8,6', '2026-05-10 21:35:30'),
(1263, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,5,7,,4,8,6', '2026-05-10 21:35:31'),
(1264, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,5,7,6,4,8,', '2026-05-10 21:35:31'),
(1265, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,5,7,6,4,,8', '2026-05-10 21:35:31'),
(1266, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,5,,6,4,7,8', '2026-05-10 21:35:32'),
(1267, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,,5,6,4,7,8', '2026-05-10 21:35:32'),
(1268, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,6,,7,8', '2026-05-10 21:35:32'),
(1269, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,6,7,,8', '2026-05-10 21:35:33'),
(1270, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 315, '1,2,3,4,5,6,7,8,', '2026-05-10 21:35:33'),
(1271, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,,6,4,3,2,5,1,8', '2026-05-10 21:37:52'),
(1272, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,,4,3,2,5,1,8', '2026-05-10 21:37:53'),
(1273, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,2,4,3,,5,1,8', '2026-05-10 21:37:53'),
(1274, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,2,4,,3,5,1,8', '2026-05-10 21:37:54'),
(1275, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,2,4,1,3,5,,8', '2026-05-10 21:37:54'),
(1276, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,2,4,1,3,,5,8', '2026-05-10 21:37:54'),
(1277, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '7,6,2,,1,3,4,5,8', '2026-05-10 21:37:55'),
(1278, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, ',6,2,7,1,3,4,5,8', '2026-05-10 21:37:55'),
(1279, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '6,,2,7,1,3,4,5,8', '2026-05-10 21:37:56'),
(1280, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '6,1,2,7,,3,4,5,8', '2026-05-10 21:37:56'),
(1281, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '6,1,2,,7,3,4,5,8', '2026-05-10 21:37:57'),
(1282, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, ',1,2,6,7,3,4,5,8', '2026-05-10 21:37:57'),
(1283, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,,2,6,7,3,4,5,8', '2026-05-10 21:37:57'),
(1284, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,,6,7,3,4,5,8', '2026-05-10 21:37:58'),
(1285, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,6,7,,4,5,8', '2026-05-10 21:37:58'),
(1286, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,6,,7,4,5,8', '2026-05-10 21:37:58'),
(1287, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,,6,7,4,5,8', '2026-05-10 21:37:59'),
(1288, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,6,7,,5,8', '2026-05-10 21:37:59'),
(1289, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,6,7,5,,8', '2026-05-10 21:38:00'),
(1290, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,6,7,5,8,', '2026-05-10 21:38:02'),
(1291, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,6,,5,8,7', '2026-05-10 21:38:03'),
(1292, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,,6,5,8,7', '2026-05-10 21:38:03'),
(1293, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,8,6,5,,7', '2026-05-10 21:38:03'),
(1294, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,8,6,,5,7', '2026-05-10 21:38:04'),
(1295, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,,8,6,4,5,7', '2026-05-10 21:38:04'),
(1296, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,8,,6,4,5,7', '2026-05-10 21:38:04'),
(1297, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,8,5,6,4,,7', '2026-05-10 21:38:04'),
(1298, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,8,5,6,4,7,', '2026-05-10 21:38:05'),
(1299, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,8,5,,4,7,6', '2026-05-10 21:38:05'),
(1300, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,8,,5,4,7,6', '2026-05-10 21:38:05'),
(1301, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,,8,5,4,7,6', '2026-05-10 21:38:06'),
(1302, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,8,5,,7,6', '2026-05-10 21:38:07'),
(1303, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,8,5,7,,6', '2026-05-10 21:38:08'),
(1304, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,,5,7,8,6', '2026-05-10 21:38:08'),
(1305, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,5,,7,8,6', '2026-05-10 21:38:08'),
(1306, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 316, '1,2,3,4,5,6,7,8,', '2026-05-10 21:38:09'),
(1307, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,6,,2,8,1,7,5', '2026-05-10 21:40:00'),
(1308, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,6,1,2,8,,7,5', '2026-05-10 21:40:00'),
(1309, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,6,1,2,8,7,,5', '2026-05-10 21:40:00'),
(1310, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,6,1,2,8,7,5,', '2026-05-10 21:40:01'),
(1311, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,6,1,2,,7,5,8', '2026-05-10 21:40:01'),
(1312, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,4,,1,2,6,7,5,8', '2026-05-10 21:40:03'),
(1313, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '3,,4,1,2,6,7,5,8', '2026-05-10 21:40:03'),
(1314, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, ',3,4,1,2,6,7,5,8', '2026-05-10 21:40:04'),
(1315, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,4,,2,6,7,5,8', '2026-05-10 21:40:04'),
(1316, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,4,7,2,6,,5,8', '2026-05-10 21:40:05'),
(1317, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,4,7,2,6,5,,8', '2026-05-10 21:40:05'),
(1318, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,4,7,2,6,5,8,', '2026-05-10 21:40:06'),
(1319, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,4,7,2,,5,8,6', '2026-05-10 21:40:06'),
(1320, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,3,,7,2,4,5,8,6', '2026-05-10 21:40:06'),
(1321, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,,3,7,2,4,5,8,6', '2026-05-10 21:40:07'),
(1322, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,7,,4,5,8,6', '2026-05-10 21:40:07'),
(1323, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,7,4,,5,8,6', '2026-05-10 21:40:08'),
(1324, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,7,4,6,5,8,', '2026-05-10 21:40:08'),
(1325, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,7,4,6,5,,8', '2026-05-10 21:40:08'),
(1326, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,7,4,6,,5,8', '2026-05-10 21:40:09'),
(1327, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,,4,6,7,5,8', '2026-05-10 21:40:09'),
(1328, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,4,,6,7,5,8', '2026-05-10 21:40:09'),
(1329, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,4,5,6,7,,8', '2026-05-10 21:40:10'),
(1330, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 317, '1,2,3,4,5,6,7,8,', '2026-05-10 21:40:10'),
(1331, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,8,5,,2,3,1,4,6', '2026-05-10 21:44:29'),
(1332, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,8,5,1,2,3,,4,6', '2026-05-10 21:44:30'),
(1333, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,8,5,1,2,3,4,,6', '2026-05-10 21:44:30'),
(1334, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,8,5,1,,3,4,2,6', '2026-05-10 21:44:30'),
(1335, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,,5,1,8,3,4,2,6', '2026-05-10 21:44:31'),
(1336, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, ',7,5,1,8,3,4,2,6', '2026-05-10 21:44:31'),
(1337, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,5,,8,3,4,2,6', '2026-05-10 21:44:31'),
(1338, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,5,8,,3,4,2,6', '2026-05-10 21:44:32'),
(1339, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,5,8,2,3,4,,6', '2026-05-10 21:44:32'),
(1340, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,5,8,2,3,,4,6', '2026-05-10 21:44:33'),
(1341, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,5,,2,3,8,4,6', '2026-05-10 21:44:33'),
(1342, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, ',7,5,1,2,3,8,4,6', '2026-05-10 21:44:34'),
(1343, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,,5,1,2,3,8,4,6', '2026-05-10 21:44:34'),
(1344, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,2,5,1,,3,8,4,6', '2026-05-10 21:44:35'),
(1345, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,2,5,1,3,,8,4,6', '2026-05-10 21:44:35'),
(1346, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,2,,1,3,5,8,4,6', '2026-05-10 21:44:35'),
(1347, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '7,,2,1,3,5,8,4,6', '2026-05-10 21:44:36'),
(1348, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, ',7,2,1,3,5,8,4,6', '2026-05-10 21:44:36'),
(1349, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,2,,3,5,8,4,6', '2026-05-10 21:44:37'),
(1350, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,7,2,3,,5,8,4,6', '2026-05-10 21:44:37'),
(1351, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,,2,3,7,5,8,4,6', '2026-05-10 21:44:37'),
(1352, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,,3,7,5,8,4,6', '2026-05-10 21:44:38'),
(1353, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,5,3,7,,8,4,6', '2026-05-10 21:44:38'),
(1354, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,5,3,,7,8,4,6', '2026-05-10 21:44:38'),
(1355, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,5,,3,7,8,4,6', '2026-05-10 21:44:39'),
(1356, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, ',2,5,1,3,7,8,4,6', '2026-05-10 21:44:40'),
(1357, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '2,,5,1,3,7,8,4,6', '2026-05-10 21:44:40'),
(1358, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '2,3,5,1,,7,8,4,6', '2026-05-10 21:44:40'),
(1359, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '2,3,5,1,7,,8,4,6', '2026-05-10 21:44:40'),
(1360, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '2,3,,1,7,5,8,4,6', '2026-05-10 21:44:41'),
(1361, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '2,,3,1,7,5,8,4,6', '2026-05-10 21:44:41'),
(1362, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, ',2,3,1,7,5,8,4,6', '2026-05-10 21:44:41'),
(1363, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,,7,5,8,4,6', '2026-05-10 21:44:42'),
(1364, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,7,,5,8,4,6', '2026-05-10 21:44:42'),
(1365, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,7,4,5,8,,6', '2026-05-10 21:44:43'),
(1366, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,7,4,5,,8,6', '2026-05-10 21:44:43'),
(1367, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,,4,5,7,8,6', '2026-05-10 21:44:43'),
(1368, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,4,,5,7,8,6', '2026-05-10 21:44:44'),
(1369, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,4,5,,7,8,6', '2026-05-10 21:44:44'),
(1370, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, 318, '1,2,3,4,5,6,7,8,', '2026-05-10 21:44:45'),
(1371, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,5,,2,3,1,4,6', '2026-05-10 21:44:50'),
(1372, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,5,1,2,3,,4,6', '2026-05-10 21:44:50'),
(1373, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,5,1,2,3,4,,6', '2026-05-10 21:44:51'),
(1374, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,5,1,2,3,4,6,', '2026-05-10 21:44:52'),
(1375, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,5,1,2,,4,6,3', '2026-05-10 21:44:52'),
(1376, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,8,,1,2,5,4,6,3', '2026-05-10 21:44:52'),
(1377, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '7,,8,1,2,5,4,6,3', '2026-05-10 21:44:53'),
(1378, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, ',7,8,1,2,5,4,6,3', '2026-05-10 21:44:53'),
(1379, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,8,,2,5,4,6,3', '2026-05-10 21:44:53'),
(1380, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,8,4,2,5,,6,3', '2026-05-10 21:44:54'),
(1381, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,8,4,2,5,6,,3', '2026-05-10 21:44:54'),
(1382, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,8,4,2,5,6,3,', '2026-05-10 21:44:55'),
(1383, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,8,4,2,,6,3,5', '2026-05-10 21:44:55'),
(1384, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,7,,4,2,8,6,3,5', '2026-05-10 21:44:55'),
(1385, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,,7,4,2,8,6,3,5', '2026-05-10 21:44:56'),
(1386, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,7,4,,8,6,3,5', '2026-05-10 21:44:56'),
(1387, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,7,4,3,8,6,,5', '2026-05-10 21:44:57'),
(1388, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,7,4,3,8,,6,5', '2026-05-10 21:44:57'),
(1389, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,7,,3,8,4,6,5', '2026-05-10 21:44:58'),
(1390, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, ',2,7,1,3,8,4,6,5', '2026-05-10 21:44:58'),
(1391, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '2,,7,1,3,8,4,6,5', '2026-05-10 21:44:58'),
(1392, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '2,3,7,1,,8,4,6,5', '2026-05-10 21:44:59'),
(1393, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '2,3,7,1,8,,4,6,5', '2026-05-10 21:44:59'),
(1394, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '2,3,,1,8,7,4,6,5', '2026-05-10 21:45:00'),
(1395, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '2,,3,1,8,7,4,6,5', '2026-05-10 21:45:00'),
(1396, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, ',2,3,1,8,7,4,6,5', '2026-05-10 21:45:00'),
(1397, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,,8,7,4,6,5', '2026-05-10 21:45:01'),
(1398, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,8,7,,6,5', '2026-05-10 21:45:01'),
(1399, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,8,7,6,,5', '2026-05-10 21:45:01'),
(1400, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,,7,6,8,5', '2026-05-10 21:45:02'),
(1401, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,7,,6,8,5', '2026-05-10 21:45:02'),
(1402, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,7,5,6,8,', '2026-05-10 21:45:02'),
(1403, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,7,5,6,,8', '2026-05-10 21:45:03'),
(1404, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,,5,6,7,8', '2026-05-10 21:45:04'),
(1405, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,,6,7,8', '2026-05-10 21:45:04'),
(1406, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,8,6,7,', '2026-05-10 21:45:04'),
(1407, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,8,6,,7', '2026-05-10 21:45:05'),
(1408, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,8,,6,7', '2026-05-10 21:45:06'),
(1409, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,,5,8,4,6,7', '2026-05-10 21:45:06'),
(1410, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,5,,8,4,6,7', '2026-05-10 21:45:06'),
(1411, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,5,6,8,4,,7', '2026-05-10 21:45:07'),
(1412, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,5,6,8,4,7,', '2026-05-10 21:45:07'),
(1413, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,5,6,,4,7,8', '2026-05-10 21:45:07'),
(1414, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,5,,6,4,7,8', '2026-05-10 21:45:08'),
(1415, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,,5,6,4,7,8', '2026-05-10 21:45:08'),
(1416, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,6,,7,8', '2026-05-10 21:45:08'),
(1417, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,6,7,,8', '2026-05-10 21:45:09'),
(1418, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 318, '1,2,3,4,5,6,7,8,', '2026-05-10 21:45:09'),
(1419, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,,5,2,1,6,3,4,7', '2026-06-01 20:16:58'),
(1420, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,2,,6,3,4,7', '2026-06-01 20:16:58'),
(1421, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,,2,6,3,4,7', '2026-06-01 20:16:59'),
(1422, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,3,2,6,,4,7', '2026-06-01 20:17:00'),
(1423, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,3,2,6,4,,7', '2026-06-01 20:17:01'),
(1424, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,3,2,6,4,7,', '2026-06-01 20:17:03'),
(1425, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,3,2,,4,7,6', '2026-06-01 20:17:03'),
(1426, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,3,,2,4,7,6', '2026-06-01 20:17:03'),
(1427, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '8,1,5,,3,2,4,7,6', '2026-06-01 20:17:04'),
(1428, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, ',1,5,8,3,2,4,7,6', '2026-06-01 20:17:05'),
(1429, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,,5,8,3,2,4,7,6', '2026-06-01 20:17:05'),
(1430, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,5,,8,3,2,4,7,6', '2026-06-01 20:17:06'),
(1431, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,5,2,8,3,,4,7,6', '2026-06-01 20:17:06'),
(1432, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,5,2,8,,3,4,7,6', '2026-06-01 20:17:07'),
(1433, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,,2,8,5,3,4,7,6', '2026-06-01 20:17:07'),
(1434, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,,8,5,3,4,7,6', '2026-06-01 20:17:07'),
(1435, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,8,5,,4,7,6', '2026-06-01 20:17:08'),
(1436, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,8,,5,4,7,6', '2026-06-01 20:17:08'),
(1437, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,,8,5,4,7,6', '2026-06-01 20:17:09'),
(1438, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,4,8,5,,7,6', '2026-06-01 20:17:09'),
(1439, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,4,8,5,7,,6', '2026-06-01 20:17:09'),
(1440, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,4,,5,7,8,6', '2026-06-01 20:17:10'),
(1441, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,4,5,,7,8,6', '2026-06-01 20:17:10'),
(1442, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 298, '1,2,3,4,5,6,7,8,', '2026-06-01 20:17:11'),
(1443, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,6,8,4,2,1,3,,5', '2026-06-01 20:17:37'),
(1444, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,6,8,4,,1,3,2,5', '2026-06-01 20:17:38'),
(1445, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,,8,4,6,1,3,2,5', '2026-06-01 20:17:38'),
(1446, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,,4,6,1,3,2,5', '2026-06-01 20:17:39'),
(1447, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,1,4,6,,3,2,5', '2026-06-01 20:17:39'),
(1448, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,1,4,,6,3,2,5', '2026-06-01 20:17:40'),
(1449, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,1,4,2,6,3,,5', '2026-06-01 20:17:40'),
(1450, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,1,4,2,6,,3,5', '2026-06-01 20:17:41'),
(1451, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '7,8,1,,2,6,4,3,5', '2026-06-01 20:17:41'),
(1452, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, ',8,1,7,2,6,4,3,5', '2026-06-01 20:17:42'),
(1453, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,,1,7,2,6,4,3,5', '2026-06-01 20:17:42'),
(1454, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,,7,2,6,4,3,5', '2026-06-01 20:17:43'),
(1455, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,6,7,2,,4,3,5', '2026-06-01 20:17:43'),
(1456, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,6,7,,2,4,3,5', '2026-06-01 20:17:45'),
(1457, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,6,7,3,2,4,,5', '2026-06-01 20:17:46'),
(1458, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,6,7,3,2,,4,5', '2026-06-01 20:17:46'),
(1459, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '8,1,6,,3,2,7,4,5', '2026-06-01 20:17:46'),
(1460, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, ',1,6,8,3,2,7,4,5', '2026-06-01 20:17:47'),
(1461, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,,6,8,3,2,7,4,5', '2026-06-01 20:17:47'),
(1462, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,6,,8,3,2,7,4,5', '2026-06-01 20:17:48'),
(1463, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,6,2,8,3,,7,4,5', '2026-06-01 20:17:48'),
(1464, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,6,2,8,,3,7,4,5', '2026-06-01 20:17:49'),
(1465, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,,2,8,6,3,7,4,5', '2026-06-01 20:17:49'),
(1466, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,,8,6,3,7,4,5', '2026-06-01 20:17:50'),
(1467, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,8,6,,7,4,5', '2026-06-01 20:17:50'),
(1468, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,8,,6,7,4,5', '2026-06-01 20:17:50'),
(1469, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,8,4,6,7,,5', '2026-06-01 20:17:51'),
(1470, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,8,4,6,,7,5', '2026-06-01 20:17:51'),
(1471, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,,4,6,8,7,5', '2026-06-01 20:17:52'),
(1472, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,,6,8,7,5', '2026-06-01 20:17:52'),
(1473, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,6,,8,7,5', '2026-06-01 20:17:53'),
(1474, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,6,5,8,7,', '2026-06-01 20:17:53'),
(1475, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,6,5,8,,7', '2026-06-01 20:17:53'),
(1476, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,,5,8,6,7', '2026-06-01 20:17:54'),
(1477, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,,8,6,7', '2026-06-01 20:17:54'),
(1478, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,7,8,6,', '2026-06-01 20:17:55'),
(1479, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,7,8,,6', '2026-06-01 20:17:55'),
(1480, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,7,,8,6', '2026-06-01 20:17:55'),
(1481, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,,5,7,4,8,6', '2026-06-01 20:17:56'),
(1482, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,5,,7,4,8,6', '2026-06-01 20:17:56'),
(1483, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,5,7,,4,8,6', '2026-06-01 20:17:57'),
(1484, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,5,7,6,4,8,', '2026-06-01 20:17:57'),
(1485, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,5,7,6,4,,8', '2026-06-01 20:17:58'),
(1486, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,5,,6,4,7,8', '2026-06-01 20:17:58'),
(1487, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,,5,6,4,7,8', '2026-06-01 20:17:58'),
(1488, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,6,,7,8', '2026-06-01 20:17:59'),
(1489, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,6,7,,8', '2026-06-01 20:17:59'),
(1490, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 320, '1,2,3,4,5,6,7,8,', '2026-06-01 20:18:00'),
(1491, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '4,6,2,,8,7,3,1,5', '2026-06-01 20:18:23'),
(1492, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '4,6,2,8,,7,3,1,5', '2026-06-01 20:18:24'),
(1493, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '4,6,2,8,1,7,3,,5', '2026-06-01 20:18:24'),
(1494, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '4,6,2,8,1,7,,3,5', '2026-06-01 20:18:25'),
(1495, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '4,6,2,,1,7,8,3,5', '2026-06-01 20:18:25'),
(1496, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, ',6,2,4,1,7,8,3,5', '2026-06-01 20:18:26'),
(1497, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '6,,2,4,1,7,8,3,5', '2026-06-01 20:18:26'),
(1498, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '6,1,2,4,,7,8,3,5', '2026-06-01 20:18:27'),
(1499, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '6,1,2,4,3,7,8,,5', '2026-06-01 20:18:27'),
(1500, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '6,1,2,4,3,7,,8,5', '2026-06-01 20:18:27'),
(1501, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '6,1,2,,3,7,4,8,5', '2026-06-01 20:18:28'),
(1502, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, ',1,2,6,3,7,4,8,5', '2026-06-01 20:18:29'),
(1503, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,,2,6,3,7,4,8,5', '2026-06-01 20:18:29'),
(1504, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,,6,3,7,4,8,5', '2026-06-01 20:18:30'),
(1505, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,7,6,3,,4,8,5', '2026-06-01 20:18:30'),
(1506, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,7,6,,3,4,8,5', '2026-06-01 20:18:31'),
(1507, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,7,,6,3,4,8,5', '2026-06-01 20:18:32'),
(1508, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,7,4,6,3,,8,5', '2026-06-01 20:18:32'),
(1509, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,7,,6,3,4,8,5', '2026-06-01 20:18:33'),
(1510, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, ',2,7,1,6,3,4,8,5', '2026-06-01 20:18:34'),
(1511, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '2,,7,1,6,3,4,8,5', '2026-06-01 20:18:34'),
(1512, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '2,7,,1,6,3,4,8,5', '2026-06-01 20:18:35'),
(1513, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '2,7,3,1,6,,4,8,5', '2026-06-01 20:18:35'),
(1514, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '2,7,3,1,,6,4,8,5', '2026-06-01 20:18:35'),
(1515, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '2,,3,1,7,6,4,8,5', '2026-06-01 20:18:36'),
(1516, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, ',2,3,1,7,6,4,8,5', '2026-06-01 20:18:36'),
(1517, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,,7,6,4,8,5', '2026-06-01 20:18:37'),
(1518, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,7,6,,8,5', '2026-06-01 20:18:37'),
(1519, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,7,6,8,,5', '2026-06-01 20:18:39'),
(1520, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,,6,8,7,5', '2026-06-01 20:18:39'),
(1521, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,6,,8,7,5', '2026-06-01 20:18:40'),
(1522, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,6,5,8,7,', '2026-06-01 20:18:40'),
(1523, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,6,5,8,,7', '2026-06-01 20:18:41'),
(1524, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,,5,8,6,7', '2026-06-01 20:18:41'),
(1525, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,,8,6,7', '2026-06-01 20:18:41'),
(1526, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,7,8,6,', '2026-06-01 20:18:42'),
(1527, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,7,8,,6', '2026-06-01 20:18:42'),
(1528, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,7,,8,6', '2026-06-01 20:18:43'),
(1529, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,,5,7,4,8,6', '2026-06-01 20:18:43'),
(1530, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,5,,7,4,8,6', '2026-06-01 20:18:44'),
(1531, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,5,7,,4,8,6', '2026-06-01 20:18:44'),
(1532, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,5,7,6,4,8,', '2026-06-01 20:18:45'),
(1533, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,5,7,6,4,,8', '2026-06-01 20:18:45'),
(1534, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,5,,6,4,7,8', '2026-06-01 20:18:46'),
(1535, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,,5,6,4,7,8', '2026-06-01 20:18:46'),
(1536, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,6,,7,8', '2026-06-01 20:18:46'),
(1537, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,6,7,,8', '2026-06-01 20:18:47'),
(1538, 'b4277391-f194-4608-8410-7a448a4b906f', 0, 321, '1,2,3,4,5,6,7,8,', '2026-06-01 20:18:47');

-- --------------------------------------------------------

--
-- Table structure for table `game_rewards`
--

CREATE TABLE `game_rewards` (
  `id` int(11) NOT NULL,
  `minimum_players` int(11) NOT NULL,
  `reward` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `game_rewards`
--

INSERT INTO `game_rewards` (`id`, `minimum_players`, `reward`) VALUES
(1, 1, 0),
(2, 2, 32),
(3, 3, 48),
(4, 4, 64),
(5, 5, 80),
(6, 6, 96),
(7, 7, 112),
(8, 8, 128),
(9, 9, 144),
(10, 10, 160),
(11, 15, 240),
(12, 20, 320),
(13, 30, 480),
(14, 40, 640),
(15, 80, 1280);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `browser_uuid` mediumtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `game_id`, `browser_uuid`, `user_id`, `created_at`, `deleted`) VALUES
(1, 1, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-09 00:17:39', 0),
(2, 2, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-09 00:21:39', 0),
(3, 3, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 0, '2026-05-09 00:23:01', 0),
(4, 4, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 0, '2026-05-09 00:41:04', 0),
(5, 5, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-09 00:43:52', 0),
(6, 6, 'c75dbef4-ab86-44e6-af96-3105d4d01ba7', 0, '2026-05-09 00:44:36', 0),
(7, 7, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 01:25:49', 0),
(8, 8, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 01:27:30', 0),
(9, 9, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 01:29:35', 0),
(10, 10, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:08:42', 0),
(11, 11, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:12:04', 0),
(12, 12, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:58:09', 0),
(13, 13, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:03:08', 0),
(14, 14, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:03:37', 0),
(15, 15, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 18:47:53', 0),
(16, 16, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 18:51:31', 0),
(17, 17, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 18:52:45', 0),
(18, 18, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 18:55:17', 0),
(19, 19, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 18:56:30', 0),
(20, 20, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 19:00:38', 0),
(21, 21, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 19:01:34', 0),
(22, 22, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 19:02:26', 0),
(23, 23, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 19:04:01', 0),
(24, 24, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:03:00', 0),
(25, 25, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:03:50', 0),
(26, 26, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 20:05:06', 0),
(27, 299, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:18:43', 0),
(28, 313, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:30:03', 0),
(29, 314, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:31:35', 0),
(30, 315, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:32:58', 0),
(31, 316, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:37:33', 0),
(32, 317, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:38:14', 0),
(33, 318, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-05-10 21:40:52', 0),
(34, 318, 'bfb93d74-2e85-4dc2-b96f-ced18b388573', 0, '2026-05-10 21:44:12', 0),
(35, 298, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-06-01 23:16:37', 0),
(36, 320, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-06-01 23:17:20', 0),
(37, 321, 'b4277391-f194-4608-8410-7a448a4b906f', 0, '2026-06-01 23:18:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `duration_id` int(11) NOT NULL,
  `max_tournaments` int(11) NOT NULL,
  `suspended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `cost`, `duration_id`, `max_tournaments`, `suspended`) VALUES
(1, 1, 9, 5, 0),
(2, 2, 10, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_durations`
--

CREATE TABLE `subscription_durations` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `seconds` int(11) NOT NULL,
  `suspended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_durations`
--

INSERT INTO `subscription_durations` (`id`, `name`, `seconds`, `suspended`) VALUES
(1, '1 hour', 60, 1),
(2, '1 day', 86400, 1),
(4, '2 days', 172800, 1),
(5, '3 days', 259200, 1),
(6, '4 days', 345600, 1),
(7, '5 days', 432000, 1),
(8, '6 days', 518400, 1),
(9, '1 week', 604800, 0),
(10, '2 weeks', 1209600, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bought_subscriptions`
--
ALTER TABLE `bought_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `browsers_uuid`
--
ALTER TABLE `browsers_uuid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_moves`
--
ALTER TABLE `game_moves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_rewards`
--
ALTER TABLE `game_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_durations`
--
ALTER TABLE `subscription_durations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bought_subscriptions`
--
ALTER TABLE `bought_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `browsers_uuid`
--
ALTER TABLE `browsers_uuid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crypto_payments`
--
ALTER TABLE `crypto_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `game_moves`
--
ALTER TABLE `game_moves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1539;

--
-- AUTO_INCREMENT for table `game_rewards`
--
ALTER TABLE `game_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscription_durations`
--
ALTER TABLE `subscription_durations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `totomall`
--
CREATE DATABASE IF NOT EXISTS `totomall` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `totomall`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `html` longtext NOT NULL,
  `text` longtext NOT NULL,
  `delta` longtext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `html`, `text`, `delta`, `product_id`, `deleted`, `created_at`) VALUES
(1, '&lt;p&gt;Wrap your little one in love, strength, and softness.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Our &lt;strong&gt;Black Baby Wrap with Elephant Print&lt;/strong&gt; is more than just a carrierâ€”itâ€™s a symbol of powerful bonding. Made from &lt;strong&gt;100% breathable cotton&lt;/strong&gt;, this wrap provides gentle support for both you and your baby, ensuring comfort and security throughout your day.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The rich black fabric adds a timeless, versatile style, while the &lt;strong&gt;elegant elephant print at the front&lt;/strong&gt; represents wisdom, protection, and strengthâ€”everything a parent wants to pass on. Whether you&#039;re walking, nursing, or simply bonding at home, this wrap helps you stay close while keeping your hands free.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;&lt;strong&gt;Soft, stretchy, and durable 100% cotton&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Ergonomic fit&lt;/strong&gt; for newborns to toddlers (up to 35 lbs)&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Unisex design&lt;/strong&gt; â€“ perfect for moms, dads, and caregivers&lt;/li&gt;&lt;li&gt;Machine washable for everyday use&lt;/li&gt;&lt;li&gt;Compact and lightweight â€“ easy to pack and wear on the go&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Choose a baby wrap that stands for connection, strength, and simplicity. The elephant doesnâ€™t just carry its youngâ€”it protects them. Now you can too, in comfort and style.&lt;/p&gt;', 'Wrap your little one in love, strength, and softness.\n\nOur Black Baby Wrap with Elephant Print is more than just a carrierâ€”itâ€™s a symbol of powerful bonding. Made from 100% breathable cotton, this wrap provides gentle support for both you and your baby, ensuring comfort and security throughout your day.\n\nThe rich black fabric adds a timeless, versatile style, while the elegant elephant print at the front represents wisdom, protection, and strengthâ€”everything a parent wants to pass on. Whether you\'re walking, nursing, or simply bonding at home, this wrap helps you stay close while keeping your hands free.\n\nSoft, stretchy, and durable 100% cotton\nErgonomic fit for newborns to toddlers (up to 35 lbs)\nUnisex design â€“ perfect for moms, dads, and caregivers\nMachine washable for everyday use\nCompact and lightweight â€“ easy to pack and wear on the go\n\nChoose a baby wrap that stands for connection, strength, and simplicity. The elephant doesnâ€™t just carry its youngâ€”it protects them. Now you can too, in comfort and style.\n', '{\"ops\":[{\"insert\":\"Wrap your little one in love, strength, and softness.\\n\\nOur \"},{\"attributes\":{\"bold\":true},\"insert\":\"Black Baby Wrap with Elephant Print\"},{\"insert\":\" is more than just a carrierâ€”itâ€™s a symbol of powerful bonding. Made from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% breathable cotton\"},{\"insert\":\", this wrap provides gentle support for both you and your baby, ensuring comfort and security throughout your day.\\n\\nThe rich black fabric adds a timeless, versatile style, while the \"},{\"attributes\":{\"bold\":true},\"insert\":\"elegant elephant print at the front\"},{\"insert\":\" represents wisdom, protection, and strengthâ€”everything a parent wants to pass on. Whether you\'re walking, nursing, or simply bonding at home, this wrap helps you stay close while keeping your hands free.\\n\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Soft, stretchy, and durable 100% cotton\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Ergonomic fit\"},{\"insert\":\" for newborns to toddlers (up to 35 lbs)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Unisex design\"},{\"insert\":\" â€“ perfect for moms, dads, and caregivers\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Machine washable for everyday use\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Compact and lightweight â€“ easy to pack and wear on the go\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nChoose a baby wrap that stands for connection, strength, and simplicity. The elephant doesnâ€™t just carry its youngâ€”it protects them. Now you can too, in comfort and style.\\n\"}]}', 2, 0, '2025-07-24 20:14:04'),
(2, '&lt;p&gt;Carry your baby closeâ€”with style, grace, and meaning.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Our &lt;strong&gt;Black Baby Wrap with Giraffe Print&lt;/strong&gt; is thoughtfully designed for parents who value connection and comfort. Crafted from &lt;strong&gt;100% breathable cotton&lt;/strong&gt;, this wrap is soft on delicate skin, strong enough to support your baby, and gentle on your shoulders.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The bold black color pairs beautifully with the &lt;strong&gt;charming giraffe print at the front&lt;/strong&gt;â€”a symbol of grace, gentle strength, and perspective. Just like a giraffe sees far and moves with calm confidence, this wrap helps you move through your day with ease while keeping your little one safe and close.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Made from &lt;strong&gt;pure, soft, and durable 100% cotton&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Supports babies from newborn to 35 lbs&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Ergonomic and adjustable&lt;/strong&gt; fit for all body types&lt;/li&gt;&lt;li&gt;Unisex, modern design â€“ great for any caregiver&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Easy to clean&lt;/strong&gt; â€“ machine washable and fade-resistant&lt;/li&gt;&lt;li&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Whether you&#039;re cuddling at home or out exploring the world, this wrap offers a beautiful way to stay connected. Elevate your everyday routine with a baby wrap thatâ€™s as meaningful as it is functional.&lt;/p&gt;', 'Carry your baby closeâ€”with style, grace, and meaning.\n\nOur Black Baby Wrap with Giraffe Print is thoughtfully designed for parents who value connection and comfort. Crafted from 100% breathable cotton, this wrap is soft on delicate skin, strong enough to support your baby, and gentle on your shoulders.\n\nThe bold black color pairs beautifully with the charming giraffe print at the frontâ€”a symbol of grace, gentle strength, and perspective. Just like a giraffe sees far and moves with calm confidence, this wrap helps you move through your day with ease while keeping your little one safe and close.\n\nMade from pure, soft, and durable 100% cotton\nSupports babies from newborn to 35 lbs\nErgonomic and adjustable fit for all body types\nUnisex, modern design â€“ great for any caregiver\nEasy to clean â€“ machine washable and fade-resistant\n\nWhether you\'re cuddling at home or out exploring the world, this wrap offers a beautiful way to stay connected. Elevate your everyday routine with a baby wrap thatâ€™s as meaningful as it is functional.\n', '{\"ops\":[{\"insert\":\"Carry your baby closeâ€”with style, grace, and meaning.\\n\\nOur \"},{\"attributes\":{\"bold\":true},\"insert\":\"Black Baby Wrap with Giraffe Print\"},{\"insert\":\" is thoughtfully designed for parents who value connection and comfort. Crafted from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% breathable cotton\"},{\"insert\":\", this wrap is soft on delicate skin, strong enough to support your baby, and gentle on your shoulders.\\n\\nThe bold black color pairs beautifully with the \"},{\"attributes\":{\"bold\":true},\"insert\":\"charming giraffe print at the front\"},{\"insert\":\"â€”a symbol of grace, gentle strength, and perspective. Just like a giraffe sees far and moves with calm confidence, this wrap helps you move through your day with ease while keeping your little one safe and close.\\n\\nMade from \"},{\"attributes\":{\"bold\":true},\"insert\":\"pure, soft, and durable 100% cotton\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Supports babies from newborn to 35 lbs\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Ergonomic and adjustable\"},{\"insert\":\" fit for all body types\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Unisex, modern design â€“ great for any caregiver\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Easy to clean\"},{\"insert\":\" â€“ machine washable and fade-resistant\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\\n\"},{\"insert\":\"Whether you\'re cuddling at home or out exploring the world, this wrap offers a beautiful way to stay connected. Elevate your everyday routine with a baby wrap thatâ€™s as meaningful as it is functional.\\n\"}]}', 3, 0, '2025-07-24 20:17:49'),
(3, '&lt;p&gt;Built for comfort. Worn with love.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;This &lt;strong&gt;black baby wrap&lt;/strong&gt; is your everyday essential for keeping your baby close while keeping life moving. Made from &lt;strong&gt;100% natural cotton&lt;/strong&gt;, itâ€™s lightweight, breathable, and strongâ€”perfect for long cuddles, quick errands, or calming your baby on the go.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The deep black tone adds a sleek, modern touch that fits effortlessly into any outfit or setting. Itâ€™s practical, yesâ€”but itâ€™s also powerful. It creates a quiet space for your baby to feel safe, soothed, and connected to you in the most natural way possible.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Soft, sturdy &lt;strong&gt;100% cotton&lt;/strong&gt; for everyday wear&lt;/li&gt;&lt;li&gt;Suitable from newborn to 35 lbs&lt;/li&gt;&lt;li&gt;Comfortable, customizable fit for all body types&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Unisex design&lt;/strong&gt; â€“ simple, timeless, and easy to style&lt;/li&gt;&lt;li&gt;Machine washable and quick-drying for busy days&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Whether itâ€™s your first baby or your third, this wrap adapts to your rhythmâ€”helping you hold your little one close while keeping your hands free. Itâ€™s not just a carrier; itâ€™s a tool for calm, confidence, and connection.&lt;/p&gt;', 'Built for comfort. Worn with love.\n\nThis black baby wrap is your everyday essential for keeping your baby close while keeping life moving. Made from 100% natural cotton, itâ€™s lightweight, breathable, and strongâ€”perfect for long cuddles, quick errands, or calming your baby on the go.\n\nThe deep black tone adds a sleek, modern touch that fits effortlessly into any outfit or setting. Itâ€™s practical, yesâ€”but itâ€™s also powerful. It creates a quiet space for your baby to feel safe, soothed, and connected to you in the most natural way possible.\n\nSoft, sturdy 100% cotton for everyday wear\nSuitable from newborn to 35 lbs\nComfortable, customizable fit for all body types\nUnisex design â€“ simple, timeless, and easy to style\nMachine washable and quick-drying for busy days\n\nWhether itâ€™s your first baby or your third, this wrap adapts to your rhythmâ€”helping you hold your little one close while keeping your hands free. Itâ€™s not just a carrier; itâ€™s a tool for calm, confidence, and connection.\n', '{\"ops\":[{\"insert\":\"Built for comfort. Worn with love.\\n\\nThis \"},{\"attributes\":{\"bold\":true},\"insert\":\"black baby wrap\"},{\"insert\":\" is your everyday essential for keeping your baby close while keeping life moving. Made from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% natural cotton\"},{\"insert\":\", itâ€™s lightweight, breathable, and strongâ€”perfect for long cuddles, quick errands, or calming your baby on the go.\\n\\nThe deep black tone adds a sleek, modern touch that fits effortlessly into any outfit or setting. Itâ€™s practical, yesâ€”but itâ€™s also powerful. It creates a quiet space for your baby to feel safe, soothed, and connected to you in the most natural way possible.\\n\\nSoft, sturdy \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% cotton\"},{\"insert\":\" for everyday wear\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Suitable from newborn to 35 lbs\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Comfortable, customizable fit for all body types\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Unisex design\"},{\"insert\":\" â€“ simple, timeless, and easy to style\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Machine washable and quick-drying for busy days\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nWhether itâ€™s your first baby or your third, this wrap adapts to your rhythmâ€”helping you hold your little one close while keeping your hands free. Itâ€™s not just a carrier; itâ€™s a tool for calm, confidence, and connection.\\n\"}]}', 1, 0, '2025-07-24 20:39:21'),
(4, '&lt;p&gt;Inspired by the quiet strength of early mornings and the softness of first snuggles, our &lt;strong&gt;Cloud Calm Grey Baby Wrap&lt;/strong&gt; is your go-to for keeping your baby close in the most natural way.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Made from &lt;strong&gt;100% breathable cotton&lt;/strong&gt;, this wrap offers a gentle stretch that molds comfortably to both your body and your babyâ€™s, creating a secure, soothing space that feels like a second womb. The &lt;strong&gt;neutral grey tone&lt;/strong&gt; is calm and versatileâ€”subtle enough to complement any outfit, bold enough to wear with confidence.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Designed for everyday life, this wrap lets you move freely while your baby rests safely against your chest, listening to your heartbeat and feeling your warmth.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Crafted from &lt;strong&gt;pure cotton&lt;/strong&gt; â€“ soft, durable, and breathable&lt;/li&gt;&lt;li&gt;Supports infants and toddlers (up to 35 lbs)&lt;/li&gt;&lt;li&gt;Adapts to your shape for a &lt;strong&gt;custom, ergonomic fit&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Minimalist, &lt;strong&gt;gender-neutral design&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Machine washable â€“ made to handle real life&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;This wrap isnâ€™t just about carrying your baby. Itâ€™s about creating a quiet moment in a busy world. A space for closeness, connection, and calmâ€”where your baby feels at home, no matter where you are.&lt;/p&gt;', 'Inspired by the quiet strength of early mornings and the softness of first snuggles, our Cloud Calm Grey Baby Wrap is your go-to for keeping your baby close in the most natural way.\n\nMade from 100% breathable cotton, this wrap offers a gentle stretch that molds comfortably to both your body and your babyâ€™s, creating a secure, soothing space that feels like a second womb. The neutral grey tone is calm and versatileâ€”subtle enough to complement any outfit, bold enough to wear with confidence.\n\nDesigned for everyday life, this wrap lets you move freely while your baby rests safely against your chest, listening to your heartbeat and feeling your warmth.\n\nCrafted from pure cotton â€“ soft, durable, and breathable\nSupports infants and toddlers (up to 35 lbs)\nAdapts to your shape for a custom, ergonomic fit\nMinimalist, gender-neutral design\nMachine washable â€“ made to handle real life\n\nThis wrap isnâ€™t just about carrying your baby. Itâ€™s about creating a quiet moment in a busy world. A space for closeness, connection, and calmâ€”where your baby feels at home, no matter where you are.\n', '{\"ops\":[{\"insert\":\"Inspired by the quiet strength of early mornings and the softness of first snuggles, our \"},{\"attributes\":{\"bold\":true},\"insert\":\"Cloud Calm Grey Baby Wrap\"},{\"insert\":\" is your go-to for keeping your baby close in the most natural way.\\n\\nMade from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% breathable cotton\"},{\"insert\":\", this wrap offers a gentle stretch that molds comfortably to both your body and your babyâ€™s, creating a secure, soothing space that feels like a second womb. The \"},{\"attributes\":{\"bold\":true},\"insert\":\"neutral grey tone\"},{\"insert\":\" is calm and versatileâ€”subtle enough to complement any outfit, bold enough to wear with confidence.\\n\\nDesigned for everyday life, this wrap lets you move freely while your baby rests safely against your chest, listening to your heartbeat and feeling your warmth.\\n\\nCrafted from \"},{\"attributes\":{\"bold\":true},\"insert\":\"pure cotton\"},{\"insert\":\" â€“ soft, durable, and breathable\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Supports infants and toddlers (up to 35 lbs)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Adapts to your shape for a \"},{\"attributes\":{\"bold\":true},\"insert\":\"custom, ergonomic fit\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Minimalist, \"},{\"attributes\":{\"bold\":true},\"insert\":\"gender-neutral design\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Machine washable â€“ made to handle real life\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nThis wrap isnâ€™t just about carrying your baby. Itâ€™s about creating a quiet moment in a busy world. A space for closeness, connection, and calmâ€”where your baby feels at home, no matter where you are.\\n\"}]}', 4, 0, '2025-07-24 20:53:50'),
(5, '&lt;p&gt;Strong. Gentle. Unforgettable.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The &lt;strong&gt;Elephant Embrace Grey Baby Wrap&lt;/strong&gt; is inspired by one of natureâ€™s most nurturing creaturesâ€”where strength meets tenderness, and connection is everything. Made from &lt;strong&gt;100% breathable cotton&lt;/strong&gt;, this wrap is soft on your babyâ€™s skin, durable for daily wear, and designed to hold your little one close in a way that feels natural and secure.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The soft grey fabric offers timeless versatility, while the &lt;strong&gt;thoughtfully placed elephant print&lt;/strong&gt; adds a meaningful touchâ€”a symbol of protection, loyalty, and love. It&#039;s more than just a print; it&#039;s a reminder that you&#039;re building a bond that lasts a lifetime.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Crafted from &lt;strong&gt;pure, natural cotton&lt;/strong&gt; â€“ soft, strong, and breathable&lt;/li&gt;&lt;li&gt;Grows with your baby â€“ suitable from newborn up to 35 lbs&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Ergonomic support&lt;/strong&gt; for both parent and baby&lt;/li&gt;&lt;li&gt;Unisex grey color with a &lt;strong&gt;charming elephant design&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Machine washable&lt;/strong&gt; for easy care&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Whether you&#039;re calming a newborn or exploring the world with your toddler, this wrap turns everyday moments into lasting memories.&lt;/p&gt;&lt;p&gt; Let the elephant be your symbol of love that carries, supports, and stays closeâ€”just like you do.&lt;/p&gt;', 'Strong. Gentle. Unforgettable.\n\nThe Elephant Embrace Grey Baby Wrap is inspired by one of natureâ€™s most nurturing creaturesâ€”where strength meets tenderness, and connection is everything. Made from 100% breathable cotton, this wrap is soft on your babyâ€™s skin, durable for daily wear, and designed to hold your little one close in a way that feels natural and secure.\n\nThe soft grey fabric offers timeless versatility, while the thoughtfully placed elephant print adds a meaningful touchâ€”a symbol of protection, loyalty, and love. It\'s more than just a print; it\'s a reminder that you\'re building a bond that lasts a lifetime.\n\nCrafted from pure, natural cotton â€“ soft, strong, and breathable\nGrows with your baby â€“ suitable from newborn up to 35 lbs\nErgonomic support for both parent and baby\nUnisex grey color with a charming elephant design\nMachine washable for easy care\n\nWhether you\'re calming a newborn or exploring the world with your toddler, this wrap turns everyday moments into lasting memories.\n Let the elephant be your symbol of love that carries, supports, and stays closeâ€”just like you do.\n', '{\"ops\":[{\"insert\":\"Strong. Gentle. Unforgettable.\\n\\nThe \"},{\"attributes\":{\"bold\":true},\"insert\":\"Elephant Embrace Grey Baby Wrap\"},{\"insert\":\" is inspired by one of natureâ€™s most nurturing creaturesâ€”where strength meets tenderness, and connection is everything. Made from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% breathable cotton\"},{\"insert\":\", this wrap is soft on your babyâ€™s skin, durable for daily wear, and designed to hold your little one close in a way that feels natural and secure.\\n\\nThe soft grey fabric offers timeless versatility, while the \"},{\"attributes\":{\"bold\":true},\"insert\":\"thoughtfully placed elephant print\"},{\"insert\":\" adds a meaningful touchâ€”a symbol of protection, loyalty, and love. It\'s more than just a print; it\'s a reminder that you\'re building a bond that lasts a lifetime.\\n\\nCrafted from \"},{\"attributes\":{\"bold\":true},\"insert\":\"pure, natural cotton\"},{\"insert\":\" â€“ soft, strong, and breathable\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Grows with your baby â€“ suitable from newborn up to 35 lbs\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Ergonomic support\"},{\"insert\":\" for both parent and baby\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Unisex grey color with a \"},{\"attributes\":{\"bold\":true},\"insert\":\"charming elephant design\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Machine washable\"},{\"insert\":\" for easy care\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nWhether you\'re calming a newborn or exploring the world with your toddler, this wrap turns everyday moments into lasting memories.\\n Let the elephant be your symbol of love that carries, supports, and stays closeâ€”just like you do.\\n\"}]}', 5, 0, '2025-07-24 21:01:55'),
(6, '&lt;p&gt;Carry your baby with confidence, calm, and connection.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Our &lt;strong&gt;Grace &amp; Growth Grey Baby Wrap&lt;/strong&gt; is designed to reflect the quiet beauty of parenthood. Made from &lt;strong&gt;100% breathable cotton&lt;/strong&gt;, this wrap offers a soft, supportive embrace for your baby while keeping you comfortable and hands-free throughout the day.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;The gentle grey tone blends seamlessly into any outfit, while the &lt;strong&gt;giraffe print at the front&lt;/strong&gt; adds a meaningful touch. Giraffes symbolize growth, vision, and gentle strengthâ€”qualities every parent carries within. As your baby grows, so does your bondâ€”and this wrap is made to grow with you both.&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Crafted from &lt;strong&gt;100% natural cotton&lt;/strong&gt; â€“ soft, safe, and durable&lt;/li&gt;&lt;li&gt;Ideal for newborns to toddlers (up to 35 lbs)&lt;/li&gt;&lt;li&gt;&lt;strong&gt;Ergonomic design&lt;/strong&gt; for healthy hip development and back support&lt;/li&gt;&lt;li&gt;Unisex, minimalist look with a &lt;strong&gt;playful, symbolic giraffe print&lt;/strong&gt;&lt;/li&gt;&lt;li&gt;Machine washable and made for daily wear&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;Whether you&#039;re at home, out for a walk, or on the move, this wrap keeps your baby close, calm, and comforted. It&#039;s more than a carrierâ€”it&#039;s a daily ritual of love, support, and growth.&lt;/p&gt;', 'Carry your baby with confidence, calm, and connection.\n\nOur Grace & Growth Grey Baby Wrap is designed to reflect the quiet beauty of parenthood. Made from 100% breathable cotton, this wrap offers a soft, supportive embrace for your baby while keeping you comfortable and hands-free throughout the day.\n\nThe gentle grey tone blends seamlessly into any outfit, while the giraffe print at the front adds a meaningful touch. Giraffes symbolize growth, vision, and gentle strengthâ€”qualities every parent carries within. As your baby grows, so does your bondâ€”and this wrap is made to grow with you both.\n\nCrafted from 100% natural cotton â€“ soft, safe, and durable\nIdeal for newborns to toddlers (up to 35 lbs)\nErgonomic design for healthy hip development and back support\nUnisex, minimalist look with a playful, symbolic giraffe print\nMachine washable and made for daily wear\n\nWhether you\'re at home, out for a walk, or on the move, this wrap keeps your baby close, calm, and comforted. It\'s more than a carrierâ€”it\'s a daily ritual of love, support, and growth.\n', '{\"ops\":[{\"insert\":\"Carry your baby with confidence, calm, and connection.\\n\\nOur \"},{\"attributes\":{\"bold\":true},\"insert\":\"Grace & Growth Grey Baby Wrap\"},{\"insert\":\" is designed to reflect the quiet beauty of parenthood. Made from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% breathable cotton\"},{\"insert\":\", this wrap offers a soft, supportive embrace for your baby while keeping you comfortable and hands-free throughout the day.\\n\\nThe gentle grey tone blends seamlessly into any outfit, while the \"},{\"attributes\":{\"bold\":true},\"insert\":\"giraffe print at the front\"},{\"insert\":\" adds a meaningful touch. Giraffes symbolize growth, vision, and gentle strengthâ€”qualities every parent carries within. As your baby grows, so does your bondâ€”and this wrap is made to grow with you both.\\n\\nCrafted from \"},{\"attributes\":{\"bold\":true},\"insert\":\"100% natural cotton\"},{\"insert\":\" â€“ soft, safe, and durable\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Ideal for newborns to toddlers (up to 35 lbs)\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"attributes\":{\"bold\":true},\"insert\":\"Ergonomic design\"},{\"insert\":\" for healthy hip development and back support\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Unisex, minimalist look with a \"},{\"attributes\":{\"bold\":true},\"insert\":\"playful, symbolic giraffe print\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"Machine washable and made for daily wear\"},{\"attributes\":{\"list\":\"bullet\"},\"insert\":\"\\n\"},{\"insert\":\"\\nWhether you\'re at home, out for a walk, or on the move, this wrap keeps your baby close, calm, and comforted. It\'s more than a carrierâ€”it\'s a daily ritual of love, support, and growth.\\n\"}]}', 6, 0, '2025-07-24 21:06:28');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `variety_id` int(11) NOT NULL,
  `path` mediumtext NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `variety_id`, `path`, `height`, `width`, `deleted`, `created_at`) VALUES
(1, 1, 'Artboard 10.png', 760, 749, 1, '2025-06-09 22:04:43'),
(2, 1, 'Artboard 10.png', 760, 749, 1, '2025-06-09 22:07:57'),
(3, 1, 'Artboard 10.png', 760, 749, 0, '2025-06-09 22:10:20'),
(4, 2, 'Black Baby Wrap With Elephant Print.png', 760, 749, 0, '2025-07-24 20:02:02'),
(5, 3, 'Black Baby Wrap With Giraffe Print.png', 797, 749, 0, '2025-07-24 20:17:49'),
(6, 4, 'Grey Plain Baby Wrap.png', 756, 753, 0, '2025-07-24 20:53:11'),
(7, 5, 'Grey Baby Wrap with Elephant Print.png', 755, 753, 0, '2025-07-24 21:01:10'),
(8, 6, 'Grey Baby Wrap with Giraffe Print.png', 793, 753, 0, '2025-07-24 21:06:28'),
(9, 7, 'Teal baby wrap - plain.png', 760, 750, 0, '2025-09-24 20:33:30'),
(10, 8, 'Teal baby wrap - elephant.png', 760, 750, 0, '2025-09-24 20:36:38'),
(11, 9, 'Teal baby wrap - giraffe print.png', 797, 750, 0, '2025-09-24 20:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `description` mediumtext NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `deleted`, `created_at`) VALUES
(1, 'Black Plain Baby Wrap (100% Cotton)', 'This black baby wrap is your everyday essential for keeping your baby close while keeping life moving. Made from 100% natural cotton, itâ€™s lightweight, breathable, and strongâ€”perfect for long cuddles, quick errands, or calming your baby on the go.', 0, '2025-06-09 22:04:43'),
(2, 'Black Baby Wrap with Elephant Print (100% Cotton)', 'Our Black Baby Wrap with Elephant Print is more than just a carrierâ€”itâ€™s a symbol of powerful bonding. Made from 100% breathable cotton, this wrap provides gentle support for both you and your baby, ensuring comfort and security throughout your day.', 0, '2025-07-24 20:02:02'),
(3, 'Black Baby Wrap with Giraffe Print (100% Cotton)', 'Our Black Baby Wrap with Giraffe Print is thoughtfully designed for parents who value connection and comfort. Crafted from 100% breathable cotton, this wrap is soft on delicate skin, strong enough to support your baby, and gentle on your shoulders.', 0, '2025-07-24 20:17:49'),
(4, 'Grey Plain Baby Wrap (100% Cotton)', 'Made from 100% breathable cotton, this wrap offers a gentle stretch that molds comfortably to both your body and your babyâ€™s, creating a secure, soothing space that feels like a second womb. The neutral grey tone is calm and versatileâ€”subtle enough to complement any outfit, bold enough to wear with confidence.', 0, '2025-07-24 20:53:11'),
(5, 'Grey Baby Wrap with Elephant Print (100% Cotton)', 'The Elephant Embrace Grey Baby Wrap is inspired by one of natureâ€™s most nurturing creaturesâ€”where strength meets tenderness, and connection is everything. Made from 100% breathable cotton, this wrap is soft on your babyâ€™s skin, durable for daily wear, and designed to hold your little one close in a way that feels natural and secure.', 0, '2025-07-24 21:01:10'),
(6, 'Grey Baby Wrap with Giraffe Print (100% Cotton)', 'The gentle grey tone blends seamlessly into any outfit, while the giraffe print at the front adds a meaningful touch. Giraffes symbolize growth, vision, and gentle strengthâ€”qualities every parent carries within. As your baby grows, so does your bondâ€”and this wrap is made to grow with you both.', 0, '2025-07-24 21:06:28'),
(7, 'Teal Baby Wrap - Plain', 'Wrap your little one in comfort and style with our beautifully crafted teal baby wrap, designed to keep your baby close while giving you the freedom to move with ease. The vibrant teal color adds a touch of elegance to your everyday look, while the soft, breathable fabric ensures both you and your baby stay cozy and comfortable throughout the day. Perfect for bonding, soothing, and hands-free convenience, this wrap is a must-have for modern parents who want both functionality and fashion in one.', 0, '2025-09-24 20:33:30'),
(8, 'Teal Baby Wrap - Elephant', 'Carry your little one in comfort and charm with our teal baby wrap featuring a playful elephant print, designed to make every moment of bonding even more special. The rich teal color brings a refreshing pop of style, while the adorable elephants add a touch of fun that both you and your baby will love. Crafted from soft, breathable fabric, this wrap keeps your baby snug and secure while allowing you to stay hands-free and comfortable throughout the day. A perfect blend of fashion, function, and sweetnessâ€”this wrap is made to be as joyful as the memories youâ€™ll create together.', 0, '2025-09-24 20:36:38'),
(9, 'Teal baby wrap carrier - with Giraffe print', 'Bring a touch of adventure to your everyday bonding moments with our teal baby wrap featuring a charming giraffe print. The calming teal hue pairs beautifully with the playful giraffes, creating a stylish yet delightful look youâ€™ll love wearing anywhere. Made from soft, breathable fabric, this wrap keeps your baby snug and secure while giving you the freedom of hands-free movement. Perfect for soothing your little one, encouraging closeness, and adding a dash of personality to your day, this wrap is where comfort meets charm for both parent and baby.', 0, '2025-09-24 20:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `parent` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `parent`, `deleted`) VALUES
(1, 'Baby Wraps', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories_relations`
--

CREATE TABLE `product_categories_relations` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories_relations`
--

INSERT INTO `product_categories_relations` (`id`, `category_id`, `product_id`, `deleted`, `created_at`) VALUES
(1, 1, 1, 1, '2025-06-09 22:04:44'),
(2, 1, 1, 1, '2025-06-09 22:07:57'),
(3, 1, 1, 1, '2025-06-09 22:10:21'),
(4, 1, 2, 1, '2025-07-24 20:02:02'),
(5, 1, 2, 0, '2025-07-24 20:14:04'),
(6, 1, 3, 0, '2025-07-24 20:17:49'),
(7, 1, 1, 0, '2025-07-24 20:39:21'),
(8, 1, 4, 1, '2025-07-24 20:53:11'),
(9, 1, 4, 0, '2025-07-24 20:53:50'),
(10, 1, 5, 1, '2025-07-24 21:01:10'),
(11, 1, 5, 0, '2025-07-24 21:01:55'),
(12, 1, 6, 0, '2025-07-24 21:06:28'),
(13, 1, 7, 0, '2025-09-24 20:33:30'),
(14, 1, 8, 0, '2025-09-24 20:36:38'),
(15, 1, 9, 0, '2025-09-24 20:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications`
--

CREATE TABLE `product_specifications` (
  `id` int(11) NOT NULL,
  `group_name` tinytext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_specifications`
--

INSERT INTO `product_specifications` (`id`, `group_name`, `product_id`, `deleted`, `created_at`) VALUES
(1, 'Properties', 1, 0, '2025-06-10 01:04:44'),
(2, 'Properties', 2, 0, '2025-07-24 13:02:02'),
(3, 'Dimensions and Weight', 3, 0, '2025-07-24 13:17:49'),
(4, 'Properties', 4, 0, '2025-07-24 13:53:11'),
(5, 'Properties', 5, 0, '2025-07-24 14:01:10'),
(6, 'Properties', 6, 0, '2025-07-24 14:06:28'),
(7, 'Dimensions and Weight', 7, 0, '2025-09-24 13:33:30'),
(8, 'Dimensions and Weight', 8, 0, '2025-09-24 13:36:38'),
(9, 'Dimensions and Weight', 9, 0, '2025-09-24 13:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_specifications_key_value_pairs`
--

CREATE TABLE `product_specifications_key_value_pairs` (
  `id` int(11) NOT NULL,
  `property` tinytext NOT NULL,
  `value` mediumtext NOT NULL,
  `product_specifications_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_specifications_key_value_pairs`
--

INSERT INTO `product_specifications_key_value_pairs` (`id`, `property`, `value`, `product_specifications_id`, `deleted`, `created_at`) VALUES
(1, 'Material', '100% Cotton', 1, 0, '2025-06-09 22:04:44'),
(2, 'Color', 'Black', 1, 0, '2025-06-09 22:04:44'),
(3, 'Height', '3 mm', 1, 1, '2025-06-09 22:04:44'),
(4, 'Material', '100% Cotton', 2, 0, '2025-07-24 20:02:02'),
(5, 'Material', '100% Cotton', 3, 0, '2025-07-24 20:17:49'),
(6, 'Material', '100% Cotton', 4, 0, '2025-07-24 20:53:11'),
(7, 'Color', 'Ash Grey', 4, 0, '2025-07-24 20:53:11'),
(8, 'Material', '100% Cotton', 5, 0, '2025-07-24 21:01:10'),
(9, 'Color', 'Grey', 5, 0, '2025-07-24 21:01:10'),
(10, 'Material', '100% Cotton', 6, 0, '2025-07-24 21:06:28'),
(11, 'Color', 'Ash Grey', 6, 0, '2025-07-24 21:06:28'),
(12, 'Print', 'Giraffe', 6, 0, '2025-07-24 21:06:28'),
(13, 'Length', '3m', 7, 0, '2025-09-24 20:33:30'),
(14, 'Width', '0.5m', 7, 0, '2025-09-24 20:33:30'),
(15, 'Height', '-', 7, 0, '2025-09-24 20:33:30'),
(16, 'Length', '3m', 8, 0, '2025-09-24 20:36:38'),
(17, 'Width', '~ 0.5m', 8, 0, '2025-09-24 20:36:38'),
(18, 'Height', '-', 8, 0, '2025-09-24 20:36:38'),
(19, 'Length', '3m', 9, 0, '2025-09-24 20:39:04'),
(20, 'Width', '~0.5m', 9, 0, '2025-09-24 20:39:04'),
(21, 'Height', '-', 9, 0, '2025-09-24 20:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_varieties`
--

CREATE TABLE `product_varieties` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL,
  `price` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `product_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_varieties`
--

INSERT INTO `product_varieties` (`id`, `name`, `price`, `description`, `product_id`, `deleted`, `created_at`) VALUES
(1, 'Black Plain Baby Wrap', 1500, 'This black baby wrap is your everyday essential for keeping your baby close while keeping life moving. Made from 100% natural cotton, itâ€™s lightweight, breathable, and strongâ€”perfect for long cuddles, quick errands, or calming your baby on the go.', 1, 0, '2025-06-09 22:04:43'),
(2, 'Black Baby Wrap with Elephant Print (100% Cotton)', 1500, 'Our Black Baby Wrap with Elephant Print is more than just a carrierâ€”itâ€™s a symbol of powerful bonding. Made from 100% breathable cotton, this wrap provides gentle support for both you and your baby, ensuring comfort and security throughout your day.', 2, 0, '2025-07-24 20:02:02'),
(3, 'Black Baby Wrap with Giraffe Print (100% Cotton)', 1500, 'Our Black Baby Wrap with Giraffe Print is thoughtfully designed for parents who value connection and comfort. Crafted from 100% breathable cotton, this wrap is soft on delicate skin, strong enough to support your baby, and gentle on your shoulders.', 3, 0, '2025-07-24 20:17:49'),
(4, 'Grey Plain Baby Wrap (100% Cotton)', 1500, 'Made from 100% breathable cotton, this wrap offers a gentle stretch that molds comfortably to both your body and your babyâ€™s, creating a secure, soothing space that feels like a second womb. The neutral grey tone is calm and versatileâ€”subtle enough to complement any outfit, bold enough to wear with confidence.', 4, 0, '2025-07-24 20:53:11'),
(5, 'Grey Baby Wrap with Elephant Print (100% Cotton)', 1500, 'The Elephant Embrace Grey Baby Wrap is inspired by one of natureâ€™s most nurturing creaturesâ€”where strength meets tenderness, and connection is everything. Made from 100% breathable cotton, this wrap is soft on your babyâ€™s skin, durable for daily wear, and designed to hold your little one close in a way that feels natural and secure.', 5, 0, '2025-07-24 21:01:10'),
(6, 'Grey Baby Wrap with Giraffe Print (100% Cotton)', 1500, 'The gentle grey tone blends seamlessly into any outfit, while the giraffe print at the front adds a meaningful touch. Giraffes symbolize growth, vision, and gentle strengthâ€”qualities every parent carries within. As your baby grows, so does your bondâ€”and this wrap is made to grow with you both.', 6, 0, '2025-07-24 21:06:28'),
(7, 'Plain teal baby wrap', 1500, 'Plain teal baby wrap', 7, 0, '2025-09-24 20:33:30'),
(8, 'Teal baby wrap - with elephant print', 1500, 'teal baby wrap with elephant print', 8, 0, '2025-09-24 20:36:38'),
(9, 'Teal baby wrap carrier with giraffe print', 1500, 'Teal baby wrap carrier with giraffe print.', 9, 0, '2025-09-24 20:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'authenticated'),
(2, 'admin'),
(3, 'super-admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` tinytext NOT NULL,
  `verification_code` tinytext NOT NULL,
  `code_expiry` int(11) NOT NULL,
  `failed_code_attempts` int(11) NOT NULL DEFAULT 0,
  `jwt_token` text NOT NULL,
  `jwt_expiry` int(11) NOT NULL,
  `failed_jwt_attempts` int(11) NOT NULL DEFAULT 0,
  `role_id` int(11) NOT NULL DEFAULT 1,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `verification_code`, `code_expiry`, `failed_code_attempts`, `jwt_token`, `jwt_expiry`, `failed_jwt_attempts`, `role_id`, `deleted`) VALUES
(1, 'samsonkumeni8@gmail.com', 'Qru9Nh', 1742221906, 0, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NDIyMjAxMjAsImV4cCI6MTc0MjI2MzMyMCwidXNlcklkIjoiMSIsImVtYWlsIjoic2Ftc29ua3VtZW5pOEBnbWFpbC5jb20ifQ._rOmIRFwX23gxXwDmrYoUDLzYGgL-LB0qSZc4JuCoTk', 1742263320, 0, 2, 0),
(2, 'samsonkuemeni8@gmail.com', 'hkmfd2', 1741579131, 0, '', 0, 0, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories_relations`
--
ALTER TABLE `product_categories_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_specifications`
--
ALTER TABLE `product_specifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_specifications_key_value_pairs`
--
ALTER TABLE `product_specifications_key_value_pairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_varieties`
--
ALTER TABLE `product_varieties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
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
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_categories_relations`
--
ALTER TABLE `product_categories_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_specifications`
--
ALTER TABLE `product_specifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_specifications_key_value_pairs`
--
ALTER TABLE `product_specifications_key_value_pairs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_varieties`
--
ALTER TABLE `product_varieties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

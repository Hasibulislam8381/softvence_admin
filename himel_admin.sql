-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 06, 2025 at 06:37 AM
-- Server version: 9.4.0
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `himel_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('draft','published') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Getting Started with Laravel 10', 'Laravel 10 is the latest version of the Laravel framework. In this blog, we will explore its new features and improvements.', 'getting-started-with-laravel-10', NULL, 'published', NULL, '2025-09-04 03:38:11'),
(3, 'How to Deploy Laravel on Shared Hosting', 'Deploying a Laravel project to shared hosting can be tricky. In this article, I will guide you step by step.', 'how-to-deploy-laravel-on-shared-hosting', NULL, 'draft', NULL, NULL),
(4, 'This is my First bgog', 'dsfdsdsgfd', 'this-is-my-first-bgog', NULL, 'published', '2025-09-04 03:33:33', '2025-09-04 03:37:52');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-admin@gmail.com|127.0.0.1', 'i:3;', 1757133017),
('laravel-cache-admin@gmail.com|127.0.0.1:timer', 'i:1757133017;', 1757133017);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_otps`
--

CREATE TABLE `email_otps` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `verification_code` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_03_080951_create_personal_access_tokens_table', 2),
(5, '2025_09_04_033504_create_system_settings_table', 3),
(6, '2025_09_04_054739_add_avatar_to_users_table', 4),
(7, '2025_09_04_064319_create_social_media_table', 5),
(8, '2025_09_04_085349_create_blogs_table', 6),
(9, '2025_09_06_050325_create_email_otps_table', 7),
(10, '2025_09_06_051006_create_profile_options_table', 8),
(11, '2025_09_06_052216_add_agree_to_terms_to_users_table', 9),
(12, '2025_09_06_052437_add_profile_fields_to_users_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('himel8381.softvence@gmail.com', '$2y$12$92lTfcIoHlrjSw8FLuF6duODgsg.Qf0qd5DamUimE3lWdSvM/o2QC', '2025-09-05 22:29:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'ff404cf0bb85761b868ba873b6ec0c3cb126948ed0e7f730cde856df46a74915', '[\"*\"]', NULL, NULL, '2025-09-03 02:33:24', '2025-09-03 02:33:24'),
(2, 'App\\Models\\User', 1, 'MyApp', 'd516ea5702d4a5342ceca4ac8ec078758cd07060b4a81ff50ea203c96384a323', '[\"*\"]', NULL, NULL, '2025-09-03 02:37:46', '2025-09-03 02:37:46'),
(3, 'App\\Models\\User', 1, 'MyApp', '8840afce4242a49b56c066f9e7750bdc5efbe1557180eee34f62835b642fe915', '[\"*\"]', NULL, NULL, '2025-09-03 02:38:13', '2025-09-03 02:38:13'),
(4, 'App\\Models\\User', 1, 'MyApp', 'a14ebce47f28c9047a2b8a3ead1c80fc1fdef9efa0aff8d1ffffbe34516566f2', '[\"*\"]', NULL, NULL, '2025-09-03 02:46:06', '2025-09-03 02:46:06'),
(5, 'App\\Models\\User', 1, 'MyApp', '4db3babf96954ee1d94585fe8269a3d664cc7c0f3c398e6c8792d00d2edbb634', '[\"*\"]', NULL, NULL, '2025-09-03 03:01:32', '2025-09-03 03:01:32'),
(6, 'App\\Models\\User', 1, 'MyApp', '958f94e1af7eb0e3dabd62812d2a7ec2a2c449ad2ebf193c2cf690028e9acbdc', '[\"*\"]', NULL, NULL, '2025-09-03 03:01:35', '2025-09-03 03:01:35'),
(7, 'App\\Models\\User', 1, 'MyApp', '41e88c0437e1537f6907b950bd51fcd91f7e32c576c545ef8605f5b191bf5ef2', '[\"*\"]', NULL, NULL, '2025-09-05 20:35:43', '2025-09-05 20:35:43'),
(8, 'App\\Models\\User', 1, 'MyApp', '45d4ec5377694886645ffede5270ce3e5d4c04c212afad7b69199399a6dc81d9', '[\"*\"]', NULL, NULL, '2025-09-05 20:58:51', '2025-09-05 20:58:51'),
(9, 'App\\Models\\User', 1, 'MyApp', 'd96b54bbd921dfbbb407d6f6459bc1135360eee29219e86e7b3bc2e14eb13ea0', '[\"*\"]', NULL, NULL, '2025-09-05 20:59:39', '2025-09-05 20:59:39'),
(10, 'App\\Models\\User', 1, 'MyApp', '75bfc439434f6b26ffa5dc6fe69fb7e26359348a95d8c2be7967c93bcd686315', '[\"*\"]', NULL, NULL, '2025-09-05 21:01:05', '2025-09-05 21:01:05'),
(11, 'App\\Models\\User', 1, 'MyApp', 'ae6e18d09e68ebd7e0727325931e267db54bcd5705a7df7b1335f22ed7b3b2f3', '[\"*\"]', NULL, NULL, '2025-09-05 21:03:26', '2025-09-05 21:03:26'),
(12, 'App\\Models\\User', 1, 'MyApp', 'b9848d633fa1646100b0192f899a8c4b268d17c3cddc9e8f4c899467a9556395', '[\"*\"]', NULL, NULL, '2025-09-05 21:06:04', '2025-09-05 21:06:04'),
(13, 'App\\Models\\User', 1, 'MyApp', '740e0d607ef6f58037c51c1db235c8a78a1efe2dbffb2c1c187a6b95a6e11a56', '[\"*\"]', NULL, NULL, '2025-09-05 21:06:53', '2025-09-05 21:06:53'),
(14, 'App\\Models\\User', 1, 'MyApp', '94d24c021e8b127cbfe50a80e3ce585eb0ff212934635f182f3f7c90160b1ed4', '[\"*\"]', NULL, NULL, '2025-09-05 21:08:00', '2025-09-05 21:08:00'),
(15, 'App\\Models\\User', 1, 'MyApp', '5f2ce5cf0098d1d4f29d8a735e3b951f7aef242a13060da8ed95b970110136fc', '[\"*\"]', '2025-09-05 21:10:49', NULL, '2025-09-05 21:09:37', '2025-09-05 21:10:49'),
(16, 'App\\Models\\User', 1, 'MyApp', '8ac34e2c4bf635368ac9b8cc1111f34e6cfcbe525ec557f7ceb808369e3f6db6', '[\"*\"]', '2025-09-05 21:25:14', NULL, '2025-09-05 21:12:58', '2025-09-05 21:25:14'),
(17, 'App\\Models\\User', 6, 'auth_token', '87805da65ea67b734b01994ea37572fc948498481b515f36cb97e1d8394a3631', '[\"*\"]', NULL, NULL, '2025-09-05 23:43:02', '2025-09-05 23:43:02'),
(18, 'App\\Models\\User', 6, 'auth_token', 'b23b2234c7b9217442cebf6ed5c5a53be780378888dd1406b692207faceb8aa1', '[\"*\"]', NULL, NULL, '2025-09-06 00:00:41', '2025-09-06 00:00:41'),
(19, 'App\\Models\\User', 6, 'auth_token', 'fccef0143403fadbec73f0acab84082c9b2e56034dc94c7b020a09e70d38a702', '[\"*\"]', NULL, NULL, '2025-09-06 00:01:26', '2025-09-06 00:01:26'),
(20, 'App\\Models\\User', 6, 'auth_token', '70e8b788c24a3b46756098ca0d55102890d1c1dd117280b598fc5ce69cde3b1a', '[\"*\"]', NULL, NULL, '2025-09-06 00:02:04', '2025-09-06 00:02:04'),
(21, 'App\\Models\\User', 6, 'auth_token', '1b1eac91e3b4e0d976ed4cb5657c9db2cfa454e9a47a83b10294f1607d737077', '[\"*\"]', NULL, NULL, '2025-09-06 00:02:46', '2025-09-06 00:02:46'),
(22, 'App\\Models\\User', 6, 'auth_token', 'cd1aa052ed2b3ae9830f22074886ab31cc4c7a0bfe0be89447d04b06d0eda2af', '[\"*\"]', NULL, NULL, '2025-09-06 00:06:00', '2025-09-06 00:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `profile_options`
--

CREATE TABLE `profile_options` (
  `id` bigint UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DlhGT8oTtK80bfoLQwfiyMTIge4Hq0MqDr1ihI9K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXg3WXFqQUNNaGRoSG5Gd3BnMmp2MnpmbmM4ZlBCT3ZBTzZ1a2p1eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjM6Imh0dHA6Ly9oaW1lbC1hZG1pbi50ZXN0Ijt9fQ==', 1757139672),
('dLoQABXejlhwcRfoyVgoqJjPopBI10X8iVt7ydFa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.22.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVQ4VGE2Q3ptVkRISTFYaUNXSFM3amNMUTBKa1ZzaGZ6SGFBQkpYRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9oaW1lbC1hZG1pbi50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1757134063),
('egNHZnqFUQenz8GWAgms3VnzuvNEdwm20F76i70u', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNW9WV2NNMnRmb1pycThqVTdCM1BudGxPbkJmRnZ0WFZXWFh3SWNuWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9oaW1lbC1hZG1pbi50ZXN0L2FkbWluL2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1757140430);

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint UNSIGNED NOT NULL,
  `social_media` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `social_media`, `profile_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'twitter', 'https://twitter.com/yourprofile', '2025-09-04 00:57:20', '2025-09-04 00:57:20', NULL),
(3, 'instagram', 'https://instagram.com/yourprofile', '2025-09-04 00:57:20', '2025-09-04 00:57:20', NULL),
(4, 'skype', 'https://instagram.com/yourprofile', '2025-09-04 02:17:59', '2025-09-04 02:17:59', NULL),
(5, 'facebook', 'https://facebook.com/yourprofile', '2025-09-04 02:20:57', '2025-09-04 02:20:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `title`, `email`, `system_name`, `copyright_text`, `logo`, `favicon`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'My Application', 'admin@example.com', 'Admin Panel', '© 2025 My Application. All rights reserved.', 'uploads/logos/1756967397777836624.png', 'uploads/favicons/17569585601950656052.jpg', '<p>dfgffdg fsdfs</p>', '2025-09-03 22:01:22', '2025-09-04 00:29:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agree_to_terms` tinyint(1) NOT NULL DEFAULT '0',
  `date_of_birth` date DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship_goal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ideal_connection` bigint UNSIGNED DEFAULT NULL,
  `willing_to_relocate` bigint UNSIGNED DEFAULT NULL,
  `preferred_age_min` int DEFAULT NULL,
  `preferred_age_max` int DEFAULT NULL,
  `preferred_property_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `budget_min` decimal(10,2) DEFAULT NULL,
  `budget_max` decimal(10,2) DEFAULT NULL,
  `preferred_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perfect_weekend` text COLLATE utf8mb4_unicode_ci,
  `cant_live_without` text COLLATE utf8mb4_unicode_ci,
  `quirky_fact` text COLLATE utf8mb4_unicode_ci,
  `about_me` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `agree_to_terms`, `date_of_birth`, `remember_token`, `created_at`, `updated_at`, `location`, `relationship_goal`, `ideal_connection`, `willing_to_relocate`, `preferred_age_min`, `preferred_age_max`, `preferred_property_type`, `identity`, `budget_min`, `budget_max`, `preferred_location`, `perfect_weekend`, `cant_live_without`, `quirky_fact`, `about_me`) VALUES
(1, 'Himel khan', 'himel8381.softvence@gmail.com', 'uploads/users/17569651471031315531.jpg', NULL, '$2y$12$Tf0GCA2J3Qew5fhsz22pBuyy.0KJ7dj6iSqnl9ujUQMPxxeLg/wkW', 0, NULL, 'feHGvkahmS0tnD2oJIgZzwvLnDqo3xaQ18MlXleb2XusDUJjvvMuHCrtV3hv', '2025-09-03 02:33:24', '2025-09-06 00:18:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'jihad', 'hasibulislam8381@gmail.com', NULL, '2025-09-06 00:15:40', '$2y$12$O7dDuGzYG78qX0jEo9Cc6e/RoU6POVyjLcFFuAGAYEH7qQbXhjo8y', 1, NULL, NULL, '2025-09-05 23:31:22', '2025-09-06 00:17:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `email_otps`
--
ALTER TABLE `email_otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_otps_user_id_unique` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `profile_options`
--
ALTER TABLE `profile_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_options_group_key_unique` (`group`,`key`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_otps`
--
ALTER TABLE `email_otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `profile_options`
--
ALTER TABLE `profile_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `email_otps`
--
ALTER TABLE `email_otps`
  ADD CONSTRAINT `email_otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : task_manager

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-09-25 11:34:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2014_10_12_200000_add_two_factor_columns_to_users_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('5', '2019_12_14_000001_create_personal_access_tokens_table', '1');
INSERT INTO `migrations` VALUES ('6', '2020_09_25_091225_create_projects_table', '1');
INSERT INTO `migrations` VALUES ('7', '2020_09_25_093433_create_tasks_table', '1');
INSERT INTO `migrations` VALUES ('8', '2020_09_25_110903_create_sessions_table', '1');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `personal_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for `projects`
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_unique` (`name`),
  KEY `projects_user_id_foreign` (`user_id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES ('1', 'Derek Jaskolski PhD', 'Non ut nemo ipsam ut saepe. Est debitis in corporis nostrum. Totam quae eveniet quidem inventore ut doloremque hic. Qui rerum repellendus nam itaque odio voluptatibus molestias. Ipsum dicta natus ratione voluptatem eum.', '10', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `projects` VALUES ('2', 'Maiya Bailey', 'Qui et aut accusantium incidunt fugiat. Et ipsa et harum harum occaecati dolorem. Veniam qui quisquam consequatur. Numquam eos animi molestias ipsam omnis quibusdam et.', '8', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `projects` VALUES ('3', 'Kaley Franecki', 'Est adipisci tempore ipsam cupiditate. Nobis qui repudiandae nemo et saepe ut a. Aut dolores culpa autem voluptates nihil. Quia qui nihil quisquam iusto vero.', '1', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `projects` VALUES ('4', 'Dr. Sigurd Denesik', 'Perferendis id nam dolores natus. Aut et ut aut qui nobis. Id illo tempore dolorem accusamus. Ipsa molestiae animi placeat possimus totam.', '10', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `projects` VALUES ('5', 'Misty Kling', 'Eligendi velit explicabo non qui aliquam. Sit soluta praesentium voluptates eum. Consequatur et molestiae ipsum omnis vel tempora asperiores odio. Dolorem qui et eius aspernatur non quia.', '9', '2020-09-25 17:41:33', '2020-09-25 17:41:33');

-- ----------------------------
-- Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('0iunixDkG3MgaA8Ir35HCw6QG4AwVctSowIoWniS', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTmt4d2wwR3hMcWtyNzQyRUNQZmR1ZjQ0Y1R0c1dFY3hUQXFiaGFuSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90YXNrL2luZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDkySVhVTnBrak8wck9RNWJ5TWkuWWU0b0tvRWEzUm85bGxDLy5vZy9hdDIudWhlV0cvaWdpIjt9', '1601058703');

-- ----------------------------
-- Table structure for `tasks`
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('4', 'Norberto Bogan', '3', '9', '3', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `tasks` VALUES ('5', 'Rocio O\'Hara Sr.', '1', '5', '3', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `tasks` VALUES ('6', 'Prof. Emory McKenzie I', '5', '4', '2', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `tasks` VALUES ('7', 'Prof. Griffin Botsford', '1', '5', '3', '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `tasks` VALUES ('8', 'Theron Gorczany II', '7', '3', '1', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('9', 'Skylar Lynch', '3', '7', '5', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('10', 'Dr. Kurtis Dibbert DVM', '7', '6', '2', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('11', 'Ms. Kitty Witting II', '6', '5', '1', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('12', 'Andreanne Rolfson', '1', '8', '4', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('13', 'Calista Doyle', '10', '8', '5', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('14', 'Titus Grimes', '8', '6', '3', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('15', 'Mallie Gleason', '5', '3', '1', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('16', 'Isabelle Durgan', '10', '5', '1', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('17', 'Miss Luella Abernathy DDS', '8', '3', '2', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('18', 'Juvenal Ondricka', '4', '3', '4', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('19', 'Dr. Autumn Larson Sr.', '7', '4', '5', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('20', 'Ms. Kaylee Kuhn Jr.', '9', '1', '4', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('21', 'Rafael Krajcik', '1', '5', '3', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('22', 'Richie Hackett', '5', '7', '4', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('23', 'Emely Hansen Sr.', '2', '2', '1', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('24', 'Roscoe King', '9', '2', '2', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('25', 'Olaf Nader II', '6', '5', '3', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('26', 'Lukas Considine', '7', '10', '5', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('27', 'Ellsworth Hoppe', '9', '2', '3', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('28', 'Ms. Kaya Weissnat', '3', '6', '4', '2020-09-25 17:41:34', '2020-09-25 17:41:34');
INSERT INTO `tasks` VALUES ('29', 'Waldo Russel', '1', '9', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('30', 'Furman Metz', '8', '5', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('31', 'Dixie Raynor', '6', '8', '1', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('32', 'Prof. Roscoe Russel', '4', '9', '5', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('33', 'Margret Lind', '6', '1', '1', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('34', 'Therese Labadie', '9', '8', '5', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('35', 'Lexi Okuneva', '4', '4', '4', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('36', 'Nathanael Renner', '6', '1', '3', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('37', 'Maeve Hermiston', '5', '5', '5', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('38', 'Mrs. Isabell Schimmel I', '6', '9', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('39', 'Lorna Herman', '7', '9', '5', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('40', 'Hermina Bahringer', '6', '9', '1', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('41', 'Cheyanne Bartoletti', '7', '5', '3', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('42', 'Miss Jude Schamberger', '5', '7', '3', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('43', 'Rosalia Abbott', '5', '6', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('44', 'Mr. Reinhold Renner PhD', '9', '1', '1', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('45', 'Prof. Ryleigh Marvin DVM', '6', '8', '4', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('46', 'Emory Bernier DDS', '7', '6', '3', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('47', 'Darius Wolf Sr.', '10', '1', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('48', 'Chase Yundt', '3', '7', '2', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('49', 'Mrs. Lelah Buckridge PhD', '8', '2', '4', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('50', 'Leola Kiehn', '2', '1', '3', '2020-09-25 17:41:35', '2020-09-25 17:41:35');
INSERT INTO `tasks` VALUES ('51', 'Gabriel Krajcik', '4', '6', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('52', 'Giovani Ryan', '9', '9', '4', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('53', 'Delfina Ward', '5', '3', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('54', 'Pansy Tillman', '10', '1', '1', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('55', 'Joanne Parker', '8', '2', '1', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('56', 'Prof. Travis Grimes', '5', '2', '4', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('57', 'Tyrel Frami Jr.', '7', '8', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('58', 'Henri Rice DVM', '3', '10', '5', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('59', 'Cheyenne Kunde', '2', '7', '1', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('60', 'Ms. Anabel Cartwright', '9', '7', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('61', 'Sammy Ondricka', '2', '10', '1', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('62', 'Miss Vesta Macejkovic MD', '9', '3', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('63', 'Jarod Murazik PhD', '4', '4', '5', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('64', 'Ophelia Kassulke', '10', '7', '3', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('65', 'Maxwell Grimes', '5', '4', '4', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('66', 'Nella Block IV', '7', '7', '4', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('67', 'Mr. Monserrat Flatley Jr.', '9', '3', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('68', 'Mr. Faustino Corkery Sr.', '1', '9', '2', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('69', 'Prof. Allene Daniel Sr.', '8', '2', '5', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('70', 'Patience Tillman', '6', '5', '4', '2020-09-25 17:41:36', '2020-09-25 17:41:36');
INSERT INTO `tasks` VALUES ('71', 'Shawn Heathcote', '1', '10', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('72', 'Ms. Abby Krajcik DVM', '3', '8', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('73', 'Ms. Joanne Crist', '3', '4', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('74', 'Dr. Percival Rippin MD', '8', '3', '4', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('75', 'Nathen Brown', '9', '4', '2', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('76', 'Adolfo Cummings', '10', '3', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('77', 'Justice Schimmel', '4', '2', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('78', 'Prof. Oral Hermiston MD', '6', '1', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('79', 'Mohammed Tromp II', '7', '7', '5', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('80', 'Alexie Lubowitz', '5', '4', '2', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('81', 'Jerrod Mitchell', '3', '1', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('82', 'Gladys Welch MD', '7', '1', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('83', 'Jeanne Sauer', '5', '4', '2', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('84', 'Dr. Keyshawn Ernser', '10', '3', '2', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('85', 'Dr. Alexis Wehner', '10', '3', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('86', 'Miss Augustine O\'Kon Sr.', '3', '1', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('87', 'Dr. Rocio Raynor PhD', '8', '3', '3', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('88', 'Amelia Lueilwitz II', '7', '5', '5', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('89', 'Sharon Pollich', '5', '3', '1', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('90', 'Olga Breitenberg Jr.', '9', '4', '5', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('91', 'Dr. Kelley Grady', '9', '2', '2', '2020-09-25 17:41:37', '2020-09-25 17:41:37');
INSERT INTO `tasks` VALUES ('92', 'Miss Gabrielle Cassin II', '4', '4', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('93', 'Prof. Paolo Wilderman PhD', '7', '3', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('94', 'Dr. Jacinto Graham', '2', '9', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('95', 'Oleta Moore', '6', '9', '2', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('96', 'Mariana Blick', '6', '10', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('97', 'Tevin Sporer', '10', '9', '4', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('98', 'Dr. Emelie Green I', '1', '1', '1', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('99', 'Dr. Cynthia Wolf II', '9', '1', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('100', 'Antwon Nitzsche I', '7', '1', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('101', 'Maximus West', '5', '2', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('102', 'Mr. Arne Abernathy IV', '2', '4', '4', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('103', 'Cordell Osinski', '10', '7', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('104', 'Lilly Krajcik', '6', '1', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('105', 'Katarina Mitchell', '10', '10', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('106', 'May Krajcik', '1', '1', '4', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('107', 'Dr. Timmothy Lang V', '1', '4', '1', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('108', 'Lorenza Conroy', '5', '9', '4', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('109', 'Jordyn Tromp', '1', '7', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('110', 'Prof. Maxine Price I', '10', '8', '3', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('111', 'Gay Grady', '10', '8', '5', '2020-09-25 17:41:38', '2020-09-25 17:41:38');
INSERT INTO `tasks` VALUES ('112', 'Tiara Mraz', '5', '7', '2', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('113', 'Triston Bednar', '2', '1', '4', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('114', 'Bert Oberbrunner', '5', '2', '5', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('115', 'Terry Sauer', '7', '9', '3', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('116', 'Marilou Bradtke', '8', '8', '5', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('117', 'Gilbert Schulist', '1', '9', '1', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('118', 'Autumn Schmidt', '3', '5', '3', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('119', 'Daisha King', '1', '4', '3', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('120', 'Hester Towne', '1', '8', '4', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('121', 'Autumn Stiedemann', '10', '3', '2', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('122', 'Dr. Edison Baumbach', '5', '8', '3', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('123', 'Neil Langosh', '7', '5', '4', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('124', 'Imani Becker', '5', '5', '4', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('125', 'Miss Alda Smitham', '8', '2', '3', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('126', 'Deshaun Tremblay', '10', '3', '1', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('127', 'Ms. Marie Williamson', '1', '5', '2', '2020-09-25 17:41:39', '2020-09-25 17:41:39');
INSERT INTO `tasks` VALUES ('128', 'Miss Winifred Tromp I', '5', '2', '1', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('129', 'Alexandrea Skiles', '5', '10', '4', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('130', 'Presley Wunsch', '5', '10', '2', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('131', 'Dr. Corbin Kohler V', '9', '2', '4', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('132', 'Mr. Cyrus Funk DVM', '6', '7', '1', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('133', 'Merle Bashirian', '10', '9', '4', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('134', 'Prof. Erich Metz MD', '5', '3', '2', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('135', 'Chadrick Walter', '1', '9', '3', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('136', 'Lori Prosacco', '3', '4', '2', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('137', 'Prof. Mitchel Lueilwitz', '6', '9', '5', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('138', 'Brant Mante', '2', '9', '3', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('139', 'Maximilian Kertzmann', '3', '7', '5', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('140', 'Josiah Stoltenberg V', '10', '2', '5', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('141', 'Colby Kub', '1', '9', '3', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('142', 'Elroy Schaden PhD', '7', '3', '2', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('143', 'Karli Reynolds DDS', '6', '10', '2', '2020-09-25 17:41:40', '2020-09-25 17:41:40');
INSERT INTO `tasks` VALUES ('144', 'Mr. Elmore Gleason', '9', '5', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('145', 'Kira Welch', '7', '1', '2', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('146', 'Vita Carter', '5', '6', '1', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('147', 'Adolf Wunsch', '9', '8', '4', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('148', 'Miss Daphne Kreiger', '9', '5', '2', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('149', 'Dr. Meghan Blick Jr.', '9', '8', '1', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('150', 'Owen Batz', '6', '8', '3', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('151', 'Ms. Genoveva Hoeger', '3', '10', '4', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('152', 'Golden Graham', '5', '6', '1', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('153', 'Ena Bayer', '9', '1', '4', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('154', 'Lula Becker', '2', '10', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('155', 'Ms. Karelle Keeling', '3', '4', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('156', 'Roselyn Douglas', '5', '6', '1', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('157', 'Ms. Jeanette Mohr DVM', '3', '4', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('158', 'Reta O\'Keefe Jr.', '10', '9', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('159', 'Prof. Arch Murray', '3', '7', '3', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('160', 'Bettie Bauch', '1', '2', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('161', 'Aimee Herzog Sr.', '3', '2', '5', '2020-09-25 17:41:41', '2020-09-25 17:41:41');
INSERT INTO `tasks` VALUES ('162', 'Dr. Ward Kiehn', '5', '10', '5', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('163', 'Dr. Justina Krajcik', '7', '8', '3', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('164', 'Eduardo Rosenbaum', '8', '7', '1', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('165', 'Gianni Pagac', '1', '5', '5', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('166', 'Fritz Gerhold', '8', '7', '1', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('167', 'Eldon Lemke', '6', '1', '4', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('168', 'Myah Pfannerstill', '6', '5', '1', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('169', 'Iva Kirlin', '8', '10', '4', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('170', 'Erna Stark', '4', '6', '3', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('171', 'Ms. Samantha Buckridge', '1', '10', '1', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('172', 'Darian Schimmel', '4', '3', '3', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('173', 'Dr. Alvina Cruickshank Sr.', '1', '8', '5', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('174', 'Miss Lydia Brakus DDS', '1', '3', '3', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('175', 'Casper Oberbrunner MD', '5', '1', '2', '2020-09-25 17:41:42', '2020-09-25 17:41:42');
INSERT INTO `tasks` VALUES ('176', 'Josue Murphy', '3', '5', '5', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('177', 'Prof. Christa O\'Conner', '2', '10', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('178', 'Mr. Quinn Kuhn', '6', '10', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('179', 'Lonzo Cronin', '7', '2', '1', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('180', 'Mr. Obie Runolfsson', '2', '9', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('181', 'Marge Wehner V', '8', '7', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('182', 'Keyshawn Wunsch PhD', '5', '3', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('183', 'Stuart Schmeler', '3', '1', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('184', 'Christop Koelpin', '6', '2', '1', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('185', 'Ms. Elvera Abbott', '5', '6', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('186', 'Dr. Merlin Beier', '7', '6', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('187', 'Zackary Abshire', '7', '5', '3', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('188', 'Kariane Bechtelar', '1', '9', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('189', 'Leta Hyatt', '9', '7', '1', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('190', 'Norma Simonis', '9', '5', '2', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('191', 'Danielle Ondricka PhD', '1', '8', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('192', 'Jaden Connelly I', '4', '9', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('193', 'Mattie Simonis', '9', '1', '4', '2020-09-25 17:41:43', '2020-09-25 17:41:43');
INSERT INTO `tasks` VALUES ('194', 'Tate Hermann', '2', '5', '4', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('195', 'Jayson Hammes', '5', '5', '1', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('196', 'Alysha Ritchie', '4', '4', '4', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('197', 'Alexandrea Bayer', '4', '9', '4', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('198', 'Mrs. Brisa Larkin Jr.', '10', '2', '4', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('199', 'Liana Schulist', '4', '7', '5', '2020-09-25 17:41:44', '2020-09-25 17:41:44');
INSERT INTO `tasks` VALUES ('200', 'Gregory Spencer', '10', '6', '2', '2020-09-25 17:41:44', '2020-09-25 17:41:44');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Austin Wolf IV', 'bwillms@example.org', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'BsURU2aTT2', null, null, '2020-09-25 17:41:32', '2020-09-25 17:41:32');
INSERT INTO `users` VALUES ('2', 'Desmond Rippin', 'uwalter@example.com', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'ds4WHMWOeT', null, null, '2020-09-25 17:41:32', '2020-09-25 17:41:32');
INSERT INTO `users` VALUES ('3', 'Prof. Jon Hand', 'sleffler@example.com', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, '6zkfohvr01', null, null, '2020-09-25 17:41:32', '2020-09-25 17:41:32');
INSERT INTO `users` VALUES ('4', 'Lamont Leffler DVM', 'dino53@example.org', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'Qt3r1Hd2R6', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('5', 'Dr. Mohammad Jones I', 'hmayert@example.org', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'ZutqJuxXQY', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('6', 'Miss Myrna Beier', 'hmarquardt@example.com', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'JtU2sQHUlg', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('7', 'Jake Reynolds', 'alexandrine12@example.com', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'il6gdz6qu7', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('8', 'Joyce Larkin', 'franecki.leonard@example.net', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'S4aWKpJKrY', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('9', 'Dax Kling', 'nikolas.gutkowski@example.net', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'zA0Xj9Uzmc', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');
INSERT INTO `users` VALUES ('10', 'Keely Runte PhD', 'soledad.bernier@example.com', '2020-09-25 17:41:32', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', null, null, 'rZh8TFQiwT', null, null, '2020-09-25 17:41:33', '2020-09-25 17:41:33');

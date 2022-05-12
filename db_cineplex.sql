-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2021 at 05:37 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_cineplex`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `firstname`, `lastname`, `age`, `gender`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Jennie Ruby', 'Kim', '24', 'Female', 'JennieRuby.jpg', '2021-05-12 03:24:45', '2021-05-11 19:24:45', NULL),
(5, 'Lalisa', 'Manoban', '23', 'Female', 'Lalisa.jpg', '2021-05-12 03:24:27', '2021-05-11 19:24:27', NULL),
(9, 'Tom', 'Hardy', '24', 'Male', 'Tom.jpg', '2021-05-12 03:24:18', '2021-05-11 19:24:18', NULL),
(10, 'Michelle', 'Williams', '43', 'Female', 'Michelle.jpg', '2021-05-12 03:24:06', '2021-05-11 19:24:06', NULL),
(11, 'John', 'Reilly', '34', 'Male', 'John.jpg', '2021-05-12 03:23:55', '2021-05-11 19:23:55', NULL),
(12, 'Gal', 'Gaddot', '34', 'Female', 'Gal.jpg', '2021-05-12 03:23:42', '2021-05-11 19:23:42', NULL),
(13, 'Sarah', 'Silverman', '34', 'Female', 'Sarah.jpg', '2021-05-12 03:23:20', '2021-05-11 19:23:20', NULL),
(14, 'Emily', 'Blunt', '54', 'Female', 'Emily.jpg', '2021-05-12 03:23:06', '2021-05-11 19:23:06', NULL),
(15, 'Millicent', 'Simmonds', '27', 'Female', 'Millicent.jpg', '2021-05-12 03:22:54', '2021-05-11 19:22:54', NULL),
(16, 'Cole', 'Sprouse', '32', 'Female', 'Cole.jpg', '2021-05-12 03:22:43', '2021-05-11 19:22:43', NULL),
(17, 'Haley', 'Richardson', '43', 'Female', 'Haley.jpg', '2021-05-12 03:22:33', '2021-05-11 19:22:33', NULL),
(18, 'Ashley', 'Jud', '23', 'Female', 'Ashley.jpg', '2021-05-12 03:22:25', '2021-05-11 19:22:25', NULL),
(19, 'Edward James', 'Olmos', '31', 'Female', 'EdwardJames.jpg', '2021-05-12 03:22:10', '2021-05-11 19:22:10', NULL),
(43, 'Jonas', 'Hobit', '29', 'Male', 'Jonas.jpg', '2021-05-19 07:34:01', '2021-05-18 23:34:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `film_actor`
--

INSERT INTO `film_actor` (`id`, `actor_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(44, 13, 15, NULL, NULL),
(45, 9, 15, NULL, NULL),
(46, 2, 15, NULL, NULL),
(47, 10, 16, NULL, NULL),
(52, 19, 18, NULL, NULL),
(53, 18, 18, NULL, NULL),
(54, 17, 18, NULL, NULL),
(55, 13, 19, NULL, NULL),
(56, 12, 19, NULL, NULL),
(57, 9, 19, NULL, NULL),
(58, 15, 20, NULL, NULL),
(59, 14, 20, NULL, NULL),
(79, 16, 17, '2021-05-18 18:38:17', '2021-05-18 18:38:17'),
(80, 17, 17, '2021-05-18 18:38:34', '2021-05-18 18:38:34'),
(81, 5, 16, '2021-05-18 18:39:01', '2021-05-18 18:39:01'),
(82, 19, 17, '2021-05-18 22:04:23', '2021-05-18 22:04:23'),
(83, 19, 15, '2021-05-18 22:05:00', '2021-05-18 22:05:00'),
(84, 5, 44, '2021-05-18 23:32:12', '2021-05-18 23:32:12'),
(85, 43, 44, '2021-05-18 23:32:42', '2021-05-18 23:32:42'),
(86, 43, 16, '2021-05-18 23:33:05', '2021-05-18 23:33:05'),
(87, 43, 15, '2021-05-18 23:33:16', '2021-05-18 23:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`, `created_at`, `updated_at`) VALUES
(3, 'Romance', '2020-09-12 20:53:19', NULL),
(4, 'Adventure', '2020-09-18 20:58:22', NULL),
(5, 'Mystery', '2020-09-18 20:58:51', NULL),
(6, 'Thriller', '2020-09-18 20:59:06', NULL),
(8, 'Anime', '2020-09-18 21:00:06', NULL),
(9, 'Comedy', '2020-09-18 21:00:40', NULL),
(10, 'Crime', '2020-09-18 21:00:56', NULL),
(11, 'Drama', '2020-09-18 21:01:06', NULL),
(12, 'Documentary', '2020-09-18 21:01:17', NULL),
(14, 'History', '2020-09-18 21:01:40', NULL),
(15, 'Sports', '2020-09-18 21:01:57', NULL),
(16, 'Musical', '2020-09-18 21:02:11', NULL),
(17, 'Sci-fi', '2020-09-18 21:02:32', NULL),
(18, 'Comedy', '2020-09-20 07:52:57', NULL);

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
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(6, '2016_06_01_000004_create_oauth_clients_table', 2),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(8, '2021_01_26_042219_create_roletypes_table', 3),
(9, '2021_01_26_042412_create_roletypes_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `prod_id` int(10) UNSIGNED NOT NULL,
  `gen_id` int(10) UNSIGNED NOT NULL,
  `film_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `release_date` date NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `prod_id`, `gen_id`, `film_title`, `summary`, `release_date`, `country`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(15, 9, 17, 'Venom 2', 'Venom: Let There Be Carnage is an upcoming American superhero film based on the Marvel Comics character Venom, produced by Columbia Pictures in association with Marvel and Tencent Pictures. Distributed by Sony Pictures Releasing, it is intended to be the second film in the Sony Pictures Universe of Marvel Characters and the sequel to Venom (2018). The film is being directed by Andy Serkis from a screenplay by Kelly Marcel, and stars Tom Hardy as Eddie Brock / Venom alongside Woody Harrelson, Michelle Williams, Reid Scott, and Naomie Harris.', '2019-01-07', 'USA', 'Venom2.jpg', '2021-05-12 03:34:52', '2021-01-25 20:40:32', NULL),
(16, 7, 10, 'Ralph Breaks the Internet 2', 'Six years after saving the arcade from the Cy-Bugs attack and from Turbo\'s revenge, the story leaves Litwak\'s video arcade behind, venturing into the uncharted, expansive and thrilling world of the internet - which may or may not survive Ralph\'s wrecking. Video game bad guy Ralph and fellow misfit Vanellope von Schweetz must risk it all by traveling to the world wide web in search of a replacement part to save Vanellope\'s video game, Sugar Rush. In way over their heads, Ralph and Vanellope rely on the citizen of the internet - the netizens - to help navigate their way, including a website entrepreneur named Yesss, who is the head algorithm and the heart and soul of trend-making site \"BuzzTube.', '2018-01-30', 'USA', 'RalphBreakstheInternet2.jpg', '2021-05-14 14:12:58', '2021-05-14 06:12:58', NULL),
(17, 8, 3, 'Five Feet Apart', 'Seventeen-year-old Stella spends most of her time in the hospital as a cystic fibrosis patient. Her life is full of routines, boundaries and self-control all of which get put to the test when she meets Will, an impossibly charming teen who has the same illness. There\'s an instant flirtation, through restrictions dictate that they must maintain a safe distance between them. As their connection intensifies, so does the temptation to throw the rules out the window and embrace that attraction. Love has no boundaries', '2019-02-15', 'USA', 'FiveFeetApart.jpg', '2021-05-12 03:35:25', '2021-01-25 20:44:25', NULL),
(18, 5, 11, 'A Dogs Way Home', 'A stray puppy, Bella, is taken in by young man, Lucas. Everything seems to be going fine but Lucas has annoyed a property developer who uses his connections to have Bella impounded. In order for Lucas to prevent Bella from being permanently locked up, Lucas sends her to live with another family over 600 kms away. However, Bella is determined to find her way home.', '2019-12-12', 'USA', 'ADogsWayHome.jpg', '2021-05-12 03:35:42', '2021-01-25 20:45:53', NULL),
(19, 8, 18, 'Jumanji Adventures Final', 'In 1971, Carolyn and Roger Perron move their family into a dilapidated Rhode Island farm house and soon strange things start happening around it with escalating nightmarish terror. In desperation, Carolyn contacts the noted paranormal investigators, Ed and Lorraine Warren, to examine the house. What the Warrens discover is a whole area steeped in a satanic haunting that is now targeting the Perron family wherever they go. To stop this evil, the Warrens will have to call upon all their skills and spiritual strength to defeat this spectral menace at its source that threatens to destroy everyone involved.', '2014-02-27', 'USA', 'JumanjiAdventuresFinal.jpg', '2021-05-12 13:19:02', '2021-05-12 05:19:02', NULL),
(44, 36, 18, 'Conjurings', 'contents', '2018-12-12', 'USA', 'Conjurings.jpg', '2021-05-19 08:34:47', '2021-05-19 00:34:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('fa821c73d7173a7e664403d5b5e90516e393a9c3ec46c3ee44f42fd28c7502f349101a0c0aa584c1', 4, 1, 'Laravel', '[]', 0, '2021-01-19 22:07:40', '2021-01-19 22:07:40', '2022-01-20 06:07:40'),
('ada294f88b1398d760052ab65573fe001860444feeac454fc6eef43e46f638b95fe8beb7cdbf7398', 4, 1, 'Laravel', '[]', 0, '2021-01-20 20:28:27', '2021-01-20 20:28:27', '2022-01-21 04:28:27'),
('8389ead324e4e503fdf62bbf24ff6dd161f39d5307cd8a98be70db32c127a787e1341c4d8ec808cc', 4, 1, 'Laravel', '[]', 0, '2021-01-20 20:32:48', '2021-01-20 20:32:48', '2022-01-21 04:32:48'),
('ff2d831145c0191fda951d45dd41017e6fcb14b1fdf0e9678481f34ab748eb577f5043682293b2a4', 8, 1, 'Laravel', '[]', 0, '2021-04-18 21:10:13', '2021-04-18 21:10:13', '2022-04-19 05:10:13'),
('9fb7098cb671e5963326ae4cf7124f3568e190f464c380add7fc2b93f3a6d4e04854a4913cfc5c49', 8, 1, 'Laravel', '[]', 0, '2021-04-18 21:11:34', '2021-04-18 21:11:34', '2022-04-19 05:11:34'),
('4a9fb0c831f0d325b1c379f0a45236bb6f8b97ac70b1b952257c00676553f9c88168e86bc88a5d79', 9, 1, 'Laravel', '[]', 0, '2021-05-01 05:53:55', '2021-05-01 05:53:55', '2022-05-01 13:53:55'),
('53a1360518de778208b9bddf3890f5f6c5b5c881579a1b21a55c6d8414746fb5fbcdd0a533f7f1db', 9, 1, 'Laravel', '[]', 0, '2021-05-01 05:55:32', '2021-05-01 05:55:32', '2022-05-01 13:55:32'),
('fdf79ad68485d742d7105ced863d6307f38a0f00be19fe445334044ae667823099e2f82054a992fe', 9, 1, 'Laravel', '[]', 0, '2021-05-01 05:58:07', '2021-05-01 05:58:07', '2022-05-01 13:58:07'),
('e098c21e9672f88611bcc713f8bd7dc07e93ab67b14aa8582ff443a12482953e062e8b90deafe960', 9, 1, 'Laravel', '[]', 0, '2021-05-01 06:07:08', '2021-05-01 06:07:08', '2022-05-01 14:07:08'),
('ec3845a40e93a76dd7964f71522a6b3d46dda26c7f415940ab43e68f9a67c0799b2e34ad3f8b20a3', 9, 1, 'Laravel', '[]', 0, '2021-05-01 06:15:46', '2021-05-01 06:15:46', '2022-05-01 14:15:46'),
('2a0006602b8d19c78c2cb9104c9c529177e8817c06dab4413149ff341fcb60b1898063c59cd13ae4', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:05:07', '2021-05-01 19:05:07', '2022-05-02 03:05:07'),
('787e1e653c88cd571ea852df3bf2e8cf036d9ca7078324c5e3725700f49f798d50bad5efaccb4313', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:05:09', '2021-05-01 19:05:09', '2022-05-02 03:05:09'),
('9acce1c42fc20325f2ff058d173e5b9da371c509f5257fd8544a27b26e729b0a2b38707a8ec9e4f0', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:05:09', '2021-05-01 19:05:09', '2022-05-02 03:05:09'),
('9335daa98da8c5d157c51d71ad8ae78d6dd533d2b99d25adab9798e605bddb829cd1111c52d24269', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:05:10', '2021-05-01 19:05:10', '2022-05-02 03:05:10'),
('ccfffd2b33ed7ef50dca1f0b30275cbe3951c9d2b90d6c196d3ebf52fad00174c3d9306e38b2d726', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:05:23', '2021-05-01 19:05:23', '2022-05-02 03:05:23'),
('45e45020b0eda8ed3b292cbf28e1db35dc2d11e518644aac7ff35b7cf31fa0b55c8b99b7e1bcb96d', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:14:40', '2021-05-01 19:14:40', '2022-05-02 03:14:40'),
('b2427e228a6c7962167cfdf9b146d50cf416405a40950212e860eb61875065036697ccb42c431862', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:25:56', '2021-05-01 19:25:56', '2022-05-02 03:25:56'),
('522a6bcf02cb7937df648cc739ca240727d29c3490d3423a69b19fb1fedca3fd875289d905f2e2e9', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:49:41', '2021-05-01 19:49:41', '2022-05-02 03:49:41'),
('e78e154cc5be99f9de7114d52385f5f583c862b070952f8fad96f54c23e93b239aeccb07c55807ec', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:51:17', '2021-05-01 19:51:17', '2022-05-02 03:51:17'),
('71a49a0a325e1fc4caea268e2cf3e822512a04838aa361a1253ea612ede645c4ef3dea77b0de1469', 9, 1, 'Laravel', '[]', 0, '2021-05-01 19:53:48', '2021-05-01 19:53:48', '2022-05-02 03:53:48'),
('7ce2ae72682f8f090079d40e4ec4aa08b7bb307cfeebdded8bc758932a80477ce6ebada73e9c01c1', 9, 1, 'Laravel', '[]', 0, '2021-05-02 01:05:40', '2021-05-02 01:05:40', '2022-05-02 09:05:40'),
('d7974daf42fc6b730f877c41b25aa7bef52f2f767880e6be75721ac28aa19ccda823d54dff0d70fb', 10, 1, 'Laravel', '[]', 0, '2021-05-02 03:06:41', '2021-05-02 03:06:41', '2022-05-02 11:06:41'),
('b9d4e7a57bde8b478badc763068a3188510e6c69ac2fe83331dcc9fa6646b8ab7869328d86ddc38f', 9, 1, 'Laravel', '[]', 0, '2021-05-02 03:14:40', '2021-05-02 03:14:40', '2022-05-02 11:14:40'),
('2f5d351826178a52c41b6922ead4a43c4d06f8a5c1b93535fff4d0bc192c124476299448a6ebbb4f', 9, 1, 'Laravel', '[]', 0, '2021-05-02 03:15:30', '2021-05-02 03:15:30', '2022-05-02 11:15:30'),
('c6efd338f318c8c9c8d4f3da771554eddc08c5b8d57081c105fa5788003c8845e11cb584b8c9bd2a', 9, 1, 'Laravel', '[]', 0, '2021-05-02 03:16:13', '2021-05-02 03:16:13', '2022-05-02 11:16:13'),
('684ed3d7e175cceebaa89e127740377045d003502b6f9bfa197a59494e9d7772333339f70c60f9ff', 11, 1, 'Laravel', '[]', 0, '2021-05-02 03:17:41', '2021-05-02 03:17:41', '2022-05-02 11:17:41'),
('ed6745c73b7aff17b30e8847d1ed9556bba2919dda2729725ccc61f44b182a7e2c1efaa5b5ca2705', 12, 1, 'Laravel', '[]', 0, '2021-05-02 03:19:02', '2021-05-02 03:19:02', '2022-05-02 11:19:02'),
('e739a39c7b3683db4d3a818ab622072bc7b57764de8f7da99f6fdc7c7a88db6dbc02c2f7edb5c0b4', 13, 1, 'Laravel', '[]', 0, '2021-05-02 03:23:25', '2021-05-02 03:23:25', '2022-05-02 11:23:25'),
('705dd405c3e47239ee79098ca7f38aa209251a918db14b9b1e0128ff14be5d60bb09aab692186fef', 13, 1, 'Laravel', '[]', 0, '2021-05-02 03:24:31', '2021-05-02 03:24:31', '2022-05-02 11:24:31'),
('e6b0b83186df6f25e92c7095c7b40556021ac9f200dafbc9e9a0a1f8b9ae3bbd97b81e90cccc6aad', 14, 1, 'Laravel', '[]', 0, '2021-05-02 16:42:44', '2021-05-02 16:42:44', '2022-05-03 00:42:44'),
('1f8b1e6325a5340a70764290baa8964824d2422a69d6f4fcd7019ec6bb3e6f0f29d852799f095b8f', 15, 1, 'Laravel', '[]', 0, '2021-05-02 16:44:23', '2021-05-02 16:44:23', '2022-05-03 00:44:23'),
('da93ec9e729dc46424ecd3a791eeb1147802c056fdf552572f05cdb39f7b61f36963665141ec7d11', 9, 1, 'Laravel', '[]', 0, '2021-05-02 17:23:35', '2021-05-02 17:23:35', '2022-05-03 01:23:35'),
('eae3494d2aee05df4e183e0e075ca2b4473978fec766480de122bd69669754a72222fe00904e2855', 9, 1, 'Laravel', '[]', 0, '2021-05-02 17:23:37', '2021-05-02 17:23:37', '2022-05-03 01:23:37'),
('60ecc7556a129cc6f4b3cabc579a0e7a1878dfbe6e278e19d2275a16e94ef0467032aca0a545c436', 9, 1, 'Laravel', '[]', 0, '2021-05-02 17:26:11', '2021-05-02 17:26:11', '2022-05-03 01:26:11'),
('6d8d37dbd3f65d730348c286eaec78a2b0bdc546379feaecea90e9ac76c644ba2a50406ac8e5eb23', 9, 1, 'Laravel', '[]', 0, '2021-05-02 17:26:35', '2021-05-02 17:26:35', '2022-05-03 01:26:35'),
('85913971343edc9db9ab04f1d7d962f8daef0ab1b169d13f9d479b5cfba13fbd3cd772eb81cbd322', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:03:53', '2021-05-02 18:03:53', '2022-05-03 02:03:53'),
('58080bcbcf70222acdc60988a3bbac3104a6cd5158e40c57e70a703197598920005d7722796a9e9c', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:03:57', '2021-05-02 18:03:57', '2022-05-03 02:03:57'),
('d9fe636a5e2c49b0fe19bba62ca15b346942ecb86c2a050b5da55a6e82b9d73513094109fae4af0f', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:05:15', '2021-05-02 18:05:15', '2022-05-03 02:05:15'),
('014a22ce6bc1682f5eed025556e844f319fb404e1707c8f65c3af9a65e062e8d5bf5fec2dbbadd90', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:05:51', '2021-05-02 18:05:51', '2022-05-03 02:05:51'),
('81b797cd08551f1cb08705a7a46a6ce388f4a5de111d5115cfcaab175f37c8a4c5f049377abb7769', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:23:58', '2021-05-02 18:23:58', '2022-05-03 02:23:58'),
('4d6904316f2ca96e460745fa07e8e0f7f3bf1c11754f9457ae5360a596af0dadc60e7ba4708df5f8', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:26:22', '2021-05-02 18:26:22', '2022-05-03 02:26:22'),
('378737d27c1adc56ee9232a6c93137b5e2899e6cd10c48e1db2991f15a0cbf8e15be0c70bfd7869b', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:26:24', '2021-05-02 18:26:24', '2022-05-03 02:26:24'),
('9942426c0b29e26271a3f19367e858c908a7dc0e16b55b44a021a3c8714fe1894d88635e0a0b3bfc', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:29:24', '2021-05-02 18:29:24', '2022-05-03 02:29:24'),
('27c8409e0256d43acbbaa186d1ae4fce8b7ae7fba37e6492a0a2676e7c8be1d7e2b56ef407e3b82a', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:29:27', '2021-05-02 18:29:27', '2022-05-03 02:29:27'),
('0043a6ae72d77c477f2c662aba13d9570c1aa7d94c4a48669e1562afd2de8dd16f38153d7d45ba54', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:29:41', '2021-05-02 18:29:41', '2022-05-03 02:29:41'),
('4d5e8deb03bebdc9e8ea93268658133bd1076dd5ee076541f5261d9b9bcab16c220441f0662b026c', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:33:03', '2021-05-02 18:33:03', '2022-05-03 02:33:03'),
('aed3f9734c2f1055a140ddb7b7198e1663ed5d187ffb134e5a1f848e444ffcc3e32f3e2c605780ea', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:35:24', '2021-05-02 18:35:24', '2022-05-03 02:35:24'),
('641981a3eba26537cfc837aed909cf5a826c846f5b32a2d0ac7990e2cf34714e9c878f7c3b532ce9', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:37:28', '2021-05-02 18:37:28', '2022-05-03 02:37:28'),
('d7157109983c99fac545643e62c2bdea9e97de2f74774e62d90ff225070f09b18f06e872cd2b8b12', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:58:57', '2021-05-02 18:58:57', '2022-05-03 02:58:57'),
('b5d04a00007ecad840c58ed2a9f76bf6026c31b341df10d55074769d5d3cfbef7cde201e80275861', 9, 1, 'Laravel', '[]', 0, '2021-05-02 18:58:57', '2021-05-02 18:58:57', '2022-05-03 02:58:57'),
('8d3f86b0fd76f04f9cbfd97735d8ac84814c34b22621f2e5902208c41c1a8339afcfbcd42d53d6c7', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:05:30', '2021-05-02 19:05:30', '2022-05-03 03:05:30'),
('79420701c3c2c424e2c8ae53976bdc9e903f3b48b0b815c8dc3ff7fc33cd61e7001d7b2da5986286', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:09:47', '2021-05-02 19:09:47', '2022-05-03 03:09:47'),
('a5a5e131a101986cf47492895b86b9bc25b04a0fdeb15abbe966cca44d55df49e8469000b82fb521', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:11:26', '2021-05-02 19:11:26', '2022-05-03 03:11:26'),
('7491125a40fd352c67575b7d912ec255526da8b65500ea4afbf525ee9180bb03f7b763ac78370e63', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:14:40', '2021-05-02 19:14:40', '2022-05-03 03:14:40'),
('b3ee35c13960d845d94cabcca87e708ebf12eb07583caeb9d2236d26580f278d387ac50f4643bf43', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:36:33', '2021-05-02 19:36:33', '2022-05-03 03:36:33'),
('45a611a331f91e5a9fa33aafd3c772eaf337130fdfaf85e65b202688708a7eaf16c0644fd8837106', 9, 1, 'Laravel', '[]', 0, '2021-05-02 19:40:50', '2021-05-02 19:40:50', '2022-05-03 03:40:50'),
('9e99bf782fdae67d2e1558545a3fe72f335eeaba85748212a15ddae54ef9ac08ae9e940768f5a01f', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:02:25', '2021-05-02 20:02:25', '2022-05-03 04:02:25'),
('f6b8394fcbd4caaeff3f4cbfe9cdf189aeab1d15f64f900875e59e874e91631e244588b57745daef', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:09:13', '2021-05-02 20:09:13', '2022-05-03 04:09:13'),
('d9b7b91d92a7cf36be030f556530ce6949c13c53c9568319a5e18d621da9243ff43f22fded14cb47', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:10:33', '2021-05-02 20:10:33', '2022-05-03 04:10:33'),
('aaf5dd68ab86964d79b67244ef40825c3d2f0a40f48c0e04ae8e239156e4725ecd32b1f30926af86', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:12:10', '2021-05-02 20:12:10', '2022-05-03 04:12:10'),
('d76c818e857cadce56ed4641ee5babd33a8007fe2e84929ef50a79e75fc3f97c7a5ee86dd2e82823', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:18:17', '2021-05-02 20:18:17', '2022-05-03 04:18:17'),
('6eff72c65107fef02819b5df7e131f9fc382616ffd08a0b06e6da5777ac626a200182736c3c099fe', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:18:46', '2021-05-02 20:18:46', '2022-05-03 04:18:46'),
('7be36b3e627ca8733fbcdc4f596ffd008ac23c7d01e61fcbec7e9c2837bf0275e735ecfb9087136e', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:26:33', '2021-05-02 20:26:33', '2022-05-03 04:26:33'),
('1ad48224af7d1958f085b6a81e838ff32420497527991e614d66cd3248f121bccbc501b5d5b78f8e', 9, 1, 'Laravel', '[]', 0, '2021-05-02 20:31:04', '2021-05-02 20:31:04', '2022-05-03 04:31:04'),
('ff01ea08c1f77eb493a5696967f29f29316304dde8737e8b8c1d17e3dc0c7203d9f5fd3ac0b059db', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:31:17', '2021-05-02 21:31:17', '2022-05-03 05:31:17'),
('07b880897423d23c11f9ae3c5acafaa32aa1a3c3882027dd93ccb80159800c6b8a84ad186c46e5d2', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:32:40', '2021-05-02 21:32:40', '2022-05-03 05:32:40'),
('ab104181aa7ee80166b0ee014f4271cfaac25bab0e19cc2b8906a22a33806e378ad24e0997bfd6a7', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:34:40', '2021-05-02 21:34:40', '2022-05-03 05:34:40'),
('07cf8240a7c587b9f5414db21b51a803b70b06c81e6c1257dc81a8128a32027177cbbd6bb9a3dba9', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:34:44', '2021-05-02 21:34:44', '2022-05-03 05:34:44'),
('9d2a0b3e9fed25586d5fccf38c8caa9007f2270f54104e6e98bcd8dcc6093e98a9b4209a64da75d5', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:34:46', '2021-05-02 21:34:46', '2022-05-03 05:34:46'),
('bf420b65fd2fa4a0b7abced731a0a3ea6ceeaadb93657925544ee2ae33da99aa13f8d3cf1581dd75', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:35:02', '2021-05-02 21:35:02', '2022-05-03 05:35:02'),
('80087985afd190638019037b63abbf41c5b5950cff721dacb9eb81ba032660ff7b73cbfec3867e25', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:38:08', '2021-05-02 21:38:08', '2022-05-03 05:38:08'),
('8951673dd20406c29edf06d261d68ae42dbce61405442d43f1053c3c81205a8aa7250f0ce51d665d', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:39:19', '2021-05-02 21:39:19', '2022-05-03 05:39:19'),
('1d553e6f77c7cdc788be2150b1828bf73fb237de6bd39e2e8508defb25815780ffa5153ae8bf9b53', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:40:48', '2021-05-02 21:40:48', '2022-05-03 05:40:48'),
('dfa9fd9cb2b6eaf75a87c67770d4a8ae05919ab60306425c39f77f3b9552c9e3ed42b06d5e7426b8', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:46:58', '2021-05-02 21:46:58', '2022-05-03 05:46:58'),
('ae00fa73360e858adac94ab107ee649b8bccd3fecf9badfb385f0004feec1a426cfa1819e332800f', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:48:33', '2021-05-02 21:48:33', '2022-05-03 05:48:33'),
('6025ac0125cff93930cbff3768b63383d0e501e525af1e1660ccacd98cb273bf4e6e7e6e44a56238', 9, 1, 'Laravel', '[]', 0, '2021-05-02 21:50:52', '2021-05-02 21:50:52', '2022-05-03 05:50:52'),
('2c5172daab809f8ae01d6dbcfa51f67cbe100389d349bd97bac86c11a14a8f36beb7dfd50fb75268', 9, 1, 'Laravel', '[]', 0, '2021-05-02 23:02:08', '2021-05-02 23:02:08', '2022-05-03 07:02:08'),
('4373217a631d5f17d6e890d0f18a4970d3381997ab0fb3a7bb19d7c90200e841f240f82ed946db94', 9, 1, 'Laravel', '[]', 0, '2021-05-03 07:45:09', '2021-05-03 07:45:09', '2022-05-03 15:45:09'),
('057150454d8fd77e5fc1cf7e96fe43b9184aba6504dc5810d8ba972aa5f172fdd6f1b3855b54ee80', 9, 1, 'Laravel', '[]', 0, '2021-05-03 07:54:44', '2021-05-03 07:54:44', '2022-05-03 15:54:44'),
('6894f498a9870b97f4c03f3f2ebf1a059c15d061c7d9b0b52a22dca2adf4cf53f169cdc66b2eadac', 9, 1, 'Laravel', '[]', 0, '2021-05-03 07:54:46', '2021-05-03 07:54:46', '2022-05-03 15:54:46'),
('8f3f67274ee77d14372210817dde0293083c84c46f3896e71606e41b2b1fdb4dfee5c222764f45ed', 9, 1, 'Laravel', '[]', 0, '2021-05-03 08:04:06', '2021-05-03 08:04:06', '2022-05-03 16:04:06'),
('e450342a4cc1ef550e974c896b6354e916dde30208693c8699aa79f5530cfd6127f8652a8f38c05e', 9, 1, 'Laravel', '[]', 0, '2021-05-03 08:06:05', '2021-05-03 08:06:05', '2022-05-03 16:06:05'),
('d433c6cec8bd3d89ea3f28cddeaa262ff915d1a3251042488a2d2fa9fcdf44c24803e7e35182ad43', 9, 1, 'Laravel', '[]', 0, '2021-05-03 08:12:54', '2021-05-03 08:12:54', '2022-05-03 16:12:54'),
('469e6c36dfe4454d0de8db10bd7fee66af61de198b5a8a55078401985d4b9a071dfbdb403177678a', 9, 1, 'Laravel', '[]', 0, '2021-05-03 08:24:59', '2021-05-03 08:24:59', '2022-05-03 16:24:59'),
('89486d481ac09ca66b58cadd8dd545e56c94cbea5f8ad0d54f322d1ed2fdca97c9b87f02aa6fd31b', 9, 1, 'Laravel', '[]', 0, '2021-05-03 08:25:00', '2021-05-03 08:25:00', '2022-05-03 16:25:00'),
('3797a0fb0b8cfb61c3b70d69c368c8c3ef71b00d5ce7bddb1d591285803f59852d499645684345f4', 9, 1, 'Laravel', '[]', 0, '2021-05-03 09:00:35', '2021-05-03 09:00:35', '2022-05-03 17:00:35'),
('bc4694c7aa4c202a0ee29779bb45f9207ee6f543e76c228ae41e6c5dba851bf1a48d8e1ce7779dfd', 9, 1, 'Laravel', '[]', 0, '2021-05-03 09:01:28', '2021-05-03 09:01:28', '2022-05-03 17:01:28'),
('e1566b99c93179d5774bc7dff7fce298397bc4d428eccc17d2ff22dbad145c5d180bfe6230b5b9d3', 9, 1, 'Laravel', '[]', 0, '2021-05-03 09:05:04', '2021-05-03 09:05:04', '2022-05-03 17:05:04'),
('981c540ad0edc28fbc8cd2f28aeb2c1ba2e20d4f2b53a89aff8988be7d68d0661ec6bd21764420ca', 9, 1, 'Laravel', '[]', 0, '2021-05-03 09:05:07', '2021-05-03 09:05:07', '2022-05-03 17:05:07'),
('f6e3a1c7c32e0471c61568a83a8ab39da5e578951e497ac6331dbc68842ab1fae31f7a17a6ea955c', 9, 1, 'Laravel', '[]', 0, '2021-05-03 09:05:09', '2021-05-03 09:05:09', '2022-05-03 17:05:09'),
('fce84139be79cddb029171fd051d40a820728d9794637a6bf92f9beee04dc4257940b49cfa6620fd', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:13:08', '2021-05-03 16:13:08', '2022-05-04 00:13:08'),
('9c5cc6dec9320fc0933a4cb099a795ef66677d8ca24ed7ad63718d005097757c95d8210355014fac', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:13:11', '2021-05-03 16:13:11', '2022-05-04 00:13:11'),
('a5a3d98b8f87ce597a99a9ec87fe23cf12e2174a0d4e91628249d724ed02ba67403a6551e8dc2462', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:13:53', '2021-05-03 16:13:53', '2022-05-04 00:13:53'),
('e0ef531afa221751730a08a7ecdf2b3cadfa726df3760d15842e62650bf2674aa06d9d675989d378', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:13:57', '2021-05-03 16:13:57', '2022-05-04 00:13:57'),
('ed0d28031a95a1d899024a0f291a0ef9b357957ae1736a08bdcbde81df64634f3b70093020f89693', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:42:48', '2021-05-03 16:42:48', '2022-05-04 00:42:48'),
('1df07d1ed94a501e33bee3dd1433b6098bf3295020192bdec2c74f0b5184dfa0f568ebfda22afa95', 9, 1, 'Laravel', '[]', 0, '2021-05-03 16:42:49', '2021-05-03 16:42:49', '2022-05-04 00:42:49'),
('d18ccefa1de3878315025dbf5886c23adb6290be68999f5da77d7fc24812e68b4c728d4f8855a7b8', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:49:11', '2021-05-03 16:49:11', '2022-05-04 00:49:11'),
('1a2c5550c96c2b3c3bb07ac54d0f7d1161da8841d1f6369726bb238882bf492c33bf62987df83bcd', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:50:07', '2021-05-03 16:50:07', '2022-05-04 00:50:07'),
('5b1d0ce7f0b4ea7a8b2ff47a6dc3cead83cc4a2384ad95b87571962f7b1a710cc266456ad4c23068', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:56:10', '2021-05-03 16:56:10', '2022-05-04 00:56:10'),
('86b6b0643d2e216e762acf234250f603dd8d2adfa91ee5dc6f8ed5ce2946f3bcd29dafe3561d2a1d', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:56:10', '2021-05-03 16:56:10', '2022-05-04 00:56:10'),
('e17583fecaf87d17f56a70215837a94424a0eb6162c60a501fc89f3510284c09a6e661c8dc9efbb2', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:56:11', '2021-05-03 16:56:11', '2022-05-04 00:56:11'),
('d1adcda62109ecc8c0f051d0af46a1668626030693a0f14ac1337064be37a7de609c95229c897835', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:59:10', '2021-05-03 16:59:10', '2022-05-04 00:59:10'),
('54b36c05faca35b586ac51bcc03034e33a3c14f53301a6e80a84c20d0fa4512804489202f6a6882e', 16, 1, 'Laravel', '[]', 0, '2021-05-03 16:59:46', '2021-05-03 16:59:46', '2022-05-04 00:59:46'),
('ba507eb6f978217ba2f83a205f7384e2aaec716da47e9dc8d87b3bed146645ecf5b4a8d14a264208', 16, 1, 'Laravel', '[]', 0, '2021-05-03 17:15:42', '2021-05-03 17:15:42', '2022-05-04 01:15:42'),
('75b5a7e04efff6bdbf259ee90e9d9735d91a9763460b4c097a0372da3d1ba671dc39e184195d374d', 16, 1, 'Laravel', '[]', 0, '2021-05-03 17:15:43', '2021-05-03 17:15:43', '2022-05-04 01:15:43'),
('b9d119c5a06905f17abf6baf02291cc4b21aeaa0db9155fbd43b71e3ca903c0318111fae846183fe', 16, 1, 'Laravel', '[]', 0, '2021-05-03 17:18:20', '2021-05-03 17:18:20', '2022-05-04 01:18:20'),
('4b129ab042eef12fb06c78ff22fbb492111447612ffea2fccbf955688a565b9a539da2762a698108', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:19:15', '2021-05-03 17:19:15', '2022-05-04 01:19:15'),
('c7f0d01d5a0baf6a4a1c14dc5c3b657edc10c608ad047b423ed3040f02f08219742a9bddcc1eca55', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:19:41', '2021-05-03 17:19:41', '2022-05-04 01:19:41'),
('a8c6a7a847dc3457260a65b09261f3571f94e985404ab8d0ea4b500282915d3e00394f683907f4f7', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:23:30', '2021-05-03 17:23:30', '2022-05-04 01:23:30'),
('6ddaf44edbcbf12acddccd223b2c62b3eb011a6c86c51a5f23d920cb7dd5d896c58846db2520c010', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:35:41', '2021-05-03 17:35:41', '2022-05-04 01:35:41'),
('a7ca8b6b541dcfd0266da990f20a1be4a6c1307e67ead07e26d0db3c80f1ece97e5f37a5adb29857', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:43:39', '2021-05-03 17:43:39', '2022-05-04 01:43:39'),
('103148456e361f2e1208d4770823c80da152bd89594654c273cae5a2ec12212416e8d9fa43ca58f4', 17, 1, 'Laravel', '[]', 0, '2021-05-03 17:46:29', '2021-05-03 17:46:29', '2022-05-04 01:46:29'),
('a4a5d8af3eaf81b23f36dbc6078981d2c01b3b6f2c3a54d7777a924840865621eb7e0722ecb9cf02', 17, 1, 'Laravel', '[]', 0, '2021-05-04 11:36:02', '2021-05-04 11:36:02', '2022-05-04 19:36:02'),
('0dd6adb9b84be2952e83b5c05cb24b5cc378fbdd5008f52f5c4474b586801ceb2bfe2fa7be60c661', 17, 1, 'Laravel', '[]', 0, '2021-05-04 11:36:03', '2021-05-04 11:36:03', '2022-05-04 19:36:03'),
('129f3b20bf85bbdc552eaef668de3e4d6cc37e026ec898b6c4873dff84bfb1b4ef37d5eb1ea7a200', 17, 1, 'Laravel', '[]', 0, '2021-05-04 11:36:04', '2021-05-04 11:36:04', '2022-05-04 19:36:04'),
('751800f0b6e335fffc4cc871dd2da165ab1f6568094244182f95625de0ef2ef0ebcf59fbe7cb4579', 17, 1, 'Laravel', '[]', 0, '2021-05-04 11:36:32', '2021-05-04 11:36:32', '2022-05-04 19:36:32'),
('8380a312dca5466b4d2e69201cf1801cf1fe173f837d3afb18271327030866f51c1508d26a70b8d3', 9, 1, 'Laravel', '[]', 0, '2021-05-05 03:51:17', '2021-05-05 03:51:17', '2022-05-05 11:51:17'),
('3d3a508227d41bab0426924ae8176cb66fa3e368ad0024e11aa1dab92b157edc43ebf2d025202d04', 9, 1, 'Laravel', '[]', 0, '2021-05-05 03:53:30', '2021-05-05 03:53:30', '2022-05-05 11:53:30'),
('8ce21c764ad796f6748b5c199764252c6acdb0df15fa4664330fc5ae50f743536e227e057372fd49', 9, 1, 'Laravel', '[]', 0, '2021-05-05 08:30:54', '2021-05-05 08:30:54', '2022-05-05 16:30:54'),
('432b042b5bfe894505f7b08699b80a4cfdf351d972ca6df610db414c969fbde13d329f03b34db540', 9, 1, 'Laravel', '[]', 0, '2021-05-05 08:30:56', '2021-05-05 08:30:56', '2022-05-05 16:30:56'),
('45c35d00c06554278a6bf746f924ffa0dd7f4d6fdae8302b381e094a1c28c30ebca156220e2dffc4', 9, 1, 'Laravel', '[]', 0, '2021-05-05 08:31:10', '2021-05-05 08:31:10', '2022-05-05 16:31:10'),
('7e9f5e929e3523f19967d1b1085a47de8edc5d20f29f6d1f578ba2eae6698dadbb7200f9b8cc5075', 9, 1, 'Laravel', '[]', 0, '2021-05-05 08:31:14', '2021-05-05 08:31:14', '2022-05-05 16:31:14'),
('3978018cc8d19af308078cd79da0d1ae0d8e3b54eee740d8c3b071c2ead5baade37d1ef21a646b6c', 9, 1, 'Laravel', '[]', 0, '2021-05-05 08:57:12', '2021-05-05 08:57:12', '2022-05-05 16:57:12'),
('f4044309a8efed38af00c11a578792949bd612cdf29ebf34dc5c02489f53b8b45b2fd45c341d02b8', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:15:33', '2021-05-05 09:15:33', '2022-05-05 17:15:33'),
('e2901f8e5ee4204de0e4a574a7063eed840a4889c516a482da9f241ee38e3389f044cccbebe7e543', 19, 1, 'Laravel', '[]', 0, '2021-05-05 09:17:00', '2021-05-05 09:17:00', '2022-05-05 17:17:00'),
('38f0a98a9fd09b0b1f19c59a037dc055d569a48083c2cea9b042296eccc06f777ba02a120aeecd2c', 20, 1, 'Laravel', '[]', 0, '2021-05-05 09:18:26', '2021-05-05 09:18:26', '2022-05-05 17:18:26'),
('2066ff278354c0863b0bd1d77fb981844a5ae837e4be7451f8c8d8bf5b1676876308007881c4f763', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:49:54', '2021-05-05 09:49:54', '2022-05-05 17:49:54'),
('f4971ce9678086c9d984b2dfe5d4c41585312d3af346bd9455a2ab7a1f5a3f0c1e8b2012d871467b', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:49:54', '2021-05-05 09:49:54', '2022-05-05 17:49:54'),
('9e5146cbcb400597ed78d2ad1f2d13abe7c6c39bb75e68bc5ce6a5d035e3ae747d1beb90727e8d80', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:51:58', '2021-05-05 09:51:58', '2022-05-05 17:51:58'),
('61ba087482c40e2cc68d667bc6b6186b2ac02ef42ba6ff5c87b0b5417063cb62a3a47a9aa393aa63', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:53:45', '2021-05-05 09:53:45', '2022-05-05 17:53:45'),
('fd4266d49a27459b05845032b97dc6cd8d8641a6d6260e95d9356074f0417bb1851ec73f91bdc49e', 18, 1, 'Laravel', '[]', 0, '2021-05-05 09:56:44', '2021-05-05 09:56:44', '2022-05-05 17:56:44'),
('b024e97493d88ace928ea0e6f0f49d241db24ebb670bae9e4bd465ca2815a458bcfc1990badad0ce', 9, 1, 'Laravel', '[]', 0, '2021-05-05 17:53:40', '2021-05-05 17:53:40', '2022-05-06 01:53:40'),
('d0f396beae947958cddb943e4cdb6e3f06bfd88f5a5e50b886315743cf0efd9d60838d91b1697b44', 18, 1, 'Laravel', '[]', 0, '2021-05-05 17:56:17', '2021-05-05 17:56:17', '2022-05-06 01:56:17'),
('8a6f8f0b97571e279f196ab59c50f56f630c94b4b39b47d13a68f5415270e3c5161bab578474b7c1', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:02:41', '2021-05-05 18:02:41', '2022-05-06 02:02:41'),
('377e94adbc1d880b258aafdad2a2ed6e64a3112999204ae5dd9fd3c907c9ab3accb97b92221ef047', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:05:36', '2021-05-05 18:05:36', '2022-05-06 02:05:36'),
('73f74b49a159804b7cf4456668f178aee30b5e6f986ed2b7cc33b62a9ebd7ddcb31d8eecd8ec6494', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:08:47', '2021-05-05 18:08:47', '2022-05-06 02:08:47'),
('bb4e1bb158c40962dbf1ca870b95d56ca4cb989717368c815df959f03c402ed59a3de374b3b947c3', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:09:43', '2021-05-05 18:09:43', '2022-05-06 02:09:43'),
('c2eb71ab371c99f6e8a0cc4f77f04e552b590efb1db28282c4e528ff0050755311b0c9c21d138a24', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:11:59', '2021-05-05 18:11:59', '2022-05-06 02:11:59'),
('f0ab7118ecf0cade8fbe4a59e04ba92c27258e777bd86a52ea2a4c4b03ff03901a9dad7eb4273fcb', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:17:26', '2021-05-05 18:17:26', '2022-05-06 02:17:26'),
('1fbc43aec9696daef21732bb5df4eb93c602eef5935d07e9ff566678ce835e0dc29e427c4ed6c361', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:20:39', '2021-05-05 18:20:39', '2022-05-06 02:20:39'),
('af7c2af2d2dbc7b9bc728ccdb6c1242d5957fd11723c9cb64a5204a19ca319780883f2ee9b8ce448', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:24:00', '2021-05-05 18:24:00', '2022-05-06 02:24:00'),
('cfeb0bb7004b289bf31cc24427eddef17bd1bbafa3053637fcef0f93f8689b5a2437965c528416b6', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:41:32', '2021-05-05 18:41:32', '2022-05-06 02:41:32'),
('8b32191e10d331d05eabe1daaec6a4e82d4a8d33e1bd73c1691984bf63d7b68a4cef57dba855ec52', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:45:16', '2021-05-05 18:45:16', '2022-05-06 02:45:16'),
('18865d33073c42127913cd6a2253ea1c8a29801c6749250eff2c33b5dd59c7e008742bc3b10f7967', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:47:59', '2021-05-05 18:47:59', '2022-05-06 02:47:59'),
('d04387fb94692cb6c60a75c785ad0d084d787b3283c37ba9464e904ee28e20d969e3ed436a724ec4', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:49:38', '2021-05-05 18:49:38', '2022-05-06 02:49:38'),
('ea30af47cce7631f5500237a91a7fcc91f5a280046abd998a6b9a5ce5ed591967da3e478d11928a8', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:50:24', '2021-05-05 18:50:24', '2022-05-06 02:50:24'),
('fa1e412648fdf026662e87578c947175e93adeddfb8d77471fd77dd67c34f31d90b27279002b2756', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:51:12', '2021-05-05 18:51:12', '2022-05-06 02:51:12'),
('67f119be187923b3987fca71ac5136b98303aac7288c48d23f42f13c59cee1c4ca66de74046b1e8f', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:58:19', '2021-05-05 18:58:19', '2022-05-06 02:58:19'),
('d41c33a88dd5afcca5c9c06630198332f865f50714efd0694e59357da847b3c09e0c75cac53a6f80', 9, 1, 'Laravel', '[]', 0, '2021-05-05 18:58:20', '2021-05-05 18:58:20', '2022-05-06 02:58:20'),
('e7b1604ece6578980cad8132bfe844bfb55b3e4eafb23bcaf2dc27d35f0885dfc4164911defa1ef5', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:03:51', '2021-05-05 19:03:51', '2022-05-06 03:03:51'),
('1a440f521e57db12d389bc7615bc6cf2ea8c29a4d0ac459dd1e4157c1af3c5c59930a90bb691ec34', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:07:06', '2021-05-05 19:07:06', '2022-05-06 03:07:06'),
('87d65f46f02762efe338156011a0e30623b929382d16e4c6aa67536e2610f6d87f999ddd7758c37d', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:10:05', '2021-05-05 19:10:05', '2022-05-06 03:10:05'),
('b0ff62c449f85a4376deb5e1b2c18b2f223efa251d0bbd2531e98aabda1834f6c78e433a2df37dcd', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:11:04', '2021-05-05 19:11:04', '2022-05-06 03:11:04'),
('73658cf197466c211129efd7a293fa0880680a894a73436606087222d82bf1a460671b1ebc76beae', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:12:37', '2021-05-05 19:12:37', '2022-05-06 03:12:37'),
('886dc1796c3351afbf5558c6678b85f329f2a9a4951d281cf62fe67e772e02c6b7c89bbd2a011eeb', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:15:01', '2021-05-05 19:15:01', '2022-05-06 03:15:01'),
('aea21a64c40984bacaeae942460ff6b24c2e933e5b1c0a63328a964bc34a8c64cf3dc5cea38db631', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:16:34', '2021-05-05 19:16:34', '2022-05-06 03:16:34'),
('5ab872d32af185842eadec7c747653aac750d02df87c0321d76092f7ae90f498db8b1f1bd557212f', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:23:34', '2021-05-05 19:23:34', '2022-05-06 03:23:34'),
('fbd0a9c63dc74951c7de8ff07699435c21780951805e417f1ba41d6f6735c821cb99104ce0ca45d4', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:24:19', '2021-05-05 19:24:19', '2022-05-06 03:24:19'),
('6c7ab00eb2bdf28d4ab5efdc42f0e9639747744dce67ec8510130807fcf082514b289ca88ac58152', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:26:30', '2021-05-05 19:26:30', '2022-05-06 03:26:30'),
('f1aab203ea57bdc74010f344183e91eacdc3b93d37ba4fd91ee6024b296f14ea33252798e3ae7c2b', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:29:15', '2021-05-05 19:29:15', '2022-05-06 03:29:15'),
('422fc776ba0824dc008792aba0bd97781310c2d12f16046faf835d4e7f2931ddf317a1b3cfb817fc', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:30:05', '2021-05-05 19:30:05', '2022-05-06 03:30:05'),
('779db28489d89f7b7f8e265b7926e84fc6032722906f8b6b9956015339cb51219d854c04a2c458a5', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:33:48', '2021-05-05 19:33:48', '2022-05-06 03:33:48'),
('e2d080fac6973e6600ec8712d32a7547c479ef4d763bcd60280e7932390ff11d4de612eae6794189', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:48:01', '2021-05-05 19:48:01', '2022-05-06 03:48:01'),
('8d5912edd85d999d4086dd6b16470a50d494886479e2dace7316bac3805e8c5a3993f37e8c98ee99', 9, 1, 'Laravel', '[]', 0, '2021-05-05 19:57:01', '2021-05-05 19:57:01', '2022-05-06 03:57:01'),
('60c9903262ba3f140c15308dabaa245863b880e7f54dc0c519527d26389afff5b2fabdb2a550da74', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:04:38', '2021-05-05 20:04:38', '2022-05-06 04:04:38'),
('fa0f396a3d8d6eca71aa9aa1d5755a2dd54552053d6d4075fda919a97059cf4eb08aeeb7162744a5', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:07:53', '2021-05-05 20:07:53', '2022-05-06 04:07:53'),
('eec4971cce4a43f14d927e4ff586e8e171b51c509735dffad9a9f53ca5f1cfe02fa557927a44fcfa', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:14:42', '2021-05-05 20:14:42', '2022-05-06 04:14:42'),
('b2a84e6ea3195d48cfeaa19307b231a73137c72ca9199bce07faf14af1295f2caaf0b249485decbe', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:18:15', '2021-05-05 20:18:15', '2022-05-06 04:18:15'),
('edf8d3f7f6ed7af441c9cf1f2583e748227f7f85dd3c3801b8dbe480605d6a2f687077dfc1667edc', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:23:31', '2021-05-05 20:23:31', '2022-05-06 04:23:31'),
('2a86e9fc3b3d946b41ceb3907108b2a67b28eb1b5248a10dcc0cce92b4b7c198004671b91a3cc77a', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:30:17', '2021-05-05 20:30:17', '2022-05-06 04:30:17'),
('33c5ebbd65f8be1e79da56fcb59ce7b46a9d0ba2170a56aee0c2f6d29d87df9c109468772f97e12c', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:32:32', '2021-05-05 20:32:32', '2022-05-06 04:32:32'),
('a2c1a2db21836b1464688fefe6b6d4507798a2e4df5caed57ec5318f1645621d210404479337f7d5', 9, 1, 'Laravel', '[]', 0, '2021-05-05 20:36:27', '2021-05-05 20:36:27', '2022-05-06 04:36:27'),
('aea3447c130c740ff7fc005c8dfb09c12702cd2d307c225fa0a460f95cb14ce854f17a6b586e9a12', 21, 1, 'Laravel', '[]', 0, '2021-05-05 23:27:29', '2021-05-05 23:27:29', '2022-05-06 07:27:29'),
('48dfc3acdde175d565ba1b8e9f738a005e519da36ed86e3c3752a153754d6255538da21920f3ec18', 21, 1, 'Laravel', '[]', 0, '2021-05-05 23:30:44', '2021-05-05 23:30:44', '2022-05-06 07:30:44'),
('2a87e80fdb2332d783fc618a25091000b4007a25e240ac2fa99d511f488462843ceed4943f5e7848', 22, 1, 'Laravel', '[]', 0, '2021-05-05 23:31:44', '2021-05-05 23:31:44', '2022-05-06 07:31:44'),
('3836f91e06815754c75b1cccfee08205bbc13a363fee84902a4c1bac2e0dbdc93b8ad27011870906', 22, 1, 'Laravel', '[]', 0, '2021-05-05 23:37:09', '2021-05-05 23:37:09', '2022-05-06 07:37:09'),
('c5c118e41b2bf913f0a50e704114baf4c3fd940d2fe9a352bb44fb8d84740dc5765e1fc9e2f4811a', 22, 1, 'Laravel', '[]', 0, '2021-05-05 23:41:14', '2021-05-05 23:41:14', '2022-05-06 07:41:14'),
('d5f77d6d7673ad28fd3ef75c8a655d5564501a1c08b7b834b86526b57e6042abd0691343793f551d', 22, 1, 'Laravel', '[]', 0, '2021-05-05 23:47:52', '2021-05-05 23:47:52', '2022-05-06 07:47:52'),
('8d571d958b2a1407f070b9fed7bf51dda3f380ac1b10d0236f870a39a3e875caebcadcf591e59d04', 22, 1, 'Laravel', '[]', 0, '2021-05-06 00:16:43', '2021-05-06 00:16:43', '2022-05-06 08:16:43'),
('1177a92d72a2531cefc2908f73a71abaf52231e9a0cb6858a4151ca7fb09a89c2c40bb362ae89ed2', 22, 1, 'Laravel', '[]', 0, '2021-05-06 00:16:43', '2021-05-06 00:16:43', '2022-05-06 08:16:43'),
('7a77bd46733ab933bbc015d2b7bb3074a43772eef44cfc7d034fc7090526de59150244231dfb6ef5', 22, 1, 'Laravel', '[]', 0, '2021-05-06 00:16:44', '2021-05-06 00:16:44', '2022-05-06 08:16:44'),
('b87c85b9420ef31f6beca76d1e3df4a71f39c526f4802dc4d3d679d0abf5a9fe8e51eb65456dbb40', 22, 1, 'Laravel', '[]', 0, '2021-05-06 00:25:18', '2021-05-06 00:25:18', '2022-05-06 08:25:18'),
('cbfae437ed970624398e9a4ee70a59332d988d4a8456db9a27fd106c07c3bcab1e478f7ebc5c1a7e', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:51:25', '2021-05-09 06:51:25', '2022-05-09 14:51:25'),
('5ff68f4987de0a1a4cd94991e324771635899ec18b005d718c2b69f99c87ed999b1aff137043e67a', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:51:27', '2021-05-09 06:51:27', '2022-05-09 14:51:27'),
('de55a62943e8daf377dc0dc6f742516183fad8f7c237d498cf91967620b26a03710b5c8b4a9ddc7f', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:51:28', '2021-05-09 06:51:28', '2022-05-09 14:51:28'),
('c672bbe05db549a2a243c0c8a21e68c393b84b666d43fc0aed5cabf148ad616263f104265d718674', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:51:28', '2021-05-09 06:51:28', '2022-05-09 14:51:28'),
('17cdac614e38e3d8d218fd8a386245ccf9d68de9483d5ab611a302190af72e3ac2f6d4602919d571', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:54:34', '2021-05-09 06:54:34', '2022-05-09 14:54:34'),
('6e1e567031567c7f8f6010f0d93d80c2088873cab1dbfec205627a9f5ce317a59a68a6a4a3996d94', 22, 1, 'Laravel', '[]', 0, '2021-05-09 06:56:51', '2021-05-09 06:56:51', '2022-05-09 14:56:51'),
('69d13d184a3439d21c5660546a9b808b6a7f03938975007a67676f9cfde13cd967be1d1745b37a7c', 22, 1, 'Laravel', '[]', 0, '2021-05-09 07:00:26', '2021-05-09 07:00:26', '2022-05-09 15:00:26'),
('4466b70e6acf6b2567a4a40c518f74b57cfe1193843d581ca4c55c7ac1c9e0e7c53651ee6c6e6714', 22, 1, 'Laravel', '[]', 0, '2021-05-09 07:52:02', '2021-05-09 07:52:02', '2022-05-09 15:52:02'),
('83ed91355fead819dedffdb59d20394986c0b5666646731b5b8f5726d32c2cc69952efead73a092a', 22, 1, 'Laravel', '[]', 0, '2021-05-09 07:52:03', '2021-05-09 07:52:03', '2022-05-09 15:52:03'),
('e81acf844259eb1918d70fb70fa52968b24ddefed442c8f9646e74c4a93c5d641aa56e6bd433f48f', 22, 1, 'Laravel', '[]', 0, '2021-05-09 07:54:52', '2021-05-09 07:54:52', '2022-05-09 15:54:52'),
('8c9cbaef3cea06cb40dd64053501b78c41e3a66e185ec1f5415b1255bb368af3cedb033a0bef86f1', 22, 1, 'Laravel', '[]', 0, '2021-05-09 07:59:30', '2021-05-09 07:59:30', '2022-05-09 15:59:30'),
('423b1833c7b33f96020261d98521cf967ac33a7107a3cf6afb3dcd74dac98d8825c49df17bbc15df', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:10:22', '2021-05-09 08:10:22', '2022-05-09 16:10:22'),
('5ebede67c971ae3fa2195593474c2754ffa13ce9195f76b20f7cd41f55077125048e27a9f7397011', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:11:24', '2021-05-09 08:11:24', '2022-05-09 16:11:24'),
('7616f5572b75838270bc497e9e881ef67f4bd6674fec74855254718034b0cff78a32ac9c99f43dce', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:15:37', '2021-05-09 08:15:37', '2022-05-09 16:15:37'),
('23aa1aaab51c4aa1a1903bc94a150e14c521fa70d4e2f3e56a96fbf007752a900ba278a30f52440f', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:17:01', '2021-05-09 08:17:01', '2022-05-09 16:17:01'),
('5dc63ff61622c6cfa789b850c08e2b3e6b008cbfc943988da1d120933bc09c39e653ac0f9e16fa15', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:19:29', '2021-05-09 08:19:29', '2022-05-09 16:19:29'),
('c4febc30fb3e2eaf5a48e583a7a2d7087feeac75b51781ccc3815bda0f2deefea058f4998c6dabb8', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:32:35', '2021-05-09 08:32:35', '2022-05-09 16:32:35'),
('6ee3e8e99b48ec5ba40012321fbf5c5427cf07e2b781697a1ffd905311b26f3413f10e0921f5d7dd', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:46:42', '2021-05-09 08:46:42', '2022-05-09 16:46:42'),
('cd5849fc3e689a46bd7350a76cbadcb7b4d5dc3804e80ee1e7e3532f8fcaa00420094f5cdeaf5553', 22, 1, 'Laravel', '[]', 0, '2021-05-09 08:59:54', '2021-05-09 08:59:54', '2022-05-09 16:59:54'),
('fe085efaa8b62b9bc0f69d8a25e396272ae87edf6c3ff84d1481b34cd09174683cd6d4a4e1be8fb1', 22, 1, 'Laravel', '[]', 0, '2021-05-09 16:40:54', '2021-05-09 16:40:54', '2022-05-10 00:40:54'),
('ae205809b3650a7e25b4b801fbe227cb4386bc1dbbfab0585af48f631e316d4f9b5139ff0a9513d4', 22, 1, 'Laravel', '[]', 0, '2021-05-09 19:05:01', '2021-05-09 19:05:01', '2022-05-10 03:05:01'),
('6d2f36f5b2b41f39dcd4add0cdb2701bcc61ffef1d8e9a26aa881c5842e764110781f778af7043c3', 22, 1, 'Laravel', '[]', 0, '2021-05-09 19:09:04', '2021-05-09 19:09:04', '2022-05-10 03:09:04'),
('a325f86b774436f57c03c2088a57ea09c55d192a3c07227881a35c7b6fce6e6d2de1a39fe7419c08', 22, 1, 'Laravel', '[]', 0, '2021-05-10 07:44:02', '2021-05-10 07:44:02', '2022-05-10 15:44:02'),
('ad42fd40edd0d32cd950b41adc50ce560dbc900df0745df1c669fd91298e28e350efc08202e19cf6', 22, 1, 'Laravel', '[]', 0, '2021-05-10 07:44:03', '2021-05-10 07:44:03', '2022-05-10 15:44:03'),
('17a5beb9a41ddcc5dc3f3d165266d7b7b4270d879f8fc1ecf1ef79a234c0bc16839b2373765710be', 22, 1, 'Laravel', '[]', 0, '2021-05-10 07:51:32', '2021-05-10 07:51:32', '2022-05-10 15:51:32'),
('0a428aabf20248f97d1a9b9f769f677fec8265d68b44a5cb2ace83d285661734b8d03a386d70f99e', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:16:12', '2021-05-10 09:16:12', '2022-05-10 17:16:12'),
('ddfd4845af6f1f2a18f99ac06c6fb4d63f6ccd8fdc7187141793d3c5ca9f46e9160837fe74f4b048', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:29:17', '2021-05-10 09:29:17', '2022-05-10 17:29:17'),
('d209201cd0f6428fdac934d40497505578c318773ec95f0789085611ad9e7881155b58b33908abff', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:31:35', '2021-05-10 09:31:35', '2022-05-10 17:31:35'),
('ddab87f6c8e595fb318f633ee01343c788d55e762f9277fb57d2afd02256612662a04242c7cc308d', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:35:44', '2021-05-10 09:35:44', '2022-05-10 17:35:44'),
('946eea5c6666c299649a4f481d0e31e468db8b6edf28fcd40604c51e1b89cf479a616f61fc235087', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:36:23', '2021-05-10 09:36:23', '2022-05-10 17:36:23'),
('67cc7bcd276e50cf06c66aac62995f6bbdee92b375e9eb01a02661b8bdff335a71653c26b2f71996', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:38:42', '2021-05-10 09:38:42', '2022-05-10 17:38:42'),
('1b1b2c6eda06636c5dfccad0ea6c01d38e6c3bc74483252d7351f3d7265f54525c71cf02636a6f9c', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:39:43', '2021-05-10 09:39:43', '2022-05-10 17:39:43'),
('c70f60b6a00aac5cbeb2af31b0b95afe6f21dbcb22d0563ccee465c16a5e1a026edf7c9385e1ebcf', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:43:24', '2021-05-10 09:43:24', '2022-05-10 17:43:24'),
('ce0ca28e83851333aaeee7cbdcf922f750e4e1f0a9d648be7b186594d634d7968e48b5b65a57380c', 22, 1, 'Laravel', '[]', 0, '2021-05-10 09:45:55', '2021-05-10 09:45:55', '2022-05-10 17:45:55'),
('d19fe05baef92dc2f59910cd3a2ad7a88cd156753fd82ad11f14b78431a202380e6bbb1de35c3c4d', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:10:49', '2021-05-10 11:10:49', '2022-05-10 19:10:49'),
('ee2bb7a930ba66d1d51101a81190fb1ec003959397ecb6849d4156236cac2408d77dddddfc131efd', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:10:50', '2021-05-10 11:10:50', '2022-05-10 19:10:50'),
('22371c82bf1776a060a1ce4a1012e5018989e0e2894ef8868239191f8928c673fcf5b238dcd5f732', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:11:40', '2021-05-10 11:11:40', '2022-05-10 19:11:40'),
('28880ce9cb383fc1ec7975db4db547e0baa1f55ffb0ff359d319800572651315a6127a1358540b56', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:18:59', '2021-05-10 11:18:59', '2022-05-10 19:18:59'),
('e8146d004819fff25f57cca256d3e0838bbee69687a1ab32aac9d23804931854811c101477de6704', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:27:48', '2021-05-10 11:27:48', '2022-05-10 19:27:48'),
('ef7c86ddcd5e1ae8ac8094480741dda51a35c79d53f3b337672c33935b006ac7dfcd8530c5256061', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:32:16', '2021-05-10 11:32:16', '2022-05-10 19:32:16'),
('8670e4bff845c5485613d7ae949e7f11f2aeed652250b423c7e3556562492745a4e02aba8f8be833', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:34:07', '2021-05-10 11:34:07', '2022-05-10 19:34:07'),
('9a914320912c56ab9cf46945b45cd69bb0f98dc869c068aa1e7577b3dfbc0c1826739708e61a5f01', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:37:03', '2021-05-10 11:37:03', '2022-05-10 19:37:03'),
('d5748a849d2c09a843f14a1dc3e7cee69d6b3a39dd295fae84a6de402596a6c5662a68ed4bcd3105', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:39:18', '2021-05-10 11:39:18', '2022-05-10 19:39:18'),
('f6732c52fd42a8022fa6894c13abe30fb49d97de137d02d084fd5a3a5b558ab7318787008e2f9f2c', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:43:49', '2021-05-10 11:43:49', '2022-05-10 19:43:49'),
('f692727f814351023e78d1cf01d71942136dd115172de81d2d3a34eb01fd7074ae0d24e314204265', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:44:53', '2021-05-10 11:44:53', '2022-05-10 19:44:53'),
('4d2e3ef027b29afe58895c682a5622ff0b623c25960f6ad8fbfdae920ff930f19e529143a6592870', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:51:29', '2021-05-10 11:51:29', '2022-05-10 19:51:29'),
('a41d43f8f59f281fcc9678263de1876f41ece906fd02e56b59109e0bcf25e0c9cdd498518a45ac37', 22, 1, 'Laravel', '[]', 0, '2021-05-10 11:51:54', '2021-05-10 11:51:54', '2022-05-10 19:51:54'),
('809e3cf88d2829700b83156d3e6897542d5ea1d88d30cc0a6576762b36305343c9c23dfde1c47b11', 22, 1, 'Laravel', '[]', 0, '2021-05-10 12:13:02', '2021-05-10 12:13:02', '2022-05-10 20:13:02'),
('a912984bb3a872b8932eddc6db4c89aa2cb10c27ead9df27fa3b988b1a807456fab7699799a6283f', 22, 1, 'Laravel', '[]', 0, '2021-05-10 12:13:03', '2021-05-10 12:13:03', '2022-05-10 20:13:03'),
('a3607d044fc84efb87ab639f4c96b1d4f0c881b09b7963711315c9573a0977811106e3ec1bdf95c1', 22, 1, 'Laravel', '[]', 0, '2021-05-10 12:15:50', '2021-05-10 12:15:50', '2022-05-10 20:15:50'),
('3ae6346f2ac93b29e6eb48f546bb5aba61b5173676cb92efeb00c2fa2aea2ba06d7e2be03f8ecc37', 22, 1, 'Laravel', '[]', 0, '2021-05-10 16:30:37', '2021-05-10 16:30:37', '2022-05-11 00:30:37'),
('429db73b773b7df1d4c9d7f3411a5df69326f3f84ac8980030622902d6f8adb46adb6a3768b03a83', 22, 1, 'Laravel', '[]', 0, '2021-05-10 16:30:38', '2021-05-10 16:30:38', '2022-05-11 00:30:38'),
('9881cd9faa79699d797c90102b8c4475845cd4edaa2818858f3b5b97a549cceabed8f7bf610eac1b', 22, 1, 'Laravel', '[]', 0, '2021-05-10 16:37:57', '2021-05-10 16:37:57', '2022-05-11 00:37:57'),
('1e9a9e581646ac17eac3b5d342a889b55e6571bc7a6b6c0344c3198ef3a4c0a75f52a66d5da051cb', 22, 1, 'Laravel', '[]', 0, '2021-05-10 16:45:31', '2021-05-10 16:45:31', '2022-05-11 00:45:31'),
('e60350979e6c6445cab38de8b6f6f75e88d0441d4227ac8353a62af8626196cde248b58ebde89ed9', 22, 1, 'Laravel', '[]', 0, '2021-05-11 06:53:03', '2021-05-11 06:53:03', '2022-05-11 14:53:03'),
('f387d89c80702cc2cc767be65148ff2868e936864dafbfd3ae2fb380c7d98af97065912e622bb081', 22, 1, 'Laravel', '[]', 0, '2021-05-11 06:53:04', '2021-05-11 06:53:04', '2022-05-11 14:53:04'),
('4c5160ef56852ebfb1f7776067687489a23a669eb6a314040c469fdcba30b05aed51616235c4f19e', 22, 1, 'Laravel', '[]', 0, '2021-05-11 06:57:25', '2021-05-11 06:57:25', '2022-05-11 14:57:25'),
('dd0b7684c72832c70ce36a3c50ff1b08bf926ed0c1ab70a951b4af55cc203d7e5003e1315a6a044d', 22, 1, 'Laravel', '[]', 0, '2021-05-11 06:59:22', '2021-05-11 06:59:22', '2022-05-11 14:59:22'),
('111e5003f54d4c82d83d25aa4a2ac30c2cd3027f03042c381989759ccef8d307ba65048984ba2e50', 22, 1, 'Laravel', '[]', 0, '2021-05-11 07:03:08', '2021-05-11 07:03:08', '2022-05-11 15:03:08'),
('c25da9fd1753d7d13bc36b3ce1a45a2101754477d242aa42316795e6d521c835861d3a2b6fa87286', 22, 1, 'Laravel', '[]', 0, '2021-05-11 07:06:15', '2021-05-11 07:06:15', '2022-05-11 15:06:15'),
('4cf556dea18429c2da5edf16159f2c0f5623e684ec6b753cd21ce95ba2f14e780c2685dc898809b8', 22, 1, 'Laravel', '[]', 0, '2021-05-11 08:21:00', '2021-05-11 08:21:00', '2022-05-11 16:21:00'),
('63acf630f5973d91dee0b7fa1a2e7b5d7ed5d31f3d097e74e8c2fae0d46896d28d0ce30efcc31377', 22, 1, 'Laravel', '[]', 0, '2021-05-11 08:21:01', '2021-05-11 08:21:01', '2022-05-11 16:21:01'),
('e68fa7cdd7c94ce5d4cb97bc529a90646270d2f2754aa9912ba4bce96c64208345bea7384ba188e1', 22, 1, 'Laravel', '[]', 0, '2021-05-11 08:22:07', '2021-05-11 08:22:07', '2022-05-11 16:22:07'),
('199f13d198c42482caeaff41cf55d46e6fddc9bde1379bfe9a5f73e7add2963ab6cefedd2935990e', 22, 1, 'Laravel', '[]', 0, '2021-05-11 08:24:11', '2021-05-11 08:24:11', '2022-05-11 16:24:11'),
('33ee3fbc471d2007e9a1b98f95ff57bfa9bf595db7efeb07a115149390eb9ee547a9903af1d59f5e', 22, 1, 'Laravel', '[]', 0, '2021-05-11 09:12:18', '2021-05-11 09:12:18', '2022-05-11 17:12:18'),
('8e5c17f27aa450d25448a90aeb64e885c677f06948ec3bb6b571a86001a0d30fcb3e3722b05f9847', 22, 1, 'Laravel', '[]', 0, '2021-05-11 09:12:19', '2021-05-11 09:12:19', '2022-05-11 17:12:19'),
('c2e6ca260c6c8fc62fd68609481504a344ceedba90071087620ce0be206da8b09e50ca83ef9b8ca1', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:30:14', '2021-05-11 18:30:14', '2022-05-12 02:30:14'),
('d3fb913517ec73d1d50abb3e4ae83d5eb7ef753050658c04a07da39e4bb817a925a028c3a54286e2', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:40:36', '2021-05-11 18:40:36', '2022-05-12 02:40:36'),
('34df8061537ba573c8466a2b9ef12b1f02cb6a70cf96677041ac2c1d0bd9e8ec72895ead55f0f763', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:41:55', '2021-05-11 18:41:55', '2022-05-12 02:41:55'),
('59e575df8fc506123c168ccf02d09dc36f3a1350245416e0d550ca9b72b2341964b779f15137a066', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:44:56', '2021-05-11 18:44:56', '2022-05-12 02:44:56'),
('9ee1e7b2212065a8a2f0ce0d859a1494a51b56e39b731f2caf358ab3fe369751425b5cd7e7860e71', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:52:18', '2021-05-11 18:52:18', '2022-05-12 02:52:18'),
('1c19ccc853040b6d947650a5ee32803b88bca0b5b2ebbe21673b4f1986dce3bea1510ba6e8cab589', 22, 1, 'Laravel', '[]', 0, '2021-05-11 18:54:41', '2021-05-11 18:54:41', '2022-05-12 02:54:41'),
('3806319d265419e3d330beaf615b6095ac5bf15298e764015696a881baa417d86aaed3c72cfcab75', 22, 1, 'Laravel', '[]', 0, '2021-05-11 19:07:31', '2021-05-11 19:07:31', '2022-05-12 03:07:31'),
('63f3bbac35d11b61a82c5b746ec81f0890df24dba580a5c02516eef3f520e66e53008d1ff152438f', 22, 1, 'Laravel', '[]', 0, '2021-05-11 19:07:32', '2021-05-11 19:07:32', '2022-05-12 03:07:32'),
('f99e2a5c3612044f1cd9bf1026aae14207e922adff9a9e1ad9b509a5c5ad2f1d8927cd3735216056', 22, 1, 'Laravel', '[]', 0, '2021-05-11 19:21:33', '2021-05-11 19:21:33', '2022-05-12 03:21:33'),
('f4b4f60e20e56c6291e9c80d20d707fe67224bd3f6ba1847119cd55d1791a493ad1f247e88a417cd', 22, 1, 'Laravel', '[]', 0, '2021-05-11 19:37:39', '2021-05-11 19:37:39', '2022-05-12 03:37:39'),
('3afeba010ee9731f93217e919587de0d83159223e4fe6552d0c5ebef7d088efe3dd0cc225882a65d', 22, 1, 'Laravel', '[]', 0, '2021-05-11 22:01:14', '2021-05-11 22:01:14', '2022-05-12 06:01:14'),
('a24683e83c88b2cdb2151d55024a17066783ffcea353518607596e51af6322873d57db7be44a6966', 22, 1, 'Laravel', '[]', 0, '2021-05-11 22:04:59', '2021-05-11 22:04:59', '2022-05-12 06:04:59'),
('936e3069dcb1c7255576c2adddca3f8bb3e13d16bc2c04ab6c9cbb6004e41357d3852db7ba0abcca', 22, 1, 'Laravel', '[]', 0, '2021-05-11 22:39:17', '2021-05-11 22:39:17', '2022-05-12 06:39:17'),
('facfb3442feea89a5814906c6cd98781786647f4c5719a4f6342039bf09a43b43fc0fe7a24c5e507', 22, 1, 'Laravel', '[]', 0, '2021-05-11 22:44:15', '2021-05-11 22:44:15', '2022-05-12 06:44:15'),
('03c1ded27f2eb3a5d8716fb65788621786d66562e885f7b6a0edfc325180c2475a89e4544709de28', 22, 1, 'Laravel', '[]', 0, '2021-05-12 04:47:10', '2021-05-12 04:47:10', '2022-05-12 12:47:10'),
('89400c92a85bc7b4ecf1b6a349515697db96f3b938999c6530b206243a1eeec10c749e3e0eace0f8', 22, 1, 'Laravel', '[]', 0, '2021-05-12 04:47:12', '2021-05-12 04:47:12', '2022-05-12 12:47:12'),
('13803fb65ec8efed03091e18bed650131f48ec0b30013711ddcd441cdb1590b88bfe32e15beeea7b', 22, 1, 'Laravel', '[]', 0, '2021-05-12 04:47:13', '2021-05-12 04:47:13', '2022-05-12 12:47:13'),
('13130542ae0ff639de399ce5240d685a7d6dba9a19101cc0cd6e9c942de29f3fed27bb68c16a34d1', 23, 1, 'Laravel', '[]', 0, '2021-05-14 05:27:37', '2021-05-14 05:27:37', '2022-05-14 13:27:37'),
('af275fb9839816f1b2b215e36d7fd02153ada0a5b7e0840daace15422cf4714ad8aa4e01c38f7ee2', 24, 1, 'Laravel', '[]', 0, '2021-05-14 05:32:51', '2021-05-14 05:32:51', '2022-05-14 13:32:51'),
('96345dd710fd5ff6d9be66be89283ad8ceea4c336793e13b1d4f0cda432630812eadd66c6986d664', 25, 1, 'Laravel', '[]', 0, '2021-05-14 05:33:42', '2021-05-14 05:33:42', '2022-05-14 13:33:42'),
('115effa0f77656dffa32bc6daaf92e292142e14331adb397c658bba86216233da605f2af61b40025', 26, 1, 'Laravel', '[]', 0, '2021-05-14 05:44:40', '2021-05-14 05:44:40', '2022-05-14 13:44:40'),
('4ca25c94a32ef3af54adf015c0c7d824e61fde8d33fdddf27431a39c4db98fdc313f04f1587909f3', 27, 1, 'Laravel', '[]', 0, '2021-05-14 05:49:50', '2021-05-14 05:49:50', '2022-05-14 13:49:50'),
('3e1e73b13ca679bd1cc39731c4481a0b1b329ee701a4370b6f034452cecf6b931690e5604f32efbc', 28, 1, 'Laravel', '[]', 0, '2021-05-14 05:50:45', '2021-05-14 05:50:45', '2022-05-14 13:50:45'),
('c76c7ee87529b48682386c7747c23db0505498d5ea35d3cd4751b4364658b94f8d1e35a6308b2a00', 29, 1, 'Laravel', '[]', 0, '2021-05-14 05:53:09', '2021-05-14 05:53:09', '2022-05-14 13:53:09'),
('3df42abd8ab16d389cbccb730526b0b3fd7dffbe7dfe7f34969c657a4b09ea8a76da0fbb37dc7432', 30, 1, 'Laravel', '[]', 0, '2021-05-14 05:55:29', '2021-05-14 05:55:29', '2022-05-14 13:55:29'),
('c5eb0e3b71c1bd812b45409c04df701fbd4d81b78479a73df64695e952771487426b4a4a112ab3df', 22, 1, 'Laravel', '[]', 0, '2021-05-14 05:59:06', '2021-05-14 05:59:06', '2022-05-14 13:59:06'),
('719ffcc66b7dfc0a3d521d6d618ba890d4bf8543c55c24dce5e4a3bc3f3f21dfc5e587222885c00d', 31, 1, 'Laravel', '[]', 0, '2021-05-14 06:01:32', '2021-05-14 06:01:32', '2022-05-14 14:01:32'),
('7eaef2ed4769ba85cc3be9d141e9825db47a75f40cbc61dd1523f325cb8d527b30abea7adaaab7fe', 22, 1, 'Laravel', '[]', 0, '2021-05-14 06:02:31', '2021-05-14 06:02:31', '2022-05-14 14:02:31'),
('dfce4cb4723f4f86807ff84572ca8e75a716c5f76194e90a97c100a992a4f6e1d0bb5b1d3ae31267', 32, 1, 'Laravel', '[]', 0, '2021-05-14 06:03:42', '2021-05-14 06:03:42', '2022-05-14 14:03:42');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('5b6863f3bbc6c6773f15816b718e024260f8722fdcae7f54120d4df6f02aebc1fb287754da380bcd', 22, 1, 'Laravel', '[]', 0, '2021-05-14 06:05:53', '2021-05-14 06:05:53', '2022-05-14 14:05:53'),
('562b4338e37fc09ad6c2e5e94131a02a100f32fcced94e09587cc70223fc3aa2851a425b9f924308', 22, 1, 'Laravel', '[]', 0, '2021-05-14 06:31:09', '2021-05-14 06:31:09', '2022-05-14 14:31:09'),
('3da950560a25e1b9311befdaca1cf3ae743aff726cc70dc21c05031413e95d8523295d6898eae039', 22, 1, 'Laravel', '[]', 0, '2021-05-14 06:42:50', '2021-05-14 06:42:50', '2022-05-14 14:42:50'),
('b0db5795cd1c5cca9e2f4c8f7ad1083374d05e6218e225e5179979af0622447ccc27c77a31d50ae7', 22, 1, 'Laravel', '[]', 0, '2021-05-14 08:00:46', '2021-05-14 08:00:46', '2022-05-14 16:00:46'),
('82d4939da59d8572df2a50ada0b8beae4146707cd88d0872a484426930f307c8b6b12f998421f8bc', 22, 1, 'Laravel', '[]', 0, '2021-05-14 08:00:46', '2021-05-14 08:00:46', '2022-05-14 16:00:46'),
('21d0893f3ff3f4ec966143f6914be47b38e99fb197a7f19b6f94ff62805117e76724cd79b23e1d36', 22, 1, 'Laravel', '[]', 0, '2021-05-14 08:00:46', '2021-05-14 08:00:46', '2022-05-14 16:00:46'),
('e618f07558df66c65c3dafeecdcdb7126b1529598218e0803553289a60cf6c0ff6fe2b8935ff991c', 22, 1, 'Laravel', '[]', 0, '2021-05-14 08:00:47', '2021-05-14 08:00:47', '2022-05-14 16:00:47'),
('bbb4f9f5c364fedf2876bea4c23223cddbcd3961b2d891fce9f8816bdacf3b748bf797035c1fd57d', 22, 1, 'Laravel', '[]', 0, '2021-05-14 08:56:23', '2021-05-14 08:56:23', '2022-05-14 16:56:23'),
('f172ea8e8866cb1d2fb0a7e283c0a32c838355bd9dc0019f552ecdc002c1dce38c7745aab8ff4b59', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:24:41', '2021-05-18 18:24:41', '2022-05-19 02:24:41'),
('7d4985bcc08e0e84d5f72fc69cd371a5afb8dc874a21450cd98e514b3e79d694880361d4d2fcd94e', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:24:43', '2021-05-18 18:24:43', '2022-05-19 02:24:43'),
('730018826a0ca8a257f9c40158ed856b80042e8ad583c940e2f409ef2e7ab5cb0dd276229f9b1620', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:24:44', '2021-05-18 18:24:44', '2022-05-19 02:24:44'),
('97965ec7cae066993d6ce5acf3be5c0193e834a538d5f108567a384bf3114996b29d9f4c05539de3', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:37:23', '2021-05-18 18:37:23', '2022-05-19 02:37:23'),
('daa58de5d01a5e735de09d230bc99035ae14928e4707106cee9db26352a9a5661468776cf98bd177', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:40:07', '2021-05-18 18:40:07', '2022-05-19 02:40:07'),
('913de3c59360a50c80e5bc306a9bb5b9c227eba5af3b4a24feca3643a840e3bad88ab605eb83733f', 22, 1, 'Laravel', '[]', 0, '2021-05-18 18:47:28', '2021-05-18 18:47:28', '2022-05-19 02:47:28'),
('15029da2b104dc0f1aeff39a16212a38abba19711c9f8dcb5c8b8a0a14ae96cbbc34aa1c8ddee2f3', 22, 1, 'Laravel', '[]', 0, '2021-05-18 21:00:54', '2021-05-18 21:00:54', '2022-05-19 05:00:54'),
('fd81a0a3a338868b5977987f9c6c3d15a35c3239087103cc2cedc8fcf253032fb39a25ac25c005a9', 22, 1, 'Laravel', '[]', 0, '2021-05-18 21:00:55', '2021-05-18 21:00:55', '2022-05-19 05:00:55'),
('34c68e2d7e80831a998a16dd50468dab71bc1e274612edd532795a4eebf0683f67d0e24bda1ddb6e', 22, 1, 'Laravel', '[]', 0, '2021-05-18 21:02:09', '2021-05-18 21:02:09', '2022-05-19 05:02:09'),
('008ba1d4df147e5b92fbb225e6ffb2053905f02a27967873ccf8d6c1013f4fd74700c56a5d1d9570', 22, 1, 'Laravel', '[]', 0, '2021-05-18 21:11:18', '2021-05-18 21:11:18', '2022-05-19 05:11:18'),
('d92c76c8b767154fe4fcb22e7b6239c794400478495f6181489f1b64be8804227a9142ee88e20826', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:03:21', '2021-05-18 22:03:21', '2022-05-19 06:03:21'),
('a386b6536cedbb3a38f63e9d8a7b6813b5a3176ac8e5835046aaaeb6bbabc7196382041dea058e66', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:03:21', '2021-05-18 22:03:21', '2022-05-19 06:03:21'),
('68a0c0a9644e78004924571715ccc6896877f6f5dcca3275b2ec3c492ef4603bcdd4ddcaffa5ee4c', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:03:53', '2021-05-18 22:03:53', '2022-05-19 06:03:53'),
('2ae71dd73ea2276558166f12a1787bbec806766079a1e12231740ceeff60f8359a9cb3613c4cebb5', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:05:26', '2021-05-18 22:05:26', '2022-05-19 06:05:26'),
('1148b497418a4fff89dc146eeae30caea415c0cfdd48dd9c59dabafe701d979486ab5bc516cab549', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:06:11', '2021-05-18 22:06:11', '2022-05-19 06:06:11'),
('f794933ef072fa507bda81f009654c43b88a7906ca39b21903db5800758f8116bc2c258a7910ac00', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:19:02', '2021-05-18 22:19:02', '2022-05-19 06:19:02'),
('5d168daa81f011f69be4e13aee9df237e64ba423dbbfe4408cabe9143181c95109f544bf48a3ab6d', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:35:40', '2021-05-18 22:35:40', '2022-05-19 06:35:40'),
('af209f29cb6ef75619b813ca3aac4d43a7df6662c8ef0664974a421776a9afbc1b9cfacf28af6db3', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:41:37', '2021-05-18 22:41:37', '2022-05-19 06:41:37'),
('84790c3a401239f1622972206742edf246135140ca82b3ee42badd5ed819bd54702caaba88306cc9', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:42:30', '2021-05-18 22:42:30', '2022-05-19 06:42:30'),
('8fb95389a05c65079719b8567c6fb6d6e950550d815c02e8ab82ba846fbcafcdc6ce50027a0cbf4a', 22, 1, 'Laravel', '[]', 0, '2021-05-18 22:47:50', '2021-05-18 22:47:50', '2022-05-19 06:47:50'),
('e9ab348195331e151a1b08444d1d1284a74e101d6606afdcda52e1dfdb68360c79253dfd9eaec9e3', 22, 1, 'Laravel', '[]', 0, '2021-05-18 23:05:08', '2021-05-18 23:05:08', '2022-05-19 07:05:08'),
('9b49f75abce4f750c4311dc1f03813a7b0e2c9faf8001d6ace4ab9c4b1a29d8a6bc4f9bc5c23bb13', 22, 1, 'Laravel', '[]', 0, '2021-05-18 23:30:31', '2021-05-18 23:30:31', '2022-05-19 07:30:31'),
('9aa6767ace83260ae9f239fc361652584747b9c3bede44754c43d704b39317e8a53bd24b317c0bb9', 22, 1, 'Laravel', '[]', 0, '2021-05-18 23:31:03', '2021-05-18 23:31:03', '2022-05-19 07:31:03'),
('e97320682418de4631c26a725058c97eadd95cd75656920294990bca48300e72ca1d06dfda7617c4', 22, 1, 'Laravel', '[]', 0, '2021-05-19 00:15:20', '2021-05-19 00:15:20', '2022-05-19 08:15:20'),
('1b46fa5bbb31f6107585203bd666b69efe116d2866c63a1c0d5bf281b8ff57e79cd5bbe2675a0947', 22, 1, 'Laravel', '[]', 0, '2021-05-19 00:32:06', '2021-05-19 00:32:06', '2022-05-19 08:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '4ArBKkEWvxubhiy5Yr1rcFBh7fw9TkwM71zcxhFv', 'http://db_cineplex.com', 1, 0, 0, '2021-01-19 20:56:05', '2021-01-19 20:56:05'),
(2, NULL, 'Laravel Password Grant Client', 'Ly7TEEWfHTekbV0HNk1o8kQNh1SuKrQIjPUeVMrF', 'http://db_cineplex.com', 0, 1, 0, '2021-01-19 20:56:05', '2021-01-19 20:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-19 20:56:05', '2021-01-19 20:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `producers`
--

CREATE TABLE `producers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producers`
--

INSERT INTO `producers` (`id`, `first_name`, `last_name`, `age`, `created_at`, `updated_at`) VALUES
(6, 'Phil', 'Robes', '21', '2021-04-24 07:11:14', '2021-01-25 20:37:36'),
(7, 'John', 'Murphy', '62', '2021-04-24 07:11:17', '2021-01-25 20:37:29'),
(8, 'Dave', 'Estopa', '34', '2021-05-06 04:38:20', '2021-05-05 20:38:20'),
(36, 'John', 'Bellamy', '23', '2021-05-18 18:26:35', '2021-05-18 18:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `roletypes`
--

CREATE TABLE `roletypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roletypes`
--

INSERT INTO `roletypes` (`id`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Antagonist', '2021-01-25 20:25:22', '2021-01-25 20:25:22'),
(2, 'Protagonist', '2021-01-26 00:43:57', '2021-01-26 00:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Dave', 'justindave488@gmail.com', 'dave', NULL, '$2y$10$uzcGz.XqS4mTsdMPN5w08uB7G8tuSeT4JOXWjvDCfISSqUAE/GjCq', NULL, '2021-01-25 23:36:58', '2021-01-25 23:36:58'),
(9, 'Dave Estopa', 'davejustin.estopa@tup.edu.ph', 'Justin Dave', NULL, '$2y$10$PH.S3UE.iw9OH1C2J9hoJeMOtQKbiExPE/BMIHNpPYGuEh25R377C', NULL, '2021-05-01 05:47:50', '2021-05-01 05:47:50'),
(10, 'Anne Biel', 'anneebiel@gmail.com', 'Annee', NULL, '$2y$10$JNo.KqrJEhfkHUOt1uI7tuXMROSqqXkjtZj/PjeFkMH5LE3p2rvqq', NULL, '2021-05-02 03:06:39', '2021-05-02 03:06:39'),
(11, 'justin', 'justin@gmail.com', 'justin', NULL, '$2y$10$P3T5l.39XGxgkRPeuystDOEYZQmp.0aFUoKHBKLLgYV3Zoc3BDDyy', NULL, '2021-05-02 03:17:41', '2021-05-02 03:17:41'),
(12, 'francine', 'francineayn01@yahoo.com', 'francine', NULL, '$2y$10$5la9ueJrPFW5FoQLDTCzKu7bSZQ/ZYpbol302e8rto4wBICw/JtZ6', NULL, '2021-05-02 03:19:02', '2021-05-02 03:19:02'),
(14, 'edgar', 'edd@gmail.com', 'edga', NULL, '$2y$10$8cxKAD3q59Jb7Thck8Iqy.XDcZS5O9riJIr03impE./mx9Pcd/hnG', NULL, '2021-05-02 16:42:42', '2021-05-02 16:42:42'),
(15, 'iom', 'iom@gmail.com', 'iom', NULL, '$2y$10$ckjW.RHJIOy5RwrWeMSYr.LG55xJjQ1M5CYCv34rFgf/2KTYeipyO', NULL, '2021-05-02 16:44:21', '2021-05-02 16:44:21'),
(16, 'anna', 'anna@gmail.com', 'anna', NULL, '$2y$10$JYrO.wdI2IPL8D/dNu792O8eMG2Yt6RQYXsyofVfXbYVahaJ2Bnrm', NULL, '2021-05-03 16:49:10', '2021-05-03 16:49:10'),
(17, 'sample', 'sample@gmail.com', 'sample', NULL, '$2y$10$DZxPiq.11z4Uw2311UrR1uKlw5jOMUJSJ0YFmbj4WfYXBFVA2QOke', NULL, '2021-05-03 17:19:14', '2021-05-03 17:19:14'),
(18, 'www', 'www@gmail.com', 'www', NULL, '$2y$10$rCPwFiaMZLiuf1HMrEheCO/DjVWrk6Rrzq2ABJuWAtDdJHZTye5De', NULL, '2021-05-05 09:15:32', '2021-05-05 09:15:32'),
(19, 'fff', 'fff@gmail.com', 'fff', NULL, '$2y$10$qmVjkh9PJUlsBpiKtNCe4uLW1HVaovrvq8PQIJ8NeLI5ymSYI0zmO', NULL, '2021-05-05 09:17:00', '2021-05-05 09:17:00'),
(20, 'foo', 'bar@gmail.com', 'bar', NULL, '$2y$10$byyT2e2WeT7ytQsLPxMCk.a/yDMzG92af0fD44yC.iPy8h/2A5jP.', NULL, '2021-05-05 09:18:24', '2021-05-05 09:18:24'),
(21, 'mel', 'mel@gmail.com', 'mel', NULL, '$2y$10$fVZn9p1jX08SZPtnho133u/PGt70E7JGF5dXvCzBpjuAN.ejc1KDK', NULL, '2021-05-05 23:27:28', '2021-05-05 23:27:28'),
(22, 'jean', 'jean@gmail.com', 'jean', NULL, '$2y$10$ymEK4EtrghNrYCIFOPIWjeWmtp3tlXgy6f/gpYDnSl4wtCSNRylFG', NULL, '2021-05-05 23:31:44', '2021-05-05 23:31:44'),
(31, 'june', 'june@gmail.com', 'june', NULL, '$2y$10$FrJPu7hWNVYULOV1YMsEoevkshzhUnHJ8uafZOv7NJXOJs7Mjy/Ii', NULL, '2021-05-14 06:01:30', '2021-05-14 06:01:30'),
(32, 'ayn', 'ayn@gmail.com', 'ayn', NULL, '$2y$10$0giIaokRgluJzgs19kRAWuO7x5b6rMRP.wlBOSJebzBp9Rp4.VQDC', NULL, '2021-05-14 06:03:40', '2021-05-14 06:03:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `film_actor`
--
ALTER TABLE `film_actor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `producers`
--
ALTER TABLE `producers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roletypes`
--
ALTER TABLE `roletypes`
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
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `film_actor`
--
ALTER TABLE `film_actor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `producers`
--
ALTER TABLE `producers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `roletypes`
--
ALTER TABLE `roletypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 juin 2024 à 13:22
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `auth`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
CREATE TABLE IF NOT EXISTS `refresh_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(6, 'b5c8de93a774f514d41178f4e5419347705eb226fabc91b511f543ae9f4596135d08307a2b9eb2686ce0b4594371ce18af9dfb61426e555342da1a274857d9fe', '667204af857a6', '2024-07-19 02:28:02'),
(7, 'baac98487fb6c05199af34bcb147d3273d94d3686a922b8a3e5c54839ec34a47586596b729d19fed520e38f18eec849fdf4af46e0ea8523316c6ce79eae27a59', '667204af857a6', '2024-07-19 03:35:12'),
(8, 'c74effa496ca6d14ba0b3be2def82fe4018d50b17645672074b58f63369cdf779a315c6ddc2d0c29f5b258e11eb9f00f8c30d11ecaad2eb558864671eb938eec', '667204af857a6', '2024-07-19 03:30:12'),
(11, '5a58f3b9f76eedf5d4d8df3e89f5993d70d50dbd717aec5114810fb7f75f3127b627282f64df6f4e9c03053dda4fab1cc30f3a79ecbe9336694c9a2081566a5b', 'test', '2024-07-19 03:44:47'),
(12, '8efd6a4b75d8abce1a55fa38aef3cff435de55b5c250ce4a3fb921cf7a7dbb9002acc514e6da19f11cd21e03f28f8596e1952a0bffe9fd07ae8c070538fb59e9', 'test', '2024-06-19 06:28:32'),
(13, 'f90c10c962dbcc6f481286c400bf14a468b23844cfa5ecc798fe0195742887a0d76e46b081c467ec1448cc58bc6d6c6bf228b4bff5ca822ed4fa1c48455602ec', 'test', '2024-06-19 05:57:01'),
(14, '4b2d59750f4c3d80ed5384bda4ed1e2360a5f52908621e3813dec2234b63c6fcf3214736328118176e1c38d792b7eac9628fcbaf071eb52948b4249a671d4079', 'test', '2024-06-19 06:29:07'),
(15, 'fffa83645d3e83e2d22b9c2fb348289f59168592b4a14707cdbe432baf9f600f5377c276d586b5e6010f0fc0fd52c8b1791caefc341a306612a989d8a7555a2e', 'test', '2024-06-19 06:45:34'),
(16, 'b696294ab3e387d89cc2500b51ee3d706e1c4846a7d39bba44db532f617c050b19b831918797e1f2da4cfc98e227eb448274de0930b3249ecbe5cf5847c63db2', 'test', '2024-06-19 06:46:12'),
(17, '9a1368c013ff9431fd0446ee77e100c9318b410ea43be00cea590e27038981f2632ab146165f334905b47e03dcb027a31fab7f3623015c4fe9ca89a06891710b', 'test', '2024-06-19 06:47:42'),
(18, 'fddf17d032a779f7809871ded3f4f8a4b548622e4c2add6ade898da99673df38228de473f0ad3c07da33a753457aa2881cc6564501a7c519e6e107a3370f7918', 'test', '2024-06-19 06:59:47'),
(19, '51c8d793b052efd08eaa2404aba9e09e8030fa253836055610bf699257c1e0560d83dd072b31e46af82395228e16cd968560a12767d20b2453065fd8fbd3e156', 'test', '2024-06-19 07:02:39'),
(20, '1f45524f926e0c5a21228ca0236b7d5b8dcb2a40b47cc99c1c4590e6893199ee79738d8a7a0c0339768ea5c420cfc4880c1abf63926dc786fc2fd7b03cd94a4f', 'test', '2024-06-19 07:02:47'),
(21, '8baa7ed012ef380f670c1d5bbcc7b1fe4002b947fff26b8215020a2feb30a09ae814901e18c17cadb8f9ae4e5a1edfd51b2401d01d2d5b99d5c37c43cbcba895', 'test', '2024-06-19 07:04:05');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_UUID` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `uuid`, `roles`, `password`, `login`, `created_at`, `updated_at`, `status`) VALUES
(5, '667204af857a6', '[\"ROLE_ADMIN\"]', '$2y$13$/FLO.LIEP4/iB7ILJBCJeO/ymFK2NZnWnq6bxmO8ci9u0.j0EQAxW', 'test', '2024-06-18 22:05:35', NULL, 'closed'),
(6, '6672103dc26b5', '[]', '$2y$13$iTIRHBIhXFz8GURNmOslA.myOF8TkQjEpelRXkeY1Xvy9NpxI1NWK', 'user', '2024-06-18 22:54:53', '2024-06-19 00:35:05', 'closed');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

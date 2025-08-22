-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.3.0 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cesizen
CREATE DATABASE IF NOT EXISTS `cesizen` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cesizen`;

-- Listage de la structure de table cesizen. admin_authentification_token
CREATE TABLE IF NOT EXISTS `admin_authentification_token` (
  `id` int NOT NULL,
  `token` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `suppression_date` datetime NOT NULL DEFAULT (now()),
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Listage des données de la table cesizen.admin_authentification_token : ~52 rows (environ)
INSERT INTO `admin_authentification_token` (`id`, `token`, `suppression_date`, `type`) VALUES
	(33, 'EV8P62O88X033AH9', '2025-03-18 00:48:06', 'web'),
	(33, 'X7W896OECLGFHU9X', '2025-03-18 13:50:54', 'web'),
	(33, '94MSDTHZ6983T0VM', '2025-05-10 21:33:20', 'web'),
	(33, '2SLYKSIWM5Z6F4MO', '2025-04-20 21:00:35', 'web'),
	(33, 'TT8JZ9FZ5GW4JAIN', '2025-04-20 18:59:29', 'web'),
	(33, 'DDCWBBKVCH59SXUM', '2025-05-10 19:34:20', 'web'),
	(33, 'GT3M9RZ8X8J3RNGS', '2025-05-11 15:49:26', 'web'),
	(33, 'MMBSU2O26CFW40BO', '2025-05-17 20:46:42', 'web'),
	(33, 'FQETFWRBYIMRZOZ7', '2025-05-11 16:22:43', 'web'),
	(33, 'WU91IDNOQK24VCN7', '2025-05-11 17:01:46', 'web'),
	(33, 'QJPLW5K9DXQ6VE8M', '2025-05-12 01:57:21', 'web'),
	(33, 'JN3NQ7PY8YM5A9NK', '2025-05-12 00:30:47', 'web'),
	(33, '4JANVPKVWA4FJ30O', '2025-05-12 20:20:42', 'web'),
	(33, 'C6QU1EOGJ0FLMS1W', '2025-05-13 22:59:30', 'web'),
	(33, '9B3TL19WWJXT6X65', '2025-05-17 18:27:29', 'web'),
	(33, 'S5F7EFA8SEDTBHH1', '2025-05-16 21:06:02', 'web'),
	(33, 'O6G08F6LWZ8TWKIB', '2025-05-17 18:09:36', 'web'),
	(33, 'H63F44AOBDHLYAPW', '2025-05-17 23:16:15', 'web'),
	(33, 'ZRB7BKGQDXLXJGYC', '2025-05-17 23:40:43', 'web'),
	(33, 'FUN3WNW9H790O1EV', '2025-05-18 04:04:15', 'web'),
	(43, 'GWNPEQL19983RL1A', '2025-05-20 13:03:43', 'web'),
	(44, 'SULD6DVLQCEX644N', '2025-05-20 13:04:21', 'web'),
	(45, 'S7713PQVZEUTI7OK', '2025-05-20 11:13:48', 'web'),
	(46, 'Y3B0N26G0CVM3DS4', '2025-05-20 13:13:58', 'web'),
	(47, 'V1MIRVPWA13QIBTX', '2025-05-20 11:14:07', 'web'),
	(48, '5OG5GXL0NQ6D14X4', '2025-05-20 11:14:14', 'web'),
	(49, '1C99VXDQ22LV4PYJ', '2025-05-20 11:14:35', 'web'),
	(50, '67KCDQ4UCX2OZMAK', '2025-05-20 11:15:14', 'web'),
	(51, '5PRO3IA890L3D5S6', '2025-05-20 13:15:25', 'web'),
	(52, 'TF1NXPDLIXMX5PED', '2025-05-20 11:15:34', 'web'),
	(53, 'JT7LYXV41YAEV8KY', '2025-05-20 11:15:40', 'web'),
	(54, 'GZTB5G6FZW2UCVQ3', '2025-05-20 11:15:55', 'web'),
	(55, 'WR58FIADO0M2OR8M', '2025-05-20 11:16:45', 'web'),
	(56, '0BYRWF2RWBZC4TUM', '2025-05-20 13:16:55', 'web'),
	(57, 'GWT7YSATKXWLB4IK', '2025-05-20 11:17:04', 'web'),
	(58, 'R3RCN1PBM5OM8GP7', '2025-05-20 11:17:11', 'web'),
	(59, 'BLJ5L6EKM90F4E9G', '2025-05-20 11:17:32', 'web'),
	(60, '22YSP5TLVLZVKAXC', '2025-05-20 11:18:54', 'web'),
	(61, 'T65KZADK4TIF7IHP', '2025-05-20 13:19:05', 'web'),
	(62, 'ZKY9UXIRSO49GXYA', '2025-05-20 11:19:14', 'web'),
	(63, 'EHS5EHEENAWUFA5W', '2025-05-20 11:19:20', 'web'),
	(64, 'O4P37Q6J6EQ9ZREV', '2025-05-20 11:19:41', 'web'),
	(65, '31IFL4WC0GTQTPO0', '2025-05-20 11:21:30', 'web'),
	(66, 'X4M619FEV7AMPN3R', '2025-05-20 13:21:41', 'web'),
	(67, 'IYIJJFEKUULONREU', '2025-05-20 11:21:50', 'web'),
	(68, 'TM6PJOUWA8E213VP', '2025-05-20 11:21:56', 'web'),
	(69, 'KR2W8JRALORF95ZJ', '2025-05-20 11:22:17', 'web'),
	(70, '934DZ8G2SG5CXSKM', '2025-05-20 11:28:51', 'web'),
	(71, 'VN2GILVK9OYLF0E3', '2025-05-20 13:29:02', 'web'),
	(72, 'GTRLV6UD36U3WJK9', '2025-05-20 11:29:10', 'web'),
	(73, 'ZXKKQDLQ006JWKIM', '2025-05-20 11:29:19', 'web'),
	(74, 'V3DE0TMA3ADTPOES', '2025-05-20 11:29:40', 'web'),
	(33, '61V8GU316MTFEWKF', '2025-05-25 18:20:08', 'web'),
	(33, 'SAR0OZDC630KME14', '2025-05-25 22:37:13', 'web');

-- Listage de la structure de table cesizen. admin_users
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birth_date` date NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  `id_equipe` int NOT NULL,
  `date_dernier_changement_mot_de_passe` date DEFAULT NULL,
  `date_suppression_compte` date DEFAULT NULL,
  `actif` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Listage des données de la table cesizen.admin_users : ~41 rows (environ)
INSERT INTO `admin_users` (`id`, `firstname`, `lastname`, `birth_date`, `sex`, `email`, `password`, `role`, `id_equipe`, `date_dernier_changement_mot_de_passe`, `date_suppression_compte`, `actif`) VALUES
	(1, 'John', 'Doe', '1990-05-14', 'male', 'john.doe@example.com', '$2b$12$LdgRkFxYjHBTRUBhU1are.q0/oM45rLkovML55.QQW.oRP3zhk/Zq', 'user', 2, NULL, NULL, 1),
	(2, 'Jane', 'Smith', '1988-03-22', 'female', 'jane.smith@example.com', '$2b$12$NUm/4zrLw90ddEYaSUfpQulHoVYiL3e4MhlT0wS1Poa7uhi23L4li', 'user', 2, NULL, NULL, 1),
	(33, 'Guillaume', 'Lechevallier', '2001-10-01', 'Homme', 'moilechevallier@gmail.com', '$2b$12$mefHmY5jILmZJBv3A3m7z.2TE7WAyFKvZgYxriZxSGlfNS1cH2z8y', 'referent', 2, NULL, NULL, 1),
	(37, 'tretrete', 'trtetee', '2001-10-01', 'tretre', 'moilechevallier+1@gmail.com', '$2b$12$9S4DpkxID.3iP5kQN2UGKuNtbqBEoKJkmChGVLqm5zMxf0VVTr90K', 'user', 4, NULL, NULL, 1),
	(38, 'dsqdsqdsq', 'dqsdsqdqsdqs', '2001-10-01', 'dqsdddqsqsd', '', '$2b$12$ZcfcblUksBoQ8S1qpuzjqOXtil/Gx3p9kWnDef2vpLKEyYHiNhwrG', 'user', 0, NULL, NULL, 1),
	(39, 'fdsfsdfds', 'fdsfdsfds', '2001-10-01', 'dsqdsqdqs', 'moilechevallier+12@gmail.com', '$2b$12$5ieRftI6A4.WCDy31UuBbee5ggORiX62JUXToAJxvnAzmXlo7h6dW', 'user', 0, NULL, NULL, 1),
	(40, 'Guillaume ', 'Lechevallier ', '2001-10-01', 'Homme', 'moilechevalhgclier@gmail.com', '$2b$12$gjum1Asml4BsAdUliB16xO2/3PG1h5nFbLtZ62TDmMSHdbyLsmxTy', 'user', 0, NULL, NULL, 1),
	(41, 'dsqdqds', 'dsqdsq', '2001-10-01', 'dsqdsqdqs', '63645qsdqsd@dsq.xw', '$2b$12$URm2TpWEQOI2e/OrYlOn7uUKTazse4aWnYnymahpSLCPyfiFW15OC', 'user', 0, NULL, NULL, 1),
	(42, '53455543', '534354345', '2001-10-01', '615651651', 'nhgfhgbfb@dfsfds.dfs', '$2b$12$xWGLmJXl9ca04.bCFqeUQelfM/tiAGPsaBEafR1sa32Rqs4WG7Qre', 'user', 0, NULL, NULL, 1),
	(43, 'Test', 'User', '1990-01-01', 'M', 'test.user1747731814.711571@example.com', '$2b$12$U1V/KNDwVX5cfBy9hMRBVeZevjbFe89MC22RncVXBVHZLDkIjWCku', 'user', 0, NULL, NULL, 1),
	(44, 'Test', 'User', '1990-01-01', 'M', 'test.user1747731852.393646@example.com', '$2b$12$aCdI9Ih2WOV1ULD8yT770.HaQS5aGhzliIdcwQUzZBAOPvlt7N2uG', 'user', 0, NULL, NULL, 1),
	(45, 'Test', 'User', '1990-01-01', 'M', 'test_1747732423.072627@test.com', '$2b$12$.8tNUbzB/FuUfSoT5LGxYOk8eY.HY8I32Y0mPPllooDAR5kbJeDVe', 'user', 0, NULL, NULL, 1),
	(46, 'Test', 'User', '1990-01-01', 'M', 'test_1747732431.810479@test.com', '$2b$12$yyk92OrToCnc6MFrt8g2f.cv/TIz/YjmwRjUoCfSmQeAhilhQdaQ6', 'user', 0, NULL, NULL, 1),
	(47, 'Test', 'User', '1990-01-01', 'M', 'test_1747732442.527767@test.com', '$2b$12$S6qfcdoG2IMOSR/lwAUxJOCnPvMKPbm602uVFIx/HLLCziKGBGVzG', 'user', 0, NULL, NULL, 1),
	(48, 'Test', 'User', '1990-01-01', 'M', 'test_1747732449.15851@test.com', '$2b$12$kOCZg5N6CaQJMohVM8DkU.SSC2nGxZWIPNBHHLHH.xlwXTEXpn/RW', 'user', 0, NULL, NULL, 1),
	(49, 'Test', 'User', '1990-01-01', 'M', 'test_1747732470.21361@test.com', '$2b$12$24ci1AV5hGZnxE6Y7eSRdO94gLduA4IHwxBJ5BgWSY0s.I5jdcw92', 'user', 0, NULL, NULL, 1),
	(50, 'Test', 'User', '1990-01-01', 'M', 'test_1747732509.744593@test.com', '$2b$12$xAs.VxSXwgT94tfu89BVPOKCbfKIimuEQ.ZpBgMOPNIRjJMFobooK', 'user', 0, NULL, NULL, 1),
	(51, 'Test', 'User', '1990-01-01', 'M', 'test_1747732518.410317@test.com', '$2b$12$3.fXGQDlEJh5UExWdDTiSu4YYK3G4RGgF/VT3.FK/mRl2i1rx8kQG', 'user', 0, NULL, NULL, 1),
	(52, 'Test', 'User', '1990-01-01', 'M', 'test_1747732529.147427@test.com', '$2b$12$eZMU3G8qNDkUBJcaMwOuk.OnlJsFgSN61ubSVuHqFnktNkE5RrbSm', 'user', 0, NULL, NULL, 1),
	(53, 'Test', 'User', '1990-01-01', 'M', 'test_1747732535.764931@test.com', '$2b$12$Xl4dMhLYzr2eRGW1snFNdOVIh9f7/l4T2y4TcS94Ztu72oy1TkUzS', 'user', 0, NULL, NULL, 1),
	(54, 'Test', 'User', '1990-01-01', 'M', 'test_1747732550.634855@test.com', '$2b$12$gy11HSvu.P9eODEOD2gfUOs5v./E3K8.RpZ6b/PNkkeJE8s0BDVm.', 'user', 0, NULL, NULL, 1),
	(55, 'Test', 'User', '1990-01-01', 'M', 'test_1747732600.038024@test.com', '$2b$12$LruKKbroZZbkUzDNqWxSGehlAgOrg2FUzJzILYf1TEGgfm8rreJQ2', 'user', 0, NULL, NULL, 1),
	(56, 'Test', 'User', '1990-01-01', 'M', 'test_1747732608.785052@test.com', '$2b$12$GOUvBteU08LSjxador6kNeMHVe8mIbcjFAeRg.RKSCdu.QE/cRitW', 'user', 0, NULL, NULL, 1),
	(57, 'Test', 'User', '1990-01-01', 'M', 'test_1747732619.507437@test.com', '$2b$12$IJJQVrlpXUshWhQu8OVZ3u6OI/QoZJcwz1etZ3JrOw98ifNq6tLHO', 'user', 0, NULL, NULL, 1),
	(58, 'Test', 'User', '1990-01-01', 'M', 'test_1747732626.127753@test.com', '$2b$12$Go9vNT59oiWsCcYMlQ7tiO20wFctzxSLAq/fc.9X8q2jUqceRsuwa', 'user', 0, NULL, NULL, 1),
	(59, 'Test', 'User', '1990-01-01', 'M', 'test_1747732647.179679@test.com', '$2b$12$x0gcU/13D/XBPZnRC9W/ru12oO78u6qOs7bcLtboHs.SpBmGMfcBW', 'user', 0, NULL, NULL, 1),
	(60, 'Test', 'User', '1990-01-01', 'M', 'test_1747732729.506148@test.com', '$2b$12$j1IFrcvf0FQNs7jAUttHne99SJLtk9Mio/SFGFbaOwHocf/1Ihq7K', 'user', 0, NULL, NULL, 1),
	(61, 'Test', 'User', '1990-01-01', 'M', 'test_1747732738.212176@test.com', '$2b$12$2gQc/ms9wQUXEVjuhjNsjuGyQd1Y5/BPbn.q53HHNXJx.F6kvhnWm', 'user', 0, NULL, NULL, 1),
	(62, 'Test', 'User', '1990-01-01', 'M', 'test_1747732748.961923@test.com', '$2b$12$QvxxDg9Q6vgke00NBBsrJuAbyxc/8S233vSgHeaA189oZzR2Eu0aq', 'user', 0, NULL, NULL, 1),
	(63, 'Test', 'User', '1990-01-01', 'M', 'test_1747732755.573278@test.com', '$2b$12$quLXaFYaGC7kL0ztVyZMket0qilfEB/QTexvQq.lEmGuZrRrWaXka', 'user', 0, NULL, NULL, 1),
	(64, 'Test', 'User', '1990-01-01', 'M', 'test_1747732776.619976@test.com', '$2b$12$I2wjGROhK1twa9sg4MPls.4MYCT/S7HnpxJkewsb6QddIJUJGWlsi', 'user', 0, NULL, NULL, 1),
	(65, 'Test', 'User', '1990-01-01', 'M', 'test_1747732885.772622@test.com', '$2b$12$Q0Sm3HFx/sSJtJPoDAudteEcK7hwYY4a7Wyqc51BddBzVzmc9YyQ6', 'user', 0, NULL, NULL, 1),
	(66, 'Test', 'User', '1990-01-01', 'M', 'test_1747732894.50651@test.com', '$2b$12$HUj3PsgFDxcgxuin.uA3G.sYiNLvngxqxGqtTZGZDmqtQVzAfTr2a', 'user', 0, NULL, NULL, 1),
	(67, 'Test', 'User', '1990-01-01', 'M', 'test_1747732905.233401@test.com', '$2b$12$koLFPNrpCpA5LkAS9sZPo.115WdZ/D4s9ZdLnDnbie5U.OKN1i6Py', 'user', 0, NULL, NULL, 1),
	(68, 'Test', 'User', '1990-01-01', 'M', 'test_1747732911.834759@test.com', '$2b$12$eMeNVlEnOsa5mcAm7FxaXecNs1zU8BT5KR3LnsYCdJT1bkXXeHZD6', 'user', 0, NULL, NULL, 1),
	(69, 'Test', 'User', '1990-01-01', 'M', 'test_1747732932.887862@test.com', '$2b$12$ALMcefPVDC2gBbEDNAmCAOFbNPEj3Y5glOjtCR2/I6vZ0du5guCjq', 'user', 0, NULL, NULL, 1),
	(70, 'Test', 'User', '1990-01-01', 'M', 'test_1747733326.462556@test.com', '$2b$12$0NiQ/11IHRqdMpWSPbKoJOhBH4Oxh0.vXdbW9D6AetXPv9cu5nmiW', 'user', 0, NULL, NULL, 1),
	(71, 'Test', 'User', '1990-01-01', 'M', 'test_1747733335.104207@test.com', '$2b$12$ZuoTHnI6BlAnyztbaiqnuOi9iuFsD2Q/hBQlv1dSzkg45SfBJidCi', 'user', 0, NULL, NULL, 1),
	(72, 'Test', 'User', '1990-01-01', 'M', 'test_1747733345.934622@test.com', '$2b$12$2C41kyTBC4eUOFmFCcClGuC97xJNP9EFJ7Y67FnpdCE6W0BAkJgXu', 'user', 0, NULL, NULL, 1),
	(73, 'Test', 'User', '1990-01-01', 'M', 'test_1747733354.609505@test.com', '$2b$12$snXFg0YLGj5oN3z2KCrMbOjmTAIDBDlOQ8kOyjCaKlZOideVo6BzG', 'user', 0, NULL, NULL, 1),
	(74, 'Test', 'User', '1990-01-01', 'M', 'test_1747733375.663138@test.com', '$2b$12$Uhvwa2BmUEMwpg66x2hckOBQJ5In1wE/LWcCuZoyUvCYk9qH480tW', 'user', 0, NULL, NULL, 1);

-- Listage de la structure de table cesizen. authentification_token
CREATE TABLE IF NOT EXISTS `authentification_token` (
  `id` int NOT NULL,
  `token` varchar(16) NOT NULL,
  `suppression_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) NOT NULL DEFAULT 'web',
  KEY `fk_auth_token_user` (`id`),
  CONSTRAINT `fk_auth_token_user` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.authentification_token : ~0 rows (environ)

-- Listage de la structure de procédure cesizen. deleteExpiredTokens
DELIMITER //
CREATE PROCEDURE `deleteExpiredTokens`()
BEGIN
  DELETE FROM authentification_token
  WHERE suppression_date < NOW();
END//
DELIMITER ;

-- Listage de la structure de l'évènement cesizen. deleteExpiredTokensEvent
DELIMITER //
CREATE EVENT `deleteExpiredTokensEvent` ON SCHEDULE EVERY 1 SECOND STARTS '2025-05-25 19:59:05' ON COMPLETION NOT PRESERVE ENABLE DO CALL deleteExpiredTokens()//
DELIMITER ;

-- Listage de la structure de table cesizen. exercice_respiration
CREATE TABLE IF NOT EXISTS `exercice_respiration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exercice` json DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `descrpition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.exercice_respiration : ~5 rows (environ)
INSERT INTO `exercice_respiration` (`id`, `exercice`, `name`, `descrpition`) VALUES
	(1, '{"id": 748, "name": "Respiration 7-4-8", "steps": [{"size": 100, "phase": "Inspirez", "duration": 7000}, {"size": 100, "phase": "Bloquez", "duration": 4000}, {"size": 50, "phase": "Expirez", "duration": 8000}]}', 'Respiration 7-4-8-9', NULL),
	(2, '{"id": 55, "name": "Respiration 5-0-5", "steps": [{"size": 100, "phase": "Inspirez", "duration": 5000}, {"size": 50, "phase": "Expirez", "duration": 5000}]}', 'Respiration 5-0-5', NULL),
	(3, '{"id": 46, "name": "Respiration 4-0-6", "steps": [{"size": 100, "phase": "Inspirez", "duration": 4000}, {"size": 50, "phase": "Expirez", "duration": 6000}]}', 'Respiration 4-0-6', NULL),
	(6, 'null', NULL, NULL),
	(7, 'null', NULL, NULL);

-- Listage de la structure de table cesizen. historique_connexion
CREATE TABLE IF NOT EXISTS `historique_connexion` (
  `id` int NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'web',
  `dateconnexion` datetime NOT NULL,
  KEY `fk_hist_conn_token` (`id`),
  CONSTRAINT `fk_hist_conn_token` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.historique_connexion : ~83 rows (environ)
INSERT INTO `historique_connexion` (`id`, `type`, `dateconnexion`) VALUES
	(75, 'web', '2025-05-26 19:14:50'),
	(76, 'web', '2025-05-26 19:14:56'),
	(77, 'web', '2025-05-26 19:15:09'),
	(78, 'web', '2025-05-26 19:15:20'),
	(79, 'web', '2025-05-26 19:15:26'),
	(80, 'web', '2025-05-26 19:15:39'),
	(81, 'web', '2025-05-26 19:15:46'),
	(82, 'web', '2025-05-26 19:15:55'),
	(83, 'web', '2025-05-26 19:20:34'),
	(84, 'web', '2025-05-26 19:20:41'),
	(33, 'web', '2025-05-26 23:40:14'),
	(33, 'web', '2025-05-26 23:40:14'),
	(33, 'web', '2025-05-26 23:40:17'),
	(33, 'web', '2025-05-26 23:40:29'),
	(33, 'web', '2025-05-26 23:40:43'),
	(33, 'web', '2025-05-26 23:40:45'),
	(33, 'web', '2025-05-26 23:40:46'),
	(33, 'web', '2025-05-26 23:40:46'),
	(33, 'web', '2025-05-26 23:40:46'),
	(33, 'web', '2025-05-26 23:40:47'),
	(33, 'web', '2025-05-26 23:40:47'),
	(33, 'web', '2025-05-26 23:43:04'),
	(33, 'web', '2025-05-26 23:43:26'),
	(33, 'web', '2025-05-26 23:43:47'),
	(33, 'web', '2025-05-26 23:43:47'),
	(33, 'web', '2025-05-26 23:43:50'),
	(33, 'web', '2025-05-26 23:44:02'),
	(33, 'web', '2025-05-26 23:44:37'),
	(33, 'web', '2025-05-26 23:44:46'),
	(33, 'web', '2025-05-26 23:45:15'),
	(33, 'web', '2025-05-26 23:45:23'),
	(33, 'web', '2025-05-26 23:52:37'),
	(33, 'web', '2025-05-26 23:52:37'),
	(33, 'web', '2025-05-26 23:52:40'),
	(33, 'web', '2025-05-26 23:53:24'),
	(33, 'web', '2025-05-26 23:53:24'),
	(33, 'web', '2025-05-26 23:53:28'),
	(33, 'web', '2025-05-26 23:56:34'),
	(33, 'web', '2025-05-27 00:00:50'),
	(33, 'web', '2025-05-27 00:00:50'),
	(33, 'web', '2025-05-27 00:00:54'),
	(33, 'web', '2025-05-27 00:00:55'),
	(33, 'web', '2025-05-27 00:01:33'),
	(33, 'web', '2025-05-27 00:02:35'),
	(33, 'web', '2025-05-27 00:02:35'),
	(33, 'web', '2025-05-27 00:02:38'),
	(33, 'web', '2025-05-27 00:02:39'),
	(33, 'web', '2025-05-27 09:45:42'),
	(33, 'web', '2025-05-27 09:45:42'),
	(33, 'web', '2025-05-27 09:45:45'),
	(33, 'web', '2025-05-27 09:45:45'),
	(33, 'web', '2025-05-27 09:54:40'),
	(33, 'web', '2025-05-27 09:54:40'),
	(33, 'web', '2025-05-27 09:54:41'),
	(33, 'web', '2025-05-27 09:54:42'),
	(33, 'web', '2025-05-27 09:54:52'),
	(33, 'web', '2025-05-27 09:54:52'),
	(33, 'web', '2025-05-27 09:54:52'),
	(33, 'web', '2025-05-27 09:54:55'),
	(33, 'web', '2025-05-27 09:55:05'),
	(33, 'web', '2025-05-27 09:55:05'),
	(33, 'web', '2025-05-27 09:55:07'),
	(33, 'web', '2025-05-27 09:55:08'),
	(85, 'web', '2025-05-27 13:55:18'),
	(86, 'web', '2025-05-27 13:55:24'),
	(87, 'web', '2025-05-27 13:55:37'),
	(88, 'web', '2025-05-27 13:55:48'),
	(89, 'web', '2025-05-27 13:55:55'),
	(90, 'web', '2025-05-27 13:56:08'),
	(91, 'web', '2025-05-27 13:56:14'),
	(92, 'web', '2025-05-27 13:56:23'),
	(93, 'web', '2025-05-27 15:15:28'),
	(94, 'web', '2025-05-27 15:15:34'),
	(95, 'web', '2025-05-27 15:15:47'),
	(96, 'web', '2025-05-27 15:15:58'),
	(97, 'web', '2025-05-27 15:16:04'),
	(98, 'web', '2025-05-27 15:16:17'),
	(99, 'web', '2025-05-27 15:16:24'),
	(100, 'web', '2025-05-27 15:16:32'),
	(33, 'web', '2025-05-27 15:17:21'),
	(33, 'web', '2025-05-27 15:17:21'),
	(33, 'web', '2025-05-27 15:17:23'),
	(33, 'web', '2025-05-27 15:17:23'),
	(33, 'web', '2025-08-21 14:32:21');

-- Listage de la structure de table cesizen. informations_liste
CREATE TABLE IF NOT EXISTS `informations_liste` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.informations_liste : ~52 rows (environ)
INSERT INTO `informations_liste` (`id`, `name`, `profile_pic`, `content`, `created_at`) VALUES
	(103312, 'Santé mentale érigée en grande cause nationale', 'https://example.com/images/grande_cause.jpg', 'En 2025, la santé mentale a été érigée en "grande cause" en France, visant à sensibiliser le public et à améliorer les ressources dédiées, alors que le système de soins est débordé. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/02/la-sante-mentale-erigee-en-grande-cause-alors-que-le-systeme-de-soins-est-deborde_6341186_3224.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103317, 'Les jeunes femmes moins confiantes face à l\'avenir', 'https://example.com/images/jeunes_femmes.jpg', 'Selon une étude, 71% des jeunes de 15 à 30 ans se disent confiants en l\'avenir, contre 50% des plus de 31 ans. Cependant, les jeunes femmes sont moins optimistes que les hommes (51% contre 64%). <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/campus/article/2024/09/11/les-jeunes-femmes-sont-moins-confiantes-face-a-l-avenir_6312212_4401467.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103319, 'PSSM France', 'https://example.com/images/pssm_france.jpg', 'PSSM France est une association fondée en 2018 visant à déployer le secourisme en santé mentale et à lever le tabou autour de la santé mentale. Elle fait partie du réseau international Mental Health First Aid. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/PSSM_France\'">Source</button>', '2025-05-10 22:47:49'),
	(103320, 'Fondation FondaMental', 'https://example.com/images/fondation_fondamental.jpg', 'La Fondation FondaMental, créée en 2007, est dédiée à la recherche et à l\'innovation en santé mentale. Elle vise à mieux comprendre les troubles psychiatriques pour améliorer leur diagnostic et leur traitement. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/Fondation_FondaMental\'">Source</button>', '2025-05-10 22:47:49'),
	(103321, 'Semaines d\'information sur la santé mentale', 'https://example.com/images/sism.jpg', 'Les Semaines d\'information sur la santé mentale (SISM) sont une manifestation annuelle en France visant à sensibiliser le public et à déstigmatiser les troubles psychiatriques. Elles existent depuis 1990. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/Semaines_d%27information_sur_la_sant%C3%A9_mentale\'">Source</button>', '2025-05-10 22:47:49'),
	(103323, 'Jeunes psychiatres contre la stigmatisation', 'https://example.com/images/jeunes_psychiatres.jpg', 'Des jeunes psychiatres en France militent activement contre la stigmatisation des troubles psychiques, utilisant des initiatives comme "Pop & psy" pour normaliser ces sujets. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/10/sante-mentale-des-jeunes-psychiatres-militent-contre-la-stigmatisation_6347943_3224.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103328, 'La danse comme appui aux soins en psychiatrie', 'https://example.com/images/danse_psychiatrie.jpg', 'À Lyon, des initiatives intègrent patients et soignants dans des projets artistiques, utilisant la danse comme appui aux soins en psychiatrie pour renforcer la confiance en soi et contribuer à la réhabilitation psychosociale. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/sciences/article/2024/10/16/la-danse-comme-appui-aux-soins-en-psychiatrie_6353155_1650684.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103334, 'Augmentation des prescriptions de psychotropes chez les jeunes', 'https://example.com/images/psychotropes_jeunes.jpg', 'Entre 2019 et 2023, la prescription de psychotropes chez les jeunes de 12 à 25 ans a augmenté de manière préoccupante. Près de 936 000 jeunes ont reçu au moins une fois un remboursement pour ces médicaments en 2023, une hausse de 18% par rapport à 2019. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/02/sante-mentale-pourquoi-la-prescription-de-psychotropes-chez-les-jeunes-s-envole_6341710_3224.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103335, 'Initiatives de PSSM France', 'https://example.com/images/pssm_france.jpg', 'PSSM France, fondée en 2018, vise à déployer le secourisme en santé mentale et à lever le tabou autour de la santé mentale. En novembre 2024, l\'association compte plus de 75 000 secouristes formés en France. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/PSSM_France\'">Source</button>', '2025-05-10 22:47:49'),
	(103336, 'La santé mentale érigée en grande cause nationale', 'https://example.com/images/grande_cause_nationale.jpg', 'En 2025, la santé mentale a été désignée comme "grande cause" en France, visant à sensibiliser le public et à améliorer les ressources dédiées, alors que le système de soins est débordé. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/02/la-sante-mentale-erigee-en-grande-cause-alors-que-le-systeme-de-soins-est-deborde_6341186_3224.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103337, 'Nouvelles approches pour traiter le stress post-traumatique', 'https://example.com/images/stress_post_traumatique.jpg', 'Des approches innovantes, comme la stimulation magnétique transcrânienne répétitive (rTMS), sont en cours de test pour traiter les troubles de stress post-traumatique, offrant de nouvelles perspectives thérapeutiques. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/sciences/article/2024/10/21/les-nouvelles-voies-pour-traiter-les-troubles-de-stress-post-traumatique_6357693_1650684.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103338, 'Investir dans le bien-être mental des enfants', 'https://example.com/images/bien_etre_enfants.jpg', 'Plus d\'un enfant sur six souffre de troubles mentaux tels que l\'anxiété ou le TDAH. Investir massivement dans le bien-être mental des enfants réduit le risque de troubles psychiatriques futurs. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/idees/article/2024/09/19/investir-massivement-dans-le-bien-etre-mental-des-enfants-reduit-le-risque-de-trouble-psychiatrique-futur_6324147_3232.html\'">Source</button>', '2025-05-10 22:47:49'),
	(103344, 'La santé mentale, Grande Cause nationale 2025', 'https://solidarites.gouv.fr/sites/default/files/styles/large/public/2025-03/sante_mentale_grande_cause_2025.jpg', 'En 2025, la santé mentale a été désignée Grande Cause nationale en France, succédant à l\'activité physique et sportive de 2024. Cette initiative vise à sensibiliser le public et à améliorer les ressources dédiées à la santé mentale. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://solidarites.gouv.fr/la-sante-mentale-grande-cause-nationale-2025\'">Source</button>', '2025-05-10 23:09:13'),
	(103345, 'Programme 2025-2030 de la HAS pour la santé mentale', 'https://www.has-sante.fr/upload/docs/image/jpeg/2025-03/has_sante_mentale_2030.jpg', 'La Haute Autorité de santé (HAS) a adopté un programme pluriannuel dédié à la santé mentale et à la psychiatrie pour la période 2025-2030, visant à améliorer le parcours de santé des personnes dès l’émergence de troubles mentaux. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.has-sante.fr/jcms/p_3590541/fr/la-has-adopte-son-nouveau-programme-sante-mentale-et-psychiatrie-2025-2030\'">Source</button>', '2025-05-10 23:09:13'),
	(103346, 'Webinaires "Santé mentale : tous concernés"', 'https://santementalefrance.fr/wp-content/uploads/2025/01/webinaire_sante_mentale.jpg', 'En janvier 2025, plus de 7 600 participants ont assisté aux 8 webinaires gratuits "Santé mentale : tous concernés", démontrant un engagement sans précédent pour sensibiliser les professionnels au contact des personnes concernées par des troubles psychiques. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://santementalefrance.fr/evenements-actus/actus/\'">Source</button>', '2025-05-10 23:09:13'),
	(103347, 'Lieu de répit à Marseille pour les personnes en crise psychotique', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Marseille_vue.jpg/800px-Marseille_vue.jpg', 'À Marseille, un "Lieu de répit" a été mis en place pour accueillir les personnes sans-abri souffrant de troubles psychiques en crise, offrant une alternative à l’hospitalisation avec une approche communautaire et humaniste. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/Sant%C3%A9_mentale_communautaire\'">Source</button>', '2025-05-10 23:09:13'),
	(103348, '36ème édition des Semaines d’Information sur la Santé Mentale (SISM)', 'https://www.semaines-sante-mentale.fr/wp-content/uploads/2025/01/sism_2025.jpg', 'La 36ème édition des Semaines d’Information sur la Santé Mentale se tiendra du 6 au 19 octobre 2025, autour de la thématique "Pour notre santé mentale, réparons le lien social", visant à renforcer les liens sociaux pour améliorer la santé mentale. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.semaines-sante-mentale.fr/sism-2025/les-sism-2025/\'">Source</button>', '2025-05-10 23:09:13'),
	(103349, 'La France, pays le plus touché par la dépression en Europe', 'https://www.psychomedia.qc.ca/sites/psychomedia.qc.ca/files/styles/article/public/prevalence-depression-france-europe.jpg', 'En 2025, la France affiche un taux de prévalence de la dépression de 11 %, le plus élevé d’Europe, selon une étude de la DREES. Cela représente près du double de la moyenne européenne estimée à 6 %. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.psychomedia.qc.ca/sante-mentale/2025-01-20/prevalence-depression-france-europe\'">Source</button>', '2025-05-10 23:21:27'),
	(103350, 'Hausse des consultations pour états dépressifs en 2025', 'https://www.santepubliquefrance.fr/content/download/123456/9876543/version/1/file/graphique_consultations_depression_2025.jpg', 'Les actes SOS Médecins pour angoisse et état dépressif chez les 25-64 ans ont augmenté en février 2025, dépassant les niveaux des années précédentes. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.santepubliquefrance.fr/surveillance-syndromique-sursaud-R/documents/bulletin-national/2025/sante-mentale.-bulletin-mensuel-du-3-mars-2025\'">Source</button>', '2025-05-10 23:21:27'),
	(103351, 'Dépression résistante : une nouvelle thérapie par ultrasons', 'https://presse.inserm.fr/wp-content/uploads/2025/05/ultrasons_depression.jpg', 'Des chercheurs français testent une méthode innovante à base d’ultrasons pour traiter la dépression résistante aux traitements classiques. Cette approche non invasive offre de nouveaux espoirs. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://presse.inserm.fr/une-nouvelle-piste-therapeutique-pour-traiter-la-depression-resistante-par-ultrasons/70455/\'">Source</button>', '2025-05-10 23:21:27'),
	(103352, 'Programme Mon Soutien Psy : 12 séances remboursées par an', 'https://monacolife.net/wp-content/uploads/2025/02/mon_soutien_psy.jpg', 'Depuis janvier 2025, le programme Mon Soutien Psy permet aux Français de bénéficier de 12 séances de soutien psychologique entièrement remboursées par an, sans prescription médicale préalable. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://monacolife.net/new-mental-health-reforms-in-france-offer-greater-access-to-care/\'">Source</button>', '2025-05-10 23:21:27'),
	(103353, 'Campagne de sensibilisation à la dépression périnatale dans le Val-de-Marne', 'https://www.valdemarne.fr/sites/default/files/styles/large/public/2025-01/depression_perinatale_val_de_marne.jpg', 'Le département du Val-de-Marne a lancé une campagne pour sensibiliser à la dépression périnatale, encourageant les femmes enceintes et jeunes mères à consulter les professionnels de PMI. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.valdemarne.fr/espace-presse/les-communiques-de-presse/le-departement-du-val-de-marne-lance-une-campagne-de-sensibilisation-sur-la-depression-perinatale\'">Source</button>', '2025-05-10 23:21:27'),
	(103354, 'ComPaRe Dépression : une recherche participative innovante', 'https://www.lemonde.fr/images/2025/04/27/compare_depression.jpg', 'La cohorte en ligne ComPaRe Dépression, lancée par l’Inserm, implique plus de 4 700 volontaires pour améliorer la compréhension et le traitement de la dépression en intégrant l’expérience des patients. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/sciences/article/2024/04/27/astrid-chevance-psychiatre-impliquer-les-patients-dans-la-recherche-sur-la-depression-n-est-pas-un-imperatif-ethique-c-est-un-atout-scientifique_6230308_1650684.html\'">Source</button>', '2025-05-10 23:21:27'),
	(103355, 'La dépression, première cause de dépenses de l’Assurance Maladie', 'https://ymanci.fr/wp-content/uploads/2025/03/depression_depenses_assurance_maladie.jpg', 'En 2025, les troubles psychiques, dont la dépression, représentent le premier poste de dépense de l’Assurance Maladie en France, soulignant l’urgence d’une prise en charge renforcée. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://ymanci.fr/assurance-sante/actualites/la-sante-mentale-grande-cause-nationale/\'">Source</button>', '2025-05-10 23:21:27'),
	(103356, 'La dépression chez les seniors français : un taux alarmant de 16 %', 'https://drees.solidarites-sante.gouv.fr/sites/default/files/2025-01/depression_seniors_france.jpg', 'En France, 24 % des seniors déclarent un mauvais état de santé, avec un taux de dépression élevé de 16 %, selon une étude de la DREES publiée en janvier 2025. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://drees.solidarites-sante.gouv.fr/sites/default/files/2025-01/ER1324-V6_Embargo_2.pdf\'">Source</button>', '2025-05-10 23:21:27'),
	(103357, 'Les jeunes psychiatres militent contre la stigmatisation des troubles psychiques', 'https://www.lemonde.fr/images/2024/10/10/jeunes_psychiatres.jpg', 'En 2025, de jeunes psychiatres en France s’engagent activement contre la stigmatisation des troubles psychiques, notamment à travers des initiatives culturelles et des recherches participatives. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/10/sante-mentale-des-jeunes-psychiatres-militent-contre-la-stigmatisation_6347943_3224.html\'">Source</button>', '2025-05-10 23:21:27'),
	(103358, 'La France investit 150 000 € pour sensibiliser à la santé mentale', 'https://www.connexionfrance.com/images/2025/05/08/sensibilisation_sante_mentale.jpg', 'Le gouvernement français a investi 150 000 € en 2025 pour des campagnes de sensibilisation à la santé mentale, visant à réduire la stigmatisation et à encourager le dialogue sur la dépression. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.connexionfrance.com/practical/france-declares-mental-health-a-national-priority/714903\'">Source</button>', '2025-05-10 23:21:27'),
	(103359, 'La France, pays le plus touché par la dépression en Europe', 'https://www.santementale.fr/wp-content/uploads/2025/01/depression_france.jpg', 'En 2025, la France affiche un taux de dépression de 11 %, le plus élevé d’Europe de l’Ouest, touchant particulièrement les jeunes et les seniors. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.santementale.fr/2025/01/les-francais-souffrent-davantage-de-depression/\'">Source</button>', '2025-05-11 23:09:44'),
	(103360, '21 % des 18-24 ans souffrent de troubles dépressifs', 'https://www.lemonde.fr/images/2025/01/10/18-24_depression.jpg', 'Selon Santé publique France, près d’un jeune adulte sur cinq présente des symptômes dépressifs, un chiffre en forte hausse depuis la pandémie. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/10/sante-mentale-des-jeunes-psychiatres-militent-contre-la-stigmatisation_6347943_3224.html\'">Source</button>', '2025-05-11 23:09:44'),
	(103361, '12 séances de psychologue remboursées sans ordonnance', 'https://www.sortiraparis.com/images/2025/01/11/mon_soutien_psy.jpg', 'Depuis janvier 2025, le programme "Mon Soutien Psy" permet à tous les Français d’accéder à 12 séances de psychologue remboursées par an, sans prescription médicale. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://monacolife.net/new-mental-health-reforms-in-france-offer-greater-access-to-care/\'">Source</button>', '2025-05-11 23:09:44'),
	(103362, 'Traitement de la dépression résistante par ultrasons', 'https://presse.inserm.fr/wp-content/uploads/2025/05/ultrasons_depression.jpg', 'Des chercheurs français testent une méthode innovante utilisant des ultrasons pour traiter les cas de dépression sévère résistants aux traitements classiques. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://presse.inserm.fr/une-nouvelle-piste-therapeutique-pour-traiter-la-depression-resistante-par-ultrasons/70455/\'">Source</button>', '2025-05-11 23:09:44'),
	(103363, 'ComPaRe Dépression : recherche participative avec 4 700 patients', 'https://www.lemonde.fr/images/2025/04/27/compare_depression.jpg', 'La cohorte en ligne ComPaRe Dépression, lancée en 2023, implique des milliers de patients pour améliorer les outils cliniques et la compréhension de la maladie. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/sciences/article/2024/04/27/astrid-chevance-psychiatre-impliquer-les-patients-dans-la-recherche-sur-la-depression-n-est-pas-un-imperatif-ethique-c-est-un-atout-scientifique_6230308_1650684.html\'">Source</button>', '2025-05-11 23:09:44'),
	(103364, 'Semaine européenne de la santé mentale du 19 au 25 mai 2025', 'https://www.mentalhealtheurope.org/wp-content/uploads/2025/05/european_mental_health_week.jpg', 'La Semaine européenne de la santé mentale 2025 met l’accent sur les droits sociaux et la prévention des troubles dépressifs à travers des événements dans toute l’Europe. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.mentalhealtheurope.org/european-mental-health-week/\'">Source</button>', '2025-05-11 23:09:44'),
	(103365, 'Les femmes plus touchées par la dépression que les hommes', 'https://www.lepoint.fr/images/2025/01/09/femmes_depression.jpg', 'En France, les femmes sont significativement plus affectées par la dépression que les hommes, en particulier dans les tranches d’âge jeunes et âgées. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lepoint.fr/sante/les-francais-plus-depressifs-que-leurs-voisins-09-01-2025-2579568_40.php\'">Source</button>', '2025-05-11 23:09:44'),
	(103366, 'Dépression résistante : 2,5 millions de Français concernés', 'https://www.fondation-fondamental.org/wp-content/uploads/2025/01/depression_resistante.jpg', 'Chaque année, 2,5 millions de Français souffrent de dépression, dont une part significative ne répond pas aux traitements standards, nécessitant des approches alternatives. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.fondation-fondamental.org/les-maladies-mentales/depression-resistante\'">Source</button>', '2025-05-11 23:09:44'),
	(103367, 'La dépression coûte 25 milliards d’euros par an au système de santé', 'https://www.connexionfrance.com/images/2025/05/08/cout_depression.jpg', 'Les troubles de santé mentale, principalement la dépression, représentent la première dépense pour le système de santé français, avec un coût annuel de 25 milliards d’euros. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.connexionfrance.com/practical/france-declares-mental-health-a-national-priority/714903\'">Source</button>', '2025-05-11 23:09:44'),
	(103368, 'Festival Pop & Psy : culture et déstigmatisation de la dépression', 'https://www.lemonde.fr/images/2024/10/10/pop_psy_festival.jpg', 'Le festival Pop & Psy, organisé à Paris, utilise la culture populaire pour sensibiliser et déstigmatiser les troubles dépressifs, réunissant professionnels et grand public. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.lemonde.fr/societe/article/2024/10/10/sante-mentale-des-jeunes-psychiatres-militent-contre-la-stigmatisation_6347943_3224.html\'">Source</button>', '2025-05-11 23:09:44'),
	(103369, 'Stress chronique et maladie d’Alzheimer', 'https://www.vaincrealzheimer.org/wp-content/uploads/2025/02/stress-alzheimer.jpg', 'Des chercheurs du CNRS et de l’Inserm ont démontré que le stress chronique altère l’hippocampe, favorisant l’accumulation de la protéine tau, caractéristique de la maladie d’Alzheimer. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.vaincrealzheimer.org/2025/02/21/stress-maladie-alzheimer-comprendre-lien/\'">Source</button>', '2025-05-11 23:17:33'),
	(103370, '59% des Français stressés en 2025', 'https://www.fondation-ramsaysante.com/wp-content/uploads/2025/03/stress-france.jpg', 'Selon l’Observatoire du Stress de la Fondation Ramsay Santé, 59% des Français se déclarent stressés en 2025, un facteur aggravant pour les troubles cognitifs. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://en.fondation-ramsaysante.com/observatoire-stress\'">Source</button>', '2025-05-11 23:17:33'),
	(103371, 'Surcharge mentale au travail', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Marseille_vue.jpg/800px-Marseille_vue.jpg', 'La surcharge mentale due à l’hyperconnexion et aux réunions excessives entraîne une saturation de la mémoire de travail, affectant la concentration et la mémoire. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/Charge_mentale_au_travail\'">Source</button>', '2025-05-11 23:17:33'),
	(103372, 'Stress et neuro-inflammation', 'https://www.francealzheimer.org/wp-content/uploads/2025/02/stress-neuroinflammation.jpg', 'Le stress chronique accélère la formation des plaques amyloïdes et aggrave les troubles cognitifs en favorisant la neuro-inflammation. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.francealzheimer.org/evitez-situations-stressantes/\'">Source</button>', '2025-05-11 23:17:33'),
	(103373, 'Plasticité cérébrale et résilience au stress', 'https://presse.inserm.fr/wp-content/uploads/2025/01/plasticite-cerebrale.jpg', 'Une étude de l’Inserm à Caen met en évidence la plasticité cérébrale comme mécanisme clé de résilience face au stress post-traumatique. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://presse.inserm.fr/stress-post-traumatique-la-plasticite-cerebrale-un-mecanisme-cle-de-la-resilience-au-trauma/69820/\'">Source</button>', '2025-05-11 23:17:33'),
	(103374, 'Activité physique et prévention du déclin cognitif', 'https://www.vaincrealzheimer.org/wp-content/uploads/2025/04/bouge-ton-cerveau.jpg', 'Pratiquer 2h30 d’activité physique par semaine réduit de 35 à 45% le risque de développer des troubles cognitifs liés au stress. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.vaincrealzheimer.org/2025/04/09/defi-bougetoncerveau-2025/\'">Source</button>', '2025-05-11 23:17:33'),
	(103375, 'Lien entre stress et troubles cognitifs', 'https://www.frcneurodon.org/wp-content/uploads/2025/03/stress-cognition.jpg', 'Le stress quotidien, même mineur, peut affecter les émotions, la cognition et la physiologie, diminuant les capacités du cerveau tout au long de la journée. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.frcneurodon.org/informer-sur-la-recherche/actus/se-reveiller-stresse-diminue-les-capacites-du-cerveau-tout-au-long-de-la-journee/\'">Source</button>', '2025-05-11 23:17:33'),
	(103376, 'Impact du stress sur la mémoire des étudiants', 'https://www.chu-nimes.fr/sites/default/files/media/2025-02/semaine_du_cerveau.jpg', 'Le stress et l’anxiété influencent le cerveau des étudiants, affectant leur bien-être et leurs capacités cognitives. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.chu-nimes.fr/sites/default/files/media/2025-02/programme_de_la_semaine_du_cerveau_2025_1.pdf\'">Source</button>', '2025-05-11 23:17:33'),
	(103377, 'Stress et troubles neurodéveloppementaux', 'https://www.frcneurodon.org/wp-content/uploads/2025/03/stress-neurodeveloppement.jpg', 'Le stress est un facteur de risque commun aux pathologies neurologiques et psychiatriques, incluant les troubles neurodéveloppementaux. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.frcneurodon.org/programme-2023-2025-au-croisement-des-maladies-du-cerveau/\'">Source</button>', '2025-05-11 23:17:33'),
	(103378, 'Stress et charge mentale au travail', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Marseille_vue.jpg/800px-Marseille_vue.jpg', 'La surcharge mentale au travail, exacerbée par l’hyperconnexion, peut entraîner des troubles cognitifs liés au stress. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://fr.wikipedia.org/wiki/Charge_mentale_au_travail\'">Source</button>', '2025-05-11 23:17:33'),
	(103379, 'Stress et troubles cognitifs chez les seniors', 'https://institut.amelis-services.com/wp-content/uploads/2025/03/troubles-cognitifs-seniors.jpg', 'Chez les personnes âgées, le stress peut accélérer le déclin cognitif, affectant la mémoire et la vitesse de traitement des informations. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://institut.amelis-services.com/sante/autres/troubles-cognitifs-chez-les-seniors/\'">Source</button>', '2025-05-11 23:17:33'),
	(103380, 'Troubles cognitifs liés à l’alcoolisme', 'https://maisonlepervier.com/wp-content/uploads/2025/03/troubles-cognitifs-alcoolisme.jpg', 'L’abus d’alcool peut entraîner des troubles cognitifs, notamment une diminution de la mémoire et une accélération du déclin intellectuel. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://maisonlepervier.com/nouvelles/les-troubles-cognitifs-lies-a-lalcoolisme\'">Source</button>', '2025-05-11 23:17:33'),
	(103381, 'La santé mentale, Grande cause nationale en 2025', 'https://example.com/images/sante_mentale_2025.jpg', 'En 2025, la santé mentale est désignée comme Grande cause nationale en France, visant à sensibiliser le public et à améliorer les ressources dédiées. Cette initiative est soutenue par un collectif de 23 acteurs majeurs de la santé mentale, représentant plus de 3 400 organisations. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://santementale2025.org/\'">Source</button>', '2025-05-17 22:42:55'),
	(103382, 'Formation aux Premiers Secours en Santé Mentale (PSSM)', 'https://example.com/images/formation_pssm.jpg', 'Le programme de Premiers Secours en Santé Mentale (PSSM) permet de former des secouristes capables de repérer les troubles en santé mentale, d’adopter un comportement adapté et d’orienter vers les ressources appropriées. À ce jour, plus de 202 000 secouristes ont été formés en France. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.pssmfrance.fr/\'">Source</button>', '2025-05-17 22:42:55'),
	(103383, 'Fondation FondaMental : Recherche et innovation en psychiatrie', 'https://example.com/images/fondation_fondamental_recherche.jpg', 'Créée en 2007, la Fondation FondaMental est dédiée à la recherche et à l’innovation en santé mentale. Elle se concentre sur l’amélioration du diagnostic précoce, la prise en charge et le pronostic des troubles psychiatriques, tout en diffusant les savoirs et en brisant les préjugés. <button style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;" onclick="window.location.href=\'https://www.enseignementsup-recherche.gouv.fr/fr/fondation-fondamental-98410\'">Source</button>', '2025-05-17 22:42:55');

-- Listage de la structure de table cesizen. information_favori
CREATE TABLE IF NOT EXISTS `information_favori` (
  `id_info` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  KEY `fk_info_fav_user` (`id_user`),
  KEY `fk_info_fav_info` (`id_info`),
  CONSTRAINT `fk_info_fav_info` FOREIGN KEY (`id_info`) REFERENCES `informations_liste` (`id`),
  CONSTRAINT `fk_info_fav_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Favori des informations';

-- Listage des données de la table cesizen.information_favori : ~10 rows (environ)
INSERT INTO `information_favori` (`id_info`, `id_user`) VALUES
	(103382, 73),
	(103357, 68),
	(103328, 63),
	(103334, 58),
	(103383, 48),
	(103320, 33),
	(103334, 33),
	(103312, 79),
	(103365, 89),
	(103366, 97);

-- Listage de la structure de table cesizen. information_historique
CREATE TABLE IF NOT EXISTS `information_historique` (
  `id_info` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  KEY `fk_info_hist_user` (`id_user`),
  KEY `fk_info_hist_info` (`id_info`),
  CONSTRAINT `fk_info_hist_info` FOREIGN KEY (`id_info`) REFERENCES `informations_liste` (`id`),
  CONSTRAINT `fk_info_hist_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='historique des informations envoyée';

-- Listage des données de la table cesizen.information_historique : ~7 rows (environ)
INSERT INTO `information_historique` (`id_info`, `id_user`) VALUES
	(103382, 73),
	(103357, 68),
	(103328, 63),
	(103334, 58),
	(103312, 79),
	(103365, 89),
	(103366, 97);

-- Listage de la structure de table cesizen. questionnaire
CREATE TABLE IF NOT EXISTS `questionnaire` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_question` varchar(500) DEFAULT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='questionnaire de heidi et heins ou un truc comme ça\r\n';

-- Listage des données de la table cesizen.questionnaire : ~42 rows (environ)
INSERT INTO `questionnaire` (`id`, `nom_question`, `points`) VALUES
	(1, 'Combien de fois vos conditions de vie ont-elles changé significativement cette année ?', 25),
	(2, 'Combien de fois avez-vous changé certaines de vos habitudes cette année ?', 24),
	(3, 'Combien de fois avez-vous eu des infractions mineures à la loi (contraventions) cette année ?', 11),
	(4, 'Combien de fois avez-vous célébré Noël cette année ?', 12),
	(5, 'Combien de fois êtes-vous parti(e) en vacances cette année ?', 13),
	(6, 'Combien de fois avez-vous modifié vos habitudes alimentaires cette année ?', 15),
	(7, 'Combien de fois le nombre de réunions de famille a-t-il changé cette année ?', 15),
	(8, 'Combien de fois vos habitudes de sommeil ont-elles changé cette année ?', 16),
	(9, 'Combien de fois avez-vous souscrit un prêt ou une hypothèque de moins de 3 000 € cette année ?', 17),
	(10, 'Combien de fois avez-vous modifié vos activités sociales cette année ?', 19),
	(11, 'Combien de fois avez-vous changé vos activités religieuses cette année ?', 19),
	(12, 'Combien de fois avez-vous changé vos habitudes de loisirs cette année ?', 19),
	(13, 'Combien de fois avez-vous changé de lieu d’étude cette année ?', 20),
	(14, 'Combien de fois avez-vous changé de domicile cette année ?', 20),
	(15, 'Combien de fois vos horaires ou conditions de travail ont-ils changé cette année ?', 20),
	(16, 'Combien de fois avez-vous eu des difficultés avec votre employeur ou votre manager cette année ?', 23),
	(17, 'Combien de fois avez-vous pris votre retraite cette année ?', 45),
	(18, 'Combien de fois un membre de votre famille a-t-il connu un changement majeur de santé cette année ?', 44),
	(19, 'Combien de fois avez-vous rencontré des difficultés sexuelles cette année ?', 39),
	(20, 'Combien de fois un nouveau membre a-t-il rejoint votre famille cette année ?', 39),
	(21, 'Combien de fois votre univers professionnel a-t-il changé cette année ?', 39),
	(22, 'Combien de fois votre situation financière a-t-elle changé significativement cette année ?', 38),
	(23, 'Combien de fois avez-vous perdu un ami proche cette année ?', 37),
	(24, 'Combien de fois votre fonction professionnelle a-t-elle changé cette année ?', 36),
	(25, 'Combien de fois avez-vous observé une modification dans la fréquence des disputes dans votre couple ?', 35),
	(26, 'Combien de fois avez-vous souscrit un prêt ou une hypothèque de plus de 3 000 € cette année ?', 31),
	(27, 'Combien de fois avez-vous subi une saisie sur hypothèque ou sur prêt cette année ?', 30),
	(28, 'Combien de fois vos responsabilités au travail ont-elles changé cette année ?', 29),
	(29, 'Combien de fois un de vos enfants a-t-il quitté le domicile familial cette année ?', 29),
	(30, 'Combien de fois avez-vous rencontré des difficultés avec vos beaux-parents cette année ?', 29),
	(31, 'Combien de fois avez-vous connu un succès exceptionnel cette année ?', 28),
	(32, 'Combien de fois votre conjoint a-t-il commencé ou cessé de travailler cette année ?', 26),
	(33, 'Combien de fois avez-vous commencé ou terminé des études cette année ?', 26),
	(34, 'Combien de fois avez-vous connu une réconciliation avec votre époux(se) cette année ?', 45),
	(35, 'Combien de fois avez-vous été licencié(e) de votre emploi cette année ?', 47),
	(36, 'Combien de fois vous êtes-vous marié(e) cette année ?', 50),
	(37, 'Combien de fois avez-vous souffert d’une blessure corporelle ou d’une maladie grave cette année ?', 53),
	(38, 'Combien de fois avez-vous été incarcéré(e) cette année ?', 63),
	(39, 'Combien de fois avez-vous perdu un parent proche cette année ?', 63),
	(40, 'Combien de fois avez-vous vécu une séparation avec votre époux(se) cette année ?', 65),
	(41, 'Combien de fois avez-vous divorcé cette année ?', 73),
	(42, 'Combien de fois avez-vous perdu votre conjoint cette année ?', 100);

-- Listage de la structure de table cesizen. reinitialisation_password
CREATE TABLE IF NOT EXISTS `reinitialisation_password` (
  `token` varchar(250) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `id_user` int NOT NULL,
  UNIQUE KEY `token` (`token`),
  KEY `fk_reinit_user` (`id_user`),
  CONSTRAINT `fk_reinit_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.reinitialisation_password : ~0 rows (environ)

-- Listage de la structure de table cesizen. reponses_user
CREATE TABLE IF NOT EXISTS `reponses_user` (
  `id` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `date_reponse` date DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  KEY `fk_rep_user` (`id_user`),
  CONSTRAINT `fk_rep_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='réponse au questionnaire ';

-- Listage des données de la table cesizen.reponses_user : ~3 rows (environ)
INSERT INTO `reponses_user` (`id`, `score`, `date_reponse`, `id_user`) VALUES
	(NULL, 60, '2025-05-20', 43),
	(NULL, 60, '2025-05-20', 44),
	(NULL, 3250, '2025-05-18', 33);

-- Listage de la structure de procédure cesizen. SupprimerUtilisateursObsoletes
DELIMITER //
CREATE PROCEDURE `SupprimerUtilisateursObsoletes`()
BEGIN
  DELETE FROM users
  WHERE date_suppression_compte IS NOT NULL AND date_suppression_compte < NOW();
END//
DELIMITER ;

-- Listage de la structure de l'évènement cesizen. SupprimerUtilisateursObsoletesEvent
DELIMITER //
CREATE EVENT `SupprimerUtilisateursObsoletesEvent` ON SCHEDULE EVERY 1 DAY STARTS '2025-05-26 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO CALL SupprimerUtilisateursObsoletes()//
DELIMITER ;

-- Listage de la structure de table cesizen. tracker_emotion_list
CREATE TABLE IF NOT EXISTS `tracker_emotion_list` (
  `emotion` varchar(50) DEFAULT NULL,
  `sous_emotion` json DEFAULT NULL,
  `emotion_texte` varchar(500) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Liste des emotions avec leurs sous emotions';

-- Listage des données de la table cesizen.tracker_emotion_list : ~6 rows (environ)
INSERT INTO `tracker_emotion_list` (`emotion`, `sous_emotion`, `emotion_texte`, `couleur`) VALUES
	('Surprise', '[{"nom": "Étonnement", "description": "Réaction rapide à quelque chose d’inattendu."}, {"nom": "Stupéfaction", "description": "Surprise extrême laissant sans voix."}, {"nom": "Sidération", "description": "Blocage émotionnel face à un événement choquant."}, {"nom": "Incrédulité", "description": "Doute ou refus de croire ce qui vient de se passer."}, {"nom": "Émerveillement", "description": "Surprise mêlée de plaisir et d’admiration."}]', 'Surprise 😮', 'EDBACE'),
	('Dégoût', '[{"nom": "Répulsion", "description": "Rejet instinctif face à quelque chose de désagréable ou répugnant."}, {"nom": "Déplaisir", "description": "Sensation désagréable liée à une expérience négative."}, {"nom": "Nausée", "description": "Réaction physique ou émotionnelle à une aversion."}, {"nom": "Dédain", "description": "Mépris affiché envers quelque chose ou quelqu’un."}, {"nom": "Horreur", "description": "Dégoût extrême souvent mêlé de peur."}, {"nom": "Dégoût profond", "description": "Rejet intense et enraciné, souvent durable."}]', 'Dégoût 🤢', 'CBDFBB'),
	('Tristesse', '[{"nom": "Chagrin", "description": "Douleur émotionnelle liée à une perte ou une déception."}, {"nom": "Mélancolie", "description": "Tristesse douce et contemplative souvent liée à la nostalgie."}, {"nom": "Abattement", "description": "Perte d’énergie émotionnelle, sentiment de découragement."}, {"nom": "Désespoir", "description": "Absence totale d’espoir face à une situation."}, {"nom": "Solitude", "description": "Sentiment d’isolement ou de manque de lien affectif."}, {"nom": "Dépression", "description": "État profond et prolongé de tristesse et de vide émotionnel."}]', 'Tristesse 😢', 'A7D3EB'),
	('Peur', '[{"nom": "Inquiétude", "description": "État d’alerte léger face à une menace potentielle ou à l’inconnu."}, {"nom": "Anxiété", "description": "Sensation persistante d’inconfort liée à l’anticipation d’un danger."}, {"nom": "Terreur", "description": "Peur intense et paralysante face à un danger immédiat."}, {"nom": "Appréhension", "description": "Anticipation désagréable d’un événement futur."}, {"nom": "Panique", "description": "Réaction désorganisée face à une peur soudaine."}, {"nom": "Craintes", "description": "Peur modérée ou continue face à une menace perçue."}]', 'Peur 😨', 'C1BBDF'),
	('Joie', '[{"nom": "Fierté", "description": "Satisfaction personnelle issue d’une réussite ou d’une reconnaissance."}, {"nom": "Contentement", "description": "État de satisfaction calme et durable."}, {"nom": "Enchantement", "description": "Joie magique ou féérique face à une expérience plaisante."}, {"nom": "Excitation", "description": "Joie intense accompagnée d’une énergie vive."}, {"nom": "Émerveillement", "description": "Joie mêlée d’admiration face à quelque chose de magnifique."}, {"nom": "Gratitude", "description": "Joie ressentie en réponse à un bienfait ou à une attention reçue."}]', 'Joie 😄', 'FAF8C9'),
	('Colère', '[{"nom": "Frustration", "description": "Colère retenue face à un obstacle ou une injustice."}, {"nom": "Irritation", "description": "Agacement léger, souvent déclenché par une gêne répétée."}, {"nom": "Rage", "description": "Colère explosive, incontrôlée et violente."}, {"nom": "Ressentiment", "description": "Colère persistante face à une injustice perçue."}, {"nom": "Agacement", "description": "Énervement modéré lié à un désagrément mineur."}, {"nom": "Hostilité", "description": "Attitude agressive ou défensive face à une menace perçue."}]', 'Colère 😡', 'EEB5A6');

-- Listage de la structure de table cesizen. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` text NOT NULL,
  `lastname` text NOT NULL,
  `birth_date` date NOT NULL,
  `sex` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `id_equipe` int NOT NULL,
  `date_dernier_changement_mot_de_passe` date DEFAULT NULL,
  `date_suppression_compte` date DEFAULT NULL,
  `actif` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.users : ~66 rows (environ)
INSERT INTO `users` (`id`, `firstname`, `lastname`, `birth_date`, `sex`, `email`, `password`, `role`, `id_equipe`, `date_dernier_changement_mot_de_passe`, `date_suppression_compte`, `actif`) VALUES
	(1, 'John', 'Doe', '1990-05-14', 'male', 'john.doe@example.com', '$2b$12$LdgRkFxYjHBTRUBhU1are.q0/oM45rLkovML55.QQW.oRP3zhk/Zq', 'user', 2, NULL, NULL, 1),
	(2, 'Jane', 'Smith', '1988-03-22', 'female', 'jane.smith@example.com', '$2b$12$NUm/4zrLw90ddEYaSUfpQulHoVYiL3e4MhlT0wS1Poa7uhi23L4li', 'user', 2, NULL, NULL, 1),
	(33, 'Guillaume', 'Lechevallier', '2001-10-01', 'Homme', 'moilechevallier@gmail.com', '$2b$12$mefHmY5jILmZJBv3A3m7z.2TE7WAyFKvZgYxriZxSGlfNS1cH2z8y', 'referent', 2, NULL, NULL, 1),
	(37, 'tretrete', 'trtetee', '2001-10-01', 'tretre', 'moilechevallier+1@gmail.com', '$2b$12$9S4DpkxID.3iP5kQN2UGKuNtbqBEoKJkmChGVLqm5zMxf0VVTr90K', 'user', 4, NULL, NULL, 1),
	(38, 'dsqdsqdsq', 'dqsdsqdqsdqs', '2001-10-01', 'dqsdddqsqsd', '', '$2b$12$ZcfcblUksBoQ8S1qpuzjqOXtil/Gx3p9kWnDef2vpLKEyYHiNhwrG', 'user', 0, NULL, NULL, 1),
	(39, 'fdsfsdfds', 'fdsfdsfds', '2001-10-01', 'dsqdsqdqs', 'moilechevallier+12@gmail.com', '$2b$12$5ieRftI6A4.WCDy31UuBbee5ggORiX62JUXToAJxvnAzmXlo7h6dW', 'user', 0, NULL, NULL, 1),
	(40, 'Guillaume ', 'Lechevallier ', '2001-10-01', 'Homme', 'moilechevalhgclier@gmail.com', '$2b$12$gjum1Asml4BsAdUliB16xO2/3PG1h5nFbLtZ62TDmMSHdbyLsmxTy', 'user', 0, NULL, NULL, 1),
	(41, 'dsqdqds', 'dsqdsq', '2001-10-01', 'dsqdsqdqs', '63645qsdqsd@dsq.xw', '$2b$12$URm2TpWEQOI2e/OrYlOn7uUKTazse4aWnYnymahpSLCPyfiFW15OC', 'user', 0, NULL, NULL, 1),
	(42, '53455543', '534354345', '2001-10-01', '615651651', 'nhgfhgbfb@dfsfds.dfs', '$2b$12$xWGLmJXl9ca04.bCFqeUQelfM/tiAGPsaBEafR1sa32Rqs4WG7Qre', 'user', 0, NULL, NULL, 1),
	(43, 'Test', 'User', '1990-01-01', 'M', 'test.user1747731814.711571@example.com', '$2b$12$U1V/KNDwVX5cfBy9hMRBVeZevjbFe89MC22RncVXBVHZLDkIjWCku', 'user', 0, NULL, NULL, 1),
	(44, 'Test', 'User', '1990-01-01', 'M', 'test.user1747731852.393646@example.com', '$2b$12$aCdI9Ih2WOV1ULD8yT770.HaQS5aGhzliIdcwQUzZBAOPvlt7N2uG', 'user', 0, NULL, NULL, 1),
	(45, 'Test', 'User', '1990-01-01', 'M', 'test_1747732423.072627@test.com', '$2b$12$.8tNUbzB/FuUfSoT5LGxYOk8eY.HY8I32Y0mPPllooDAR5kbJeDVe', 'user', 0, NULL, NULL, 1),
	(46, 'Test', 'User', '1990-01-01', 'M', 'test_1747732431.810479@test.com', '$2b$12$yyk92OrToCnc6MFrt8g2f.cv/TIz/YjmwRjUoCfSmQeAhilhQdaQ6', 'user', 0, NULL, NULL, 1),
	(47, 'Test', 'User', '1990-01-01', 'M', 'test_1747732442.527767@test.com', '$2b$12$S6qfcdoG2IMOSR/lwAUxJOCnPvMKPbm602uVFIx/HLLCziKGBGVzG', 'user', 0, NULL, NULL, 1),
	(48, 'Test', 'User', '1990-01-01', 'M', 'test_1747732449.15851@test.com', '$2b$12$kOCZg5N6CaQJMohVM8DkU.SSC2nGxZWIPNBHHLHH.xlwXTEXpn/RW', 'user', 0, NULL, NULL, 1),
	(49, 'Test', 'User', '1990-01-01', 'M', 'test_1747732470.21361@test.com', '$2b$12$24ci1AV5hGZnxE6Y7eSRdO94gLduA4IHwxBJ5BgWSY0s.I5jdcw92', 'user', 0, NULL, NULL, 1),
	(50, 'Test', 'User', '1990-01-01', 'M', 'test_1747732509.744593@test.com', '$2b$12$xAs.VxSXwgT94tfu89BVPOKCbfKIimuEQ.ZpBgMOPNIRjJMFobooK', 'user', 0, NULL, NULL, 1),
	(51, 'Test', 'User', '1990-01-01', 'M', 'test_1747732518.410317@test.com', '$2b$12$3.fXGQDlEJh5UExWdDTiSu4YYK3G4RGgF/VT3.FK/mRl2i1rx8kQG', 'user', 0, NULL, NULL, 1),
	(52, 'Test', 'User', '1990-01-01', 'M', 'test_1747732529.147427@test.com', '$2b$12$eZMU3G8qNDkUBJcaMwOuk.OnlJsFgSN61ubSVuHqFnktNkE5RrbSm', 'user', 0, NULL, NULL, 1),
	(53, 'Test', 'User', '1990-01-01', 'M', 'test_1747732535.764931@test.com', '$2b$12$Xl4dMhLYzr2eRGW1snFNdOVIh9f7/l4T2y4TcS94Ztu72oy1TkUzS', 'user', 0, NULL, NULL, 1),
	(54, 'Test', 'User', '1990-01-01', 'M', 'test_1747732550.634855@test.com', '$2b$12$gy11HSvu.P9eODEOD2gfUOs5v./E3K8.RpZ6b/PNkkeJE8s0BDVm.', 'user', 0, NULL, NULL, 1),
	(55, 'Test', 'User', '1990-01-01', 'M', 'test_1747732600.038024@test.com', '$2b$12$LruKKbroZZbkUzDNqWxSGehlAgOrg2FUzJzILYf1TEGgfm8rreJQ2', 'user', 0, NULL, NULL, 1),
	(56, 'Test', 'User', '1990-01-01', 'M', 'test_1747732608.785052@test.com', '$2b$12$GOUvBteU08LSjxador6kNeMHVe8mIbcjFAeRg.RKSCdu.QE/cRitW', 'user', 0, NULL, NULL, 1),
	(57, 'Test', 'User', '1990-01-01', 'M', 'test_1747732619.507437@test.com', '$2b$12$IJJQVrlpXUshWhQu8OVZ3u6OI/QoZJcwz1etZ3JrOw98ifNq6tLHO', 'user', 0, NULL, NULL, 1),
	(58, 'Test', 'User', '1990-01-01', 'M', 'test_1747732626.127753@test.com', '$2b$12$Go9vNT59oiWsCcYMlQ7tiO20wFctzxSLAq/fc.9X8q2jUqceRsuwa', 'user', 0, NULL, NULL, 1),
	(59, 'Test', 'User', '1990-01-01', 'M', 'test_1747732647.179679@test.com', '$2b$12$x0gcU/13D/XBPZnRC9W/ru12oO78u6qOs7bcLtboHs.SpBmGMfcBW', 'user', 0, NULL, NULL, 1),
	(60, 'Test', 'User', '1990-01-01', 'M', 'test_1747732729.506148@test.com', '$2b$12$j1IFrcvf0FQNs7jAUttHne99SJLtk9Mio/SFGFbaOwHocf/1Ihq7K', 'user', 0, NULL, NULL, 1),
	(61, 'Test', 'User', '1990-01-01', 'M', 'test_1747732738.212176@test.com', '$2b$12$2gQc/ms9wQUXEVjuhjNsjuGyQd1Y5/BPbn.q53HHNXJx.F6kvhnWm', 'user', 0, NULL, NULL, 1),
	(62, 'Test', 'User', '1990-01-01', 'M', 'test_1747732748.961923@test.com', '$2b$12$QvxxDg9Q6vgke00NBBsrJuAbyxc/8S233vSgHeaA189oZzR2Eu0aq', 'user', 0, NULL, NULL, 1),
	(63, 'Test', 'User', '1990-01-01', 'M', 'test_1747732755.573278@test.com', '$2b$12$quLXaFYaGC7kL0ztVyZMket0qilfEB/QTexvQq.lEmGuZrRrWaXka', 'user', 0, NULL, NULL, 1),
	(64, 'Test', 'User', '1990-01-01', 'M', 'test_1747732776.619976@test.com', '$2b$12$I2wjGROhK1twa9sg4MPls.4MYCT/S7HnpxJkewsb6QddIJUJGWlsi', 'user', 0, NULL, NULL, 1),
	(65, 'Test', 'User', '1990-01-01', 'M', 'test_1747732885.772622@test.com', '$2b$12$Q0Sm3HFx/sSJtJPoDAudteEcK7hwYY4a7Wyqc51BddBzVzmc9YyQ6', 'user', 0, NULL, NULL, 1),
	(66, 'Test', 'User', '1990-01-01', 'M', 'test_1747732894.50651@test.com', '$2b$12$HUj3PsgFDxcgxuin.uA3G.sYiNLvngxqxGqtTZGZDmqtQVzAfTr2a', 'user', 0, NULL, NULL, 1),
	(67, 'Test', 'User', '1990-01-01', 'M', 'test_1747732905.233401@test.com', '$2b$12$koLFPNrpCpA5LkAS9sZPo.115WdZ/D4s9ZdLnDnbie5U.OKN1i6Py', 'user', 0, NULL, NULL, 1),
	(68, 'Test', 'User', '1990-01-01', 'M', 'test_1747732911.834759@test.com', '$2b$12$eMeNVlEnOsa5mcAm7FxaXecNs1zU8BT5KR3LnsYCdJT1bkXXeHZD6', 'user', 0, NULL, NULL, 1),
	(69, 'Test', 'User', '1990-01-01', 'M', 'test_1747732932.887862@test.com', '$2b$12$ALMcefPVDC2gBbEDNAmCAOFbNPEj3Y5glOjtCR2/I6vZ0du5guCjq', 'user', 0, NULL, NULL, 1),
	(70, 'Test', 'User', '1990-01-01', 'M', 'test_1747733326.462556@test.com', '$2b$12$0NiQ/11IHRqdMpWSPbKoJOhBH4Oxh0.vXdbW9D6AetXPv9cu5nmiW', 'user', 0, NULL, NULL, 1),
	(71, 'Test', 'User', '1990-01-01', 'M', 'test_1747733335.104207@test.com', '$2b$12$ZuoTHnI6BlAnyztbaiqnuOi9iuFsD2Q/hBQlv1dSzkg45SfBJidCi', 'user', 0, NULL, NULL, 1),
	(72, 'Test', 'User', '1990-01-01', 'M', 'test_1747733345.934622@test.com', '$2b$12$2C41kyTBC4eUOFmFCcClGuC97xJNP9EFJ7Y67FnpdCE6W0BAkJgXu', 'user', 0, NULL, NULL, 1),
	(73, 'Test', 'User', '1990-01-01', 'M', 'test_1747733354.609505@test.com', '$2b$12$snXFg0YLGj5oN3z2KCrMbOjmTAIDBDlOQ8kOyjCaKlZOideVo6BzG', 'user', 0, NULL, NULL, 1),
	(74, 'Test', 'User', '1990-01-01', 'M', 'test_1747733375.663138@test.com', '$2b$12$Uhvwa2BmUEMwpg66x2hckOBQJ5In1wE/LWcCuZoyUvCYk9qH480tW', 'user', 0, NULL, NULL, 1),
	(75, 'Test', 'User', '1990-01-01', 'M', 'test_1748279685.322429@test.com', '$2b$12$QFx5IRFjeAK5So1ZxioHCeAY13VAvEa6a4Bmx64bmOc6i8256PTHm', 'user', 0, NULL, NULL, 1),
	(76, 'Test', 'User', '1990-01-01', 'M', 'test_1748279692.129212@test.com', '$2b$12$pkhZ.1614U.zdINyayd62.kx3RlfD7.D5xnY1nV2TzqrOw2XYJx3.', 'user', 0, NULL, NULL, 1),
	(77, 'Test', 'User', '1990-01-01', 'M', 'test_1748279704.911144@test.com', '$2b$12$PaBkcA/1xE58eZWWrXAxz.wHS4eJM1Pb5fhtYIawMrf31Mqoc2amW', 'user', 0, NULL, NULL, 1),
	(78, 'Test', 'User', '1990-01-01', 'M', 'test_1748279715.752167@test.com', '$2b$12$HzLU3Wrzf3R12ot3pDnXueBqjPrg.Yad9dvf8SiCxj.6t1XTESN5a', 'user', 0, NULL, NULL, 1),
	(79, 'Test', 'User', '1990-01-01', 'M', 'test_1748279722.404565@test.com', '$2b$12$kVdcap/OmtGN8x.8oTTQ0emx9ZA1jMdQiEPl7r9lDT3IuCw0Nd5hO', 'user', 0, NULL, NULL, 1),
	(80, 'Test', 'User', '1990-01-01', 'M', 'test_1748279735.26198@test.com', '$2b$12$D42ckDVQVchDuGd.wG27zuaxkdM/6RHDJ5DUnaZR4ANNDVXRRzBvS', 'user', 0, NULL, NULL, 1),
	(81, 'Test', 'User', '1990-01-01', 'M', 'test_1748279741.896518@test.com', '$2b$12$gC0qn/2gysFKeNxSaIUjwuCWjyCsSXEGksJtlrYVJW.57zqcR2QKG', 'user', 0, NULL, NULL, 1),
	(82, 'Test', 'User', '1990-01-01', 'M', 'test_1748279750.539636@test.com', '$2b$12$Y6GvW4i3n1VeIhHorI3ODeRT9s3BeDczjLQC1PZTX077hG0iyP.ya', 'user', 0, NULL, NULL, 1),
	(83, 'Test', 'User', '1990-01-01', 'M', 'test_1748280030.065478@test.com', '$2b$12$zXCiheEiAEKlScePtr4wl.sPmw2.pUkyztVNrD0W8jeLwl1YvOc7C', 'user', 0, NULL, NULL, 1),
	(84, 'Test', 'User', '1990-01-01', 'M', 'test_1748280036.716616@test.com', '$2b$12$EuqrJh7eQLEBUvxhOUgrHe1Qm.j1H42UiIKlYF59vI6LVgGY.T7SO', 'user', 0, NULL, NULL, 1),
	(85, 'Test', 'User', '1990-01-01', 'M', 'test_1748346913.788983@test.com', '$2b$12$WnO4Z8hcAGR26xyS7IYQ4.VjfoGpFkxYiGu3ytFfXo4JGwxG5xmby', 'user', 0, NULL, NULL, 1),
	(86, 'Test', 'User', '1990-01-01', 'M', 'test_1748346920.423458@test.com', '$2b$12$zxNEh7akU/7USj76rhglh.xYyvXdOqAM41OZTEqo2FEekGoKpdhGK', 'user', 0, NULL, NULL, 1),
	(87, 'Test', 'User', '1990-01-01', 'M', 'test_1748346933.155862@test.com', '$2b$12$jgIyXqtG4civUT4w/LKEx.Jrxo3iAROb32VNuNL0kjzJk.xPizAdq', 'user', 0, NULL, NULL, 1),
	(88, 'Test', 'User', '1990-01-01', 'M', 'test_1748346943.920834@test.com', '$2b$12$RaYPQmBtfUFP7rbBrY3Zt.2N7OwuiiXillNcGHfN7N9UfvVPl.WYu', 'user', 0, NULL, NULL, 1),
	(89, 'Test', 'User', '1990-01-01', 'M', 'test_1748346950.550273@test.com', '$2b$12$C05Lz2FQ7d9yw6PiC1plYu6HKLfqr/sFZya7/.iV2GF9JwvThxH3S', 'user', 0, NULL, NULL, 1),
	(90, 'Test', 'User', '1990-01-01', 'M', 'test_1748346963.476737@test.com', '$2b$12$1hUlL.1rcObZ6p0kpGs.feBUswwIW1ZfKZ0CpzfYXHi2XHtvFxQKu', 'user', 0, NULL, NULL, 1),
	(91, 'Test', 'User', '1990-01-01', 'M', 'test_1748346970.096429@test.com', '$2b$12$Ce9M.nsVVvVXYvhAat/CkOG47POwx9kqAwy2A9ol6SHrZw6MIppyK', 'user', 0, NULL, NULL, 1),
	(92, 'Test', 'User', '1990-01-01', 'M', 'test_1748346978.74425@test.com', '$2b$12$sIaAcDpddl1F9Em7/ecoYuOlKwbkJA4Z/hmN17GbWi3msBpHzuWVK', 'user', 0, NULL, NULL, 1),
	(93, 'Test', 'User', '1990-01-01', 'M', 'test_1748351723.547974@test.com', '$2b$12$RZzfR4XPnvmUY/3D0yhPYOKb3c7AoCdz7LTyts8Ud0u80gCnj.X3m', 'user', 0, NULL, NULL, 1),
	(94, 'Test', 'User', '1990-01-01', 'M', 'test_1748351730.177435@test.com', '$2b$12$JDtLKZlVclCjhV8ZejZehOC83yzar2XggqT9f5oGo59N0.HlLuD1q', 'user', 0, NULL, NULL, 1),
	(95, 'Test', 'User', '1990-01-01', 'M', 'test_1748351742.922901@test.com', '$2b$12$swl.6x2QoaLghW2mM6vvruryRyTQiWlnKKzyho5BhnoOWP0DEG9vq', 'user', 0, NULL, NULL, 1),
	(96, 'Test', 'User', '1990-01-01', 'M', 'test_1748351753.677134@test.com', '$2b$12$4.OD7RWefdEmc8ZrcAe/luz9FuO6fTiuIQQ0SQMsbsDG/59/DyNla', 'user', 0, NULL, NULL, 1),
	(97, 'Test', 'User', '1990-01-01', 'M', 'test_1748351760.286195@test.com', '$2b$12$Q3sL5XHhcZ9.4joUNnQN7O1rpjsgMhn299lVYoZzJvGpSxx2q8Rbi', 'user', 0, NULL, NULL, 1),
	(98, 'Test', 'User', '1990-01-01', 'M', 'test_1748351773.082181@test.com', '$2b$12$QRB9p7Cztum.D0OAGeCIS.WvwApql4h5umKI9e56xgHHb3pX0LWe.', 'user', 0, NULL, NULL, 1),
	(99, 'Test', 'User', '1990-01-01', 'M', 'test_1748351779.694838@test.com', '$2b$12$0pTZ92BjuBK8go5OWTCrJ.QZgeLX5bMh9NMo7NIKkwethseI8QAgC', 'user', 0, NULL, NULL, 1),
	(100, 'Test', 'User', '1990-01-01', 'M', 'test_1748351788.402545@test.com', '$2b$12$SL3e4sf55cMFGJkAa5Qwz.tOGbw.BqOLSfpcdA5oiMAn6vLbwFRx.', 'user', 0, NULL, NULL, 1);

-- Listage de la structure de table cesizen. user_emotion
CREATE TABLE IF NOT EXISTS `user_emotion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `emotion` varchar(100) NOT NULL,
  `sous_emotion` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_emotion_per_day` (`id_user`,`sous_emotion`,`created_date`),
  CONSTRAINT `fk_user_emotion_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cesizen.user_emotion : ~27 rows (environ)
INSERT INTO `user_emotion` (`id`, `id_user`, `emotion`, `sous_emotion`, `created_at`, `created_date`) VALUES
	(1, 33, 'Colère', 'Agacement', '2025-05-13 22:58:26', '2025-05-14'),
	(2, 33, 'Colère', 'Rage', '2025-05-13 22:58:33', '2025-05-14'),
	(3, 33, 'Colère', 'Ressentiment', '2025-05-13 22:58:47', '2025-05-14'),
	(4, 33, 'Surprise', 'Étonnement', '2025-05-13 22:59:12', '2025-05-14'),
	(5, 33, 'Surprise', 'Stupéfaction', '2025-05-13 23:04:09', '2025-05-14'),
	(6, 33, 'Surprise', 'Incrédulité', '2025-05-13 23:06:43', '2025-05-14'),
	(7, 33, 'Joie', 'Contentement', '2025-05-13 23:06:48', '2025-05-14'),
	(8, 33, 'Surprise', 'Sidération', '2025-05-13 23:06:53', '2025-05-14'),
	(9, 33, 'Surprise', 'Émerveillement', '2025-05-13 23:06:57', '2025-05-14'),
	(10, 33, 'Dégoût', 'Répulsion', '2025-05-13 23:08:36', '2025-05-14'),
	(11, 33, 'Dégoût', 'Déplaisir', '2025-05-13 23:08:40', '2025-05-14'),
	(12, 33, 'Dégoût', 'Nausée', '2025-05-13 23:08:43', '2025-05-14'),
	(13, 33, 'Dégoût', 'Dédain', '2025-05-13 23:08:47', '2025-05-14'),
	(14, 33, 'Dégoût', 'Horreur', '2025-05-13 23:08:50', '2025-05-14'),
	(15, 33, 'Dégoût', 'Dégoût profond', '2025-05-13 23:08:53', '2025-05-14'),
	(16, 33, 'Tristesse', 'Mélancolie', '2025-05-13 23:08:59', '2025-05-14'),
	(17, 33, 'Tristesse', 'Mélancolie', '2025-05-16 17:05:36', '2025-05-16'),
	(18, 33, 'Dégoût', 'Répulsion', '2025-05-17 12:27:04', '2025-05-17'),
	(19, 33, 'Colère', 'Irritation', '2025-05-17 12:27:08', '2025-05-17'),
	(20, 43, 'Joie', 'Contentement', '2025-05-20 09:03:50', '2025-05-20'),
	(21, 44, 'Joie', 'Contentement', '2025-05-20 09:04:27', '2025-05-20'),
	(22, 48, 'happy', 'joyful', '2025-05-20 09:14:22', '2025-05-20'),
	(23, 53, 'happy', 'joyful', '2025-05-20 09:15:49', '2025-05-20'),
	(24, 58, 'happy', 'joyful', '2025-05-20 09:17:19', '2025-05-20'),
	(25, 63, 'happy', 'joyful', '2025-05-20 09:19:28', '2025-05-20'),
	(26, 68, 'happy', 'joyful', '2025-05-20 09:22:05', '2025-05-20'),
	(27, 73, 'happy', 'joyful', '2025-05-20 09:29:27', '2025-05-20'),
	(28, 80, 'happy', 'joyful', '2025-05-26 17:15:42', '2025-05-26'),
	(29, 90, 'happy', 'joyful', '2025-05-27 11:56:10', '2025-05-27'),
	(30, 98, 'happy', 'joyful', '2025-05-27 13:16:20', '2025-05-27');

-- Listage de la structure de déclencheur cesizen. creation_historique_connexion
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `creation_historique_connexion` AFTER INSERT ON `authentification_token` FOR EACH ROW BEGIN
  INSERT INTO historique_connexion (ID, type, dateconnexion)
  VALUES (NEW.ID, NEW.type, NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Listage de la structure de déclencheur cesizen. definition_date_suppression_token
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `definition_date_suppression_token` BEFORE INSERT ON `authentification_token` FOR EACH ROW BEGIN
  IF NEW.type = 'phone' THEN
    SET NEW.suppression_date = DATE_ADD(NOW(), INTERVAL 1 WEEK);
  ELSE
    SET NEW.suppression_date = DATE_ADD(NOW(), INTERVAL 2 HOUR);
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

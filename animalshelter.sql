-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 23. 10:29
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `animalshelter`
--
CREATE DATABASE IF NOT EXISTS `animalshelter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `animalshelter`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `animals`
--

CREATE TABLE IF NOT EXISTS `animals` (
  `Id` char(36) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Species` varchar(30) NOT NULL,
  `Age` int(11) NOT NULL,
  `Weight` double NOT NULL,
  `RegTime` datetime DEFAULT current_timestamp(),
  `ShelterId` char(36) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ShelterId` (`ShelterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `animals`
--

INSERT INTO `animals` (`Id`, `Name`, `Species`, `Age`, `Weight`, `RegTime`, `ShelterId`) VALUES
('03fe23d4-30e7-5d46-b0e6-eb58652536e6', 'Buksi', 'Kutya', 10, 22, '2026-05-19 18:56:19', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('0792ea5b-019c-5a5f-af13-43d50932b385', 'Szuszi', 'Macska', 6, 4.8, '2026-08-09 08:59:52', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('0af0cf17-ccbb-5d2b-b38e-7e2d4cecf326', 'Tündi', 'Macska', 4, 4, '2026-10-08 12:02:07', 'c41845d3-62ac-5c31-9b16-80193b82aec0'),
('1138d3c9-4155-570c-8e61-6030264585a5', 'Pamacs', 'Nyúl', 1, 1.8, '2026-09-27 11:00:58', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('1866512f-0d91-5870-862c-892578857d0a', 'Bolyhos', 'Nyúl', 2, 2.2, '2026-04-09 19:37:39', '95f1187f-f2c2-54b7-afc1-3dba453580ab'),
('20b269d2-f6bb-5f93-a35f-e0a83e3b1b6a', 'Nutella', 'Macska', 7, 4.6, '2026-10-06 12:36:00', 'a2691474-e139-594f-a782-443415ee7d41'),
('250155ac-0734-5e32-b60f-67c2caddcf21', 'Barni', 'Kutya', 5, 16.4, '2026-06-02 14:10:23', 'a2691474-e139-594f-a782-443415ee7d41'),
('35924a92-448f-5531-81aa-715db46108f0', 'Cica', 'Macska', 1, 2.7, '2026-01-11 11:20:09', 'a2691474-e139-594f-a782-443415ee7d41'),
('36a61e25-bef0-5196-89c6-63953864c4f2', 'Rozi', 'Kutya', 6, 17.7, '2026-09-10 19:26:41', 'c41845d3-62ac-5c31-9b16-80193b82aec0'),
('402f40a8-b37b-59b7-a7a0-4f516fcba9a2', 'Dundi', 'Kutya', 11, 19, '2026-02-10 18:43:20', 'a2691474-e139-594f-a782-443415ee7d41'),
('4f9f6702-f2a1-5573-9387-773fda917258', 'Kokó', 'Papagáj', 15, 0.35, '2026-04-04 12:59:11', '95f1187f-f2c2-54b7-afc1-3dba453580ab'),
('51170f6b-b09d-5636-ac43-0d9db9b8bcce', 'Frufru', 'Macska', 4, 3.9, '2026-09-07 13:27:38', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('5fece87e-38d4-5c16-98d7-6c5b240201c0', 'Mici', 'Macska', 12, 4.2, '2026-05-09 20:51:02', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('679351af-5ebc-5a6d-9d96-542c438c734f', 'Pihe', 'Macska', 3, 3.6, '2026-01-02 18:10:38', 'c41845d3-62ac-5c31-9b16-80193b82aec0'),
('6feb7e27-7765-5713-b55e-c4843277245e', 'Morzsa', 'Kutya', 3, 12, '2026-05-10 17:55:46', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('7a68e4f2-cd19-5173-8847-714d089ecfa2', 'Tigris', 'Macska', 5, 5.2, '2026-06-04 20:03:45', '95f1187f-f2c2-54b7-afc1-3dba453580ab'),
('9c62eeaf-0a9f-52be-9476-bed0482b596d', 'Gombóc', 'Tengerimalac', 3, 1.1, '2026-02-10 16:12:57', 'a2691474-e139-594f-a782-443415ee7d41'),
('a6f442e4-9741-51c3-ade0-29660d30b381', 'Pötyi', 'Kutya', 9, 11.8, '2026-07-28 20:39:43', 'a2691474-e139-594f-a782-443415ee7d41'),
('c021cb09-96a4-5642-86ec-61940e00ff4a', 'Csöpi', 'Tengerimalac', 2, 0.9, '2026-07-07 17:40:28', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('c2f0f823-1a76-585e-b4e5-ed19a94af132', 'Maci', 'Kutya', 6, 25, '2026-10-11 17:35:12', '95f1187f-f2c2-54b7-afc1-3dba453580ab'),
('c4162e6f-4003-554b-86cb-0fb7d88b4890', 'Lord', 'Kutya', 7, 27.5, '2026-05-14 14:10:14', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('c4213408-f2c0-5d4e-87b2-52790ce154c7', 'Fülöp', 'Nyúl', 4, 2.6, '2026-08-10 09:16:24', 'a2691474-e139-594f-a782-443415ee7d41'),
('cc23294d-d306-51f5-8c7d-221df318b121', 'Tappancs', 'Kutya', 2, 15, '2026-02-02 14:40:17', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('cf626a32-1c45-5fb2-ab48-38e94b0a5c57', 'Rex', 'Kutya', 8, 30.2, '2026-06-03 20:38:21', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('d5f4addb-98de-5c04-b2e5-45ed81987db5', 'Szörme', 'Macska', 3, 4.4, '2026-05-06 12:27:47', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('d72a9eac-c97e-5c4b-b0b9-d5fa0218d122', 'Foltos', 'Kutya', 2, 14.4, '2026-04-14 10:07:03', 'c41845d3-62ac-5c31-9b16-80193b82aec0'),
('da96085c-6580-5b96-a0fa-fc15680887c9', 'Cuki', 'Papagáj', 9, 0.09, '2026-09-18 17:30:44', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('e196728c-79be-5619-a0a8-d035b01e6818', 'Vacak', 'Kutya', 1, 8.3, '2026-05-15 07:02:22', '95f1187f-f2c2-54b7-afc1-3dba453580ab'),
('e48aaf7f-bfbb-5758-8426-8c50f11b6f0a', 'Kormi', 'Kutya', 4, 20.3, '2026-06-05 17:12:04', '8d32af8e-bca2-5907-997f-05ff3b325fe7'),
('ea3a4fc7-be73-5043-91f4-42c6067d428a', 'Cirmi', 'Macska', 2, 4.1, '2026-07-17 10:11:15', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('ea9adb07-4806-5788-93bd-5ceffafc1b4d', 'Zsuzsi', 'Papagáj', 6, 0.4, '2026-06-10 16:06:28', 'a2691474-e139-594f-a782-443415ee7d41'),
('ef8764f7-b2c4-5b61-991e-795f3fedea39', 'Bodri', 'Kutya', 5, 18.5, '2026-05-26 11:12:10', 'dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64'),
('fcfb1c56-b3e8-51aa-9fd7-bbefe92a6f2b', 'Mazsola', 'Nyúl', 2, 2, '2026-03-20 07:34:31', 'c41845d3-62ac-5c31-9b16-80193b82aec0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `shelters`
--

CREATE TABLE IF NOT EXISTS `shelters` (
  `Id` char(36) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `City` varchar(40) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `RegTime` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `shelters`
--

INSERT INTO `shelters` (`Id`, `Name`, `City`, `Capacity`, `RegTime`) VALUES
('7267c0e1-47ab-5f60-9676-3214482b6e63', 'Új Remény', 'Győr', 20, '2026-05-07 07:53:41'),
('8d32af8e-bca2-5907-997f-05ff3b325fe7', 'Gazdira Vár', 'Debrecen', 25, '2026-08-05 08:04:01'),
('95f1187f-f2c2-54b7-afc1-3dba453580ab', 'Cirmos Menedék', 'Eger', 15, '2026-07-18 11:51:48'),
('a2691474-e139-594f-a782-443415ee7d41', 'Boldog Mancs', 'Szeged', 40, '2026-01-08 15:34:23'),
('c41845d3-62ac-5c31-9b16-80193b82aec0', 'Kis Menedék', 'Salgótarján', 3, '2026-05-25 09:52:06'),
('dd87a9dd-de9b-55c7-8fa6-fdafdfcc4a64', 'Négylábú Otthon', 'Miskolc', 30, '2026-04-10 08:46:25');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`ShelterId`) REFERENCES `shelters` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

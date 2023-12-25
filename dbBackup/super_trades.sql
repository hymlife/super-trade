-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: mysql:3306
-- Üretim Zamanı: 23 Ara 2023, 22:31:54
-- Sunucu sürümü: 11.0.3-MariaDB-1:11.0.3+maria~ubu2204
-- PHP Sürümü: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `super_trades`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `balance` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tablo döküm verisi `portfolios`
--

INSERT INTO `portfolios` (`id`, `userId`, `balance`, `createdAt`, `updatedAt`) VALUES
(1, 1, 2620.5, '2023-12-23 21:37:32', '2023-12-23 22:25:34');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `portfolio_shares`
--

CREATE TABLE `portfolio_shares` (
  `id` int(11) NOT NULL,
  `portfolioId` int(11) NOT NULL,
  `shareId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tablo döküm verisi `portfolio_shares`
--

INSERT INTO `portfolio_shares` (`id`, `portfolioId`, `shareId`, `amount`, `createdAt`, `updatedAt`) VALUES
(7, 1, 2, 150, '2023-12-23 22:11:58', '2023-12-23 22:12:43'),
(8, 1, 1, 90, '2023-12-23 22:12:56', '2023-12-23 22:25:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `shares`
--

CREATE TABLE `shares` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `shortnName` varchar(3) NOT NULL,
  `price` float NOT NULL,
  `amount` int(11) NOT NULL,
  `lastEdit` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tablo döküm verisi `shares`
--

INSERT INTO `shares` (`id`, `name`, `shortnName`, `price`, `amount`, `lastEdit`, `createdAt`, `updatedAt`) VALUES
(1, 'Türk Hava Yolları', 'THY', 25.12, 1000, '2023-12-23 21:36:47', '2023-12-23 21:36:47', '2023-12-23 21:36:47'),
(2, 'Tüpraş', 'TPR', 34.13, 1000, '2023-12-23 21:37:13', '2023-12-23 21:37:13', '2023-12-23 21:37:13'),
(3, 'Bim Ananonim Şirketi', 'BIM', 50.32, 1000, '2023-12-23 21:37:22', '2023-12-23 21:37:22', '2023-12-23 21:37:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trades`
--

CREATE TABLE `trades` (
  `id` int(11) NOT NULL,
  `portfolioId` int(11) NOT NULL,
  `shareId` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `type` varchar(4) NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tablo döküm verisi `trades`
--

INSERT INTO `trades` (`id`, `portfolioId`, `shareId`, `amount`, `createdAt`, `type`, `updatedAt`) VALUES
(10, 1, 2, 50, '2023-12-23 22:11:57', 'BUY', '2023-12-23 22:11:57'),
(11, 1, 2, 100, '2023-12-23 22:12:43', 'BUY', '2023-12-23 22:12:43'),
(12, 1, 1, 100, '2023-12-23 22:12:55', 'BUY', '2023-12-23 22:12:55'),
(14, 1, 1, 5, '2023-12-23 22:25:12', 'SELL', '2023-12-23 22:25:12'),
(15, 1, 1, 5, '2023-12-23 22:25:33', 'SELL', '2023-12-23 22:25:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `identityNumber` varchar(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `identityNumber`, `createdAt`, `updatedAt`) VALUES
(1, 'halil', 'dursun', 'dursun@gmail.com', '12345678912', '2023-12-23 21:36:37', '2023-12-23 21:36:37');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Tablo için indeksler `portfolio_shares`
--
ALTER TABLE `portfolio_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolioId` (`portfolioId`),
  ADD KEY `shareId` (`shareId`);

--
-- Tablo için indeksler `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolioId` (`portfolioId`),
  ADD KEY `shareId` (`shareId`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `identityNumber` (`identityNumber`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `portfolio_shares`
--
ALTER TABLE `portfolio_shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `shares`
--
ALTER TABLE `shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `trades`
--
ALTER TABLE `trades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `portfolio_shares`
--
ALTER TABLE `portfolio_shares`
  ADD CONSTRAINT `portfolio_shares_ibfk_1` FOREIGN KEY (`portfolioId`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `portfolio_shares_ibfk_2` FOREIGN KEY (`shareId`) REFERENCES `shares` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `trades`
--
ALTER TABLE `trades`
  ADD CONSTRAINT `trades_ibfk_1` FOREIGN KEY (`portfolioId`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trades_ibfk_2` FOREIGN KEY (`shareId`) REFERENCES `shares` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

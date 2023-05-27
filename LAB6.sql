SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SELECT name, region
FROM cities
WHERE population > 350000;

SELECT cities.name, regions.name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(10) unsigned NOT NULL,
  `color` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `lines` (`id`, `color`) VALUES
(1, 'червона'),
(2, 'синя'),
(3, 'зелена');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `next` tinyint(3) unsigned DEFAULT NULL,
  `prev` tinyint(3) unsigned DEFAULT NULL,
  `line_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `stations` (`id`, `name`, `next`, `prev`, `line_id`) VALUES
(1, 'Історичний музей', 2, 0, 2),
(2, 'Університет', 3, 1, 2),
(3, 'Пушкінська', 4, 2, 2),
(4, 'Академіка Барабашова', 5, 3, 2),
(5, 'Метробудівників', 6, 4, 3),
(6, 'Захисників України', 7, 5, 3),
(7, 'Держпром', 8, 6, 3),
(8, 'Проспект Гагаріна', 9, 7, 1),
(9, 'Спортивна', 10, 8, 1);

DROP TABLE IF EXISTS `transition`;
CREATE TABLE `transition` (
  `station_from_id` tinyint(4) DEFAULT NULL,
  `station_to_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `transition` (`station_from_id`, `station_to_id`) VALUES
(7, 2),
(5, 9);
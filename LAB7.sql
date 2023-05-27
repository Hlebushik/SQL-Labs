SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO categories (name) VALUES
('Наука'),
('Економіка'),
('Спорт');

DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  content TEXT NOT NULL,
  category_id INT UNSIGNED NOT NULL
);

INSERT INTO news (title, content, category_id) VALUES
('Забруднення', 'Українські вчені розробили новий метод боротьби зі забрудненням водоймищ, що сприятиме поліпшенню екологічної ситуації в країні', 1),
('Зріст ВВП', 'Економічний розвиток України зазнав позитивних змін у другому кварталі 2023 року, зростання ВВП досягло 3,5%.', 2),
('Легка атлетика', 'Українські спортсмени здобули перемогу на міжнародних змаганнях з легкої атлетики, піднявши прапор країни на найвищу позицію.', 3);

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  news_id INT UNSIGNED NOT NULL,
  comment TEXT NOT NULL,
  ip_address VARCHAR(45) NOT NULL,
  rating TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (news_id) REFERENCES news(id)
);

INSERT INTO users (news_id, comment, ip_address, rating) VALUES
(1, 'Цікаво!', '192.168.0.1', 4),
(2, 'Згоден', '192.168.0.2', 5);
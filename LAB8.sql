SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT
);

INSERT INTO projects (name, description) VALUES
('Сапер', 'На стадії завершення'),
('Сайт', 'Додавання інтерфейсу');

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

INSERT INTO users (name, email) VALUES
('Данило', 'danylo@gmail.com'),
('Антон', 'anton@gmail.com'),
('Артем', 'artem@gmail.com');

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  project_id INT UNSIGNED NOT NULL,
  worker_id INT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (worker_id) REFERENCES users(id)
);

INSERT INTO tasks (project_id, worker_id, title, description) VALUES
(1, 1, 'Екран старту', 'Розробити екран старту програми'),
(1, 2, 'Бомби', 'Додати бомби у програму'),
(2, 1, 'Шрифти', 'Замінити шрифти на сайті');

DROP TABLE IF EXISTS task_members;

CREATE TABLE task_members (
  task_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO task_members (task_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 2);

DROP TABLE IF EXISTS files;

CREATE TABLE files (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  task_id INT UNSIGNED,
  project_id INT UNSIGNED,
  name VARCHAR(255) NOT NULL,
  url VARCHAR(255) NOT NULL,
  FOREIGN KEY (task_id) REFERENCES tasks(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

INSERT INTO files (task_id, project_id, name, url) VALUES
(1, 1, 'Сапер', 'https://minesweeper.com/file1.pdf'),
(2, 2, 'Сайт', 'https://site.com/file2.jpg');
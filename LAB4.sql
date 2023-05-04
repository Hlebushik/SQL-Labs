SELECT UPPER(name) AS upper_name
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

SELECT name, LENGTH(name) AS length_name
FROM cities
WHERE LENGTH (name) < 8 OR LENGTH (name) > 10;

SELECT SUM(population) AS sum
FROM cities
WHERE region = 'C' OR region = 'S';

SELECT SUM(population)/COUNT(population) AS average
FROM cities
WHERE region = 'W';

SELECT COUNT(name) AS amount
FROM cities
WHERE region = 'E';

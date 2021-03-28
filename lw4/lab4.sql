USE lw4;

INSERT INTO apartment(floor, size, number_of_inhabitants, apartment_number )
VALUES (1, 100, 4, 3),
	   (1, 20, 2, 6),
	   (2, 30, 3, 9),
       (2, 90, 19, 12),
       (3, 40, 11, 15),
       (3, 60, 4, 3),
	   (4, 70, 2, 6),
	   (4, 95, 3, 9),
       (5, 45, 19, 12),
       (5, 150, 11, 15);

INSERT INTO service(type, units, time_frame)
VALUES ('Горячая вода', 'кубометр', '2010-12-17 03:14:07'),
       ('Газ', 'кубометр', '2010-12-17 03:14:07'),
       ('Электричество', 'ватт', '2010-12-17 03:14:07');
       
INSERT INTO tariff(price, conditions, validity)
VALUES (100, 'потребление > 100кбм горячей воды', '2020-12-17'),
	   (50, 'потребление < 100кбм горячей воды', '2021-12-17'),
       (30, 'потребление > 100кбм холодной воды', '2008-12-17'),
       (150, 'потребление > 100ватт электричества', '2010-12-17'),
       (40, 'потребление < 100кбм электричества', '2015-12-17');       
       
/* 3.1 INSERT */

/* Без указания списка полей */
INSERT INTO service()
VALUES ('Холодная вода', 'кубометр', '2015-12-17 03:14:07');

/* с указания списка полей */
INSERT INTO service(type, units, time_frame)
VALUES ('Уборка лифта', '1 лифт', '2015-12-17 03:14:07');

/* С чтением значения из другой таблицы */
INSERT INTO tariff (conditions) SELECT units FROM service;


/* 3.2 DELETE */

/* Всех записей */
DELETE FROM tariff;

/* По условию */
DELETE FROM tariff WHERE price > 30;


/* 3.3 UPDATE */

/* Всех записей */
UPDATE service
SET type = "Газ", units = "кубометры", time_frame = '2015-12-18 03:14:10'

/* По условию обновляя один атрибут */
UPDATE service
SET type = "Уборка двора" WHERE type="Газ"

/* По условию обновляя несколько атрибут */
UPDATE service
SET type = "Вывоз мусора", units = "1 мусорный бак" WHERE type="Уборка двора"

/* 3.4 SELECT */

/* С набором извлекаемых атрибутов */
SELECT type, units FROM service

/* Совсеми атрибутами */
SELECT * FROM service

/* Совсеми атрибутами по условию */
SELECT * FROM service WHERE type='Газ'

/* 3.5 SELECT ORDER BY + TOP (LIMIT) */

/* C сортировкой по возрастанию ASC + ограничение вывода количества записей */
SELECT * FROM apartment ORDER BY floor ASC LIMIT 2;

/* C сортировкой по убыванию DESC */
SELECT * FROM apartment ORDER BY floor DESC;

/* C сортировкой по двум атрибутам + ограничение вывода количества записей */
SELECT * FROM apartment ORDER BY floor ASC, size ASC LIMIT 2;

/* С сортировкой по первому атрибуту, из списка извлекаемых */
SELECT * FROM apartment ORDER BY floor ASC, size ASC LIMIT 2;

/* 3.6 Работа с датами */

/* 3.6 Работа с датами */

/* WHERE по дате */
SELECT * FROM service WHERE DATE(time_frame)='2010-12-17';

/* WHERE по дате в диапозоне */
SELECT * FROM service WHERE DATE(time_frame) BETWEEN '2008-10-20' AND '2015-10-20'

/* извлечь год, используя YEAR */
SELECT YEAR(time_frame) FROM service WHERE DATE(time_frame) BETWEEN '2008-10-20' AND '2015-10-20'


/* Функции агрегации */

/* Узнать кол-во записей в таблице */
SELECT count(*) FROM apartment

/* Узнать кол-во уникальных записей в таблице */
SELECT COUNT(DISTINCT floor) FROM apartment

/* Вывести уникальные значения столбца */
SELECT DISTINCT floor FROM apartment;

/* Вывести максимальное значения столбца */
SELECT MAX(floor) FROM apartment;

/* Вывести минимальное значения столбца */
SELECT MIN(floor) FROM apartment;

/* group by + count */ 
select floor, count(floor) from apartment group by floor;


/* 3.8 SELECT GROUP BY + HAVING */
SELECT * FROM apartment GROUP BY floor HAVING size>=45;

SELECT * FROM apartment GROUP BY floor HAVING number_of_inhabitants>=2;

SELECT * FROM apartment GROUP BY floor HAVING apartment_number>=10;

/* 3.9 SELECT JOIN */

/* LEFT JOIN двух таблиц и WHERE по одному из атрибутов */
SELECT * FROM apartment LEFT JOIN tariff ON apartment.size = tariff.price WHERE apartment.size=100

/* RIGHT JOIN двух таблиц и WHERE по одному из атрибутов */
SELECT * FROM apartment RIGHT JOIN tariff ON apartment.size = tariff.price WHERE apartment.size=100

/* LEFT JOIN трех таблиц и WHERE по одному из каждой из таблиц */
SELECT apartment.floor, tariff.price, tariff.validity, service.time_frame FROM tariff LEFT JOIN apartment ON apartment.size = tariff.price LEFT JOIN service ON YEAR(tariff.validity) = YEAR(service.time_frame) WHERE apartment.floor<10 AND tariff.price>=1  AND YEAR(service.time_frame)='2015'

/* inner join */
SELECT * FROM apartment INNER JOIN tariff ON apartment.size = tariff.price

/* Подзапросы */

/* Написать запрос с условием WHERE IN (подзапрос) */
SELECT * FROM apartment WHERE size > (SELECT AVG(size) FROM apartment)

/* Написать запрос SELECT atr1, atr2, (подзапрос) FROM */
SELECT floor, size, MAX(number_of_inhabitants) FROM apartment

/* Написать запрос вида SELECT * FROM ( подзапрос ) */
SELECT * FROM (SELECT * FROM tariff) s

/* Написать запрос вида SELECT * FROM table JOIN (подзапрос) ON ... */
SELECT * FROM apartment LEFT JOIN (SELECT * FROM tariff) s ON apartment.size = s.price WHERE apartment.size=100






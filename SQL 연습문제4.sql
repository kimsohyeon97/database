#날짜 : 2025/01/16
#이름 : 김소현
#내용 : SQL 연습문제4

#실습4-1
CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `Theater`.* TO 'theater'@'%';
FLUSH PRIVILEGES;

use Theater;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30),
    genre VARCHAR(10),
    release_date DATE
);

CREATE TABLE Customers (
    `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20),
    `email` VARCHAR(50),
    `phone` CHAR(13)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    num_tickets INT,
    booking_date DATETIME
);

# 4-3. 위에서 생성한 테이블에 다음 데이터를 삽입하세요
INSERT INTO Movies (title, genre, release_date) VALUES 
('쇼생크의 탈출', '드라마', '1994-10-14'),
('타이타닉',     '로맨스', '1997-03-24'),
('탑건',        '액션', '1987-07-16'),
('쥬라기공원',    '액션', '1994-02-11'),
('글래디에이터',   '액션', '2000-05-03'),
('시네마천국',    '드라마', '1995-04-12'),
('미션임파서블',  '액션', '1995-11-11'),
('노트북',      '로맨스', '2003-08-23'),
('인터스텔라',   'SF', '2011-05-26'),
('아바타',      'SF', '2010-02-10');

INSERT INTO Customers (name, email, phone) VALUES 
('김유신', 'kys@example.com', '010-1234-1001'),
('김춘추', 'kcc@example.com', '010-1234-1002'),
('장보고', 'jbg@example.com', '010-1234-1003'),
('강감찬', 'kgc@example.com', '010-1234-1004'),
('이순신', 'lss@example.com', '010-1234-1005');

INSERT INTO Bookings (booking_id, customer_id, movie_id, num_tickets, booking_date) VALUES 
(101, 1,  1, 2, '2023-01-10'),
(102, 2,  2, 3, '2023-01-11'),
(103, 3,  2, 2, '2023-01-13'),
(104, 4,  3, 1, '2023-01-17'),
(105, 5,  5, 2, '2023-01-21'),
(106, 3,  8, 2, '2023-01-21'),
(107, 1, 10, 4, '2023-01-21'),
(108, 2,  9, 1, '2023-01-22'),
(109, 5,  7, 2, '2023-01-23'),
(110, 3,  4, 2, '2023-01-23'),
(111, 1,  6, 1, '2023-01-24'),
(112, 3,  5, 3, '2023-01-25');

#실습4-4
SELECT title FROM  Movies;

#실습4-5
SELECT * FROM Movies where `genre`='로맨스';

#실습4-6
SELECT 
title, 
release_date 
FROM Movies WHERE `release_date` > '2010-01-01';

#실습4-7
 SELECT 
	booking_id, booking_date
 FROM Bookings WHERE `num_tickets` >= 3;


#실습4-8
SELECT * FROM Bookings WHERE `booking_date` < '2023-01-20';


#실습4-9
SELECT * FROM Movies 
 WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31';

#실습4-10
SELECT * FROM Bookings 
ORDER BY booking_date DESC
LIMIT 3;


#실습4-11
SELECT 
	title, release_date 
FROM Movies 
ORDER BY release_date ASC
LIMIT 1;

#실습4-12
SELECT 
	CONCAT(title, ' - ', release_date) AS movie_info
 FROM Movies
 WHERE `genre`='액션' and `title` like '%공원%'
 ORDER BY release_date ASC
 LIMIT 1;

#실습4-13
SELECT booking_date, title
 FROM Bookings
 JOIN Movies
 ON Bookings.movie_id = Movies.movie_id
 WHERE customer_id = 2;

SELECT booking_date, title
 FROM Bookings
 JOIN Movies
 USING (`movie_id`)
 WHERE customer_id = 2;

#실습4-14
SELECT 
	C.name,
	C.phone,
	B.booking_date, 
	M.title
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;


#실습4-15
SELECT 
	M.genre, 
	AVG(B.num_tickets) AS avg_tickets
 FROM bookings B
 JOIN Movies M ON B.movie_id = M.movie_id
 GROUP BY `genre`;


#실습4-16
 SELECT 
	C.name, 	
	AVG(B.num_tickets) AS avg_tickets
 FROM Bookings B
 JOIN Customers C ON B.customer_id = C.customer_id
 GROUP BY C.`customer_id`;

#실습4-17
SELECT 
	C.name, 
	SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.`customer_id`
ORDER BY `전체 예매 티켓 수` DESC;

#실습4-18
SELECT 
	B.booking_id, B.movie_id, C.name, B.booking_date
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY B.booking_date ASC
LIMIT 1;


#실습4-19
SELECT 
	genre, title, release_date
FROM Movies
WHERE (genre, release_date) 
IN (SELECT genre, MAX(release_date) FROM Movies GROUP BY `genre`);


SELECT genre, MAX(release_date) FROM Movies GROUP BY `genre`;

#실습4-20
SELECT * FROM Movies
WHERE movie_id 
IN (
 SELECT movie_id FROM Bookings 
	WHERE customer_id = 
		(SELECT customer_id FROM Customers where `name`='김유신'));


#실습4-21
SELECT 
	name, email 
FROM Customers 
WHERE customer_id = (
 SELECT customer_id 
	FROM Bookings 
	GROUP BY customer_id 
	ORDER BY SUM(num_tickets) DESC
	LIMIT 1);

#실습4-22
SELECT * FROM bookings
 WHERE num_tickets > (SELECT AVG(`num_tickets`) FROM Bookings);

#실습4-23
SELECT 
	M.title, SUM(B.num_tickets) AS total_tickets
 FROM Bookings B
 JOIN Movies M ON B.movie_id = M.movie_id
 GROUP BY M.`movie_id`;

#실습4-24
SELECT 
	c.name, 
	SUM(b.num_tickets) AS total_tickets, 
	AVG(b.num_tickets) AS avg_tickets
 FROM Bookings b
 JOIN Customers c ON b.customer_id = c.customer_id
 GROUP BY c.`customer_id`;
 
#실습4-25
SELECT 
	c.customer_id,
	c.name, 
	c.email, 
	SUM(b.num_tickets) AS `예매 티켓수`
 FROM Bookings b
 JOIN Customers c ON b.customer_id = c.customer_id
 GROUP BY c.`customer_id`
 ORDER BY `예매 티켓수` DESC;

#실습4-26
SELECT 
	c.name,
	m.title,
	b.num_tickets,
	b.booking_date	
FROM bookings b
 JOIN customers c ON b.customer_id = c.customer_id
 JOIN movies m ON b.movie_id = m.movie_id
 ORDER BY num_tickets DESC;


#실습4-27
SELECT
 M.title,
 M.genre,
 SUM(B.num_tickets) AS `예매 티켓 수`,
 AVG(B.num_tickets) AS `평균 티켓 수`
 FROM bookings B
 JOIN Movies M ON B.movie_id = M.movie_id
 WHERE M.genre = '액션'
 GROUP BY M.`movie_id`
 ORDER BY `평균 티켓 수` DESC;

#실습4-28
SELECT 
	B.customer_id,
	C.name,
	SUM(`num_tickets`) AS `ticket_total`
 FROM bookings B
 JOIN Customers C ON B.customer_id = C.customer_id
 GROUP BY C.customer_id
 ORDER BY ticket_total DESC;


#실습4-29
SELECT 
	B.booking_id,
	B.customer_id,
	B.movie_id,
	MaxTickets.max_tickets
 FROM Bookings B
 JOIN (
	SELECT movie_id, MAX(num_tickets) AS max_tickets
	FROM Bookings
    GROUP BY movie_id
 ) AS MaxTickets
 ON B.movie_id = MaxTickets.movie_id AND 
	B.num_tickets = MaxTickets.max_tickets;
    
SELECT movie_id, MAX(num_tickets) AS max_tickets
	FROM Bookings
    GROUP BY movie_id;

#실습4-30
SELECT @@sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT
 B.booking_id,
 B.customer_id,
 C.name,
 M.title,
 M.genre,
 SUM(B.num_tickets) AS `예매 티켓 수`
 FROM bookings B
 JOIN movies M ON B.movie_id = M.movie_id
 JOIN customers C ON B.customer_id = C.customer_id
 GROUP BY M.title
 Having `예매 티켓 수` = (
 SELECT MAX(total_tickets)
 FROM (
	 SELECT SUM(B2.num_tickets) AS total_tickets
	 FROM Bookings B2
	 JOIN Movies M2 ON B2.movie_id = M2.movie_id
	 WHERE M2.genre = M.genre
	 GROUP BY M2.title
	 ) AS SelectMAX
 )
 ORDER BY `예매 티켓 수` DESC;
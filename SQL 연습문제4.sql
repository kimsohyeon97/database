#실습 4-1
create database `Theater`;
create User 'theater'@'%' identified by '1234';
grant all privileges on Theater.* to 'theater'@'%';
flush privileges;

#실습 4-2
create table `Movies`(
`movie_id` int not null auto_increment primary key,
`title` varchar(30) not null,
`genre` varchar(10) not null,
`release_date` date not null
);

drop table `Customers`;
create table `Customers` (
`customer_id` int not null auto_increment primary key,
`name` varchar(20) not null,
`email` varchar(50) not null,
`phone` char(13) not null
);

create table `Bookings` (
`booking_id` int not null primary key,
`customer_id` int not null,
`movie_id` int not null,
`num_tickets` int not null,
`booking_date` datetime not null
);

#실습 4-3
insert into `Movies` (`title`, `genre`, `release_date`) values
	('쇼생크의 탈출','드라마','1994-10-14'),
    ('타이타닉','로맨스','1997-03-24'),
    ('탑건','액션','1987-07-16'),
    ('쥬라기공원','액션','1994-02-11'),
    ('글래디에이터','액션','2000-05-03'),
    ('시네마천국','드라마','1995-04-12'),
    ('미션임파서블','액션','1995-11-11'),
    ('노트북','로맨스','2003-08-23'),
    ('인터스텔라','SF','2011-05-26'),
    ('아바타','SF','2010-02-10');

insert into `Customers` (`name`,`email`,`phone`) values
	('김유신','kys@example.com','010-1234-1001'),
    ('김춘추','kcc@example.com','010-1234-1002'),
    ('장보고','jbg@example.com','010-1234-1003'),
    ('강감찬','kgc@example.com','010-1234-1004'),
    ('이순신','lss@example.com','010-1234-1005');
    
insert into `Bookings` (`booking_id`, `customer_id`, `movie_id`, `num_tickets`, `booking_date`) values
	(101,1,1,2,'2023-01-10 00:00:00'),
    (102,2,2,3,'2023-01-11 00:00:00'),
    (103,3,2,2,'2023-01-13 00:00:00'),
    (104,4,3,1,'2023-01-17 00:00:00'),
    (105,5,5,2,'2023-01-21 00:00:00'),
    (106,3,8,2,'2023-01-21 00:00:00'),
    (107,1,10,4,'2023-01-21 00:00:00'),
    (108,2,9,1,'2023-01-22 00:00:00'),
    (109,5,7,2,'2023-01-23 00:00:00'),
    (110,3,4,2,'2023-01-23 00:00:00'),
    (111,1,6,1,'2023-01-24 00:00:00'),
    (112,3,5,3,'2023-01-25 00:00:00');

#실습 4-4
select `title` from `Movies`;

#실습 4-5
select * from Movies where `genre`='로맨스';

#실습 4-6
select `title`, `release_date` from `Movies` where `release_date` > '2010-01-01';

#실습 4-7
select `booking_id`, `booking_date` from Bookings where `num_tickets`>=3;

#실습 4-8
select * from `Bookings` where `booking_date` < '2023-01-20';

#실습 4-9
select * from `Movies` where release_date between '1990-01-01' and '1999-12-31';

#실습 4-10
select * from Bookings order by booking_date desc limit 3;

#실습 4-11
select title, release_date from Movies order by release_date asc limit 1;

#실습 4-12
select concat(title, '-', release_date) as movie_info
from Movies 
where title like '%공원%'
order by release_date asc
limit 1;

#실습 4-13
select booking_date, title
from Bookings
join Movies on Bookings.movie_id=Movies.movie_id
where customer_id=2;

#실습 4-14
select c.name, c.phone, B.booking_date, M.title
from bookings B
join Customers C on B.customer_id=C.customer_id
join Movies M on B.movie_id=M.movie_id;

#실습 4-15
select M.genre, AVG(B.num_tickets) as avg_tickets
from bookings B
join Movies M on B.movie_id=M.movie_id
group by genre;

#실습 4-16
select C.name, avg(b.num_tickets) as avg_tickets 
from bookings B
join Customers C on B.customer_id=C.customer_id
group by `name`;

#실습 4-17
select C.name, sum(B.num_tickets) as '전체 예매 티켓 수'
from bookings B
join Customers C on B.customer_id = C.customer_id
group by B.name
order by 전체 예매 티켓 수 desc;

#실습 4-18
SELECT
B.booking_id,
B.movie_id,
C.name,
B.booking_date
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY B.booking_date asc
limit 1;

#실습 4-19
SELECT
genre, title, release_date
FROM Movies
WHERE (genre, release_date) IN (
SELECT genre, MAX(release_date)
FROM Movies
group by genre
);

#실습 4-20
SELECT * FROM Movies
WHERE movie_id IN (
SELECT movie_id FROM Bookings
WHERE customer_id = (SELECT customer_id FROM Customers where name = '김유신' )
);

#실습 4-21
SELECT name, email FROM Customers
WHERE customer_id = (
SELECT customer_id
FROM Bookings
GROUP BY customer_id
ORDER by sum(num_tickets) desc
limit 1
);

#실습 4-22
SELECT * FROM bookings
WHERE num_tickets > (SELECT avg(num_tickets) FROM Bookings);

#실습 4-23
SELECT
M.title, SUM(B.num_tickets) AS total_tickets
FROM Bookings B
JOIN Movies M ON B.movie_id = M.movie_id
group by M.title;

#실습 4-24
SELECT
c.name,
SUM(b.num_tickets) AS total_tickets,
AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
group by c.`customer_id`;

#실습 4-25
SELECT
c.name,
SUM(b.num_tickets) AS total_tickets,
AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
group by c.`customer_id`
order by `예매 티켓수` desc;

#실습 4-26
SELECT
C.name,
M.title,
B.num_tickets,
B.booking_date
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN movies m ON b.movie_id = m.movie_id
order by num_tickets desc;

#실습 4-27
SELECT
B.customer_id,
C.name,
SUM(B.num_tickets) AS `예매 티켓 수`,
avg(B.num_tickets) as `평균 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY ticket_total DESC;

#실습 4-28
SELECT
B.customer_id,
C.name,
SUM(B.num_tickets) AS `예매 티켓 수`,
avg(B.num_tickets) as `평균 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
group by C.customer_id
ORDER BY ticket_total DESC;

#실습 4-29
SELECT
	B.booking_id,
	B.customer_id,
	B.movie_id,
	MaxTickets.max_tickets
FROM Bookings B
JOIN (
	SELECT movie_id, MAX(num_tickets) AS max_tickets
	FROM Bookings
    group by movie_id
) AS MaxTickets
ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습 4-30
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
Having	`예매 티켓 수` = (
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

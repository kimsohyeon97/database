#날짜 : 2025/01/17
#이름 : 김소현
#내용 : SQL 연습문제5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;

use bookstore;

#실습5-2
CREATE TABLE `Customer`(
	`custId`		INT AUTO_INCREMENT PRIMARY KEY,
	`name` 		VARCHAR(10) NOT NULL,
	`address` 	VARCHAR(20),
	`phone` 		CHAR(13)
);

CREATE TABLE `Book` (
	`bookId`    INT NOT NULL PRIMARY KEY,
	`bookName`  VARCHAR(20) NOT NULL,
	`publisher` VARCHAR(20) NOT NULL,
	`price`     INT
);

CREATE TABLE `Order`(
	`orderId` 	INT PRIMARY KEY AUTO_INCREMENT,
	`custId`		INT NOT NULL,
	`bookId` 	INT NOT NULL,
	`salePrice` INT NOT NULL,
	`orderDate` DATE NOT NULL
);

#실습5-3
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타',   '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 1,6000,'2014-07-01');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 3,21000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2, 5,8000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 6,6000,'2014-07-04');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 7,20000,'2014-07-05');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 2,12000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 8,13000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 8,13000,'2014-07-10');

#실습5-4
SELECT `custId`, `name`, `address` FROM `Customer`;

#실습5-5
SELECT `bookName`, `price` FROM `Book`;

#실습5-6
SELECT `price`, `bookName` FROM `Book`;

#실습5-7
SELECT * FROM `Book`;

#실습5-8
SELECT `publisher` FROM `Book`;

#실습5-9
SELECT distinct `publisher` FROM `Book`;

SELECT `publisher` FROM `Book` group by `publisher`;


#실습5-10
SELECT * FROM `Book` WHERE `price` >= 20000;

#실습5-11
SELECT * FROM `Book` WHERE `price` < 20000;

#실습5-12
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;

SELECT * FROM `Book` WHERE `price` between 10000 and 20000;


#실습 5-13
SELECT 
	`bookId`, 
    `bookName`,
    `price` 
FROM `Book` 
WHERE `price` >= 15000 AND `price` <= 30000;

#실습5-14
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;
SELECT * FROM `Book` WHERE `bookId` IN (2, 3, 5);


#실습 5-15
SELECT * FROM `Book` WHERE `bookId` % 2 = 0;
SELECT * FROM `Book` WHERE MOD(`bookId`, 2) = 0;

#실습 5-16
SELECT * FROM `Customer` WHERE `name` LIKE '박%';

#실습5-17
SELECT * FROM `Customer` WHERE `address` LIKE '대한민국%';

#실습5-18
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;

#실습 5-19
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR `publisher`='대한미디어';
SELECT * FROM `Book` WHERE `publisher` IN ('굿스포츠', '대한미디어');

#실습 5-20
SELECT `publisher` FROM `Book` WHERE `bookName`='축구의 역사';

#실습5-21
SELECT `publisher` FROM `Book` WHERE `bookName` LIKE '%축구%';

#실습 5-22
SELECT * FROM `Book` WHERE `bookName` LIKE '_구%';

#실습 5-23
SELECT * FROM `Book` WHERE `bookName` LIKE '%축구%' and `price` >= 20000;

#실습 5-24
SELECT * FROM `Book` order BY `bookName`;

#실습 5-25
SELECT * FROM `Book` order BY `price`, `bookName`;

#실습 5-26
SELECT * FROM `Book` order BY `price` DESC, `publisher` ASC;

#실습 5-27
SELECT * FROM `Book` order BY `price` desc limit 3;

#실습 5-28
SELECT * FROM `Book` order BY `price` ASC limit 3;

#실습 5-29
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;

#실습5-30
SELECT 
	SUM(`salePrice`) AS `총판매액`,
	AVG(`salePrice`) AS `평균값`,
	MIN(`salePrice`) AS `최저가`,
	MAX(`salePrice`) AS `최고가`
FROM `Order`;

#실습5-31
select COUNT(*) as `판매건수` from `Order`;

#실습5-32
select 
	`bookId`,
    REPLACE(`bookName`, '야구', '농구') as `bookName`,
    `publisher`,
    `price`
from `Book`;


#실습5-33
select
    `custId`,
    COUNT(*) as `수량`
from `Order` 
where `salePrice` >= 8000
group by `custId`
having `수량` >= 2;

#실습5-34
SELECT 
	* 
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId;

SELECT 
	* 
FROM `Customer`
JOIN `Order` USING (custId);

select * from `Customer` a, `Order` b where a.custId = b.custId;

#실습5-35
SELECT 
	* 
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
order by a.`custId`;


#실습5-36
SELECT 
	`name`,
    `salePrice`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
order by a.`custId`;


#실습5-37
SELECT 
	`name`,
    SUM(`salePrice`) 
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
GROUP BY a.`custId`
order by `name`;



#실습5-38
SELECT 
	`name`,
    `bookName`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
JOIN `Book` as c on b.bookId = c.bookId;



#실습5-39
SELECT 
	`name`,
    `bookName`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
JOIN `Book` as c on b.bookId = c.bookId
where `salePrice` = 20000;

#실습5-40
SELECT 
	`name`,
    `salePrice`
FROM `Customer` AS a 
LEFT JOIN `Order` AS b  ON a.custId = b.custId;


#실습5-41
SELECT 
	SUM(`salePrice`) as `총매출`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
where `name` = '김연아';

#실습5-42
select `bookName` from `Book` order by `price` desc limit 1;
select `bookName` from `Book` where `price`=(select MAX(`price`) from `Book`);

#실습5-43
select 
	`name`
from `Customer` as a
left join `Order` as b on a.custId = b.custId
where `orderId` is null;

#실습5-44
insert into `Book` SET 
					`bookId`=11,
					`bookName`='스프츠의학',
                    `publisher`='한솔의학서적',
                    `price`=NULL;

#실습5-45
update `Customer` set `address`='대한민국 부산' where `custId`=5;
select * from `Customer`;


#실습5-46
delete from `Customer` where `custId`=5;






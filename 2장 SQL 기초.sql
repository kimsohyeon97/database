#날짜 : 2025/01/06
#이름 : 김소현
#내용 : 2장 SQL 기초

#실습 2-1
use StudyDB;
CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
);user1user1

DROP TABLE `User1`;

#실습 2-2
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-2222', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-3333', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET `uid`='A105', `name`='이순신', `hp`='010-1234-5555';

#실습 2-3
SELECT * FROM `User1`;
SELECT * FROM `User1` WHERE `uid`='A101';
SELECT * FROM `User1` WHERE `name`='김춘추';
SELECT * FROM `User1` WHERE `age` < 30;
SELECT * FROM `User1` WHERE `age` >= 30;
SELECT `uid`, `name`, `age` FROM `User1`;

#실습 2-4
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';
UPDATE `User1` SET `hp`='010-1234-1001', `age`=27 WHERE `uid`='A101';

#실습 2-5
DELETE FROM `User1` WHERE `uid`='A101';
DELETE FROM `User1` WHERE `uid`='A102' AND `age`=25;
DELETE FROM `User1` WHERE `age` >= 30;

#실습 2-6
alter table `User1` add `gender` TINYINT;
alter table `User1` add `birth` char(10) after `name`;
alter table `User1` modify `gender` char(1);
alter table `User1` modify `age` tinyint;
alter table `User1` drop `gender`;

#실습 2-7
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1Copy` SELECT * FROM `User1`;

#실습 2-8
create table `TblUser` (
	`user_id`	VARCHAR(10),
	`user_name`	VARCHAR(10),
	`user_hp`	CHAR(13),
	`user_age`	TINYINT,
	`user_addr`	VARCHAR(100)
);

INSERT INTO `TblUser` VALUES ('p101', '김유신', '010-1234-1001', 25, '경남 김해시');
INSERT INTO `TblUser` VALUES ('p102', '김춘추', '010-1234-1002', 23, '경남 경주시');
INSERT INTO `TblUser` VALUES ('p103', '장보고',  NULL, 31, '전남 완도군');
INSERT INTO `TblUser` (`user_id`, `user_name`, `user_addr`) 
						VALUES ('p104', '강감찬', '서울시 중구');

INSERT INTO `TblUser` SET 
						`user_id`='p105', 
						`user_name`='이순신', 
						`user_hp`='010-1234-1005', 
						`user_age`=25;

create table `TblProduct` (
	`prod_no`		INT,
	`prod_name`		VARCHAR(10),
	`prod_price`	INT,
	`prod_stock`	INT,
	`prod_company`	VARCHAR(10),
	`prod_date`		DATE
);


INSERT INTO `TblProduct` VALUES (1001, '냉장고',  800000,  25, 'LG전자', '2022-01-06');
INSERT INTO `TblProduct` VALUES (1002, '노트북', 1200000, 120, '삼성전자', '2022-01-07');
INSERT INTO `TblProduct` VALUES (1003, '모니터',  350000,  35, 'LG전자', '2023-01-13');
INSERT INTO `TblProduct` VALUES (1004, '세탁기', 1000000,  80, '삼성전자', '2021-01-01');
INSERT INTO `TblProduct` VALUES (1005, '컴퓨터', 1500000,  20, '삼성전자', '2023-10-01');
INSERT INTO `TblProduct` VALUES (1006, '휴대폰',  950000, 102, NULL, NULL);


#실습 2-9


#날짜 : 2025/01/06
#이름 : 김소현
#내용 : 2장 SQL 기초

use StudyDB;
#실습 2-4
UPDATE `User1` SET `hp`='010-1234-4444' WHERE `uid`='A104';
UPDATE `User1` SET `age`=51 WHERE `uid`='A105';

#실습 2-6
ALTER TABLE `User1` add `gender` tinyint;
ALTER TABLE `User1` ADD `birth` CHAR(10) AFTER `name`;
ALTER TABLE `User1` MODIFY `gender` CHAR(1);
ALTER TABLE `User1` MODIFY `age` TINYINT;
ALTER TABLE `User1` DROP `gender`;

#실습 2-7
CREATE TABLE `User1Copy` LIKE `User1`;
INSERT INTO `User1copy` SELECT * FROM `User1`;

#실습 2-7
create table `Tb1User`;
create table Tb1User;
CREATE TABLE Tb1User;
create table Tb1User;
CREATE TABLE `Tb1User` (
`user_id` VARCHAR(10),
`user_name` VARCHAR(10),
`user_help` CHAR(15),
`user_age` INT,
`user-addr` VARCHAR(20)
);
INSERT INTO `Tb1User` VALUES ('p101', '김유신', '010-1234-1001', 25,'경남 김해시');
INSERT INTO `Tb1User` VALUES ('p102', '김춘추', '010-1234-1002', 23,'경남 경주시');
INSERT INTO `Tb1User` (`user_id`, `user_name`, `user_age`,`user-addr`) VALUES ('p103', '장보고', 31,'전남 완도군');
INSERT INTO `Tb1User` SET `user_id`='p104', `user_name`='강감찬', `user-addr`='서울시 중구';

update `Tb1User` set `user_age`=30 where `user_id`='p105';

create table `Tb1Product` (
`prod_no` int,
`prod_name` varchar(10),
`prod_price` int,
`prod_stock` int,
`prod_company` varchar(20),
`prod_date` date
);
INSERT INTO `Tb1Product` VALUES (101, '냉장고', 800000, 25,'LG전자','2022-01-06');
insert into `Tb1Product` values (102, '노트북', 1200000, 120,'삼성전자','2002-01-07');
insert into `Tb1Product` values (103,'모니터', 350000, 35, 'LG전자', '2023-01-07');
insert into `Tb1Product` values (104,'세탁기',1000000,80,'삼성전자','2021-01-01');
insert into `Tb1Product` values(1005,'컴퓨터',1500000,20,'삼성전자','2023-10-01');
insert into `Tb1Product` values(1006,'휴대폰',950000,102,'ㅇㅇㅇ','2001-05-16');
update `Tb1Product` set `prod_no`=101 where `prod_no`=1001;
update `Tb1Product` set `prod_no`=1002 where `prod_no`=102;
update `Tb1Product` set `prod_no`=1003 where `prod_no`=103;
update `Tb1Product` set `prod_no`=104 where `prod_no`=1004;
update `Tb1Product` set `prod_no`=102 where `prod_no`=1002;
update `Tb1Product` set `prod_company`=NULL, `prod_date`=NULL where `prod_no`=1006;



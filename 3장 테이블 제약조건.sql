#날짜 : 2025/01/07
#이름 : 김소현
#내용 : 3장 테이블 제약조건

use studydb;

CREATE TABLE `User2` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`hp` CHAR(10),
`addr` VARCHAR(50)
);


insert into `User2` values ('A101','김유신','1990-02-03','김해');
insert into `User2` values ('A102','김춘추','1990-02-03','경주');
insert into `User2` values ('A103','장보고','1990-02-03','완도');
select * from `User2`;


#실습 3-3
drop table `user3`;
CREATE TABLE `User3` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`hp` CHAR(13) UNIQUE,
`addr` VARCHAR(50)
);

insert into `user3` values ('A101','김유신','1990-01-01','010-1001-1001','김해');
insert into `user3` values ('A102','김춘추','1990-01-01','010-1001-1002','경주');
insert into `user3` values ('A103','장보고','1990-01-01','010-1001-1003','완도');
insert into `user3` values ('A104','장보고','1990-01-01',null,'서울');
insert into `user3` values ('A105','이순신','1990-01-01',null,'부산');
select* from `User3`;


#실습 3-4

create table `Parent` (
`pid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`birth` CHAR(10),
`addr` VARCHAR(100)
);

CREATE TABLE `Child` (
`cid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10),
`hp` CHAR(13) UNIQUE,
`parent` VARCHAR(10),
FOREIGN KEY(`Parent`) references `Parent` (`pid`)
);         


#실습 3-6

insert into `Parent` values('P101', '김유신','1968-05-09','경남김해시');
insert into `Parent` values('P102', '김춘추','1972-11-23','경남 경주시');
insert into `Parent` values('P103', '장보고','1978-03-01','전남 완도시');
insert into `Parent` values('P104', '강감찬','1979-08-16','서울시 관악구');
insert into `Parent` values('P105', '이순신','1981-05-23','부산시 진구');

insert into `Child` values('C101','김철수','010-1234-1001','P101');
insert into `Child` values('C102','김영희','010-1234-1002','P101');
insert into `Child` values('C103','김철수','010-1234-1003','P103');
insert into `Child` values('C104','이철수','010-1234-1004','P105');
insert into `Child` values('C105','정약용','010-1234-1005','P109');

#실습 3-7
CREATE TABLE `User4` (
`uid` VARCHAR(10) PRIMARY KEY,
`name` VARCHAR(10) NOT NULL,
`gender` CHAR(10),
`age` INT DEFAULT 1,
`hp` CHAR(13) UNIQUE,
`addr` VARCHAR(20)
);

#실습 3-8
insert into `User4` values ('A101','김유신','M',21,'010-1234-1001','김해');
insert into `User4` values ('A102','김춘추','M',20,'010-1234-1002','경주');
insert into `User4` values ('A103','장보고','M',31,'010-1234-1003','완도');
insert into `User4` set 
						`uid` ='A104',
                        `name`='신사임당',
                        `gender`='F',
                        `addr`='강릉';
select * from `User4`;

#실습 3-9
drop table `User5`;
create table `User5`(
`seq` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(10) not null,
`gender` CHAR(1) check ('gender' IN('F','M')),
`age` INT DEFAULT 1 CHECK (`age`>0 AND `age`<100),
`addr` VARCHAR(20)
);

# 실습 3-10
insert into `User5` (`name`,`gender`,`age`,`addr`) values ('김유신','M',25,'김해');
insert into `User5` (`name`,`gender`,`age`,`addr`) values ('김춘추','M',24,'경주');
insert into `User5` (`name`,`gender`,`age`,`addr`) values ('장보고','M',35,'완도');
insert into `User5` (`name`,`gender`,`age`,`addr`) values ('허난설헌','F',-1,'광주');
select * from`User5`;









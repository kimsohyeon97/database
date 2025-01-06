#날짜 : 2025/01/06
#이름 : 김소현
#내용 : 1장 데이터베이트 설치와 생성

#실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `StudyDB`;

#실습 1-2
CREATE User 'sohyoun26'@'%' identified by '1234';
GRANT ALL privileges on StduyDB.* to 'sohyoun26'@'%';
flush privileges;

#실습 1-3
alter user 'sohyoun26'@'%' identified by 'abc1234';
drop user 'sohyoun26'@'%';
flush privileges;

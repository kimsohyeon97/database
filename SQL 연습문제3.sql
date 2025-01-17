use college;

#실습 3-2
create table `Student` (
`stdNo` char(8) not null primary key,
`stdName` varchar(20) not null,
`stdHp` char(13) not null unique,
`stdYear` int not null,
`stdAddress` varchar(100) default null
);

create table `Lecture` (
`lecNO` int not null primary key,
`lecName` varchar(20) not null,
`lecCredit` int not null,
`lecTime` int not null,
`lecClass` varchar(10) default null
);

create table `Register`(
`regStdNo` char(8) not null,
`regLecNo` int not null,
`regMidScore` int default null,
`regFinalScore` int default null,
`regTotalScore`int default null,
`regGrade` char(1) default null
);

#실습 3-3
INSERT INTO Student (stdNo, stdName, stdHp, stdYear, stdAddress) VALUES
('20201016', '김유신', '010-1234-1001', 3, NULL),
('20201126', '김춘추', '010-1234-1002', 3, '경상남도 경주시'),
('20210516', '장보고', '010-1234-1003', 2, '전라남도 완도시'),
('20210326', '강감찬', '010-1234-1004', 2, '서울시 영등포구'),
('20220416', '이순신', '010-1234-1005', 1, '부산시 부산진구'),
('20220521', '송상현', '010-1234-1006', 1, '부산시 동래구');

INSERT INTO Lecture (lecNo, lecName, lecCredit, lecTime, lecClass) VALUES
(159, '인지과학심리학', 3, 40, '본304'),
(167, '운영체제론', 3, 25, '본B05'),
(234, '중급 영문법', 3, 20, '본201'),
(239, '세법개론', 3, 40, '본204'),
(248, '빅데이터 개론', 3, 20, '본B01'),
(253, '컴퓨팅사고와 코딩', 2, 10, '본B02'),
(349, '사회복지 마케팅', 2, 50, '본B01');

INSERT INTO Register (regStdNo, regLecNo) VALUES
('20201126', 234),
('20201016', 248),
('20201016', 253),
('20201126', 239),
('20210516', 349),
('20210326', 349),
('20201016', 167),
('20220416', 349);

#실습 3-4
select * from `Lecture`;

#실습 3-5
select * from `Student`;

#실습 3-6
select * from `Register`;

#실습 3-7
select * from `Student` where `stdYear`= 3;

#실습 3-8
select * from `Lecture` where `lecCredit`=2;

#실습 3-9
update `Register`
set `regMidScore` = 36, `regFinalScore`= 42
WHERE `regStdNo`='20201126' AND `regLecNo`=234;

update `Register`
set `regMidScore` = 24, `regFinalScore`= 62 
WHERE `regStdNo`='20201016' AND `regLecNo`=248;

update `Register`
set `regMidScore` = 28, `regFinalScore`= 40 
WHERE `regStdNo`='20201016' AND `regLecNo`=253;

update `Register`
set `regMidScore` = 37, `regFinalScore`= 57 
WHERE `regStdNo`='20201126' AND `regLecNo`=239;

update `Register`
set `regMidScore` = 28, `regFinalScore`= 68 
WHERE `regStdNo`='20210516' AND `regLecNo`=349;

update `Register`
set `regMidScore` = 16, `regFinalScore`= 65 
WHERE `regStdNo`='20210326' AND `regLecNo`=349;

update `Register`
set `regMidScore` = 18, `regFinalScore`= 38 
where `regStdNo`='20201016' AND `regLecNo`=167;

update `Register`
set `regMidScore` = 25, `regFinalScore`= 58 
WHERE `regStdNo`='20220416' AND `regLecNo`=349;

SELECT * FROM `Register`;

#실습 3-10
update `Register`
set `regTotalScore`= `regMidScore` + `regFinalScore`,
`regGrade` = if(`regTotalScore` >= 90, 'A',
			if(`regTotalScore` >= 80, 'B',
			if(`regTotalScore` >= 70, 'C',
			if(`regTotalScore` >= 60, 'D', 'F'))));

SELECT * FROM `Register`;

#실습 3-11
select * from `Register` order by `regTotalScore` desc;

#실습 3-12
select * from `Register` where `regLecNo`=349 order by `regTotalScore` desc;

#실습 3-13
select * from `Lecture` where `lecTime`>=30;

#실습 3-14
select `lecName`, `lecClass` from `Lecture`;

#실습 3-15
select `stdNo`, `stdName` from `Student`;

#실습 3-16
select * from `Student` where `stdAddress` is null;

#실습 3-17
select * from `Student` where `stdAddress` like '부산시%';

#실습 3-18
select * from `Student` as a left join `Register` as b on a.stdNo=b.regStdNo;

#실습 3-19
SELECT a.stdNo, 
       a.stdName, 
       b.regLecNo, 
       b.regMidScore, 
       b.regFinalScore, 
       b.regTotalScore, 
       b.regGrade
FROM Student AS a
JOIN Register AS b 
where a.stdNo = b.regStdNo;

#실습 3-20
SELECT `stdName`, `stdNo`, `regLecNo`
FROM `Student` AS a
JOIN `Register` AS b
on a.stdNo=b.regStdNo
where b.regLecNo = 349;

#실습 3-21
 SELECT
`stdNo`,
`stdName`,
COUNT(`stdNo`) AS `수강신청 건수`,
SUM(`regTotalScore`) AS `종합점수`,
SUM(`regTotalScore`) / COUNT(`stdNo`) AS `평균`
FROM `Student` AS a
JOIN `Register` AS b
ON a.stdNo = b.regStdNo
group by `stdNo`
order by `stdNo`;

#실습 3-22
select * from `Register` as a join `Lecture` as b on a.`regLecNo` = b.`lecNo`;

#실습 3-23
SELECT
`regStdNo`,
`regLecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
from `Register` as a
join `Lecture` as b
on a.`Register` = b.`Lecture`;

#실습 3-24
SELECT
COUNT(*) AS `사회복지 마케팅 수강 신청건수`,
AVG(`regTotalScore`) AS `사회복지 마케팅 평균`
FROM `Register` AS a JOIN `Lecture` AS b 
ON a.regLecNo = b.lecNo
where `lecName` = '사회복지 마케팅';

#실습 3-25
SELECT
`regStdNo`,
`lecName`
FROM `Register` AS a JOIN `Lecture` AS b
 ON a.regLecNo = b.lecNo
 where `regGrade` = 'A';
 
#실습 3-26
SELECT * FROM `Student` AS a
JOIN `Register` as b on a.stdNo = b.regStdNo
JOIN `Lecture`as c on b.regLecNo = c.lecNo;

#실습 3-27
SELECT
`stdNo`,
`stdName`,
`lecNo`,
`lecName`,
`regMidScore`,
`regFinalScore`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
JOIN`Register` as b on a.stdNo = b.regStdNo
JOIN `Lecture` as c on b.regLecNo = c.lecNo;

#실습 3-28
 SELECT
`stdNo`,
`stdName`,
`lecName`,
`regTotalScore`,
`regGrade`
FROM `Student` AS a
JOIN`Register` as b on a.stdNo = b.regStdNo
JOIN `Lecture` as c on b.regLecNo = c.lecNo
where `regGrade` ='F';


#실습 3-29
 SELECT
`stdNo`,
`stdName`,
SUM(`lecCredit`) AS `이수학점`
FROM `Student` AS a
JOIN`Register` as b on a.stdNo = b.regStdNo
JOIN `Lecture` as c on b.regLecNo = c.lecNo
where `regGrade` < 'F'
group by `stdNo`;

#실습 3-30
SELECT
`stdNo`,
`stdName`,
GROUP_CONCAT(`lecName`) AS `신청과목`,
GROUP_CONCAT(if(`regTotalScore` >= 60, `lecName`, null)) AS `이수과목`
FROM `Student` AS a
JOIN`Register` as b on a.stdNo = b.regStdNo
JOIN `Lecture` as c on b.regLecNo = c.lecNo

group by `stdNo`;





















































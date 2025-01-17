#실습 5-1
create database `BookStore`;
create User 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;

#실습 5-2
create table `Customer`(
`custId` int not null auto_increment primary key,
`name` varchar(10) not null,
`address` varchar(20) default null,
`phone` varchar(13) default null
);

drop table `Book`;
create table `Book`(
`bookId` int not null auto_increment primary key,
`bookName` varchar(20) not null,
`publisher` varchar(20) not null,
`price` int default null
);

create table `Order`(
`orderId` int not null auto_increment primary key, 
`custId` int not null,
`bookId` int not null,
`salePrice` int not null,
`orderDate` date not null
);

#실습 5-3
insert into `Customer` (`name`,`address`,`phone`)  values
	('박지성','영국 멘체스타','000-5000-0001'),
    ('김연아','대한민국 서울','000-6000-0001'),
	('장미란','대한민국 강원도','000-7000-0001'),
	('추신수','미국 클리블랜드','000-8000-0001'),
	('박세리','대한민국 대전',null);
    
insert into `Book` (`bookName`, `publisher`, `price`) values
	('축구의 역사','굿스포츠',7000),
    ('축구아는 여자','나무수',13000),
    ('축구의 이해','대한미디어',22000),
    ('골프 바이블','대한미디어',35000),
    ('피겨 교본','굿스포츠',8000),
    ('역도 단계별기술','굿스포츠',6000),
    ('야구의 추억','이상미디어',20000),
    ('야구를 부탁해','이상미디어',13000),
    ('올림픽 이야기','삼성당',7500),
    ('Olympic Champions','Pearson',13000);
    
insert into `Order` (`custId`, `bookId`, `saleprice`, `orderdate`) values
	(1,1,6000,'2014-07-01'),
    (2,1,21000,'2014-07-03'),
    (3,2,8000,'2014-07-03'),
    (4,3,6000,'2014-07-04'),
    (5,4,20000,'2014-07-05'),
    (6,1,12000,'2014-07-07'),
    (7,4,13000,'2014-07-07'),
    (8,3,12000,'2014-07-08'),
    (9,2,7000,'2014-07-09'),
    (10,3,13000,'2014-07-10');

#실습 5-4
select * from `Customer`;

#실습 5-5
select `bookname`, `price` from `Book`;

#실습 5-6
select `price`, `bookname` from `Book`;

#실습 5-7
select `bookid`, `bookName`, `publisher`, `price` from `Book`;

#실습 5-8
select `publisher` from `Book`;

#실습 5-9
select distinct `publisher` from `Book`;

#실습 5-10
select * from `Book` where `price`>=20000;

#실습 5-11
select * from `Book` where `price` < 20000;

#실습 5-12
select * from `Book` where `price` >= 10000;

#실습 5-13
select `bookId`, `bookName`, `price` from `Book` where `price` between 15000 and 30000;

#실습 5-14
select * from `Book` where `bookId` in (2,3,5);

#실습 5-15
select * from `Book` where `bookId`%2=0;

#실습 5-16
select * from `Customer` where `name` like '박%';

#실습 5-17
select * from `Customer` where `address` like '대한민국%';

#실습 5-18
select * from `Customer` where `phone` is not null;

#실습 5-19
select * from `Book` where `publisher` in ('굿스포츠','대한미디어');

#실습 5-20
select `publisher` from `Book` where `bookName` = '축구의 역사';

#실습 5-21
select `publisher` from `Book` where `bookName` like '%축구%';

#실습 5-22
select * from `Book` where `bookName` like '_구%';

#실습 5-23
select * from `Book` where `price` >= 20000 and `bookName` like '%축구%';

#실습 5-24
select * from `Book`order by `bookName`;

#실습 5-25
select * from `Book` order by `price` asc, `bookName` asc;

#실습 5-26
select * from `Book` order by `price` desc, `publisher` desc;

#실습 5-27
select * from `Book` order by `price` desc limit 3;

#실습 5-28
select * from `Book` order by `price` asc limit 3;

#실습 5-29
select sum(`salePrice`) as '촣판매액' from `Order`; 

#실습 5-30
select sum(`salePrice`) as '총판매액', avg(`salePrice`) as '평균값', min(`salePrice`) as '최저가', max(`salePrice`) as '최고가'  from `Order`;

#실습 5-31
select count(`orderId`) from `Order`;

#실습 5-32
select 
	`bookId`,
	replace(`bookName`,'야구','농고') as `bookName`,
    `publisher`,
    `price`
from `Book`;

#실습 5-33
select 
	`custId`,
    count(*) as '수량' 
from `Order` 
where `salePrice` >= 8000
group by `custId`
having `수량` >=2;

#실습 5-34
select *  from `Customer` as c join `Order` as o on c.custId=o.custId;

#실습 5-35
select *  from `Customer` as c  join `Order` as o on c.custId=o.custId order by c.custId;

#실습 5-36
select name, salePrice from `Customer` as c join `Order`as  o on c.custId=o.custId;

#실습 5-37
select `name`, sum(`salePrice`) from `Customer` as c join `Order` as o on c.custId=o.custId group by c.custId order by name;

#실습 5-38
select name, bookName from `Customer`as  c join `Order` as o on c.custId=o.custId join `Book` as b on o.bookId=b.bookId;

#실습 5-39
select name, bookName from `Customer` as c join `Order`as  o on c.custId=o.custId join `Book` b on o.bookId=b.bookId where salePrice=20000;

#실습 5-40
select name, salePrice from  `Customer` as c left join `Order` as o on c.custId=o.custId;

#실습 5-41
select sum(salePrice) from  `Customer` as c join `Order` as o on c.custId=o.custId where name='김연아';

#실습 5-42
select bookName from  `Book` order by `price` desc limit 1;

#실습 5-43
select * from Customer as a left join `Order` as b on a.custId=b.custId where `orderId` is null;

#실습 5-44
insert into `Book` set `bookName`='스포츠의학', `publisher`='한솔의학서적', `price`=null;

#실습 5-45
update Customer set address='대한민국 부산' where custId=5;

#실습 5-46
delete from Customer  where custId=5;

#날짜 : 2025/01/09
#이름 : 김소현
#내용 : 5장 데이터베이스 개체

#실습 5-1
show index from `User1`;
show index from `User2`;
show index from `User3`;

#실습 5-2
create index `idx_user1_uid` on `User1` (`uid`);
analyze table `User1`;

#실습 5-3
drop index `idx_user1_uid` on `User1`;


#실습 5-4
CREATE VIEW `vw_user1` as (select `name`, `hp`, `age` from `User1`);

#실습 5-5

#실습 5-6

#실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
    BEGIN
		SELECT * FROM `Member`;
        SELECT * fROM `Department`;    
    END $$
DELIMITER ;

CALL proc_test1();

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
    BEGIN
		select count(*) INTO _count from `Member` where `pos`=_pos;
    END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
select concat('_count : ', @_count);

#실습 5-9


#실습 5-11
#저장함수 예제는 root 관리자 권한으로 실행해야 됨
DELIMITER $$
 CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT 
 DETERMINISTIC
 BEGIN
    DECLARE total INT;
    SELECT SUM(`sale`) INTO total FROM `Sales` WHERE `uid`=_userid;
    RETURN total;
 END $$
 DELIMITER ;

SELECT func_test1('a101');


DELIMITER $$
 CREATE FUNCTION func_test3(_sale INT) RETURNS DOUBLE
 DETERMINISTIC
 BEGIN
    DECLARE bonus DOUBLE;
    
    IF(_sale >= 100000) THEN
		SET bonus = _sale * 0.1;
    ELSE
		SET bonus = _sale * 0.05;
    END IF;

 RETURN bonus;
 END $$
 DELIMITER ;

select 
	`uid`, 
    `year`, 
    `month`, 
    `sale`, 
    func_test2(`sale`) as `bonus`
from `Sales`;









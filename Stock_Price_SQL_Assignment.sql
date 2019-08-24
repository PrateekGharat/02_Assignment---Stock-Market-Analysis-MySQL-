#1. Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.

#Bajaj Auto

create table bajaj1 AS
WITH bajajstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM bajajauto)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   bajajstock ORDER BY `date`;

#Eicher Motors

create table eichermotors1 AS
WITH eichermotorsstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM eichermotors)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   eichermotorsstock ORDER BY `date`;

#Hero Motor

create table heromotocorp1 AS
WITH heromotocorpstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM heromotocorp)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   heromotocorpstock ORDER BY `date`;

#Infosys

create table infosys1 AS
WITH infosysstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM infosys)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   infosysstock ORDER BY `date`;

#TCS

create table tcs1 AS
WITH tcsstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM tcs)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   tcsstock ORDER BY `date`;

#TVS

create table tvsmotors1 AS
WITH tvsmotorsstock (`date`,`Close Price`,RowNum,`20 Day MA`,`50 Day MA`)
AS (SELECT STR_TO_DATE(`date`,'%d-%M-%Y'),`Close Price`,ROW_NUMBER() OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC) RowNum,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 19 PRECEDING and 0 following) AS `20 Day MA`,
       AVG(`Close Price`) OVER (ORDER BY STR_TO_DATE(`date`,'%d-%M-%Y') ASC ROWS between 49 PRECEDING and 0 following) AS `50 Day MA`
FROM tvsmotors)
SELECT `date`,RowNum,`Close Price`,
       IF(RowNum > 19, `20 Day MA`, NULL) `20 Day MA`,
       IF(RowNum > 49, `50 Day MA`, NULL) `50 Day MA`
FROM   tvsmotorsstock ORDER BY `date`;

#2. Create a master table containing the date and close price of all the six stocks.

CREATE TABLE mastertable AS (SELECT b.`date` AS `Date`,
    b.`Close Price` AS Bajaj,
    tc.`Close Price` AS TCS,
    tv.`Close Price` AS TVS,
    i.`Close Price` AS Infosys,
    e.`Close Price` AS Eicher,
    h.`Close Price` AS Hero FROM
    bajaj1 b, tcs1 tc, tvsmotors1 tv, infosys1 i, eichermotors1 e, heromotocorp1 h
WHERE
    b.`date` = e.`date`
        AND b.`date` = h.`date`
        AND b.`date` = tc.`date`
        AND b.`date` = tv.`date`
        AND b.`date` = i.`date`);

#3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. 
#Perform this operation for all stocks.

drop function if exists signal_gen;
DELIMITER $$
CREATE FUNCTION signal_gen(`20 day MA` double ,`50 day MA` double,lag20 double,lag50 double) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
    DECLARE `signal` varchar(10);
	
    IF  `20 day MA` > `50 day MA` and lag20 < lag50 THEN SET `signal` = 'Buy';
    ELSEif `20 day MA` < `50 day MA` and lag20 > lag50 THEN SET  `signal` = 'Sell' ;
    ELSE set `signal` = 'Hold' ;
    end if;
 RETURN (`signal`);
 END
$$
DELIMITER ;

#Bajaj
create table bajaj2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from bajaj1 where `RowNum`>50;

#Eicher Motors
create table eichermotors2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from eichermotors1 where `RowNum`>50;

#Hero Motocorp
create table heromotocorp2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from heromotocorp1 where `RowNum`>50;

#Infosys
create table infosys2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from infosys1 where `RowNum`>50;

#TCS
create table tcs2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from tcs1 where `RowNum`>50;

#TVS
create table tvsmotors2 as select `date`,`Close Price`,
signal_gen(`20 day MA`,`50 day MA`,lag(`20 Day MA`,1)over(order by `RowNum`),lag(`50 Day MA`,1)over(order by `RowNum`)) as `Signal`
from tvsmotors1 where `RowNum`>50;

#4. Create a User defined function, that takes the date as input and returns the signal for that particular day 
#(Buy/Sell/Hold) for the Bajaj stock.

drop function if exists signal_day;
DELIMITER $$

CREATE FUNCTION signal_on_day(`input_date` text) RETURNS VARCHAR(10)
    DETERMINISTIC
BEGIN
RETURN (select `Signal` from bajaj2  where `date`=`input_date`);
 END
$$
DELIMITER ;

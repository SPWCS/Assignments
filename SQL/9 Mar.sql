-- TASK 1:
create database athlete;
use athlete;

-- TASK 2:
create table olympics (ID int,	Name varchar(50),
Sex varchar(20),
Age int,Height int,Weight int,Team varchar(20),NOC varchar(30),Games varchar(30),
Year int,Season varchar(20),City varchar(50),Sport varchar(50),Event varchar(30),Medal varchar(30));

-- Task 3:
set global local_infile=true;

-- TASK 4:
LOAD DATA LOCAL INFILE 'C:\Users\rdevnani\Downloads\athlete_events (1).csv'
into table stocks fields terminated by ','
lines terminated by '/n'
ignore 1 lines;

-- TASK 5:
select 
  sum(case when ID is null then 1 else 0 end) ID,
  sum(case when Name=" " then 1 else 0 end) name,
  sum(case when sex=" " then 1 else 0 end) sex,
  sum(case when age=" " then 1 else 0 end) age,
  sum(case when height=" " then 1 else 0 end) height,
  sum(case when weight=" " then 1 else 0 end) weight,
  sum(case when Team=" " then 1 else 0 end) Team,
  sum(case when NOC=" " then 1 else 0 end) NOC,
  sum(case when games=" " then 1 else 0 end) games,
  sum(case when year=" " then 1 else 0 end) year,
  sum(case when season=" " then 1 else 0 end) season,
  sum(case when city=" " then 1 else 0 end) city,
  sum(case when sport=" " then 1 else 0 end) sport,
  sum(case when event=" " then 1 else 0 end) event,
  sum(case when medal=" " then 1 else 0 end) medal
from olympics;

-- TASK 6:
select season,count(*) from olympics group by season;

-- TASK 7:
select sport from olympics group by sport;

-- TASK 8:
select season,count(*) from olympics where season='summer' group by season;

 -- yearly summer olympians
 select season,year,count(*) from olympics group by season,year;

-- TASK 9:
select count(event),season,year,count(*) from olympics group by season,year;  -- year wise
  -- season wise
select count(event),season from olympics group by season;

-- TASK 10:
select count(*) as no_of_athlete,sport from olympics group by sport order by no_of_athlete desc;
  -- max no of athlete in sport
select count(*) as no_of_athlete,sport from olympics group by sport order by no_of_athlete desc limit 1;

-- TASK 11:
select * from olympics order by age desc limit 10;

-- Task 12:
select * from olympics order by weight desc limit 10;

-- TASK 13:
select * from olympics where medal="gold" and age!=" " order by age asc limit 10;

-- TASK 14:
select * from olympics where medal="gold" order by weight desc limit 10;

-- TASK 15:
select * from olympics where medal="gold" and weight!=" " order by weight asc limit 10;

--  Task 16:

SELECT NAME,
SUM(IF(MEDAL='GOLD',1,0)) AS GOLD_MEDALS,
SUM(IF(MEDAL='SILVER',1,0)) AS SILVER_MEDALS,
SUM(IF(MEDAL='BRONZE',1,0)) AS BRONZE_MEDALS,
(SUM(IF(MEDAL='GOLD',1,0))+SUM(IF(MEDAL='SILVER',1,0))+SUM(IF(MEDAL='BRONZE',1,0))) 
AS TOTAL_MEDALS FROM OLYMPICS GROUP BY NAME ORDER BY TOTAL_MEDALS DESC LIMIT 10;


-- TASK 17:
SELECT NOC,
SUM(IF(MEDAL='GOLD',1,0)) AS GOLD_MEDALS,
SUM(IF(MEDAL='SILVER',1,0)) AS SILVER_MEDALS,
SUM(IF(MEDAL='BRONZE',1,0)) AS BRONZE_MEDALS,
(SUM(IF(MEDAL='GOLD',1,0))+SUM(IF(MEDAL='SILVER',1,0))+SUM(IF(MEDAL='BRONZE',1,0))) 
AS TOTAL_MEDALS FROM OLYMPICS GROUP BY NOC ORDER BY TOTAL_MEDALS DESC LIMIT 10;

-- TASK 18:

select noc,(round(sum(if(not medal = '0',1,0))*100/count(*),2)) as wining_percent from olympics
 where noc in('CHN','USA','RUS','AUS','GBR')
 group by NOC ORDER BY WINING_PERCENT DESC LIMIT 5;

-- TASK 19:
select noc,(round(sum(if(not medal = '0',1,0))*100/count(*),2)) as wining_percent from olympics
 where noc in('CHN','USA','RUS','AUS','GBR')
 group by NOC;

-- TASK 20:

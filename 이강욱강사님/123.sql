-- 개체를 관리 CREATE, DROP, ALTER
-- DATABASE, View, Table, user, constraints
-- CREATE DATABASE pku;
-- DROP DATABASE pku;
-- CREATE TABLE custom(custom_id VARCHAR(10), 
#						  custom_name VARCHAR(20),
#						  tel_no VARCHAR(20),
#						  address VARCHAR(50));
-- SELECT * FROM custom;
-- SELECT ABS(-10);  #절대값
-- SELECT sqrt(LOG(10)); 
-- SELECT SUBSTR('abcdefg',1,4); #1번자리부터 4번자리까지

-- SELECT substr(NOW(),11); #실시간 11은 자리수
 
/*
1. 데이터베이스 만들기(ddl)
2. 테이블 만들기 address, age (ddl)
   address 이름, 고향
   age 이름, 나이
   address  (dml transaction)
   이민주,부산
   강보민,부산
   최어진,경남
   유지현,경남
   정지연,경남
   age  (dml transaction)
   이민주,25
   강보민,26
   최어진,27
   유지현,28
   정지연,29
   
3. 데이터 인서트 (dml transaction)

*/

-- 데이터 베이스 생성
-- create database pku;

-- 테이블 생성
-- DROP TABLE age;

/*
CREATE TABLE address(student_name VARCHAR(10),
							address VARCHAR(5));*/

-- age 테이블 생성
-- DROP TABLE age;

-- CREATE TABLE age(student_name VARCHAR(10),age INT(10));

-- ALTER TABLE address CONVERT TO CHARSET UTF8;			#한글 작업
-- ALTER TABLE age CONVERT TO CHARSET UTF8; 
/*SELECT * 
FROM address;*/

/*SELECT * 
FROM age;*/

-- address에 데이터 넣기
/*INSERT INTO address(student_name, student_address) VALUEs('이민주','부산');*/


/*INSERT INTO address(student_name, student_age) VALUEs('이민주','25');*/

/*
insert into address(student_name,address)
values('이민주','부산');
insert into address(student_name,address)
values('강보민','부산');
insert into address(student_name,address)
values('최어진','부산');
insert into address(student_name,address)
values('유지현','부산');
insert into address(student_name,address)
values('정지연','부산');

insert into age(student_name,age)
values('이민주',25);
insert into age(student_name,age)
values('강보민',26);
insert into age(student_name,age)
values('최어진',27);
insert into age(student_name,age)
values('유지현',28);
insert into age(student_name,age)
values('정지연',29);*/

/*
4. 전체 address를 출력(sql)
5. 전체 age 데이터를 출력(sql)
6. 나이가 가장 적은 사람의 고향출력(sql)

*/

-- address 테이블 어떤  컬럼이 있는가?

DESC address;

SELECT *
FROM address;

UPDATE address SET address = '경남';

SELECT *
FROM address;

UPDATE address SET address = '부산' 
WHERE STUDENT_NAME = '이민주';

UPDATE address SET address = '부산' 
WHERE STUDENT_NAME = '강보민';

SELECT STUDENT_NAME
		 ,address  
 FROM address;
 
SELECT *
FROM age;

SELECT *
 FROM age,address;
 
SELECT student_name, address
 FROM address
 WHERE STUDENT_NAME = (SELECT STUDENT_NAME 
 FROM age
WHERE age = (SELECT min(age)
				FROM age));
/*				
7. 나이가 가장 많은 사람의 성만출력(sql)*/


SELECT substr(student_name,1,1)
 FROM age
 WHERE age = (select MAX(age) FROM age);


SELECT
FROM
WHERE # 거의 안 쓰는 경우가 없다.
GROUP BY
HAVING
ORDER BY ;

SHOW TABLES;

SELECT *
FROM actor;

DESC actor;

DESC film;

DESC actor_info;



SELECT actor_info;

SELECT *
FROM actor_info;


SELECT *
FROM film_actor;

SELECT *
FROM city;

SELECT COUNT(*)
FROM film_actor;

SELECT actor_id, COUNT(*)
FROM film_actor
GROUP BY actor_id;


DESC film_actor;


DESC actor;
 
 
 SELECT *
 FROM actor
 WHERE actor_id = 102;     
 
CREATE TABLE actor_tmp AS
SELECT actor_id, 
	    COUNT(*) AS cnt
FROM film_actor
GROUP BY actor_id;

SELECT MAX(cnt)
from actor_tmp;
 
 
SELECT actor_id
FROM actor_tmp
WHERE cnt = (SELECT MAX(cnt)
  	   	    from actor_tmp);
  	   	    
SELECT FIRST_name,
 		 last_name
FROM actor
WHERE actor_id = (SELECT actor_id
             	   FROM actor_tmp
                  WHERE cnt = (SELECT MAX(cnt)
                  	   	    FROM (actor_id, 
											    COUNT(*) AS cnt
												 FROM film_actor
												 GROUP BY actor_id)));


SELECT first_name, 
       last_name,
       actor_id
 FROM actor												 
where actor_id = (SELECT  actor_id
						FROM(SELECT actor_id ,COUNT(*) AS cnt
	  			     		  FROM film_actor
	  				  		  GROUP BY actor_id)a
            		WHERE cnt = (SELECT MAX(cnt) AS cnt												 
	         			     		 FROM (SELECT COUNT(*) AS cnt
	    	          					 	 FROM film_actor
			 			 						 GROUP BY actor_id) a));
			 			 						 



			 			 						 
-- 영화별로 중요배우의 캐스팅 수를 구하고
-- 구한 캐스팅수의 최고값을 구하고
-- 최고값의 영화아이디를 구하고
SELECT film_id,COUNT(*)
FROM film_actor
GROUP by film_id
ORDER BY COUNT(*) DESC LIMIT 1;

-- 영화아이디를 이용해 영화 제목을 구해온다.
SELECT title
FROM film
where film_id = (SELECT film_id
 					  FROM film_actor
					  GROUP by film_id
					  ORDER BY COUNT(*) DESC LIMIT 1);


-- film_actor에서 배우들을 많이 쓴 영화 100개만 구하기
SELECT film_id, 
		 COUNT(film_id)   #COUNT(*) = COUNT(film_id)  
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC LIMIT 100;



-- 100개 영화에서 배우들의 합계 구하기

SELECT sum(cnt)
FROM (SELECT film_id, 
		 COUNT(*) AS cnt
		FROM film_actor
	   GROUP BY film_id
		ORDER BY COUNT(*) DESC LIMIT 100)a;
		
		
		
-- 영화들의  배우 캐스팅의 평균을 구하기
SELECT AVG(cnt)
FROM (SELECT film_id,
		 COUNT(*) AS cnt
		FROM film_actor
		GROUP BY film_id)a;


-- 영화별로 주요배우 캐스팅이 평균보다 큰 영화들의 제목 구하기
-- 내가 이해한것 필름에서 타이틀을 가져오는데 배우 캐스팅 수의 평균보다 이상인 필름 아이디를 만족하는 것만 가져와라

SELECT title
FROM film
WHERE film_id IN (SELECT film_id
						FROM (SELECT film_id,
        		 						COUNT(*) AS cnt
								FROM film_actor
	   						GROUP BY film_id)a
						WHERE cnt >= (SELECT AVG(cnt)
										 FROM (SELECT film_id,
												  		  COUNT(*) AS cnt
										    	 FROM film_actor
												 GROUP BY film_id)a));
												 
												 

-- rating 갯수 조회
-- film에서 배우 캐스팅 수의 평균보다 이상인 필름 아이디의 rating을 가져와라
SELECT rating, 
		 COUNT(*)
FROM film
WHERE film_id IN (SELECT film_id
						FROM (SELECT film_id,
        		 						COUNT(*) AS cnt
								FROM film_actor
	   						GROUP BY film_id)a
						WHERE cnt >= (SELECT AVG(cnt)
										 FROM (SELECT film_id,
												  		  COUNT(*) AS cnt
										    	 FROM film_actor
												 GROUP BY film_id)a))
GROUP BY rating;
ORDER BY COUNT(*) ASC;


SELECT rating
from(SELECT title, rating
	  FROM film LIMIT 10) a 
GROUP BY rating;
                                   #######삭제

SELECT *
FROM film;

SELECT *
FROM film_actor;

#필름을 가장 많이 찍은 배우

SELECT MAX(cnt)
from(SELECT actor_id,
       COUNT(*) AS cnt
	  FROM film_actor
	  GROUP BY actor_id)a;
	  
#배우들이 찍은 필름의 평균
SELECT AVG(cnt)
from(SELECT actor_id,
       COUNT(*) AS cnt
	  FROM film_actor
	  GROUP BY actor_id)a;

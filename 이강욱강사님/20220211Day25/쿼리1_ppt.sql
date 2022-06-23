# 개체를 관리 CREATE, DROP, ALTER
# DATABASE, View, Table, user, constraints

#CREATE DATABASE pku;
#DROP DATABASE pku;

#CREATE DATABASE pku;

#CREATE TABLE custom(custom_id VARCHAR(10),
#                  custom_name VARCHAR(20), 
#                  tel_no VARCHAR(20),
#                  address VARCHAR(50));

#SELECT * FROM custom;

/* 
1. 데이터베이스 만들기 pku (ddl)
2. 테이블 만들기 address, age (ddl)
   address 이름, 고향 
   age 이름, 나이 
   address (dml transaction)
   이민주,부산 
	강보민,부산 
	최어진,경남 
	유지현,경남 
	정지연,경남 
	age (dml transaction)
	이민주,25 
	강보민,26 
	최어진,27 
	유지현,28 
	정지연,29 
3. 데이터 인서트 (dml transaction)
4. 전체 address를 출력 (sql)
5. 전체 age를 출력 (sql)
6. 나이가 가장 적은 사람의 고향출력 (sql)
7. 나이가 가장 많은  사람의 성만출력 (sql)
*/

-- 데이터베이스 생성
-- CREATE DATABASE pku;

-- address 테이블 생성
/* CREATE TABLE address(student_name varchar(10),
							address VARCHAR(5)); */

-- age 테이블 생성
/* CREATE TABLE age(student_name VARCHAR(10), age INT(10)); */

/* SELECT *
FROM address; */

/* SELECT *
FROM age; */ 

-- address에 데이터 넣기
/* INSERT INTO address(student_name,address) VALUE('이민주','부산');
*/

-- CREATE TABLE address(student_name VARCHAR(10),
--                      address VARCHAR(5)) ;

-- ALTER TABLE address CONVERT TO CHARSET UTF8;
-- ALTER TABLE age CONVERT TO CHARSET UTF8;


-- DROP TABLE address;
-- CREATE TABLE address(student_name VARCHAR(10),
--								address VARCHAR(5));
-- INSERT INTO address(student_name,address) VALUE('이민주','부산');pku

-- sakila
-- DROP TABLE address;　DROP TABLE age;

-- ALTER TABLE address CONVERT TO CHARSET UTF8;
-- ALTER TABLE age CONVERT TO CHARSET UTF8; 
/*
INSERT INTO address(student_name,address)
VALUES('이민주','부산');
INSERT INTO  address(student_name,address)
VALUES ('강보민','부산');
INSERT INTO  address(student_name,address)
VALUES ('최어진','부산');
INSERT INTO  address(student_name,address)
VALUES ('유지현','부산');
INSERT INTO  address(student_name,address)
VALUES ('정지연','부산');

INSERT INTO  age(student_name,age)
VALUES ('이민주',25);
INSERT INTO  age(student_name,age)
VALUES ('강보민',26);
INSERT INTO  age(student_name,age)
VALUES ('최어진',27);
INSERT INTO  age(student_name,age)
VALUES ('유지현',28);
INSERT INTO  age(student_name,age)
VALUES ('정지연',29); */

-- address 테이블 컬럼이 있는가?
/*
DESC address;

SELECT *
FROM address;

-- 바꿥줌
UPDATE address SET address = '경남';

SELECT *
FROM address;
-- 일부만 바꾸기
UPDATE address SET address = '부산' WHERE student_name = '이민주';
UPDATE address SET address = '부산' WHERE student_name = '강보민';


SELECT STUDENT_NAME,
		 address
	FROM address;

SELECT *
	FROM age; */

-- 나이 가장 적은 사람 찾기
/* SELECT address
	FROM address
	WHERE student_name = '이민주'; */
	
/* SELECT student_name,
			age
	FROM age
WHERE age =25;*/


/* SELECT min(age)
FROM age; 

-- 여러명 찾기
SELECT address, student_name
	FROM address
	WHERE student_name = (SELECT student_name,
			age
	FROM age
WHERE age =(SELECT min(age)
				FROM age));

-- 그 중 지역찾기
SELECT address
	FROM address
	WHERE student_name = (SELECT student_name,
			age
	FROM age
WHERE age =(SELECT min(age)
				FROM age));

-- 7번
SELECT substr(student_name,1,1)
	FROM age
	WHERE age=29;
	; 	

-- max넣어보기
SELECT substr(student_name,1,1)
	FROM age
	WHERE age=(select max(age) from age);
	; 	
	
	
-- select 쓰이는 5가지
SELECT 
	FROM #테이블 객체 찾음
	WHERE #속성(칼럼)이 여기서 제대로 쓰이는지 찾음
	GROUP BY #조인
	ORDER BY #select로 넘어감  

	*/

	
#SELECT
# FROM 
# WHERE 
# GROUP by
# ORDER BY	
 
SHOW TABLES; 

#SELECT * FROM <TABLES>;

#SELECT table_name
#FROM TABLES 
#WHERE table_schema;

SELECT *
FROM actor;

DESC actor;


DESC film;

DESC actor_info;

SELECT *
FROM actor_info;

SELECT * 
FROM film_actor;

SELECT actor_id, COUNT(*)
FROM film_actor
GROUP BY actor_id;

DESC film_actor;

DESC actor;

SELECT *
FROM actor
WHERE actor_id = 198;

SELECT *
FROM film_actor;

#CREATE TABLE actor_tmp
SELECT actor_id, COUNT(*) AS cnt
FROM film_actor
GROUP BY actor_id;

SELECT MAX(cnt)
from actor_tmp;

SELECT actor_id
FROM  actor_tmp
WHERE cnt = (SELECT MAX(cnt)
				from actor_tmp);

SELECT first_name,
		 last_name,
		 actor_id
FROM actor
WHERE actor_id =(SELECT actor_id
						FROM (SELECT actor_id, COUNT(*) AS cnt
								FROM film_actor
								GROUP BY actor_id) a				
						WHERE cnt =(SELECT MAX(cnt) AS cnt									
										FROM (SELECT COUNT(*) AS cnt
												FROM film_actor
										 		GROUP BY actor_id) a));	####이건 내가 잘못짠듯하다:: 괄호를 중간말고 맨 끝에 넣어야 함!!!!								
									
									
								
SELECT *
FROM film_actor;


SELECT * 
FROM film_actor
WHERE film_id=508;

SELECT *
FROM film;
#WHERE film_id = 841;


-- 영화별로 중요배우릐 캐스팅 수를 구하고
SELECT COUNT(actor_id) 
FROM film_id
WHERE film_actor; ###

SELECT film_id, 
		 COUNT(*) AS cnt
FROM film_actor
GROUP BY film_id; 

-- 구한 캐스팅수의 최고값을 구하고
SELECT film_id, #데이터를 (랜덤으로)선택하고
		 COUNT(*) AS cnt #센다(누락값을 제외한 전체 값을 출력한다), 센것은 -에 넣을거다(표에 이름이 필요해서 그냥 붙여줌, 안 붙여 줘도 *로 이름을 지정해서 나옴) 
FROM film_actor #테이블에서 
GROUP BY film_id #그룹화하라, 그웁화 할 컬럼(내가 셀렉트한 것) 
ORDER BY COUNT(*) DESC LIMIT 10; #정렬하라, 할 컬럼, 내림차순(제일 큰 수가 위로 올라오니, 최고값), 1개의 테이블만(리턴해서 값 다른거 선택 더 하려면 갯수 지정)

-- 최고값의 영화아이디를 구하고
SELECT film_id #한 영화에 출연한 배우의 수를 제외하고 출력(수는 필요없고 최고수를 가진 영화만 뽑아내니깐)
 FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC LIMIT 10;

-- 영화아이디를 이용해 영화 제목을 구해온다
SELECT title 
 FROM film
WHERE film_id =(SELECT film_id 
						FROM film_actor
						GROUP BY film_id
						ORDER BY COUNT(*) DESC LIMIT 1); #위에서 구한 캐스팅이 많이 된 영화아이디 값을 가진것에서(위의 조건이 안으로 들어감) 정보를 뽑아낼거야 

	
-- film_actor에서 주요 배우들을 많이 쓴 영화 100개만 구하기
SELECT*
FROM film_actor;

SELECT film_id,
		COUNT(film_id) AS cnt
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC LIMIT 100;

-- 100개 영화에서 배우들의 합계 구하기 

SELECT SUM(cnt)
FROM (SELECT film_id,
		 COUNT(film_id) AS cnt
		FROM film_actor
		GROUP BY film_id
		ORDER BY COUNT(film_id) DESC LIMIT 100) a; #위에서 구한 조건값을 더할거야, 그걸 a라고 지정할거야(표에 없는 새로운 조건으로 뽑아내는것이니, 이건 필수지정)

-- 영화별로 주요배우 캐스팅의 평균을 구하기
SELECT AVG(cnt)
FROM (SELECT film_id,
		 COUNT(*) AS cnt
		FROM film_actor
		GROUP BY film_id) a;
			

-- 영화별로 주요배우 캐스팅이 평균보다 큰 영화들의 제목 구하기
SELECT title
FROM film
WHERE film_id IN (SELECT film_id   #필름안 필름아이디안 타이틀을 구하는거. 조건에 필름아이디로 비교를 하고나서 이름을 찾는거니깐 선택될 한 개의 칼럼의 위치를 알아낸 후 제목을 뽑아낼거야
						 FROM (SELECT film_id,
		 									COUNT(*) AS cnt
								 FROM film_actor
								GROUP BY film_id) a
						 WHERE cnt >= (SELECT AVG(cnt)
											FROM (SELECT film_id,
		 													COUNT(*) AS cnt
													 FROM film_actor
													GROUP BY film_id) a)); #비교조건문에서는 order정렬시키지 않아도 되는구나, 비교하려면 수를 비교할 수 있으니 아이디로 뽑는 듯 

-- 두개 이상 찾기
SELECT * 
FROM actor
WHERE actor_id IN (1,2,4); #아이디가 1,2,4번인 열울 뽑아낼거야 

-- 영화 등급별 몇 편씩 있는지 찾아보기
SELECT rating, COUNT(*) #등급을 무작위로 뽑아서 셀거야
FROM film
WHERE film_id IN (SELECT film_id
						 FROM (SELECT film_id,
						 					COUNT(*) AS cnt
								 FROM film_actor
								GROUP BY film_id) a
						 WHERE cnt >= (SELECT AVG(cnt)
											FROM (SELECT film_id,
		 													COUNT(*) AS cnt
													 FROM film_actor
													GROUP BY film_id) a))
												
GROUP BY rating
ORDER BY COUNT(*) DESC; 

-- 필름에 뭐있는지 찾을 수 있음
SELECT *
FROM film;							


SELECT title, rating
		FROM film LIMIT 10;							




						

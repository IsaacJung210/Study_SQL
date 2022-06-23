# 개체를 관리 CREATE, DROP, ALTER
# DATABASE, View, Table, user, constraints

# CREATE DATABASE pku;
# DROP DATABASE pku;

# CREATE TABLE custom(custom_id VARCHAR(10), 
#                    custom_name VARCHAR(20),
#                    tel_no VARCHAR(20),
#                    adress VARCHAR(50));

-- SELECT ABS(-10);
-- SELECT sqrt(LOG(10));

-- SELECT SUBSTR('abcdefg',1,4);

-- SELECT substr(NOW(),12);

/* 
1. 데이터베이스 만들기 pku (ddl)
2. 테이블 만들기 addrress, age (ddl)
   address 이름, 고향
	age 이름, 나이
   address (dml transaction)
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
3. 데이터 인서트(dml transaction)
4. 전체 address를 출력 (sql)
5. 전체 age 데이터를 출력 (sql)
6. 나이가 가장 적은 사람의 고향출력(sql)
7. 나이가 가장 많은 사람의 성만출력(sql)
*/

-- 데이터 베이스 생성
-- create database pku;

-- address 테이블 생성
-- DROP TABLE address;
/*
CREATE TABLE address(student_name VARCHAR(10),
                     address VARCHAR(5)) ;

*/
-- age 테이블 생성
-- DROP TABLE age;
-- CREATE TABLE age(student_name VARCHAR(10), age INT(10));

ALTER TABLE address CONVERT TO CHARSET UTF8;
ALTER TABLE age CONVERT TO CHARSET UTF8;

-- address에 데이터 넣기
/* INSERT INTO address(student_name,student_address) 
VALUES('이민주','부산'); 
*/
/*
CREATE TABLE address(student_name VARCHAR(20), 
student_address VARCHAR(30));
*/
#######SELECT * FROM address;
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
values('정지연',29);


/*
6. 나이가 가장 적은 사람의 고향출력(sql)
7. 나이가 가장 많은 사람의 성만출력(sql)
*/

-- address 테이블 컬럼이 있는가?

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
 
SELECT address
 FROM address
 WHERE student_name = (SELECT student_name
 FROM age
WHERE age = (SELECT min(age)
            FROM age));   ###무슨말이래
            
            
SELECT substr(student_name,1,1)
 FROM age
 WHERE age =(SELECT  MAX(age) FROM age);
 
 
 
SELECT
 FROM 
 WHERE 
 GROUP by
 ORDER by 
 
SHOW TABLES;

SELECT * FROM 성적;

DESC 성적; -- 개체를 보여준다.

SELECT 학번, 이름, 점수  FROM 성적; 

SELECT 점수, 이름, 학번  FROM 성적; -- 개체를 찾는 순서대로 보여준다.

SELECT 점수, 이름, 학번  
FROM 성적
ORDER BY 점수 ASC;

-- 이름이 이씨인 사람들의 점수 정렬
SELECT 점수, 이름, 학번  
FROM 성적
WHERE SUBSTR(이름,1,1) = '이'
ORDER BY 점수 desc;

SELECT SUBSTR(이름,1,1), 이름
FROM 성적
WHERE SUBSTR(이름,1,1) = '이';

SELECT 이름, 점수  
FROM 성적
WHERE 점수 >= 90
ORDER BY 점수 DESC;

SELECT *
FROM 성적
ORDER BY 점수 DESC, 이름 DESC; -- 첫번째 기준(점수)으로 정렬 후 그 중 같은 값에서 다시 두번째 기준(이름)으로 정렬한다.


-- 성이 '김'씨인 사람
SELECT 이름, 점수
FROM 성적
WHERE SUBSTR(이름,1,1) = '김';

SELECT 이름, 점수
FROM 성적
WHERE 이름  LIKE '김%';

-- '김'씨 가 아닌 사람
SELECT 이름, 점수
FROM 성적
WHERE SUBSTR(이름,1,1) != '김';

SELECT 이름, 점수
FROM 성적
WHERE SUBSTR(이름,1,1) <> '김';

SELECT 이름, 점수
FROM 성적
WHERE 이름 not LIKE '김%';

-- 이름 안에 '석'이 들어가는 사람
SELECT 이름, 점수
FROM 성적
WHERE 이름 LIKE '%석%'; -- 앞뒤 상관없이 '석'이 들어간 사람을 찾는다.

-- book_ : 'book'뒤에  _ 한글자라는 뜻

SELECT 이름, 점수
FROM 성적
WHERE 이름 LIKE '%석%' AND 점수 >= 90; -- 앞뒤 상관없이 '석'이 들어간 사람과 90점보다 크거나 같은 사람

SELECT 이름, 점수
FROM 성적
WHERE 이름 LIKE '%석%' AND 점수 < 90; -- 앞뒤 상관없이 '석'이 들어간 사람과 90점보다 작은 사람

SELECT 이름, 점수
FROM 성적
WHERE 점수 <= 90 AND 점수 > 80;


-- 이름이 이로 시작하고 석이나 기로 끝나는 사람
SELECT 이름, 점수, 성별
FROM 성적
WHERE 이름 LIKE '이%' 
      AND (이름 LIKE '%석' OR 이름 LIKE '%기');
      
SELECT 이름, 점수, 성별
FROM 성적
WHERE SUBSTR(이름,1,1) = '이'
      AND (SUBSTR(이름,3,3) = '기' OR SUBSTR(이름,3,3) = '석');
      
SELECT 학번, CONCAT(이름,'(',성별,')') AS '[이름(성별)]' 
FROM 성적
WHERE 이름 LIKE '이%석';

SELECT CONCAT('(',학번,')', 이름) AS '칭찬'
FROM 성적;

SELECT CONCAT(이름,'(',성별,')') AS '짜잔'
FROM 성적;

-- null을 찾을 때는 is를 사용한다.
SELECT *
FROM 제품
WHERE 가격 IS null;
-- null이 아닌걸 찾을 때는 is를 사용한다.
SELECT *
FROM 제품
WHERE 가격 IS NOT NULL;


-- null 값에 값을 넣는 법)
SELECT 제품번호,
		 제품명,
		 종류,
		 색상,
		 IFNULL(가격,35000)
FROM 제품;


SELECT 책명
FROM 책
WHERE 분야 = '컴퓨터';

-- 한 개체의 요소를 보는 것, BUT 한개의 개체를 더 입력하면 더한 것이 보인다.
SELECT DISTINCT 종류
FROM 제품;

SELECT *
FROM 제품;

-- mssql
SELECT top 5 *
FROM 성적;

-- oracle
SELECT *
FROM 성적
WHERE rownum <= 5;

-- mysql
SELECT *
FROM 성적 LIMIT 5;


-- 여자의 상위 성적 3명만
SELECT 이름, 점수, 성별
FROM 성적 
WHERE 성별 = '여'
ORDER BY 점수 DESC 
LIMIT 3;


-- 여자의 상위 성적 3명을 오름차순으로 정렬
SELECT 이름, 점수, 성별
FROM (SELECT 이름, 점수, 성별
	   FROM 성적 
	   WHERE 성별 = '여'
	   ORDER BY 점수 DESC 
	   LIMIT 3)a
ORDER BY 점수 ASC;


-- 책 가격이 비싼 top2
 SELECT 책명, 가격
 FROM 책
 ORDER BY 가격 DESC 
 LIMIT 2;
 
 -- 11,000 ~ 12,000
 SELECT *
 FROM 책
 WHERE 가격 >= 11000 AND 가격 <= 12000;
 
 SELECT *
 FROM 책
 WHERE 가격 not bETWEEN 11000 AND 12000;
 
 
--  '이종석' '송중기' '이연희'

SELECT *
FROM 성적
WHERE 이름 = ' 이종석' OR  이름 = '송중기' OR 이름 =  '이연희';

SELECT *
FROM 성적
WHERE 이름 IN ('이종석', '송중기', '이연희');

SELECT 이름, 점수
FROM 성적;

SELECT 이름, 점수+3
FROM 성적;

UPDATE 성적 SET 점수 = 점수 + 3;

UPDATE 성적 SET 점수 = 점수 - 3;

SELECT *
FROM 성적
WHERE 이름 = '이종석';

SELECT *
FROM 성적
WHERE 이름 LIKE  '이종석';


SELECT *
FROM 성적
WHERE 이름 LIKE '이%';

SELECT *
FROM 성적
WHERE SUBSTR(이름,1,1) = '이';


SELECT *
FROM 성적
WHERE 이름 LIKE '이%' or 이름 LIKE '박%' or 이름 LIKE '김%';

SELECT *
FROM 성적
WHERE SUBSTR(이름,1,1) IN ('이','김','박');

SELECT *
FROM 제품;

SELECT SUM(가격), COUNT(가격), COUNT(제품명), COUNT(*)
FROM 제품;

SELECT SUM(가격)/COUNT(가격), SUM(가격)/COUNT(*)
FROM 제품;

-- null값을 제거하고 출력
SELECT SUM(가격)/COUNT(*)
FROM 제품
WHERE 가격 IS NOT NULL;

SELECT COUNT(제품번호)
FROM 제품;

SELECT *
FROM 제품;

SELECT SUM(가격)/COUNT(가격), AVG(가격)
FROM 제품;

SELECT max(가격)
FROM 제품;

SELECT min(가격)
FROM 제품;

SELECT MAX(가격) AS 가장비싼책, min(가격) AS 가장저렴한책
FROM 책;

SELECT MAX(가격) AS 가장비싼책, 가격 -- 직사각형이 아니므로 데이터가 아니다.
FROM 책;

SELECT MAX(가격) AS 가장비싼책, 
       MIN(가격) AS 가장저렴한책,
	    AVG(가격) AS 평균책값
FROM 책;

SELECT COUNT(DISTINCT 종류)
FROM 제품;

SELECT DISTINCT 종류
FROM 제품;

SELECT AVG(가격)
FROM 제품
WHERE 종류='코트';

SELECT count(DISTINCT 종류)
FROM 제품;

-- 종류별로 평균가겨
SELECT 종류, AVG(가격)
FROM 제품
GROUP BY 종류;

SELECT *
FROM 제품;

SELECT count(DISTINCT 색상)
FROM 제품;

--  색상별 평균가격
SELECT 색상, AVG(가격)
FROM 제품
GROUP BY 색상;

--  제품번호 별로 평균가격
SELECT 제품번호, AVG(가격), 색상
FROM 제품
GROUP BY 제품번호;

--  뭐에 맞춰야할지 모르기 때문에 오류가 난다. (무조건 직사각형)
SELECT 종류, AVG(가격), 색상
FROM 제품
GROUP BY 종류;

-- 
SELECT 종류, 색상, AVG(가격)
FROM 제품
GROUP BY 종류, 색상;

SELECT count(distinct CONCAT(종류,색상))
FROM 제품;

SELECT 종류, 색상
FROM 제품;

UPDATE 제품 SET 색상 = 'PINK' WHERE 종류 = '셔츠';

SELECT 종류, std(가격)
FROM 제품
GROUP BY 종류;

--  색상이 각각 몇개 있는지
SELECT 색상, COUNT(*) AS 개수
FROM 제품
GROUP BY 색상;

SELECT COUNT(*)
FROM 제품;

SELECT sum(개수) 
FROM (SELECT 색상, COUNT(*) AS 개수
		FROM 제품
		GROUP BY 색상)a;

-- 분야별 평균 책값 반올림
SELECT 분야,round(AVG(가격))
FROM 책
GROUP BY 분야;

-- 평균가격이 11000보다 큰것
SELECT 분야, AVG(가격)
FROM 책 
GROUP BY 분야
HAVING AVG(가격) >= 11000;

SELECT *
FROM(SELECT 분야, AVG(가격) AS 평균가격
     FROM 책
     GROUP BY 분야)a
WHERE 평균가격> 11000;

SELECT 분야, AVG(가격)
FROM 책
GROUP BY 분야;



SELECT *
FROM(SELECT 분야, AVG(가격) AS 평균가격
     FROM (SELECT 분야,가격
           FROM 책
           WHERE 가격 < 10000)a
     GROUP BY 분야)a
WHERE 평균가격> 11000;

SELECT 분야, ROUND(평균가격) AS 평균가격
FROM(SELECT 분야, AVG(가격) AS 평균가격
     FROM (SELECT 분야,가격
           FROM 책
           WHERE 가격 >= 10000)a
     GROUP BY 분야)a
WHERE 평균가격> 11000;


SELECT *
FROM(SELECT 분야, AVG(가격) AS 평균가격
     FROM 책
     WHERE 가격 >= 10000
     GROUP BY 분야)a
WHERE 평균가격> 11000;

SELECT 분야, ROUND(AVG(가격)) AS 평균가격
FROM 책
WHERE 가격 >= 10000
GROUP BY 분야
HAVING AVG(가격) > 11000;

SELECT * 
FROM 줄넘기결과;

SELECT SUM(스코어), count(스코어)
FROM 줄넘기결과;

SELECT MIN(스코어), MAX(스코어)
FROM 줄넘기결과;

SELECT AVG(스코어)
FROM 줄넘기결과;

SELECT 학년
FROM 줄넘기결과
GROUP BY 학년
having SUM(스코어) > 95;

SELECT *
FROM 성적;

SELECT 반, 성별, SUM(점수)
FROM 성적
GROUP BY 반, 성별
         WITH ROLLUP; --  각 반의 성별이 합산의 평균
         
SELECT 성별, 반, AVG(점수)
FROM 성적
GROUP BY 성별, 반
         WITH ROLLUP; --  각 성별의  반의 합산의 평균
         
SELECT IFNULL(학년,'총계') AS 학년, IFNULL(반,'소계') AS 반, SUM(스코어) AS 줄넘기총합
FROM 줄넘기결과
GROUP BY 학년, 반
         WITH ROLLUP;

SELECT IFNULL(학년,'총계') AS 학년, IFNULL(반,'소계') AS 반, 줄넘기총합
FROM (SELECT 학년, 반, SUM(스코어) AS 줄넘기총합
	   FROM 줄넘기결과
	   GROUP BY 학년, 반
                      WITH ROLLUP)a;

SELECT *
FROM 지도교수;

SELECT *
FROM 전공;

SELECT a.`지도교수`, a.`교수명`, b.`전공명`
FROM 지도교수 a, 전공 b;
-- WHERE a.`전공코드` = b.`전공코드`;

SELECT a.`지도교수`, a.`교수명`, a.`전공코드`, b.`전공명`
FROM 지도교수 a, 전공 b
WHERE a.`전공코드` = b.`전공코드`;

SELECT 지도교수,교수명, 전공명
from(SELECT a.`지도교수`, a.`교수명`, a.`전공코드`, b.`전공명`
	  FROM 지도교수 a, 전공 b
	  WHERE a.`전공코드` = b.`전공코드`)a
WHERE 전공명 = 'DB';

SELECT a.`지도교수`, a.`교수명`, b.`전공명`
FROM 지도교수 a, 전공 b
WHERE a.`전공코드` = b.`전공코드`and b.`전공명` = 'DB';

SELECT a.`지도교수`, 
       a.`교수명`, 
		 a.`전공코드`,
		 b.`전공코드`, 
		 b.`전공명`
FROM 지도교수 a INNER JOIN 전공 b
ON a.`전공코드`= b.`전공코드`;


SELECT *
FROM 팀프로젝트;

SELECT *
FROM 지도교수;

SELECT a.`학번`, 
       a.`이름`, 
		 b.`교수명`,
		 c.`전공명`
 FROM 팀프로젝트 a, 지도교수 b, 전공 c
WHERE a.`조장` = b.`조장` AND b.`전공코드` = c.`전공코드`;

SELECT a.학번, 
       a.이름, 
		 b.교수명,
		 c.전공명
 FROM 팀프로젝트 a INNER JOIN  지도교수 b
       ON  a.조장= b.조장
		 JOIN 전공 c
		 ON c.전공코드  =  b.`전공코드`;
		 
SELECT a.`이름`, b.`조명`, a.`점수`
FROM 학생 a, 졸작팀 b
WHERE a.`학번` = b.`학번`;

SELECT *
FROM 학생, 졸작팀, 동아리;

SELECT a.`이름`, b.`조명`, a.`점수`, c.`동아리명` 
FROM 학생 a, 졸작팀 b, 동아리 c
WHERE a.`학번`=b.`학번` AND b.`동아리코드`=c.`동아리코드`;

SELECT a.`이름`, b.`조명`, a.`점수`, c.`동아리명` 
FROM 학생 a INNER JOIN 졸작팀 b
            ON a.`학번` = b.`학번`
            JOIN 동아리 c
            ON b.`동아리코드` = c.`동아리코드`;
            
SELECT a.전공코드,
       a.전공명,
		 b.교수명
FROM 전공 a INNER join 지도교수 b
            ON a.전공코드 = b.전공코드;
            
SELECT a.전공코드,
       a.전공명,
		 b.교수명
FROM 전공 a left OUTER JOIN 지도교수 b
            ON a.전공코드 = b.전공코드;

/*
SELECT a.전공코드,
       a.전공명,
		 b.교수명
FROM 전공 a , 지도교수 b
WHERE a.`전공코드` = b.`전공코드`(+); -- 아웃터를 이렇게 쓰는 경우도 있다.
*/

SELECT *
FROM 팀프로젝트, 성적;

SELECT a.`학번`,
       a.`이름`, 
		 b.`점수`, 
		 a.`조장`
FROM 팀프로젝트 a RIGHT OUTER JOIN 성적 b
                  ON a.`학번` = b.`학번`;

SELECT a.`학번`,
       b.`이름`, 
		 b.`점수`, 
		 a.`조장`
FROM 팀프로젝트 a RIGHT OUTER JOIN 성적 b
                  ON a.`학번` = b.`학번`;
                  
SELECT b.`학번`,
       a.`이름`, 
		 a.`점수`, 
		 b.`조장`
FROM 성적 a RIGHT OUTER JOIN 팀프로젝트 b
                  ON a.`학번` = b.`학번`;
                  
SELECT b.`학번`,
       b.`이름`, 
		 a.`점수`, 
		 b.`조장`
FROM 성적 a RIGHT OUTER JOIN 팀프로젝트 b
                  ON a.`학번` = b.`학번`;
                  
SELECT 'x' AS 테스트 
 FROM 성적
UNION all
 SELECT 'x' AS 테스트
 FROM 지도교수;
 
SELECT a.`학번`,
       a.`이름`, 
		 b.`점수`, 
		 a.`조장`
FROM 팀프로젝트 a RIGHT OUTER JOIN 성적 b
                  ON a.`학번` = b.`학번`;
                  
select a.학번, 
	    a.이름, 
       b.이름 AS 프로젝트참여자,
       a.점수,
       b.조장
FROM 성적 a LEFT OUTER JOIN 팀프로젝트 b
 ON a.`학번`= b.`학번`
UNION  -- select와 select끼리 합치는것
select a.학번, 
	    a.이름, 
       b.이름 AS 프로젝트참여자,
       a.점수,
       b.조장
FROM 성적 a RIGHT OUTER JOIN 팀프로젝트 b
 ON a.`학번`= b.`학번`;
 
SELECT a.`학번` AS 조원학번, 
       b.`이름` AS 조원명, 
	    b.`조장` AS 조장학번,
	    a.`이름` AS 조장명
FROM 팀프로젝트 a JOIN 팀프로젝트 b
                  ON a.`학번` = b.`조장`;      
						
SELECT *
FROM 팀프로젝트;         

SELECT a.`제품명`, b.`판매수량` , (a.`가격` * b.`판매수량`) AS 판매금액
FROM 제품 a,(SELECT 제품번호, SUM(판매수량) AS 판매수량
				 FROM 판매
				 GROUP BY 제품번호) b
WHERE a.`제품번호` = b.`제품번호`;

SELECT MAX(판매금액)
FROM (SELECT a.`제품명`, 
             b.`판매수량` , 
				 (a.`가격` * b.`판매수량`) AS 판매금액
      FROM 제품 a,(SELECT 제품번호, 
		                     SUM(판매수량) AS 판매수량
				        FROM 판매
				        GROUP BY 제품번호) b
      WHERE a.`제품번호` = b.`제품번호` )a;

SELECT *
FROM 판매;




INSERT INTO 판매(제품번호,판매수량,판매날짜) 
       VALUES(1,30,'2015/03/01');
       
SELECT  a.`제품명`, b.`판매수량` , SUM(a.`가격` * b.`판매수량`) AS 판매금액
FROM 제품 a
JOIN 판매 b
ON a.`제품번호` = b.`제품번호`;
GROUP BY a.`제품번호` = b.`제품번호`;

SELECT a.`제품명` AS 품명, 판매수량
FROM 제품 a, (SELECT 제품번호, SUM(판매수량) AS 판매수량
              FROM 판매
              GROUP BY 제품번호) b
WHERE a.`제품번호` = b.`제품번호`;

SELECT *
FROM 제품 a, 판매 b
WHERE a.`제품번호` = b.`제품번호`;


SELECT product.제품명, 
       sales.판매수량
FROM 제품 product left join 판매 sales 
     on product.제품번호 = sales.제품번호
ORDER BY sales.판매수량 DESC;

SELECT 지도교수,  교수명
FROM 지도교수 a,  팀프로젝트 b
WHERE a.`조장` = b.`조장`
GROUP BY a.`지도교수`; 



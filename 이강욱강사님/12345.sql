SELECT 지도교수,  교수명
FROM 지도교수 a,  팀프로젝트 b
WHERE a.`조장` = b.`조장`
GROUP BY a.`지도교수`; 

						
SELECT *
FROM 팀프로젝트 a, 지도교수 b
WHERE a.`조장` = b.`조장`;

-- ('김수현', '이종석', '박보영','이민호')

SELECT distinct a.지도교수,
       a.교수명
FROM 지도교수 a JOIN 팀프로젝트 b 
     ON a.`조장`=b.`조장` 
WHERE b.`이름` in ('김수현', '이종석', '박보영','이민호');

SELECT distinct a.지도교수,
       a.교수명
FROM 지도교수 a ,팀프로젝트 b 
WHERE a.`조장`=b.`조장` 
      AND b.`이름` IN ('김수현', '이종석', '박보영','이민호');
      
SELECT s1.조이름, s1.이름,s1.점수
FROM 학생평가 s1
WHERE s1.`점수` = 
(SELECT MAX(점수) FROM 학생평가 s2
WHERE s2.조이름=s1.`조이름`);

SELECT * FROM 지도교수;
SELECT * FROM 전공;


-- 함수 개념으로 만들어서 사용도 가능
CREATE VIEW 교수전공 as
SELECT a.교수명,
       b.전공명
FROM 지도교수 a, 전공 b
WHERE a.전공코드 = b.전공코드;

SELECT *
FROM 교수전공
WHERE 교수명 = '김철수';

SELECT *
FROM 학생평가;

SELECT 이름, 
		 조이름,
       점수
FROM 학생평가
WHERE 점수 = (SELECT 조이름, MAX(점수) 
              FROM 학생평가
				  GROUP BY 조이름);

SELECT a.조이름, 
       a.이름,
		 a.점수				  
FROM 학생평가 a, (SELECT 조이름, MAX(점수) AS 점수
              		 FROM 학생평가
				 		GROUP BY 조이름) b 
WHERE a.조이름=b.조이름 
  AND a.점수=b.점수;
				 		

SELECT 조이름,
 		 이름,
		 점수
FROM 학생평가
WHERE 조이름 = 'T2015' AND 점수 = 90;		 		       
 
SELECT 96
FROM 학생평가 LIMIT 1;

SELECT a.조이름,
 		 a.이름,
		 a.점수
FROM 학생평가 a
JOIN (SELECT MAX(점수) AS 점수
      FROM 학생평가) b
ON a.점수 = b.점수;

SELECT a.조이름,
  		 a.이름,
		 a.점수
FROM 학생평가 a
WHERE a.`점수`= (SELECT MAX(a.`점수`)
					  FROM 학생평가 a, 학생평가 b
					  WHERE a.조이름= b.`조이름`);
					  
SELECT a.조이름,
  		 a.이름,
		 a.점수
FROM 학생평가 a
WHERE a.`점수`= (SELECT MAX(점수)
					  FROM 학생평가 b
					  WHERE a.조이름= b.`조이름`); -- group by 같은 역할을 하는 것
					  
DELETE FROM 판매 WHERE 판매번호 = 8; 

SELECT *
 FROM 판매;
 
SELECT a.제품번호, a.판매수량, b.총판매수량
FROM 판매 a, (SELECT 제품번호, SUM(판매수량) AS 총판매수량
				  FROM 판매
				  GROUP BY 제품번호) b
WHERE a.제품번호 = b.제품번호;

SELECT *
FROM 지도교수;

SELECT *
FROM 전공;

SELECT a.지도교수,
    	 a.교수명,
    	 a.전공코드,
    	 b.전공명
FROM 지도교수 a, 전공 b
WHERE a.`전공코드` = b.`전공코드`;

SELECT a.지도교수,
    	 a.교수명,
    	 a.전공코드,
		 (SELECT b.전공명 FROM 전공 b WHERE a.전공코드 = b.전공코드)
FROM 지도교수 a;


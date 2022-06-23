SHOW TABLES;

SELECT * 
 FROM 성적; # *는 모든 것을 불러옴
 
 -- 원하는 정보만 가져오기
DESC 성적; #뭐 있는지 확인: 특정 테이블에 어떤 칼럼이 있는지 구조가 무엇인지 조회하는 명령어
SELECT 학번, 이름, 점수
	FROM 성적; #지정한 순서대로 원하는 정보 가져옴
SELECT 점수, 이름, 학번
	FROM 성적
ORDER BY 점수 DESC; #정렬하기, 내림차순으로, asc는 오름차순
SELECT 점수, 이름, 학번
	FROM 성적
ORDER BY 점수 ASC; 

-- 이씨만 가져오기

SELECT SUBSTR(이름,1,1), 이름 #substr(원본문자열 혹은 컬럼, 시작위치, 추출개수)
	FROM 성적; #SUBSTR은 맨 앞글자만 따옴

SELECT 점수, 이름, 학번
	FROM 성적
WHERE SUBSTR(이름,1,1) = '이' #이름의 한자만가져옴
ORDER BY 점수 DESC; #점수높은 순으로 정렬하기

SELECT 이름, 점수
	FROM 성적
WHERE 점수 >= 90
ORDER BY 점수 DESC, 이름 desc; #90점대 사람들의 정렬 뽑기

SELECT * 
	FROM 성적 
ORDER BY 점수 desc, 이름  DESC; #차례로 만족시키는거 나열

SELECT 이름, 점수 
	FROM 성적
WHERE SUBSTR(이름,1,1) != '김'; #아닌사람 데려옴

SELECT 이름, 점수 
	FROM 성적
WHERE SUBSTR(이름,1,1) <> '김'; #아닌사람 데려옴

SELECT 이름, 점수
 FROM 성적
WHERE 이름 LIKE '김%'; #김으로 시작하는 사함 모든 사람 데려옴

SELECT 이름, 점수
 FROM 성적
WHERE 이름 not LIKE '김%'; #김으로 시작하는 사람 빼고  사람 데려옴, like는 문자에서 찾을 때
 
SELECT 이름, 점수
	FROM 성적
WHERE 이름 LIKE '%석%'; #앞 뒤로 '석' 들어간 사람 찾기

SELECT 이름, 점수
	FROM 성적
WHERE 이름 LIKE '%석%' AND 점수>=90; #앞 뒤로 '석' 들어간 사람 찾고 점수 조건에 맞는 사람 찾기

SELECT 이름, 점수
	FROM 성적
WHERE 점수 <=90 and 점수>80;

-- 이름이 '이'로 시작하면서 '석'또는 '기'로 끝나는 학생을 검색 
SELECT 이름, 점수, 성별
	FROM 성적
WHERE 이름 LIKE '이%' AND 이름 LIKE '%석' OR 이름 LIKE '%기' AND 점수>80;
#이름이 똑같을 땐 like말고 = 쓰면 됨

SELECT 이름, 점수, 성별
	FROM 성적
WHERE 이름 LIKE '이%' AND (이름 LIKE '%석' OR 이름 LIKE '%기');
		
SELECT 이름, 점수, 성별
	FROM 성적
WHERE SUBSTR(이름,1,1)='이' 
									AND(SUBSTR(이름,3,3) = '기' OR SUBSTR(이름,3,3) = '석');

-- 한 컬럼: 이름(성별)로 가져오기=브로드캐스팅 연산
SELECT 이름, 성별
	FROM 성적;
	
SELECT CONCAT(이름, '잘했어요') AS tt  #여러 범위 및/또는 문자열의 텍스트를 결합
	FROM 성적;

SELECT CONCAT('(',성별,')') #브로드캐스트  연산 
	FROM 성적;
	
SELECT CONCAT(이름, '(',성별,')') AS 이름_성별 #엘레멘터 와이드..? 각각 연결
	FROM 성적;
	
	
# SELECT 이름|'(',성별,')' FROM 성적; #|가 어디 들감?

SELECT *
	FROM 제품;
	
SELECT *
	FROM 제품
WHERE 가격 IS null;
	

SELECT *
	FROM 제품
WHERE 가격 IS not NULL;

SELECT 제품번호, 
		 제품명,
		 종류,
		 색상,
		 IFNULL(가격, 1000)  #nvl(필드, 처리할 값), null값에 값을 채운다
	FROM 제품;
 
-- 책 테이블 
SELECT *
 FROM 책;

SELECT 책명
 FROM 책
WHERE 분야 = '컴퓨터';

-- 중복데이터 제거
SELECT DISTINCT 종류 #한번 씩만 보여줌, 여러컬럼 넣으면 조합해서 유니크한 정보 가져옴
	FROM 제품;

SELECT *
	FROM 성적;
	
SELECT TOP 5 * #MSSQL
 FROM 성적;

SELECT * #ORACLE
	FROM 성적
WHERE ROWNUM <= 5;

SELECT * #MYSQL
 FROM 성적LIMIT 5; 
 
SELECT 이름, 점수, 성별
	FROM 성적
ORDER BY 점수 DESC
LIMIT 10;

-- 여자의 상위 성적 3명만
SELECT 이름, 점수, 성별
	FROM 성적
WHERE 성별 = '여'
ORDER BY 점수 DESC 
LIMIT 3;

SELECT * 
FROM
(SELECT 이름, 점수, 성별 FROM 성적
WHERE 성별 = '여'
ORDER BY 점수 DESC 
LIMIT 3) a
ORDER BY 이름 desc;


-- 비싼 책테이블 가져오기
SELECT *
	FROM 책;

SELECT 책명, 가격
	FROM 책
ORDER BY 가격 DESC
LIMIT 2;
	
	
SELECT *
	FROM 책
WHERE 책명 LIKE '자%' OR 책명 LIKE '세%';

-- 데이터 필터링
-- 11000~12000
SELECT *
 FROM 책
WHERE 가격>=11000 AND 가격 <= 12000;

SELECT *
 FROM 책
WHERE 가격 not between 11000 AND 12000;

-- '이종석''송중기''이연희'
SELECT *
 FROM 성적
WHERE 이름='이종석'OR 이름='송중기'OR 이름='이연희';

SELECT *
 FROM 성적
WHERE 이름 IN ('이종석', '송중기', '이연희');

SELECT 이름, 점수
 FROM 성적;

SELECT 이름, 점수+3
 FROM 성적;

UPDATE 성적 SET 점수 = 점수+3;

UPDATE 성적 SET 점수 = 점수-3;

SELECT *
 FROM 성적
WHERE 이름='이종석';

SELECT *
 FROM 성적
WHERE 이름 LIKE '이종석';

SELECT *
	FROM 성적
WHERE 이름 LIKE '이%';

SELECT *
 FROM 성적
WHERE SUBSTR(이름,1,1)='이';

SELECT *
 FROM 성적
WHERE 이름 LIKE '이%' OR 이름 LIKE '김%' OR 이름 LIKE '박%';

SELECT *
 FROM 성적
WHERE SUBSTR(이름,1,1) IN ('이','김','박'); 

SELECT *
 FROM 제품;
 
SELECT SUM(가격), COUNT(가격), COUNT(제품명), COUNT(*)
 FROM 제품;

SELECT SUM(가격)/COUNT(가격), SUM(가격)/COUNT(*)
 FROM 제품;
 
SELECT SUM(가격)/COUNT(*)
 FROM 제품
WHERE 가격 IS NOT NULL; #이렇게 해야함, 

SELECT COUNT(제품번호)
	FROM 제품;
	
SELECT SUM(가격)/COUNT(가격), AVG(가격)
	FROM 제품;
	
SELECT MAX(가격) AS 가장비싼책, 
		MIN(가격) AS 가장싼, 
		AVG(가격) AS 평균책값
 FROM 책;
 
SELECT COUNT(DISTINCT 종류)
 FROM 제품;
 
SELECT DISTINCT 종류
 FROM 제품;

SELECT count(DISTINCT 색상)
 FROM 제품;

SELECT AVG(가격)
 FROM 제품
WHERE 종류='코트';

SELECT 종류, AVG(가격)
 FROM 제품
GROUP BY 종류; #각 종류별 가격을 보고싶다 할 때 GROUP BY

SELECT 색상, AVG(가격)
 FROM 제품
GROUP BY 색상;

SELECT 제품번호, AVG(가격), 색상
 FROM 제품
GROUP BY 제품번호;


SELECT 종류, AVG(가격), 색상
 FROM 제품
GROUP BY 종류; #직사각형으로 나와야하는데 수가 달라서 안나옴. 에러

SELECT 종류, 색상, AVG(가격)
 FROM 제품
GROUP BY 종류, 색상;

SELECT 종류, 색상
	FROM 제품;

SELECT CONCAT(종류, 색상)
	FROM 제품;
	
SELECT count(distinct CONCAT(종류, 색상)) # 조합해서 유니크한 갯수만큼 나옴
	FROM 제품;

-- 11개로 만들기(셔츠와 핑크를 통일시켜서)
UPDATE 제품 SET 색상 = 'PINK' WHERE 종류 ='셔즈';

SELECT 종류, STD(가격)  #표준편차
 FROM 제품
GROUP BY 종류;

SELECT 색상, COUNT(*) #(색상)으로 해도 같다
 FROM 제품
GROUP BY 색상;

SELECT SUM(개수)
FROM 
(SELECT 색상, COUNT(*) AS 개수
 FROM 제품
GROUP BY 색상) a;
 
	
SELECT 분야, round(AVG(가격))
 FROM 책#다음이 where : 순서
GROUP BY 분야;  #having, order by: 순서
 
SELECT 분야, AVG(가격) FROM 책
GROUP BY 분야  
HAVING AVG(가격) > 11000;
 
 
SELECT * FROM  
(SELECT 분야, AVG(가격) AS 평균가격
 FROM 책
GROUP BY 분야) a
WHERE 평균가격 > 11000;  #having없이쓰기 

-- 분야별 평균책가격, 11000이상의 분야와 평균책가격 구하기

-- 위에 했음

-- 10000미만 제외하고, 11000이상 의 분야와 평균가격 구하시오

SELECT *
FROM 책;

SELECT 분야, AVG(가격) FROM 책
WHERE 가격 >= 10000
GROUP BY 분야;  #수업답


-- ppt2장 끝 3장 시작


SHOW TABLES;

SELECT *
 FROM 줄넘기결과;


SELECT SUM(스코어)
	FROM 줄넘기결과;
	
SELECT MIN(스코어), MAX(스코어)
	FROM 줄넘기결과;
	
-- 복습3 문제
SELECT AVG(스코어) AS 평균스코어
	FROM 줄넘기결과;
 
SELECT 학년, SUM(스코어) AS 총스코어	FROM 줄넘기결과
# WHERE 총스코어 >= 95 #sum이 있어서 where은 쓸 수 없다.
GROUP BY 학년
HAVING 총스코어 >= 95; 

SELECT 학년	FROM 줄넘기결과
GROUP BY 학년
HAVING SUM(스코어) >= 95; 

-- ppt
DESC 성적;
DESC 줄넘기결과;

SELECT 반, 성별, AVG(점수)	 FROM 성적
GROUP BY 반, 성별
			WITH ROLLUP; #슈퍼 집계 요약을 나타내는 결과 집합에 추가 행을 추가. 

SELECT 성별, 반, AVG(점수)	 FROM 성적
GROUP BY 성별, 반
			WITH ROLLUP;

SELECT IFNULL(학년,'총계') AS 학년, 
		 IFNULL(반,'소계') AS 반, 
		 줄넘기총합 
FROM (SELECT 학년, 
				 반, 
				 SUM(스코어) AS 줄넘기총합			
			 FROM 줄넘기결과
 			GROUP BY 학년, 반
 					WITH ROLLUP) tmp; #order by, group by 혹은 alter table 명령어 수행을 위해 내부적인 임시 테이블을 사용
 					
-- join*****

SELECT *
 FROM 지도교수;
 
SELECT *
 FROM 전공;
 
SELECT a.지도교수, a.교수명, b.전공명	FROM 지도교수 a, 전공 b #띄어쓰기 필수
WHERE a.전공코드 = b.전공코드;

SELECT COUNT(*)
FROM  			
(SELECT a.지도교수, 
		 a.교수명, 
		 b.전공명
 FROM 지도교수 a, 전공 b) a;  #뭘 셋길래 30이 나오지???
 
SELECT a.지도교수, 
		 a.교수명, 
		 a.전공코드,
		 b.전공코드, 
		 b.전공명
 FROM 지도교수 a, 전공 b
WHERE a.전공코드 = b.전공코드; #join 

-- 전공명이 DB인사람만 출력 지도교수, 교수명, 전공명
SELECT a.지도교수, 
		 a.교수명,  
		 b.전공명	
 FROM 지도교수 a, 전공 b
WHERE a.전공코드 = b.전공코드 AND b.전공명 = 'DB'; 

-- inner join
SELECT a.지도교수, 
		 a.교수명, 
		 a.전공코드,
		 b.전공코드, 
		 b.전공명
 FROM 지도교수 a INNER JOIN 전공 b 
		ON a.전공코드 = b.전공코드 #위랑 같은결과가 있는데 이걸 더 많이 씀
		AND b.전공명 = 'DB'; 


SELECT 지도교수.지도교수, 
		 지도교수.교수명, 
		 지도교수.전공코드,
		 전공.전공명
 FROM 지도교수 INNER JOIN 전공 
		ON 지도교수.전공코드 = 전공.전공코드;


SELECT * 
 FROM 팀프로젝트 LIMIT 1;
 
SELECT * 
 FROM 지도교수;
 
SELECT a.학번, a.이름, b.교수명
 FROM (SELECT * FROM 팀프로젝트 LIMIT 1) a, 지도교수 b
WHERE a.조장 = b.조장;

SELECT a.학번, 
		 a.이름, 
		 b.교수명
 FROM 팀프로젝트  a, 지도교수 b
WHERE a.조장 = b.조장;
 
SELECT a.학번, 
		 a.이름, 
		 b.교수명,
		 c.전공명
 FROM 팀프로젝트 a, 지도교수 b, 전공 c
WHERE a.조장 = b.조장 AND  b.전공코드= c.전공코드;
 
 
SELECT a.학번,
		 a.이름, 
		 b.교수명,
		 c.전공명
 FROM 팀프로젝트 a INNER JOIN 지도교수 b
 			ON a.조장 = b.조장
		 　JOIN 전공 c
		 　ON c.전공코드 = b.전공코드; 
		 
		 
-- 졸작테이블
 
SELECT *
 FROM 학생;
 
SELECT * 
 FROM 졸작팀;
 
SELECT a.이름, b.조명, a.점수
 FROM 학생 a INNER JOIN 졸작팀 b
 	ON a.학번 = b.학번;
 	
SELECT a.이름, b.조명, a.점수
 FROM 학생 a , 졸작팀 b
WHERE a.학번 = b.학번;

SELECT a.이름, b.조명, a.점수, c.동아리명
 FROM 학생 a, 졸작팀 b, 동아리 c
WHERE a.학번 = b.학번 AND  b.동아리코드 = c.동아리코드;

-- #여러개의 교집합일 때 처음엔 inner join(on겹친조건), 두번째는 join(on겹친조건)
SELECT a.이름, b.조명, a.점수, c.동아리명
 FROM 학생 a INNER JOIN 졸작팀 b ON a.학번 = b.학번 　
						JOIN 동아리 c  ON b.동아리코드 = c.동아리코드; #???
 
 
-- 자꾸 한글 바뀜 ㅡㅡ left outer join
 SELECT a.전공코드, a.전공명, b.교수명	  FROM 전공 a, 지도교수 b
WHERE a.전공코드 = b.전공코드;


 SELECT a.전공코드, a.전공명, b.교수명
  FROM 전공 a INNER join 지도교수 b	on a.전공코드 = b.전공코드;
	
 SELECT a.전공코드, a.전공명, b.교수명
  FROM 전공 a LEFT OUTER join 지도교수 b	on a.전공코드 = b.전공코드;

/*	#다른데서 쓰임
SELECT a.전공코드,
		 b.전공명,
		 b.교수명
 FROM 전공 a, 지도교수 b
WHERE a.전공코드 = b.전공코드(+);
*/

SELECT a.학번, a.이름, b.점수, a.조장
 FROM 팀프로젝트 a RIGHT OUTER JOIN 성적 b	ON a.학번 = b.학번;

SELECT a.학번, a.이름, b.점수, a.조장
 FROM 성적 b LEFT OUTER JOIN 팀프로젝트 a	ON a.학번 = b.학번;
 	
SELECT 'x' AS 테스트 FROM 성적 
UNION ALL #중복제외
SELECT 'x' AS 테스트 FROM 지도교수;



SELECT *
FROM 성적;

SELECT *
 FROM 팀프로젝트;

SELECT a.이름,
		b.이름 AS 프로젝트참여자,
		a.점수,
		b.조장
 FROM 성적 a LEFT outer jOIN 팀프로젝트 b
 ON a.학번 = b.학번
UNION
SELECT a.이름,
		b.이름 AS 프로젝트참여자,
		a.점수,
		b.조장
 FROM 성적 a right outer jOIN 팀프로젝트 b
 ON a.학번 = b.학번;




-- 셀프조인 
SELECT a.학번 AS 조원학번,
		 a.이름 AS 조원명,
		 b.조장 AS 조장학번,
		 b.이름 AS 조장명
	FROM 팀프로젝트 a, 팀프로젝트 b
WHERE a.조장 = b.학번;
	

-- 제품과 판매테이블
-- 판매한 제품의 품명과 판매수량 판매금액
SELECT *
 FROM 제품;
 
SELECT *
 FROM 판매;
 
INSERT INTO 판매(제품번호, 판매수량, 판매날짜) 
		 VALUES(1,30,'2015/03/01'); 

SELECT MAX(판매금액) 
 FROM (SELECT a.제품명,
		 			a.판매수량,
		 			b.가격,
		 			a.판매수량 * b.가격 AS 판매금액
		 FROM (SELECT a.제품번호,
		 					a.제품명,
		  					sum(b.판매수량) AS 판매수량 
 	 			 FROM 제품 a, 판매 b 
				 WHERE a.제품번호 = b.제품번호
				 GROUP BY a.제품번호, a.제품명) a, 제품 b
		 WHERE a.제품번호 = b.제품번호) a; 

-- SELECT MAX(판매금액)
-- FROM 	(	
			SELECT a.제품명,a.판매수량,b.가격,a.판매수량 * b.가격 AS 판매금액
			FROM 		 
					(
					SELECT a.제품번호,a.제품명,sum(b.판매수량) AS 판매수량 
					FROM 제품 a, 판매 b 	
					WHERE a.제품번호 = b.제품번호
					GROUP BY a.제품번호, a.제품명
					) a, 제품 b	
			WHERE a.제품번호 = b.제품번호;
			
--			) a;
			

SELECT a.제품명, SUM(b.판매수량) AS 판매수량, SUM(a.가격*b.판매수량) AS 판매금액	#이것들을 선택할거다
FROM 제품 a  #여기에서
JOIN 판매 b  #이것도 합쳐서 
ON a.제품번호 = b.제품번호 #어떻게 거를건지
GROUP BY a.제품번호,a.제품명; #결과 전 묶을거다(뒤에서 차례로)


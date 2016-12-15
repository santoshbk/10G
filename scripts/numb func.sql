-- NUMBER FUNCTIONS
-- MOD()

SELECT MOD(77,3) FROM DUAL;

-- FIND EVEN/ODD EMPNO
SELECT EMPNO FROM EMP WHERE MOD(EMPNO,2)=0;
SELECT EMPNO FROM EMP WHERE MOD(EMPNO,2)<>0;

--SIGN() ==> COMPARING NUMBERS
SELECT SIGN(&A-&B) FROM DUAL;

SELECT ENAME, COMM, SAL FROM EMP WHERE SIGN(COMM-SAL)=1;

--ASCII() => RETURN ASCII VALUE
SELECT ASCII('a'), ASCII('A') FROM DUAL;

--CHR() - INVERSE OF ASCII
SELECT CHR(97), CHR(65) FROM DUAL;

/* 
- ROUND - ROUNDS OFF TO NEARER LIMIT (eITHER LOWER OR HIGHER )
- TRUNC - SAME AS ROUND BUT ALWAYS TAKE LOWER LIMIT
- CEIL  - ROUNDS OF TO HIGER INT 
- FLOOR - ROUNDS OFF TO LOWER INT
*/
SELECT ROUND(998.658, 2) FROM DUAL;

SELECT ROUND(998.658, -1) FROM DUAL;
SELECT ROUND(998.658, 0) FROM DUAL;
SELECT ROUND(918.658, -2) FROM DUAL;
SELECT ROUND(998.658, -1) FROM DUAL;

SELECT ROUND(6656, -2), TRUNC(6656,-2) FROM DUAL;

SELECT CEIL(98.5), FLOOR(98.5) FROM DUAL; -- OUTPUT>>> 99,98

SELECT CEIL(98.123), FLOOR(98.123) FROM DUAL;

-- ABS()
SELECT ABS(-55) FROM DUAL;


--ASSIGNMENTS

-- FIND NUMBER OF 'T' IN 'TWINKLE TWINKLE LITTLE STAR'
-- REPLACE ONLY THE 3RD CHAR BY NUMNBER 9 IN ALL ENAMES



--   REPLACE ONLY THE 3RD CHARACTER BY NUMBER 9 IN ALL ENAMES.

SELECT ENAME, REPLACE(ENAME, SUBSTR(ENAME,3,1),9) FROM EMP;

SELECT ENAME, TRANSLATE(ENAME, SUBSTR(ENAME,3,1),9), REPLACE(ENAME, SUBSTR(ENAME,3,1),9) FROM EMP;


-- TO_CHAR()
-- TO_DATE()
-- TO_TIMESTAMP
-- TO_YMINTERVAL
-- TO_DSINTERVAL
-- TO_NUMBER



-- TO_CHAR() ==> CONVERTS DATE INTO STRING

/* DY     - 3 LETTER DAY
   DAY    - DAY FULLY SPELT
   MON    - 3 LETTER MONTH
   MONTH  - MONTH FULLT SPELT
   YEAR   - STRING YEAR
   YY     - 2 DIGIT YEAR
   YYYY   - 4 DIGIT YEAR
   MM     - NUMERICAL MONTH
   D      - WITHIN WEEK
   DD     - WITHIN MONTH
   DDD    - WITHIN YEAR
   Q      - QUARTER
   W      - WEEK NUMBER WITHIN MONTH
   WW     - WEEK NUMBER WITHIN YEAR
   
   TO_DATE => CONVERTS STRING INTO DATE
*/

SELECT TO_CHAR(SYSDATE, 'DY'), TO_CHAR(SYSDATE, 'DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON'), TO_CHAR(SYSDATE, 'MONTH') FROM DUAL;

-- FIND EMPLOYEES JOINED ON WED AND SUNDAY
SELECT ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'DAY')='WEDNESDAY';
SELECT ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'DY')='SUN';
-- FIND EMP JOINED ON SEP
SELECT ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'MON')='SEP';
SELECT ENAME, HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'MONTH')='SEPTEMBER';

SELECT TO_CHAR(SYSDATE, 'YYYY'), TO_CHAR(SYSDATE, 'YEAR'), TO_CHAR(SYSDATE, 'YY') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'D'), TO_CHAR(SYSDATE, 'DD'), TO_CHAR(SYSDATE, 'DDD') FROM DUAL;

-- FIND EMPLOYEES JOINED IN LEAP YEAR

SELECT ENAME, HIREDATE FROM EMP WHERE MOD(TO_CHAR(HIREDATE, 'YYYY'),4)=0;

SELECT TO_CHAR(SYSDATE, 'DDSPTH MONTH YEAR') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'Q'), TO_CHAR(SYSDATE, 'W'), TO_CHAR(SYSDATE, 'WW') FROM DUAL;

-- DAY OF INDEPENDENCE
SELECT SYSDATE FROM DUAL;



SELECT  TO_CHAR(TO_DATE('15-AUG-1947'), 'DAY') FROM DUAL;

SELECT TO_DATE('12/15/2016', 'MM/DD/YYYY') FROM DUAL;
SELECT TO_DATE('15/12/2016', 'DD/MM/YYYY') FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT='DD-MMM-YYYY';

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'hh24:mi:SS') FROM DUAL;

SELECT * FROM V$TIMEZONE_NAMES;

ALTER SESSION SET TIME_ZONE='+5:30';

SELECT CURRENT_TIMESTAMP FROM DUAL;

-- TO_YMINTERVAL
SELECT SYSDATE+TO_YMINTERVAL('2-4') FROM DUAL; -- ('<years>-<months>')

-- TO_DSINTERVAL
SELECT CURRENT_TIMESTAMP, CURRENT_TIMESTAMP+TO_DSINTERVAL('3 3:20:20') FROM DUAL; -- ('<days><space><hours>:<minutes>:<seconds>') 





desc dual;
select * from dual;

select upper('soc gen') "Upper Case" from dual;

select * from emp where job=upper('&job');

select lower('SociEty GenErale') "Lower Case" from dual;
select initcap('SociEty GenErale') "Camel Case" from dual;

select dname, upper(dname), lower(dname), initcap(dname) from dept;

select substr('HelloWorld', 4) from dual;
select substr('HelloWorld', 4, 2) from dual;
select substr('Hello World', 7, 2) from dual;

-- display ename starting with 'A' using substring
select ename, job from emp where substr(ename,1,1) = 'A' ;

select ename, job from emp where substr(ename,3,1) in ('A', 'E','I','O','U') ;

select SUBSTR('Hello WOrld', -1), substr('Hello WOrld', length('Hello WOrld')-1) from dual;

select current_date, current_timestamp from dual;


select ename, substr(ename,1,length(ename)-1)||lower(substr(ename,-1)) "Last Low"
from emp;

SELECT   ENAME,SAL,(SAL+100) "newsal",(SAL+100)  as newsal, (SAL+100)  newsall
FROM EMP
WHERE ENAME='SMITH';


select distinct(job) from emp;
SELECT   ENAME||' is working as '||  JOB FROM EMP;
select  'RAM'||'LAKHAN' "CONCAT" FROM DUAL;

select INSTR('SOCIETEGENERALE', 'E') FROM DUAL;
select INSTR('SOCIETE GENERALE', 'E', 1, 3) "FOURTH E" FROM DUAL;

SELECT TRIM('   COOL   ') FROM DUAL;
SELECT TRIM('H' FROM 'HELLOEH') FROM DUAL;

SELECT DNAME, LPAD(DNAME, 12,'.'), RPAD(DNAME,12,'!') FROM DEPT;

SELECT RPAD(ENAME,10,' ')||' is working as '||  JOB FROM EMP;

SELECT REPLACE('HELLO WORLD', 'HELLO', 12345), TRANSLATE('HELLO WORLD', 'HELLO', 12345) FROM DUAL; 

SELECT CONCAT('HELLO','WORLD') FROM DUAL;















-- FIND OUT ENAME WHERE 1ST CHARACTER IS GETTING REPEATED  - USE SUBSTRING AND %

SELECT ENAME FROM EMP
WHERE ENAME LIKE '_%'||SUBSTR(ENAME,1,1)||'%';

-- FIND OUT ENAME WHERE LAST CHARACTER IS GETTING REPEATED  - USE SUBSTRING AND %

SELECT ENAME FROM EMP
WHERE ENAME LIKE '_%'||SUBSTR(ENAME,1,1)||'%';




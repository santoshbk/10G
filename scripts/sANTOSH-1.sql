SELECT * FROM EMP;
SELECT * FROM EMP WHERE   DEPTNO=30 AND JOB ='CLERK';
SELECT * FROM EMP WHERE   DEPTNO=30 OR JOB ='CLERK';
SELECT * FROM EMP WHERE   DEPTNO=30 and JOB <>'CLERK';
SELECT * FROM EMP WHERE   DEPTNO=30 and not JOB='CLERK';

select * from dept where LOC in ('CHICAGO', 'BOSTON');
select * from emp where sal in (1250, 3000);
select ename, sal, job from emp where sal not in (1250, 3000);

select ename, hiredate from emp where 
hiredate between '03-DEC-81' and '19-APR-87';

-- finding ename starting with 'J'
select ename from emp where ename like 'J%';
select ename from emp where ename like '%S'; -- ends with S
select ename from emp where ename like 'J%S'; -- starts J and ends with S
select ename from emp where ename like '%R'; -- ends with R
select ename from emp where ename like '%T%'; -- contains T anywhere
select ename from emp where ename like '_I%';-- I as 2nd character
select ename from emp where ename like '__L%';

select ename, hiredate from emp where HIREDATE like '%FEB%';
select ename, hiredate from emp where HIREDATE like '__-F%';
select ename, hiredate from emp where HIREDATE like '___F%';
select ename, hiredate from emp where HIREDATE like '___FEB___';

update emp set job='SALES%MAN' where job = 'SALESMAN';

select ename, job from emp where job like '%/%%' escape '/';

rollback;

select ename, job from emp where job like '%/%%' escape '/';


select ename, job, sal from EMP where 
job not like 'CLERK' and sal>950;

select ename from emp where ename not like '%E%';
select ename from emp where ename not like '%E%';
select ename, sal, comm from emp where comm is null;
select ename, sal, comm from emp where comm is not null;



Define _DATE = "14-DEC-2016"



select * from emp where deptno=&deptno;
select * from emp where job='&job';

select ename, job from emp order by 2;
select ename, sal from emp order by 2;
select ename, job from emp order by ename;

select ename, job, hiredate "date" from emp order by "date";

select ename, job, hiredate "date" from emp order by "date" , job desc;

select * from emp where job='clerk';



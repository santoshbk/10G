CREATE TABLE DEPT AS SELECT * FROM SCOTT.DEPT;
CREATE TABLE EMP AS SELECT * FROM SCOTT.EMP;
CREATE TABLE SALGRADE AS SELECT * FROM SCOTT.SALGRADE;

ALTER TABLE DEPT ADD PRIMARY KEY(DEPTNO);
ALTER TABLE EMP ADD PRIMARY KEY(EMPNO);
ALTER TABLE EMP ADD CONSTRAINT FK_1 FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO);

-----------------
-- Comments 
 -- single line comment
 /* multiline 
 comment*/
------------

select * from tab; --list the available tables
desc emp; -- describes the table
desc dept;
desc salgrade;

select * from salgrade;
select * from emp;
select * from dept;

select count(*) from dept;

select dname from dept;
select dname, loc from dept;

-- to select details for dept 10 only
select * from dept where deptno=10;
-- select details of sales dept
select * from dept where DNAME='SALES';
--select details on employees whose job is ANALYST
select * from emp where JOB='ANALYST';
select * from emp where HIREDATE='03-DEC-81'
select * from emp where sal>1250;
select * from emp where HIREDATE<'03-DEC-81';
select * from emp where job!='MANAGER';


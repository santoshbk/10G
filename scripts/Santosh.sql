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

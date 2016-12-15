/* 
JOINS
----------
  > TO SELECT DATA FROM MULTIPLE TABLES
  
  oRACLE PROP. SYNTAX                         =>  SQL-99 SYNTAX
  ==========================================================================
  > EQUI                                        > INNER JOIN
  > OUTER                                       > OUTER(LEFT, RIGHT, FULL)
  > NON EQUI                                    > JOIN
  > CARTESIAN                                   > CROSS JOIN
  > SELF                                        > JOIN (SAME TABLE)
                                                > NATURAL   
                                                > USING
RULES:
-------------------------------------------
 > COLUMNS SHOULD HAVE THE FORMAT
    E.ENAME OR EMP.ENAME
 > TYPE OF JOIN SHOULD BE SPECIFIED
 > JOIN CONDITION USES ON CLAUSE
 
 EQUI(INNER) JOIN:
 ----------------------
 > JOIN CONDITION USES = OPERATOR
 > TABLES HAVING REFERENTIAL INTEGRITY -> PARENT CHILD RELATION
 
*/

-- DISPLAY DNAME FOR EACH ENAME
SELECT E.ENAME, D.DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY D.DNAME;

SELECT SUM(SAL), D.DNAME
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME
ORDER BY 1;

-- FIND EMP WORKING IN CHICAGO AS CLERK
SELECT * FROM DEPT;
SELECT E.ENAME, D.LOC, E.JOB
FROM EMP E INNER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
AND D.LOC = 'CHICAGO'
AND E.JOB='CLERK';



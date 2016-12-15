SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'DAY')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'DAY')
  4  order by 2;

  COUNT(*) TO_CHAR(H                                                                                                                
---------- ---------                                                                                                                
         2 FRIDAY                                                                                                                   
         1 MONDAY                                                                                                                   
         2 SATURDAY                                                                                                                 
         2 SUNDAY                                                                                                                   
         3 THURSDAY                                                                                                                 
         3 TUESDAY                                                                                                                  
         1 WEDNESDAY                                                                                                                

7 rows selected.

SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'DAY'),TO_CHAR(HIREDATE,'D')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'DAY'),TO_CHAR(HIREDATE,'D')
  4  ORDER BY 3;

  COUNT(*) TO_CHAR(H T                                                                                                              
---------- --------- -                                                                                                              
         2 SUNDAY    1                                                                                                              
         1 MONDAY    2                                                                                                              
         3 TUESDAY   3                                                                                                              
         1 WEDNESDAY 4                                                                                                              
         3 THURSDAY  5                                                                                                              
         2 FRIDAY    6                                                                                                              
         2 SATURDAY  7                                                                                                              

7 rows selected.

SQL> --FIND OUT NUMBER OF EMPLOYEES JOINED MONTHWISE WITHIN YEAR
SQL> 
SQL> 
SQL> 
SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'YYYY'),TO_CHAR(HIREDATE,'MONTH')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'YYYY'),TO_CHAR(HIREDATE,'MONTH');

  COUNT(*) TO_C TO_CHAR(H                                                                                                           
---------- ---- ---------                                                                                                           
         2 1981 FEBRUARY                                                                                                            
         1 1981 NOVEMBER                                                                                                            
         1 1987 MAY                                                                                                                 
         2 1981 DECEMBER                                                                                                            
         1 1987 APRIL                                                                                                               
         2 1981 SEPTEMBER                                                                                                           
         1 1981 MAY                                                                                                                 
         1 1982 JANUARY                                                                                                             
         1 1980 DECEMBER                                                                                                            
         1 1981 APRIL                                                                                                               
         1 1981 JUNE                                                                                                                

11 rows selected.

SQL> --FIND OUT NUMBER OF EMPLOYEES WHO ARE TAKING SAME SALARIES
SQL> 
SQL> 
SQL> 
SQL> SELECT COUNT(*),SAL
  2  FROM   EMP
  3  GROUP BY SAL;

  COUNT(*)        SAL                                                                                                               
---------- ----------                                                                                                               
         1       2450                                                                                                               
         1       5000                                                                                                               
         1       1300                                                                                                               
         2       1250                                                                                                               
         1       2850                                                                                                               
         1       2975                                                                                                               
         1       1100                                                                                                               
         2       3000                                                                                                               
         1        800                                                                                                               
         1       1600                                                                                                               
         1       1500                                                                                                               
         1        950                                                                                                               

12 rows selected.

SQL> SELECT COUNT(*),SAL
  2  FROM   EMP
  3  GROUP BY SAL
  4  HAVING COUNT(*)>1;

  COUNT(*)        SAL                                                                                                               
---------- ----------                                                                                                               
         2       1250                                                                                                               
         2       3000                                                                                                               

SQL> CL SCR

SQL> /* List average salary for all departments employing more  than five people*/
SQL> SELECT COUNT(*),AVG(SAL),DEPTNO
  2  FROM   EMP
  3  GROUP BY DEPTNO;

  COUNT(*)   AVG(SAL)     DEPTNO                                                                                                    
---------- ---------- ----------                                                                                                    
         6 1566.66667         30                                                                                                    
         5       2175         20                                                                                                    
         3 2916.66667         10                                                                                                    

SQL> SELECT COUNT(*),AVG(SAL),DEPTNO
  2  FROM   EMP
  3  GROUP BY DEPTNO
  4  HAVING COUNT(*)>5;

  COUNT(*)   AVG(SAL)     DEPTNO                                                                                                    
---------- ---------- ----------                                                                                                    
         6 1566.66667         30                                                                                                    

SQL> /* List jobs of all the employees where maximum salary is  greater than or equal to 3000.
SQL> */
SQL> SELECT MAX(SAL),JOB
  2  FROM   EMP
  3  GROUP  BY JOB
  4  HAVING MAX(SAL)>=3000;

  MAX(SAL) JOB                                                                                                                      
---------- ---------                                                                                                                
      5000 PRESIDENT                                                                                                                
      3000 ANALYST                                                                                                                  

SQL> --LIST TOTALSALARY FOR EACH JOB EXCLUDING MANAGER
SQL> SELECT SUM(SAL),JOB
  2  FROM   EMP
  3  GROUP BY JOB;

  SUM(SAL) JOB                                                                                                                      
---------- ---------                                                                                                                
      4150 CLERK                                                                                                                    
      5600 SALESMAN                                                                                                                 
      5000 PRESIDENT                                                                                                                
      8275 MANAGER                                                                                                                  
      6000 ANALYST                                                                                                                  

SQL> SELECT SUM(SAL),JOB
  2  FROM   EMP
  3  WHERE JOB<>'MANAGER'
  4  GROUP BY MANAGER;
GROUP BY MANAGER
         *
ERROR at line 4:
ORA-00904: "MANAGER": invalid identifier 


SQL> ED
Wrote file afiedt.buf

  1  SELECT SUM(SAL),JOB
  2  FROM   EMP
  3  WHERE JOB<>'MANAGER'
  4* GROUP BY JOB
SQL> /

  SUM(SAL) JOB                                                                                                                      
---------- ---------                                                                                                                
      4150 CLERK                                                                                                                    
      5600 SALESMAN                                                                                                                 
      5000 PRESIDENT                                                                                                                
      6000 ANALYST                                                                                                                  

SQL> SELECT COUNT(*),MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL),DEPTNO,JOB
  2  FROM   EMP
  3  WHERE DEPTNO=20
  4  GROUP BY JOB
  5  HAVING AVG(SAL)>1000
  6  ORDER BY JOB;
SELECT COUNT(*),MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL),DEPTNO,JOB
                                                    *
ERROR at line 1:
ORA-00979: not a GROUP BY expression 


SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(*),MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL),DEPTNO,JOB
  2  FROM   EMP
  3  WHERE DEPTNO=20
  4  GROUP BY DEPTNO,JOB
  5  HAVING AVG(SAL)>1000
  6* ORDER BY JOB
SQL> /

  COUNT(*)   MIN(SAL)   MAX(SAL)   AVG(SAL)   SUM(SAL)     DEPTNO JOB                                                               
---------- ---------- ---------- ---------- ---------- ---------- ---------                                                         
         2       3000       3000       3000       6000         20 ANALYST                                                           
         1       2975       2975       2975       2975         20 MANAGER                                                           

SQL> 
SQL> 
SQL> 
SQL> SELECT COUNT(*)
  2  FROM   EMP
  3  GROUP BY DEPTNO;

  COUNT(*)                                                                                                                          
----------                                                                                                                          
         6                                                                                                                          
         5                                                                                                                          
         3                                                                                                                          

SQL> SELECT MAX(COUNT(*))
  2  FROM   EMP
  3  GROUP BY DEPTNO;

MAX(COUNT(*))                                                                                                                       
-------------                                                                                                                       
            6                                                                                                                       

SQL> SELECT JOB
  2  FROM   EMP
  3  WHERE DEPTNO
  4  IN(10,20);

JOB                                                                                                                                 
---------                                                                                                                           
CLERK                                                                                                                               
MANAGER                                                                                                                             
MANAGER                                                                                                                             
ANALYST                                                                                                                             
PRESIDENT                                                                                                                           
CLERK                                                                                                                               
ANALYST                                                                                                                             
CLERK                                                                                                                               

8 rows selected.

SQL> SELECT DISTINCT(JOB)
  2  FROM   EMP
  3  WHERE DEPTNO
  4  IN(10,20);

JOB                                                                                                                                 
---------                                                                                                                           
CLERK                                                                                                                               
PRESIDENT                                                                                                                           
MANAGER                                                                                                                             
ANALYST                                                                                                                             

SQL> SELECT JOB FROM EMP WHERE DEPTNO=10
  2  UNION
  3  SELECT JOB FROM EMP WHERE DEPTNO=20;

JOB                                                                                                                                 
---------                                                                                                                           
ANALYST                                                                                                                             
CLERK                                                                                                                               
MANAGER                                                                                                                             
PRESIDENT                                                                                                                           

SQL> SELECT JOB FROM EMP WHERE DEPTNO=10
  2  UNION ALL
  3  SELECT JOB FROM EMP WHERE DEPTNO=20;

JOB                                                                                                                                 
---------                                                                                                                           
MANAGER                                                                                                                             
PRESIDENT                                                                                                                           
CLERK                                                                                                                               
CLERK                                                                                                                               
MANAGER                                                                                                                             
ANALYST                                                                                                                             
CLERK                                                                                                                               
ANALYST                                                                                                                             

8 rows selected.

SQL> --FIND COMMON JOB IN DEPTNO 10,20
SQL> SELECT JOB FROM EMP WHERE DEPTNO=10
  2  INTERSECT
  3  SELECT JOB FROM EMP WHERE DEPTNO=20;

JOB                                                                                                                                 
---------                                                                                                                           
CLERK                                                                                                                               
MANAGER                                                                                                                             

SQL> --FIND JOB UNIQUE TO 1ST QUERY
SQL> SELECT JOB FROM EMP WHERE DEPTNO=10
  2  MINUS
  3  SELECT JOB FROM EMP WHERE DEPTNO=20;

JOB                                                                                                                                 
---------                                                                                                                           
PRESIDENT                                                                                                                           

SQL> --DISPLAY TOTAL SALARY FOR EACH JOB AS WELL AS TOTAL SALARY
SQL> SELECT SUM(SAL),JOB FROM EMP GROUP BY JOB
  2  
SQL> SELECT SUM(SAL) FROM EMP
  2  
SQL> SELECT SUM(SAL),JOB FROM EMP GROUP BY JOB
  2  UNION
  3  SELECT SUM(SAL) FROM EMP;
SELECT SUM(SAL),JOB FROM EMP GROUP BY JOB
*
ERROR at line 1:
ORA-01789: query block has incorrect number of result columns 


SQL> SELECT SUM(SAL),JOB FROM EMP GROUP BY JOB
  2  UNION
  3  SELECT SUM(SAL),NULL FROM EMP;

  SUM(SAL) JOB                                                                                                                      
---------- ---------                                                                                                                
      4150 CLERK                                                                                                                    
      5000 PRESIDENT                                                                                                                
      5600 SALESMAN                                                                                                                 
      6000 ANALYST                                                                                                                  
      8275 MANAGER                                                                                                                  
     29025                                                                                                                          

6 rows selected.

SQL> SELECT SUM(SAL),JOB FROM EMP GROUP BY ROLLUP(JOB);

  SUM(SAL) JOB                                                                                                                      
---------- ---------                                                                                                                
      6000 ANALYST                                                                                                                  
      4150 CLERK                                                                                                                    
      8275 MANAGER                                                                                                                  
      5000 PRESIDENT                                                                                                                
      5600 SALESMAN                                                                                                                 
     29025                                                                                                                          

6 rows selected.

SQL> SELECT ENAME FROM EMP
  2  UNION
  3  SELECT DNAME FROM DEPT;

ENAME                                                                                                                               
--------------                                                                                                                      
ACCOUNTING                                                                                                                          
ADAMS                                                                                                                               
ALLEN                                                                                                                               
BLAKE                                                                                                                               
CLARK                                                                                                                               
FORD                                                                                                                                
JAMES                                                                                                                               
JONES                                                                                                                               
KING                                                                                                                                
MARTIN                                                                                                                              
MILLER                                                                                                                              
OPERATIONS                                                                                                                          
RESEARCH                                                                                                                            
SALES                                                                                                                               
SCOTT                                                                                                                               
SMITH                                                                                                                               
TURNER                                                                                                                              
WARD                                                                                                                                

18 rows selected.

SQL> SELECT ENAME,NULL "DNAME" FROM EMP
  2  UNION
  3  SELECT NULL,DNAME FROM DEPT;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
ADAMS                                                                                                                               
ALLEN                                                                                                                               
BLAKE                                                                                                                               
CLARK                                                                                                                               
FORD                                                                                                                                
JAMES                                                                                                                               
JONES                                                                                                                               
KING                                                                                                                                
MARTIN                                                                                                                              
MILLER                                                                                                                              
SCOTT                                                                                                                               
SMITH                                                                                                                               
TURNER                                                                                                                              
WARD                                                                                                                                
           ACCOUNTING                                                                                                               
           OPERATIONS                                                                                                               
           RESEARCH                                                                                                                 
           SALES                                                                                                                    

18 rows selected.

SQL> CL SCR

SQL> --DISPLAY DNAME FOR EACH ENAME
SQL> SELECT E.ENAME,D.DNAME
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON   E.DEPTNO=D.DEPTNO;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
CLARK      ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
MILLER     ACCOUNTING                                                                                                               
JONES      RESEARCH                                                                                                                 
FORD       RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
SMITH      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
WARD       SALES                                                                                                                    
TURNER     SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
JAMES      SALES                                                                                                                    
BLAKE      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    

14 rows selected.

SQL> --FIND OUT TOTAL SALARY FOR EACH DNAME
SQL> SELECT SUM(SAL),D.DNAME
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON E.DEPTNO=D.DEPTNO
  4  GROUP BY D.DNAME;

  SUM(SAL) DNAME                                                                                                                    
---------- --------------                                                                                                           
      8750 ACCOUNTING                                                                                                               
     10875 RESEARCH                                                                                                                 
      9400 SALES                                                                                                                    

SQL> 
SQL> 
SQL> --FIND OUT EMPLOYEES WORKING IN CHICAGO AS CLERK
SQL> SELECT E.ENAME,E.JOB,D.LOC
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON E.DEPTNO=D.DEPTNO
  4  AND  E.JOB='CLERK'
  5  AND  D.LOC='CHICAGO';

ENAME      JOB       LOC                                                                                                            
---------- --------- -------------                                                                                                  
JAMES      CLERK     CHICAGO                                                                                                        

SQL> SELECT E.ENAME,E.JOB,D.LOC
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON E.DEPTNO=D.DEPTNO
  4  WHERE  E.JOB='CLERK'
  5  AND  D.LOC='CHICAGO';

ENAME      JOB       LOC                                                                                                            
---------- --------- -------------                                                                                                  
JAMES      CLERK     CHICAGO                                                                                                        

SQL> --DISPLAY ENAME,DNAME ALONG WITH DNAME WHERE NO EMPLOYEES ARE WORKING
SQL> SELECT E.ENAME,D.DNAME
  2  FROM   EMP E RIGHT OUTER JOIN DEPT D
  3  ON     E.DEPTNO=D.DEPTNO;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
CLARK      ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
MILLER     ACCOUNTING                                                                                                               
JONES      RESEARCH                                                                                                                 
FORD       RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
SMITH      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
WARD       SALES                                                                                                                    
TURNER     SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
JAMES      SALES                                                                                                                    
BLAKE      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    
           OPERATIONS                                                                                                               

15 rows selected.

SQL> INSERT INTO EMP(EMPNO,ENAME) VALUES(6666,'XYZ');

1 row created.

SQL> COMMIT;

Commit complete.

SQL> SELECT E.ENAME,D.DNAME
  2  FROM   EMP E LEFT OUTER JOIN DEPT D
  3  ON     E.DEPTNO=D.DEPTNO;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
MILLER     ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
CLARK      ACCOUNTING                                                                                                               
FORD       RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
JONES      RESEARCH                                                                                                                 
SMITH      RESEARCH                                                                                                                 
JAMES      SALES                                                                                                                    
TURNER     SALES                                                                                                                    
BLAKE      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    
WARD       SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
XYZ                                                                                                                                 

15 rows selected.

SQL> SELECT E.ENAME,D.DNAME
  2  FROM   EMP E FULL OUTER JOIN DEPT D
  3  ON     E.DEPTNO=D.DEPTNO;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
SMITH      RESEARCH                                                                                                                 
ALLEN      SALES                                                                                                                    
WARD       SALES                                                                                                                    
JONES      RESEARCH                                                                                                                 
MARTIN     SALES                                                                                                                    
BLAKE      SALES                                                                                                                    
CLARK      ACCOUNTING                                                                                                               
SCOTT      RESEARCH                                                                                                                 
KING       ACCOUNTING                                                                                                               
TURNER     SALES                                                                                                                    
ADAMS      RESEARCH                                                                                                                 
JAMES      SALES                                                                                                                    
FORD       RESEARCH                                                                                                                 
MILLER     ACCOUNTING                                                                                                               
XYZ                                                                                                                                 
           OPERATIONS                                                                                                               

16 rows selected.

SQL> --FIND OUT GRADE FOR EACH EMPLOYEE
SQL> SELECT E.ENAME,E.SAL,S.GRADE,S.LOSAL,S.HISAL
  2  FROM   EMP E JOIN SALGRADE S
  3  ON   E.SAL
  4  BETWEEN S.LOSAL
  5  AND     S.HISAL;

ENAME             SAL      GRADE      LOSAL      HISAL                                                                              
---------- ---------- ---------- ---------- ----------                                                                              
SMITH             800          1        700       1200                                                                              
JAMES             950          1        700       1200                                                                              
ADAMS            1100          1        700       1200                                                                              
WARD             1250          2       1201       1400                                                                              
MARTIN           1250          2       1201       1400                                                                              
MILLER           1300          2       1201       1400                                                                              
TURNER           1500          3       1401       2000                                                                              
ALLEN            1600          3       1401       2000                                                                              
CLARK            2450          4       2001       3000                                                                              
BLAKE            2850          4       2001       3000                                                                              
JONES            2975          4       2001       3000                                                                              
FORD             3000          4       2001       3000                                                                              
SCOTT            3000          4       2001       3000                                                                              
KING             5000          5       3001       9999                                                                              

14 rows selected.

SQL> SELECT E.ENAME,D.DNAME
  2  FROM   EMP E CROSS JOIN DEPT D;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
SMITH      ACCOUNTING                                                                                                               
ALLEN      ACCOUNTING                                                                                                               
WARD       ACCOUNTING                                                                                                               
JONES      ACCOUNTING                                                                                                               
MARTIN     ACCOUNTING                                                                                                               
BLAKE      ACCOUNTING                                                                                                               
CLARK      ACCOUNTING                                                                                                               
SCOTT      ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
TURNER     ACCOUNTING                                                                                                               
ADAMS      ACCOUNTING                                                                                                               
JAMES      ACCOUNTING                                                                                                               
FORD       ACCOUNTING                                                                                                               
MILLER     ACCOUNTING                                                                                                               
XYZ        ACCOUNTING                                                                                                               
SMITH      RESEARCH                                                                                                                 
ALLEN      RESEARCH                                                                                                                 
WARD       RESEARCH                                                                                                                 
JONES      RESEARCH                                                                                                                 
MARTIN     RESEARCH                                                                                                                 
BLAKE      RESEARCH                                                                                                                 
CLARK      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
KING       RESEARCH                                                                                                                 
TURNER     RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
JAMES      RESEARCH                                                                                                                 
FORD       RESEARCH                                                                                                                 
MILLER     RESEARCH                                                                                                                 
XYZ        RESEARCH                                                                                                                 
SMITH      SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
WARD       SALES                                                                                                                    
JONES      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    
BLAKE      SALES                                                                                                                    
CLARK      SALES                                                                                                                    
SCOTT      SALES                                                                                                                    
KING       SALES                                                                                                                    
TURNER     SALES                                                                                                                    
ADAMS      SALES                                                                                                                    
JAMES      SALES                                                                                                                    
FORD       SALES                                                                                                                    
MILLER     SALES                                                                                                                    
XYZ        SALES                                                                                                                    
SMITH      OPERATIONS                                                                                                               
ALLEN      OPERATIONS                                                                                                               
WARD       OPERATIONS                                                                                                               
JONES      OPERATIONS                                                                                                               
MARTIN     OPERATIONS                                                                                                               
BLAKE      OPERATIONS                                                                                                               
CLARK      OPERATIONS                                                                                                               
SCOTT      OPERATIONS                                                                                                               
KING       OPERATIONS                                                                                                               
TURNER     OPERATIONS                                                                                                               
ADAMS      OPERATIONS                                                                                                               
JAMES      OPERATIONS                                                                                                               
FORD       OPERATIONS                                                                                                               
MILLER     OPERATIONS                                                                                                               
XYZ        OPERATIONS                                                                                                               

60 rows selected.

SQL> SELECT E.ENAME,E.SAL,E.JOB,D.DNAME
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON E.JOB='CLERK'
  4  AND E.SAL>950
  5  AND D.DNAME='RESEARCH';

ENAME             SAL JOB       DNAME                                                                                               
---------- ---------- --------- --------------                                                                                      
ADAMS            1100 CLERK     RESEARCH                                                                                            
MILLER           1300 CLERK     RESEARCH                                                                                            

SQL> SELECT E.ENAME,E.SAL,E.JOB,D.DNAME
  2  FROM   EMP E INNER JOIN DEPT D
  3  ON E.JOB='CLERK'
  4  AND E.SAL>950
  5  AND D.DNAME='RESEARCH'
  6  AND E.DEPTNO=D.DEPTNO;

ENAME             SAL JOB       DNAME                                                                                               
---------- ---------- --------- --------------                                                                                      
ADAMS            1100 CLERK     RESEARCH                                                                                            

SQL> SELECT E.ENAME "EMP",M.ENAME "MANAGER"
  2  FROM   EMP E JOIN EMP M
  3  ON  E.MGR=M.EMPNO;

EMP        MANAGER                                                                                                                  
---------- ----------                                                                                                               
FORD       JONES                                                                                                                    
SCOTT      JONES                                                                                                                    
TURNER     BLAKE                                                                                                                    
ALLEN      BLAKE                                                                                                                    
WARD       BLAKE                                                                                                                    
JAMES      BLAKE                                                                                                                    
MARTIN     BLAKE                                                                                                                    
MILLER     CLARK                                                                                                                    
ADAMS      SCOTT                                                                                                                    
BLAKE      KING                                                                                                                     
JONES      KING                                                                                                                     
CLARK      KING                                                                                                                     
SMITH      FORD                                                                                                                     

13 rows selected.

SQL> --FIND OUT EMPLOYEES WHO ARE TAKING SAME SALARIES
SQL> --FIND OUT EMPLOYEES WHO ARE TAKING MORE SALARIES THAN THEIR MANAGER
SQL> --FIND OUT NUMBER OF EMPLOYEES REPORTING TO KING
SQL> SELECT E.ENAME "EMP",E.SAL "EMPSAL",M.ENAME "MAN",M.SAL "MSAL"
  2  FROM   EMP E JOIN EMP M
  3  ON     E.SAL=M.SAL
  4  AND E.EMPNO<>M.EMPNO;

EMP            EMPSAL MAN              MSAL                                                                                         
---------- ---------- ---------- ----------                                                                                         
MARTIN           1250 WARD             1250                                                                                         
WARD             1250 MARTIN           1250                                                                                         
FORD             3000 SCOTT            3000                                                                                         
SCOTT            3000 FORD             3000                                                                                         

SQL> SELECT E.ENAME "EMP",E.SAL "EMPSAL",M.ENAME "MANAGER",M.SAL "MANSAL"
  2  FROM EMP E JOIN EMP M
  3  ON E.MGR=M.EMPNO
  4  AND E.SAL>M.SAL;

EMP            EMPSAL MANAGER        MANSAL                                                                                         
---------- ---------- ---------- ----------                                                                                         
FORD             3000 JONES            2975                                                                                         
SCOTT            3000 JONES            2975                                                                                         

SQL> SELECT COUNT(*),M.ENAME "MANAGER"
  2  FROM   EMP E JOIN EMP M
  3  ON E.MGR=M.EMPNO
  4  AND M.ENAME='KING';
SELECT COUNT(*),M.ENAME "MANAGER"
                *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> ED
Wrote file afiedt.buf

  1  SELECT COUNT(*),M.ENAME "MANAGER"
  2  FROM   EMP E JOIN EMP M
  3  ON E.MGR=M.EMPNO
  4  AND M.ENAME='KING'
  5* GROUP BY M.ENAME
SQL> /

  COUNT(*) MANAGER                                                                                                                  
---------- ----------                                                                                                               
         3 KING                                                                                                                     

SQL> SELECT ENAME,DNAME
  2  FROM  EMP NATURAL JOIN DEPT;

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
CLARK      ACCOUNTING                                                                                                               
MILLER     ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
JONES      RESEARCH                                                                                                                 
SMITH      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
FORD       RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
WARD       SALES                                                                                                                    
TURNER     SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
JAMES      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    
BLAKE      SALES                                                                                                                    

14 rows selected.

SQL> SELECT ENAME,DNAME
  2  FROM EMP JOIN DEPT
  3  USING(DEPTNO);

ENAME      DNAME                                                                                                                    
---------- --------------                                                                                                           
CLARK      ACCOUNTING                                                                                                               
MILLER     ACCOUNTING                                                                                                               
KING       ACCOUNTING                                                                                                               
JONES      RESEARCH                                                                                                                 
SMITH      RESEARCH                                                                                                                 
SCOTT      RESEARCH                                                                                                                 
FORD       RESEARCH                                                                                                                 
ADAMS      RESEARCH                                                                                                                 
WARD       SALES                                                                                                                    
TURNER     SALES                                                                                                                    
ALLEN      SALES                                                                                                                    
JAMES      SALES                                                                                                                    
MARTIN     SALES                                                                                                                    
BLAKE      SALES                                                                                                                    

14 rows selected.

SQL> CL SCR

SQL> --JOINING 3 TABLES
SQL> SELECT E.ENAME,D.DNAME,S.GRADE
  2  FROM  EMP E INNER JOIN DEPT D
  3  ON E.DEPTNO=D.DEPTNO
  4  JOIN SALGRADE S
  5  ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

ENAME      DNAME               GRADE                                                                                                
---------- -------------- ----------                                                                                                
KING       ACCOUNTING              5                                                                                                
FORD       RESEARCH                4                                                                                                
SCOTT      RESEARCH                4                                                                                                
JONES      RESEARCH                4                                                                                                
BLAKE      SALES                   4                                                                                                
CLARK      ACCOUNTING              4                                                                                                
ALLEN      SALES                   3                                                                                                
TURNER     SALES                   3                                                                                                
MILLER     ACCOUNTING              2                                                                                                
MARTIN     SALES                   2                                                                                                
WARD       SALES                   2                                                                                                
ADAMS      RESEARCH                1                                                                                                
JAMES      SALES                   1                                                                                                
SMITH      RESEARCH                1                                                                                                

14 rows selected.

SQL> --FIND OUT EMPLOYEE WHO IS TAKING MAXIMUM SALARY
SQL> SELECT MAX(SAL)
  2  FROM   EMP;

  MAX(SAL)                                                                                                                          
----------                                                                                                                          
      5000                                                                                                                          

SQL> SELECT ENAME,SAL
  2  FROM   EMP
  3  WHERE   SAL=(SELECT MAX(SAL) FROM EMP);

ENAME             SAL                                                                                                               
---------- ----------                                                                                                               
KING             5000                                                                                                               

SQL> --FIND OUT EMPLOYEES WHO ARE TAKING MORE SALARIES THAN 'ADAMS'
SQL> SELECT SAL
  2  FROM   EMP
  3  WHERE  ENAME='ADAMS';

       SAL                                                                                                                          
----------                                                                                                                          
      1100                                                                                                                          

SQL> SELECT ENAME,SAL
  2  FROM   EMP
  3  WHERE  SAL>(SELECT SAL FROM EMP WHERE ENAME='ADAMS');

ENAME             SAL                                                                                                               
---------- ----------                                                                                                               
ALLEN            1600                                                                                                               
WARD             1250                                                                                                               
JONES            2975                                                                                                               
MARTIN           1250                                                                                                               
BLAKE            2850                                                                                                               
CLARK            2450                                                                                                               
SCOTT            3000                                                                                                               
KING             5000                                                                                                               
TURNER           1500                                                                                                               
FORD             3000                                                                                                               
MILLER           1300                                                                                                               

11 rows selected.

SQL> --FIND OUT DNAME IN WHICH TURNER IN WORKING
SQL> SELECT DEPTNO
  2  FROM   EMP
  3  WHERE  ENAME='TURNER';

    DEPTNO                                                                                                                          
----------                                                                                                                          
        30                                                                                                                          

SQL> SELECT DNAME
  2  FROM   DEPT
  3  WHERE  DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='TURNER');

DNAME                                                                                                                               
--------------                                                                                                                      
SALES                                                                                                                               

SQL> --FIND EMPLOYEES REPORTING TO BLAKE
SQL> SELECT EMPNO
  2  FROM   EMP
  3  WHERE  ENAME='BLAKE';

     EMPNO                                                                                                                          
----------                                                                                                                          
      7698                                                                                                                          

SQL> SELECT ENAME,MGR
  2  FROM   EMP
  3  WHERE   MGR=(SELECT EMPNO FROM EMP WHERE ENAME='BLAKE');

ENAME             MGR                                                                                                               
---------- ----------                                                                                                               
ALLEN            7698                                                                                                               
WARD             7698                                                                                                               
MARTIN           7698                                                                                                               
TURNER           7698                                                                                                               
JAMES            7698                                                                                                               

SQL> --FIND OUT SENIORMOST EMPLOYEE
SQL> SELECT MIN(HIREDATE)
  2  FROM  EMP;

MIN(HIRED                                                                                                                           
---------                                                                                                                           
17-DEC-80                                                                                                                           

SQL> SELECT ENAME,HIREDATE
  2  FROM   EMP
  3  WHERE   HIREDATE=(SELECT MIN(HIREDATE) FROM EMP);

ENAME      HIREDATE                                                                                                                 
---------- ---------                                                                                                                
SMITH      17-DEC-80                                                                                                                

SQL> 
SQL> 
SQL> --FIND OUT EMPLOYEES WHO ARE WORKING IN THE SAME JOB AS ALLEN
SQL> --EXCLUDE ALLEN RECORD
SQL> SELECT JOB
  2  FROM   EMP
  3  WHERE  ENAME='ALLEN';

JOB                                                                                                                                 
---------                                                                                                                           
SALESMAN                                                                                                                            

SQL> SELECT ENAME,JOB
  2  FROM   EMP
  3  WHERE  JOB=(SELECT JOB FROM EMP WHERE ENAME='ALLEN');

ENAME      JOB                                                                                                                      
---------- ---------                                                                                                                
ALLEN      SALESMAN                                                                                                                 
WARD       SALESMAN                                                                                                                 
MARTIN     SALESMAN                                                                                                                 
TURNER     SALESMAN                                                                                                                 

SQL> SELECT ENAME,JOB
  2  FROM   EMP
  3  WHERE  JOB=(SELECT JOB FROM EMP WHERE ENAME='ALLEN')
  4  AND ENAME<>'ALLEN';

ENAME      JOB                                                                                                                      
---------- ---------                                                                                                                
WARD       SALESMAN                                                                                                                 
MARTIN     SALESMAN                                                                                                                 
TURNER     SALESMAN                                                                                                                 

SQL> --FIND EMPLOYEES WHO HAVE JOINED IN THE SAME YEAR AS SCOTT,MARTIN
SQL> SELECT TO_CHAR(HIREDATE,'YYYY')
  2  FROM   EMP
  3  WHERE  ENAME IN('SCOTT','MARTIN');

TO_C                                                                                                                                
----                                                                                                                                
1981                                                                                                                                
1987                                                                                                                                

SQL> SELECT ENAME,TO_CHAR(HIREDATE,'YYYY')
  2  FROM   EMP
  3  WHERE  TO_CHAR(HIREDATE,'YYYY')=(SELECT TO_CHAR(HIREDATE,'YYYY')
  4                                   FROM    EMP
  5                                   WHERE  ENAME IN('SCOTT','MARTIN'));
WHERE  TO_CHAR(HIREDATE,'YYYY')=(SELECT TO_CHAR(HIREDATE,'YYYY')
                                 *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row 


SQL> SELECT ENAME,TO_CHAR(HIREDATE,'YYYY')
  2  FROM   EMP
  3  WHERE  TO_CHAR(HIREDATE,'YYYY') IN(SELECT TO_CHAR(HIREDATE,'YYYY')
  4                                   FROM    EMP
  5                                   WHERE  ENAME IN('SCOTT','MARTIN'));

ENAME      TO_C                                                                                                                     
---------- ----                                                                                                                     
FORD       1981                                                                                                                     
JAMES      1981                                                                                                                     
TURNER     1981                                                                                                                     
KING       1981                                                                                                                     
CLARK      1981                                                                                                                     
BLAKE      1981                                                                                                                     
MARTIN     1981                                                                                                                     
JONES      1981                                                                                                                     
WARD       1981                                                                                                                     
ALLEN      1981                                                                                                                     
ADAMS      1987                                                                                                                     
SCOTT      1987                                                                                                                     

12 rows selected.

SQL> SPOOL OFF

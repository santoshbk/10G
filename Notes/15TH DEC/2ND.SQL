SQL> SET VERIFY OFF


SQL> DEFINE V1='TWINKLE TWINKLE LITTLE STAR'
SQL> SELECT REGEXP_COUNT('&V1','[T]') "COUNT OF T"
  2  FROM  DUAL;

COUNT OF T
----------
         5

SQL> --OLD VERSION
SQL> SELECT LENGTH('&V1')-LENGTH(REPLACE('&V1','T',NULL)) "COUNT OF T"
  2  FROM DUAL;

COUNT OF T
----------
         5

SQL>

SQL> SELECT ENAME,HIREDATE,SYSDATE-HIREDATE
  2  FROM EMP;

ENAME      HIREDATE  SYSDATE-HIREDATE
---------- --------- ----------------
SMITH      17-DEC-80       13147.4731
ALLEN      20-FEB-81       13082.4731
WARD       22-FEB-81       13080.4731
JONES      02-APR-81       13041.4731
MARTIN     28-SEP-81       12862.4731
BLAKE      01-MAY-81       13012.4731
CLARK      09-JUN-81       12973.4731
SCOTT      19-APR-87       10833.4731
KING       17-NOV-81       12812.4731
TURNER     08-SEP-81       12882.4731
ADAMS      23-MAY-87       10799.4731
JAMES      03-DEC-81       12796.4731
FORD       03-DEC-81       12796.4731
MILLER     23-JAN-82       12745.4731

14 rows selected.


SQL> SELECT ENAME,HIREDATE,SYSDATE-HIREDATE,(SYSDATE-HIREDATE)/30,MONTHS_BETWEEN(SYSDATE,HIREDATE)
  2  "using function"
  3  FROM EMP;

ENAME      HIREDATE  SYSDATE-HIREDATE (SYSDATE-HIREDATE)/30 using function
---------- --------- ---------------- --------------------- --------------
SMITH      17-DEC-80       13147.4735            438.249117     431.950758
ALLEN      20-FEB-81       13082.4735             436.08245     429.853984
WARD       22-FEB-81       13080.4735            436.015783     429.789468
JONES      02-APR-81       13041.4735            434.715783     428.434629
MARTIN     28-SEP-81       12862.4735            428.749117     422.595919
BLAKE      01-MAY-81       13012.4735            433.749117     427.466887
CLARK      09-JUN-81       12973.4735            432.449117     426.208822
SCOTT      19-APR-87       10833.4735            361.115783     355.886242
KING       17-NOV-81       12812.4735             427.08245     420.950758
TURNER     08-SEP-81       12882.4735            429.415783      423.24108
ADAMS      23-MAY-87       10799.4735             359.98245      354.75721
JAMES      03-DEC-81       12796.4735            426.549117     420.402371
FORD       03-DEC-81       12796.4735            426.549117     420.402371
MILLER     23-JAN-82       12745.4735            424.849117      418.75721

14 rows selected.

SQL> SELECT LAST_DAY(SYSDATE)
  2  FROM DUAL;

LAST_DAY(
---------
31-DEC-16

SQL> SELECT NEXT_DAY(SYSDATE,'THU')
  2  FROM DUAL;

NEXT_DAY(
---------
22-DEC-16

SQL> --FIND OUT 1ST FRIDAY DATE WITHIN THIS MONTH
SQL> SELECT NEXT_DAY(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'FRI') "1ST FRIDAY"
  2  FROM DUAL;

1ST FRIDA
---------
02-DEC-16

SQL> COL "WITHIN MONTH" FORMAT A20

SQL> COL "WITHIN WEEK" FORMAT A20
SQL> COL "WITHIN MONTH" FORMAT A20
SQL> COL "WITHIN YEAR" FORMAT A20
SQL> SELECT ROUND(SYSDATE) "WITHIN WEEK",ROUND(SYSDATE,'MONTH') "WITHIN MONTH",ROUND(SYSDATE,'YEAR') "WITHIN YEAR"
  2  FROM DUAL;

WITHIN WEEK          WITHIN MONTH         WITHIN YEAR
-------------------- -------------------- --------------------
15-DEC-16            01-DEC-16            01-JAN-17

SQL> ED
Wrote file afiedt.buf

  1  SELECT TRUNC(SYSDATE) "WITHIN WEEK",TRUNC(SYSDATE,'MONTH') "WITHIN MONTH",TRUNC(SYSDATE,'YEAR') "WITHIN YEAR"
  2* FROM DUAL
SQL> /

WITHIN WEEK          WITHIN MONTH         WITHIN YEAR
-------------------- -------------------- --------------------
15-DEC-16            01-DEC-16            01-JAN-16

SQL> SELECT TO_CHAR(SYSDATE,'DY'),TO_CHAR(SYSDATE,'DAY')
  2  FROM DUAL;

TO_ TO_CHAR(S
--- ---------
THU THURSDAY

SQL> --FIND EMPLOYEES JOINED ON WEDNESDAY
SQL> SELECT ENAME,HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'DAY')='WEDNESDAY';

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80

SQL> SELECT ENAME,HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'DY')='WED';

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80

SQL> SELECT TO_CHAR(SYSDATE,'MON'),TO_CHAR(SYSDATE,'MONTH')
  2  FROM DUAL;

TO_ TO_CHAR(S
--- ---------
DEC DECEMBER

SQL> --FIND EMPLOYEES JOINED IN SEPTEMBER
SQL> SELECT ENAME,HIREDATE FROM EMP WHERE TO_CHAR(HIREDATE,'MONTH')='SEPTEMBER';

ENAME      HIREDATE
---------- ---------
MARTIN     28-SEP-81
TURNER     08-SEP-81

SQL> SELECT TO_CHAR(SYSDATE,'YEAR'),TO_CHAR(SYSDATE,'YY'),TO_CHAR(SYSDATE,'YYYY')
  2  FROM DUAL;

TO_CHAR(SYSDATE,'YEAR')                    TO TO_C
------------------------------------------ -- ----
TWENTY SIXTEEN                             16 2016

SQL> SELECT TO_CHAR(SYSDATE,'DDSPTH MONTH YEAR') FROM DUAL;

TO_CHAR(SYSDATE,'DDSPTHMONTHYEAR')
-------------------------------------------------------------------
FIFTEENTH DECEMBER  TWENTY SIXTEEN

SQL> SELECT TO_CHAR(SYSDATE,'MM') FROM DUAL;

TO
--
12

SQL> SELECT TO_CHAR(SYSDATE,'D') "WITHIN WEEK",
  2  TO_CHAR(SYSDATE,'DD') "WITHIN MONTH",
  3  TO_CHAR(SYSDATE,'DDD') "WITHIN YEAR"
  4  FROM DUAL;

WITHIN WEEK          WITHIN MONTH         WITHIN YEAR
-------------------- -------------------- --------------------
5                    15                   350

SQL> --FIND EMPLOYEES JOINED IN LEAP YEAR
SQL> SELECT ENAME,HIREDATE,MOD(TO_CHAR(HIREDATE,'YYYY'),4)
  2  FROM EMP;

ENAME      HIREDATE  MOD(TO_CHAR(HIREDATE,'YYYY'),4)
---------- --------- -------------------------------
SMITH      17-DEC-80                               0
ALLEN      20-FEB-81                               1
WARD       22-FEB-81                               1
JONES      02-APR-81                               1
MARTIN     28-SEP-81                               1
BLAKE      01-MAY-81                               1
CLARK      09-JUN-81                               1
SCOTT      19-APR-87                               3
KING       17-NOV-81                               1
TURNER     08-SEP-81                               1
ADAMS      23-MAY-87                               3
JAMES      03-DEC-81                               1
FORD       03-DEC-81                               1
MILLER     23-JAN-82                               2

14 rows selected.

SQL> SELECT ENAME,HIREDATE FROM EMP
  2  WHERE MOD(TO_CHAR(HIREDATE,'YYYY'),4)=0;

ENAME      HIREDATE
---------- ---------
SMITH      17-DEC-80

SQL> SELECT TO_CHAR(SYSDATE,'DDSPTH MONTH YEAR')
  2  FROM DUAL;

TO_CHAR(SYSDATE,'DDSPTHMONTHYEAR')
-------------------------------------------------------------------
FIFTEENTH DECEMBER  TWENTY SIXTEEN

SQL> SELECT TO_CHAR(SYSDATE,'Q') "QUARTER",
  2  TO_CHAR(SYSDATE,'W') "WITHIN WEEK",
  3  TO_CHAR(SYSDATE,'WW') "WITHIN
  4
SQL> SELECT TO_CHAR(SYSDATE,'Q') "QUARTER",
  2  TO_CHAR(SYSDATE,'W') "WITHIN MONTH",
  3  TO_CHAR(SYSDATE,'WW') "WITHIN YEAR"
  4  FROM DUAL;

Q WITHIN MONTH         WITHIN YEAR
- -------------------- --------------------
4 3                    50

SQL> --FIND OUT THE DAY ON WHICH INDIA BECAME INDEPENDENT
SQL> SELECT TO_CHAR('15-AUG-47','DAY')
  2  FROM DUAL;
SELECT TO_CHAR('15-AUG-47','DAY')
               *
ERROR at line 1:
ORA-01722: invalid number


SQL> SELECT TO_CHAR(TO_DATE('15-AUG-47'),'DAY')
  2  FROM DUAL;

TO_CHAR(T
---------
THURSDAY

SQL> SELECT TO_CHAR(TO_DATE('15-AUG-1947'),'DAY')
  2  FROM DUAL;

TO_CHAR(T
---------
FRIDAY




































































































SQL> SELECT TO_DATE('12/15/2016','MM/DD/YYYY')
  2  FROM DUAL;

TO_DATE('                                                                                                                           
---------                                                                                                                           
15-DEC-16                                                                                                                           

SQL> ALTER SESSION SET NLS_DATE_FORMAT='MM/DD/YYYY';

Session altered.

SQL> SELECT SYSDATE FROM DUAL;

SYSDATE                                                                                                                             
----------                                                                                                                          
12/15/2016                                                                                                                          

SQL> ALTER SESSION SET NLS_DATE_FORMAT='DD-MON-YY';

Session altered.

SQL> SELECT TO_CHAR(SYSDATE,'HH24:MI:SS')
  2  FROM DUAL;

TO_CHAR(                                                                                                                            
--------                                                                                                                            
11:41:13                                                                                                                            

SQL> SELECT CURRENT_TIMESTAMP FROM DUAL;

CURRENT_TIMESTAMP                                                                                                                   
---------------------------------------------------------------------------                                                         
15-DEC-16 11.41.56.377000 AM +05:30                                                                                                 

SQL> 
SQL> 
SQL> SELECT * FROM V$TIMEZONE_NAMES
  2  
SQL> 
SQL> ALTER SESSION SET TIME_ZONE='CET';

Session altered.

SQL> SELECT CURRENT_TIMESTAMP FROM DUAL;

CURRENT_TIMESTAMP                                                                                                                   
---------------------------------------------------------------------------                                                         
15-DEC-16 07.13.49.392000 AM CET                                                                                                    

SQL> ALTER SESSION SET TIME_ZONE='+5:30';

Session altered.

SQL> SELECT CURRENT_TIMESTAMP FROM DUAL;

CURRENT_TIMESTAMP                                                                                                                   
---------------------------------------------------------------------------                                                         
15-DEC-16 11.45.57.926000 AM +05:30                                                                                                 

SQL> SELECT SYSDATE+TO_YMINTERVAL('2-4')
  2  FROM DUAL;

SYSDATE+T                                                                                                                           
---------                                                                                                                           
15-APR-19                                                                                                                           

SQL> 
SQL> 
SQL> SELECT CURRENT_TIMESTAMP,CURRENT_TIMESTAMP+TO_DSINTERVAL('3 3:20:45')
  2  FROM DUAL;

CURRENT_TIMESTAMP                                                                                                                   
---------------------------------------------------------------------------                                                         
CURRENT_TIMESTAMP+TO_DSINTERVAL('33:20:45')                                                                                         
---------------------------------------------------------------------------                                                         
15-DEC-16 11.49.37.439000 AM +05:30                                                                                                 
18-DEC-16 03.10.22.439000000 PM +05:30                                                                                              
                                                                                                                                    

SQL> 
SQL> 
SQL> SELECT ENAME,SAL,COMM,SAL+COMM
  2  FROM EMP;

ENAME             SAL       COMM   SAL+COMM                                                                                         
---------- ---------- ---------- ----------                                                                                         
SMITH             800                                                                                                               
ALLEN            1600        300       1900                                                                                         
WARD             1250        500       1750                                                                                         
JONES            2975                                                                                                               
MARTIN           1250       1400       2650                                                                                         
BLAKE            2850                                                                                                               
CLARK            2450                                                                                                               
SCOTT            3000                                                                                                               
KING             5000                                                                                                               
TURNER           1500          0       1500                                                                                         
ADAMS            1100                                                                                                               
JAMES             950                                                                                                               
FORD             3000                                                                                                               
MILLER           1300                                                                                                               

14 rows selected.

SQL> SET VERIFY OFF
SQL> CL SCR

SQL> SELECT NVL(&A,&B)
  2  FROM DUAL;
Enter value for a: 10
Enter value for b: 20

NVL(10,20)                                                                                                                          
----------                                                                                                                          
        10                                                                                                                          

SQL> /
Enter value for a: NULL
Enter value for b: 20

NVL(NULL,20)                                                                                                                        
------------                                                                                                                        
          20                                                                                                                        

SQL> SELECT ENAME,SAL,COMM,SAL+COMM,NVL((SAL+COMM),SAL) FROM EMP;

ENAME             SAL       COMM   SAL+COMM NVL((SAL+COMM),SAL)                                                                     
---------- ---------- ---------- ---------- -------------------                                                                     
SMITH             800                                       800                                                                     
ALLEN            1600        300       1900                1900                                                                     
WARD             1250        500       1750                1750                                                                     
JONES            2975                                      2975                                                                     
MARTIN           1250       1400       2650                2650                                                                     
BLAKE            2850                                      2850                                                                     
CLARK            2450                                      2450                                                                     
SCOTT            3000                                      3000                                                                     
KING             5000                                      5000                                                                     
TURNER           1500          0       1500                1500                                                                     
ADAMS            1100                                      1100                                                                     
JAMES             950                                       950                                                                     
FORD             3000                                      3000                                                                     
MILLER           1300                                      1300                                                                     

14 rows selected.

SQL> SELECT NVL2(&A,&B,&C)
  2  FROM DUAL;
Enter value for a: 10
Enter value for b: 20
Enter value for c: 30

NVL2(10,20,30)                                                                                                                      
--------------                                                                                                                      
            20                                                                                                                      

SQL> /
Enter value for a: NULL
Enter value for b: 20
Enter value for c: 30

NVL2(NULL,20,30)                                                                                                                    
----------------                                                                                                                    
              30                                                                                                                    

SQL> SELECT ENAME,MGR,SAL,COMM,NVL2(MGR,SAL,COMM)
  2  FROM EMP;

ENAME             MGR        SAL       COMM NVL2(MGR,SAL,COMM)                                                                      
---------- ---------- ---------- ---------- ------------------                                                                      
SMITH            7902        800                           800                                                                      
ALLEN            7698       1600        300               1600                                                                      
WARD             7698       1250        500               1250                                                                      
JONES            7839       2975                          2975                                                                      
MARTIN           7698       1250       1400               1250                                                                      
BLAKE            7839       2850                          2850                                                                      
CLARK            7839       2450                          2450                                                                      
SCOTT            7566       3000                          3000                                                                      
KING                        5000                                                                                                    
TURNER           7698       1500          0               1500                                                                      
ADAMS            7788       1100                          1100                                                                      
JAMES            7698        950                           950                                                                      
FORD             7566       3000                          3000                                                                      
MILLER           7782       1300                          1300                                                                      

14 rows selected.

SQL> SELECT NULLIF(&A,&B)
  2  FROM DUAL;
Enter value for a: 10
Enter value for b: 20

NULLIF(10,20)                                                                                                                       
-------------                                                                                                                       
           10                                                                                                                       

SQL> /
Enter value for a: 10
Enter value for b: 10

NULLIF(10,10)                                                                                                                       
-------------                                                                                                                       
                                                                                                                                    

SQL> SELECT ENAME,LENGTH(ENAME),SAL,LENGTH(SAL),NULLIF(LENGTH(ENAME),LENGTH(SAL)) "NULLIF"
  2  FROM EMP;

ENAME      LENGTH(ENAME)        SAL LENGTH(SAL)     NULLIF                                                                          
---------- ------------- ---------- ----------- ----------                                                                          
SMITH                  5        800           3          5                                                                          
ALLEN                  5       1600           4          5                                                                          
WARD                   4       1250           4                                                                                     
JONES                  5       2975           4          5                                                                          
MARTIN                 6       1250           4          6                                                                          
BLAKE                  5       2850           4          5                                                                          
CLARK                  5       2450           4          5                                                                          
SCOTT                  5       3000           4          5                                                                          
KING                   4       5000           4                                                                                     
TURNER                 6       1500           4          6                                                                          
ADAMS                  5       1100           4          5                                                                          
JAMES                  5        950           3          5                                                                          
FORD                   4       3000           4                                                                                     
MILLER                 6       1300           4          6                                                                          

14 rows selected.

SQL> SELECT COALESCE(&A,&B,&C)
  2  FROM DUAL;
Enter value for a: 10
Enter value for b: 20
Enter value for c: 30

COALESCE(10,20,30)                                                                                                                  
------------------                                                                                                                  
                10                                                                                                                  

SQL> /
Enter value for a: NULL
Enter value for b: 20
Enter value for c: 30

COALESCE(NULL,20,30)                                                                                                                
--------------------                                                                                                                
                  20                                                                                                                

SQL> /
Enter value for a: NULL
Enter value for b: NULL
Enter value for c: 30

COALESCE(NULL,NULL,30)                                                                                                              
----------------------                                                                                                              
                    30                                                                                                              

SQL> SELECT ENAME,COMM,MGR,SAL,COALESCE(MGR,COMM,SAL)
  2  FROM EMP;

ENAME            COMM        MGR        SAL COALESCE(MGR,COMM,SAL)                                                                  
---------- ---------- ---------- ---------- ----------------------                                                                  
SMITH                       7902        800                   7902                                                                  
ALLEN             300       7698       1600                   7698                                                                  
WARD              500       7698       1250                   7698                                                                  
JONES                       7839       2975                   7839                                                                  
MARTIN           1400       7698       1250                   7698                                                                  
BLAKE                       7839       2850                   7839                                                                  
CLARK                       7839       2450                   7839                                                                  
SCOTT                       7566       3000                   7566                                                                  
KING                                   5000                   5000                                                                  
TURNER              0       7698       1500                   7698                                                                  
ADAMS                       7788       1100                   7788                                                                  
JAMES                       7698        950                   7698                                                                  
FORD                        7566       3000                   7566                                                                  
MILLER                      7782       1300                   7782                                                                  

14 rows selected.

SQL> SELECT ENAME,COMM,MGR,SAL,COALESCE(COMM,MGR,SAL)
  2  FROM EMP;

ENAME            COMM        MGR        SAL COALESCE(COMM,MGR,SAL)                                                                  
---------- ---------- ---------- ---------- ----------------------                                                                  
SMITH                       7902        800                   7902                                                                  
ALLEN             300       7698       1600                    300                                                                  
WARD              500       7698       1250                    500                                                                  
JONES                       7839       2975                   7839                                                                  
MARTIN           1400       7698       1250                   1400                                                                  
BLAKE                       7839       2850                   7839                                                                  
CLARK                       7839       2450                   7839                                                                  
SCOTT                       7566       3000                   7566                                                                  
KING                                   5000                   5000                                                                  
TURNER              0       7698       1500                      0                                                                  
ADAMS                       7788       1100                   7788                                                                  
JAMES                       7698        950                   7698                                                                  
FORD                        7566       3000                   7566                                                                  
MILLER                      7782       1300                   7782                                                                  

14 rows selected.

SQL> /* DISPLAY ENAME,JOB,SAL,BONUS
SQL>  BONUS IS BASED ON JOB
SQL>  IF JOB='CLERK' BONUS=2.0*SAL
SQL>          'SALESMAN' BONUS=2.5*SAL
SQL>          'ANALYST'  BONUS=2.25*SAL
SQL>     OTHERS   ONLY SAL */
SQL> SELECT ENAME,JOB,SAL,CASE
  2  (WHEN JOB='CLERK' THEN 2.0*SAL
  3   WHEN JOB='SALESMAN' THEN 2.5*SAL
  4   WHEN JOB='ANALYST'  THEN  2.25*SAL
  5   ELSE
  6    SAL
  7  END) "BONUS"
  8  FROM EMP;
(WHEN JOB='CLERK' THEN 2.0*SAL
      *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> ED
Wrote file afiedt.buf

  1  SELECT ENAME,JOB,SAL,(CASE
  2  WHEN JOB='CLERK' THEN 2.0*SAL
  3   WHEN JOB='SALESMAN' THEN 2.5*SAL
  4   WHEN JOB='ANALYST'  THEN  2.25*SAL
  5   ELSE
  6    SAL
  7  END) "BONUS"
  8* FROM EMP
SQL> /

ENAME      JOB              SAL      BONUS                                                                                          
---------- --------- ---------- ----------                                                                                          
SMITH      CLERK            800       1600                                                                                          
ALLEN      SALESMAN        1600       4000                                                                                          
WARD       SALESMAN        1250       3125                                                                                          
JONES      MANAGER         2975       2975                                                                                          
MARTIN     SALESMAN        1250       3125                                                                                          
BLAKE      MANAGER         2850       2850                                                                                          
CLARK      MANAGER         2450       2450                                                                                          
SCOTT      ANALYST         3000       6750                                                                                          
KING       PRESIDENT       5000       5000                                                                                          
TURNER     SALESMAN        1500       3750                                                                                          
ADAMS      CLERK           1100       2200                                                                                          
JAMES      CLERK            950       1900                                                                                          
FORD       ANALYST         3000       6750                                                                                          
MILLER     CLERK           1300       2600                                                                                          

14 rows selected.

SQL> SELECT ENAME,SAL,JOB,DECODE(JOB,'CLERK',2.0*SAL,
  2                                  'SALESMAN',2.5*SAL,
  3                                  'ANALYST',2.25*SAL,SAL) "BONUS"
  4  FROM   EMP
  5  ORDER BY JOB;

ENAME             SAL JOB            BONUS                                                                                          
---------- ---------- --------- ----------                                                                                          
SCOTT            3000 ANALYST         6750                                                                                          
FORD             3000 ANALYST         6750                                                                                          
MILLER           1300 CLERK           2600                                                                                          
JAMES             950 CLERK           1900                                                                                          
SMITH             800 CLERK           1600                                                                                          
ADAMS            1100 CLERK           2200                                                                                          
BLAKE            2850 MANAGER         2850                                                                                          
JONES            2975 MANAGER         2975                                                                                          
CLARK            2450 MANAGER         2450                                                                                          
KING             5000 PRESIDENT       5000                                                                                          
TURNER           1500 SALESMAN        3750                                                                                          
MARTIN           1250 SALESMAN        3125                                                                                          
WARD             1250 SALESMAN        3125                                                                                          
ALLEN            1600 SALESMAN        4000                                                                                          

14 rows selected.

SQL> SELECT ENAME,DEPTNO
  2  FROM EMP;

ENAME          DEPTNO                                                                                                               
---------- ----------                                                                                                               
SMITH              20                                                                                                               
ALLEN              30                                                                                                               
WARD               30                                                                                                               
JONES              20                                                                                                               
MARTIN             30                                                                                                               
BLAKE              30                                                                                                               
CLARK              10                                                                                                               
SCOTT              20                                                                                                               
KING               10                                                                                                               
TURNER             30                                                                                                               
ADAMS              20                                                                                                               
JAMES              30                                                                                                               
FORD               20                                                                                                               
MILLER             10                                                                                                               

14 rows selected.

SQL> SELECT ENAME,DEPTNO
  2  FROM   EMP
  3  WHERE DEPTNO=30;

ENAME          DEPTNO                                                                                                               
---------- ----------                                                                                                               
ALLEN              30                                                                                                               
WARD               30                                                                                                               
MARTIN             30                                                                                                               
BLAKE              30                                                                                                               
TURNER             30                                                                                                               
JAMES              30                                                                                                               

6 rows selected.

SQL> --FIND HOW MANY EMPLOYEES ARE WORKING
SQL> SELECT COUNT(*)
  2  FROM   EMP;

  COUNT(*)                                                                                                                          
----------                                                                                                                          
        14                                                                                                                          

SQL> SELECT COUNT(*)
  2  FROM  EMP
  3  WHERE DEPTNO=&DEPTNO;
Enter value for deptno: 10

  COUNT(*)                                                                                                                          
----------                                                                                                                          
         3                                                                                                                          

SQL> /
Enter value for deptno: 20

  COUNT(*)                                                                                                                          
----------                                                                                                                          
         5                                                                                                                          

SQL> SELECT COUNT(*),COUNT(ENAME),COUNT(COMM)
  2  FROM   EMP;

  COUNT(*) COUNT(ENAME) COUNT(COMM)                                                                                                 
---------- ------------ -----------                                                                                                 
        14           14           4                                                                                                 

SQL> SELECT COUNT(HIREDATE),COUNT(SAL),COUNT(JOB)
  2  FROM   EMP;

COUNT(HIREDATE) COUNT(SAL) COUNT(JOB)                                                                                               
--------------- ---------- ----------                                                                                               
             14         14         14                                                                                               

SQL> --TO FIND MINIMUM SALARY
SQL> SELECT MIN(SAL)
  2  FROM   EMP;

  MIN(SAL)                                                                                                                          
----------                                                                                                                          
       800                                                                                                                          

SQL> SELECT MIN(SAL)
  2  FROM   EMP
  3  WHERE  JOB='SALESMAN';

  MIN(SAL)                                                                                                                          
----------                                                                                                                          
      1250                                                                                                                          

SQL> SELECT MIN(ENAME),MIN(HIREDATE),MIN(EMPNO)
  2  FROM   EMP;

MIN(ENAME) MIN(HIRED MIN(EMPNO)                                                                                                     
---------- --------- ----------                                                                                                     
ADAMS      17-DEC-80       7369                                                                                                     

SQL> SELECT MAX(ENAME),MAX(HIREDATE),MAX(EMPNO)
  2  FROM   EMP;

MAX(ENAME) MAX(HIRED MAX(EMPNO)                                                                                                     
---------- --------- ----------                                                                                                     
WARD       23-MAY-87       7934                                                                                                     

SQL> SELECT AVG(SAL),SUM(SAL)
  2  FROM   EMP;

  AVG(SAL)   SUM(SAL)                                                                                                               
---------- ----------                                                                                                               
2073.21429      29025                                                                                                               

SQL> SELECT COUNT(*),MIN(SAL),MAX(SAL),AVG(SAL),SUM(SAL)
  2  FROM   EMP;

  COUNT(*)   MIN(SAL)   MAX(SAL)   AVG(SAL)   SUM(SAL)                                                                              
---------- ---------- ---------- ---------- ----------                                                                              
        14        800       5000 2073.21429      29025                                                                              

SQL> --TO FIND TOTAL SALARY FOR EACH DEPTNO
SQL> SELECT SUM(SAL),DEPTNO
  2  FROM   EMP
  3  GROUP BY DEPTNO;

  SUM(SAL)     DEPTNO                                                                                                               
---------- ----------                                                                                                               
      9400         30                                                                                                               
     10875         20                                                                                                               
      8750         10                                                                                                               

SQL> 
SQL> 
SQL> 
SQL> --FIND NUMBER OF EMPLOYEES WORKING IN EACH JOB
SQL> SELECT COUNT(*),JOB
  2  FROM   EMP
  3  GROUP BY JOB;

  COUNT(*) JOB                                                                                                                      
---------- ---------                                                                                                                
         4 CLERK                                                                                                                    
         4 SALESMAN                                                                                                                 
         1 PRESIDENT                                                                                                                
         3 MANAGER                                                                                                                  
         2 ANALYST                                                                                                                  

SQL> --FIND OUT NUMBER OF EMPLOYEES JOINED YEARWISE
SQL> 
SQL> 
SQL> --FIND OUT NUMBER OF EMPLOYEES JOINED MONTHWISE
SQL> --FIND OUT NUMBER OF EMPLOYEES JOINED DAYWISE
SQL> 
SQL> 
SQL> 
SQL> 
SQL> --FIND OUT NUMBER OF EMPLOYEES JOINED QUARTERWISE
SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'YYYY')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'YYYY');

  COUNT(*) TO_C                                                                                                                     
---------- ----                                                                                                                     
         2 1987                                                                                                                     
         1 1980                                                                                                                     
         1 1982                                                                                                                     
        10 1981                                                                                                                     

SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'MONTH')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'MONTH');

  COUNT(*) TO_CHAR(H                                                                                                                
---------- ---------                                                                                                                
         2 FEBRUARY                                                                                                                 
         1 JANUARY                                                                                                                  
         2 APRIL                                                                                                                    
         1 JUNE                                                                                                                     
         1 NOVEMBER                                                                                                                 
         3 DECEMBER                                                                                                                 
         2 SEPTEMBER                                                                                                                
         2 MAY                                                                                                                      

8 rows selected.

SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'Q')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'Q');

  COUNT(*) T                                                                                                                        
---------- -                                                                                                                        
         3 1                                                                                                                        
         2 3                                                                                                                        
         4 4                                                                                                                        
         5 2                                                                                                                        

SQL> SELECT COUNT(*),TO_CHAR(HIREDATE,'DAY')
  2  FROM   EMP
  3  GROUP BY TO_CHAR(HIREDATE,'DAY');

  COUNT(*) TO_CHAR(H                                                                                                                
---------- ---------                                                                                                                
         3 THURSDAY                                                                                                                 
         2 SATURDAY                                                                                                                 
         3 TUESDAY                                                                                                                  
         1 WEDNESDAY                                                                                                                
         2 SUNDAY                                                                                                                   
         1 MONDAY                                                                                                                   
         2 FRIDAY                                                                                                                   

7 rows selected.

SQL> SPOOL OFF

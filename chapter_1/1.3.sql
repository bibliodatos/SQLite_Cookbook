-- Finding rows that satisfy multiple conditions

SELECT *
  FROM emp
WHERE deptno = 10
  OR comm IS NOT NULL
  OR sal <= 2000 AND deptno=20;

/*
  DEPTNO IS 10
  COMM is not NULL
  salary is $2000 or less for any employee in department 20
*/

-- no differences from MySQL

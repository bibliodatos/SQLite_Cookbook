-- Finding rows that satisfy multiple conditions

SELECT *
  FROM emp
WHERE deptno = 10
  OR comm IS NOT NULL
  OR sal <= 2000 AND deptno=20;

-- no differences from MySQL

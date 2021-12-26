/*
  Query 2.1 -  Results in a specified order
*/

-- Order by smallest salary to largest salary
SELECT ename, job, sal
  FROM emp
  WHERE deptno = 10
  ORDER BY sal ASC;

-- Order by largest salary to smallest salary
SELECT ename, job, sal
  FROM emp
  WHERE deptno = 10
  ORDER BY sal DESC;

-- Order by largest value in third column to smallest
SELECT ename, job, sal
  FROM emp
  WHERE deptno = 10
  ORDER BY 3 DESC;

-- no differences from MySQL

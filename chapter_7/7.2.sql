-- Example 7.2 Finding the min/max value in a column

SELECT MIN(sal) AS min_sal, MAX(sal) AS max_sal
  FROM emp;

SELECT MIN(sal) AS min_sal, MAX(sal) AS max_sal
  FROM emp
GROUP BY deptno;


-- No difference between SQLite and MySQL

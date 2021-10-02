-- Example 7.1 Computing an average

SELECT AVG(sal) AS avg_sal
  FROM emp;

SELECT AVG(sal) AS avg_sal
  FROM emp
GROUP BY deptno;

-- No difference between SQLite and MySQL

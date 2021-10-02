-- Example 7.3 Summing the values in a column

SELECT SUM(sal)
  FROM emp;

SELECT SUM(sal)
  FROM emp
GROUP BY deptno;


-- No difference between SQLite and MySQL

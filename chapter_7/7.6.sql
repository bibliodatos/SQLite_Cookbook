-- Example 7.6 Generating a running total

-- Running total of salaries for all employees
SELECT ename, sal,
  SUM(sal) OVER (ORDER BY sal,empno) AS running_total
FROM emp
  ORDER BY 2;

-- No difference between SQLite and MySQL

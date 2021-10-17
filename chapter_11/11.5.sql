-- Example 11.5 SELECTing the top N records


/*
  We want to find the employee with the top 5 salaries and we want to include
  all ties in the result. Use DENSE_RANK window function.
*/
SELECT ename, sal
FROM (
  SELECT ename, sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS dr
  FROM emp
) AS x
WHERE dr <= 5;


-- No difference between SQLite and MySQL

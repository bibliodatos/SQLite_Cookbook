-- Example 11.6 Finding the records with the highest and lowest values


/*
  We want to find the employees with the top 5 salaries and we want to include
  all ties in the result. Use DENSE_RANK window function.
*/
SELECT ename, sal
FROM (
  SELECT ename, sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS dr
  FROM emp
) AS x
WHERE dr <= 5;


-- No difference between SQLite and MySQL

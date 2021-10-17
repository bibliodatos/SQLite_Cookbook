-- Example 11.9 Ranking results


/*
  Rank the employee salaries while allowing for ties.
  Use the DENSE_RANK OVER window function.
*/
SELECT DENSE_RANK() OVER(ORDER BY sal) AS rnk, sal
FROM emp;

-- No difference between SQLite and MySQL

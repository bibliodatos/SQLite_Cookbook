-- Example 7.13 Compute averages without high and low values

/*
  Use subqueries to eliminate the max and min salaries from the average
*/
SELECT AVG(sal)
  FROM emp
WHERE sal NOT IN (
  (SELECT MIN(sal) FROM emp),
  (SELECT MAX(sal) FROM emp)
);

-- No difference between SQLite and MySQL

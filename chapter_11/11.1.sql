-- Example 11.1 Paginating through a result set

/*
  Use the ROW_NUMBER window function to return the first five results
*/
SELECT sal
  FROM (
    SELECT row_number() OVER (ORDER BY sal) AS rn,
    sal
    FROM emp
  ) AS x
WHERE rn BETWEEN 1 AND 5 ;

/*
  Use the ROW_NUMBER window function to return results 6 through 10
*/
SELECT sal
  FROM (
    SELECT row_number() OVER (ORDER BY sal) AS rn,
    sal
    FROM emp
  ) AS x
WHERE rn BETWEEN 6 AND 10;


-- No difference between SQLite and MySQL

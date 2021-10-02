-- Example 7.9 Calculating a mode


/*
  Mode: the element that appears most frequently in a set of data
  We use DENSE_RANK window function because it will handle ties correctly.
*/
SELECT sal
  FROM (
    SELECT sal,
      DENSE_RANK() over (ORDER BY cnt DESC) AS rnk
    FROM (
        SELECT sal, COUNT(*) AS cnt
          FROM emp
        WHERE deptno = 20
        GROUP BY sal
      ) AS x
    ) AS y
WHERE rnk = 1;

-- No difference between SQLite and MySQL

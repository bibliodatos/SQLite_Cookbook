-- Example 11.5 SELECTing the top N records


/*

*/
SELECT ename, sal
FROM (
  SELECT ename, sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS dr
  FROM emp
) AS x
WHERE dr <= 5;


-- No difference between SQLite and MySQL

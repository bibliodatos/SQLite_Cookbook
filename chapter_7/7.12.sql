-- Example 7.12 Aggregating nullable columns

/*
  To include NULLs in the average use COALESCE to make them 0 instead
*/
SELECT AVG(COALESCE(comm,0)) AS avg_comm
FROM emp
WHERE deptno = 30;

-- No difference between SQLite and MySQL

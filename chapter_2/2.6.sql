/*
  Query 2.6 - Sorting on a data-dependent key
*/

-- Sort by commission if job is 'SALESPERSON' otherwise sort by salary
SELECT ename, sal, job, comm
  FROM emp
ORDER BY CASE WHEN job = 'SALESPERSON' THEN comm ELSE sal END

-- No differences from SQLite to MySQL

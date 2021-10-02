-- Example 7.11 Finding the percentage of a total

/*
  With SQLite you have to cast to REAL data type from INTEGER
  in order for the calculation to return a percent. Otherwise
  the division of integers gets rounding to nearest INTEGER resulting
  in 0 or 1 being returned.
*/
SELECT (SUM(CASE WHEN deptno=10 THEN sal END)
        / CAST(SUM(sal) AS REAL)
       ) * 100 AS pct
FROM emp;

/*
  MySQL does not require the CAST
*/
SELECT (SUM(CASE WHEN deptno=10 THEN sal END)
        / SUM(sal)
       ) * 100 AS pct
FROM emp;

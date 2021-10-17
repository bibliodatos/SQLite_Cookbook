-- Example 12.2 Pivoting a result set into multiple rows

/*
  Pivot using MAX and CASE statements along with ROW_NUMBER OVER
*/
SELECT MAX(CASE WHEN job='CLERK' THEN ename ELSE NULL END) AS clerks,
	MAX(CASE WHEN job='ANALYST' THEN ename ELSE NULL END) AS analysts,
	MAX(CASE WHEN job='MANAGER' THEN ename ELSE NULL END) AS mgrs,
	MAX(CASE WHEN job='PRESIDENT' THEN ename ELSE NULL END) AS prez,
	MAX(CASE WHEN job='SALESMAN' THEN ename ELSE NULL END) AS sales
FROM

(
SELECT job, ename,
	ROW_NUMBER() OVER (PARTITION by job ORDER BY ename) AS rn
FROM emp
) AS x

GROUP BY rn;

-- No difference between SQLite and MySQL

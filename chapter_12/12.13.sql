-- Example 12.13 Calculating subtotals for all possible expression combinations

/*
  Sum all salaries by department, and sum by job for every job/deptno
  combination. We also want a grand total as the last row.
*/
SELECT  deptno, job,
	'TOTAL BY DEPT AND JOB' as category,
	SUM(sal) as sal
FROM emp
GROUP BY deptno, job

UNION ALL

SELECT NULL, job, 'TOTAL BY JOB', SUM(sal)
FROM emp
GROUP BY job

UNION ALL

SELECT deptno, NULL, 'TOTAL BY DEPT', SUM(sal)
FROM emp
GROUP BY deptno

UNION ALL

SELECT NULL, NULL, 'GRAND TOTAL FOR TABLE', SUM(sal)
FROM emp;

/*
	SQLite does not have CUBE() function that some DMBS's have and neither does
  MySQL so this solution will work for either.
*/

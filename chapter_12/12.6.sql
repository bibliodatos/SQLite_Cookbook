-- Example 12.6 Pivoting a result set to facilitate inter-row calculations

/*
	Calculate the difference between department 20 total salaries (the highest)
	and the other departments. Use CASE statement in a subquery to pivot. 
*/
SELECT d20_sal - d10_sal AS d20_10_diff,
	d20_sal - d30_sal AS d20_30_diff
FROM
(
SELECT SUM (CASE WHEN deptno = 10 THEN sal END) AS d10_sal,
	SUM (CASE WHEN deptno = 20 THEN sal END) AS d20_sal,
	SUM (CASE WHEN deptno = 30 THEN sal END) AS d30_sal
FROM emp AS e
);

-- No difference between SQLite and MySQL

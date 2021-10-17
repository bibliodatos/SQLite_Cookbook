-- Example 12.8 Creating predefined number of buckets

/*
	Organized the employees in emp table into four buckets using the NTILE()
	window function.
*/
SELECT NTILE(4) OVER (ORDER BY empno) AS grp,
	empno,
	ename
FROM emp

-- No difference between SQLite and MySQL

-- Example 12.5 Suppress repeating values from a result set

/*
	Return department number and employee name from emp table but we want to
	display each department number just once per department.
*/
SELECT
	CASE WHEN
		LAG(deptno) OVER (ORDER BY deptno) = deptno THEN NULL
		ELSE deptno
	END AS DEPTNO,
	ename
FROM emp;

-- No difference between SQLite and MySQL

-- Example 12.16 Creating a sparse matrix

/*
	Matrix transposing the deptno and job columns of emp table
*/
SELECT
	CASE deptno WHEN 10 THEN ename END AS d10,
	CASE deptno WHEN 20 THEN ename END AS d20,
	CASE deptno WHEN 30 THEN ename END AS d30,
	CASE job WHEN 'CLERK' THEN ename END AS clerks,
	CASE job WHEN 'MANAGER' THEN ename END AS mgrs,
	CASE job WHEN 'PRESIDENT' THEN ename END AS prez,
	CASE job WHEN 'ANALYST' THEN ename END AS anlyts,
	CASE job WHEN 'SALESMAN' THEN ename END AS sales
FROM emp

-- No difference between SQLite and MySQL

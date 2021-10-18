-- Example 12.15 Using case expressions to flag rows

/*
	Map values in job column to series of 'boolean' flag values
*/
SELECT ename,
	CASE  WHEN job = 'CLERK' THEN 1 ELSE 0 END AS is_clerk,
	CASE  WHEN job = 'SALESMAN' THEN 1 ELSE 0 END AS is_sales,
	CASE  WHEN job = 'MANAGER' THEN 1 ELSE 0 END AS is_mgr,
	CASE  WHEN job = 'ANALYST' THEN 1 ELSE 0 END AS is_analyst,
	CASE  WHEN job = 'PRESIDENT' THEN 1 ELSE 0 END AS is_prez
FROM emp
ORDER BY 2, 3, 4, 5, 6

-- No difference between SQLite and MySQL

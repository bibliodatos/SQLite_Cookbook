-- Example 13.3 Creating a hierarchical view of a table
-- Manager and employee hierarchy regardless of depth


WITH x (ename,empno)
	AS (
		SELECT CAST(ename AS TEXT), empno
  	FROM emp
  	WHERE mgr IS NULL
UNION ALL

SELECT CAST(x.ename || ' - ' || e.ename AS TEXT),
	e.empno
	FROM emp AS e, x
	WHERE e.mgr = x.empno
)
SELECT ename AS emp_tree
FROM x
ORDER BY 1

/*
  Recursive CTE solution for SQLite which is same as DB2, PostgreSQL and SQL server.
  MySQL needs the RECURSIVE keyword on the CTE.
*/

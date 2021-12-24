-- Example 13.4 Finding all child rows for a given parent row
-- Find all employees that work under JONES whether directly or indirectly.


WITH x (ename,empno)
	AS (
		SELECT ename, empno
  	FROM emp
  	WHERE ename = 'JONES'
UNION ALL

SELECT e.ename, e.empno
	FROM emp AS e, x
	WHERE x.empno = e.mgr
)
SELECT ename
FROM x


/*
  Recursive CTE solution for SQLite which is same as DB2, PostgreSQL and SQL server.
  MySQL needs the RECURSIVE keyword on the CTE.
*/

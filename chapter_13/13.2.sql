-- Example 13.2 Child-Parent-Grandparent relationship
-- Miller works for Clark who works for King


WITH x (tree, mgr, depth)
	AS (
	SELECT CAST(ename AS TEXT),
		mgr, 0
FROM emp
WHERE ename = 'MILLER'
UNION ALL
SELECT CAST(x.tree || '-->' || e.ename AS TEXT),
	e.mgr, x.depth + 1
	FROM emp e, x
	WHERE x.mgr = e.empno
)
SELECT tree  leaf___branch___root
FROM x
WHERE  depth = 2

/*
  Recursive CTE solution for SQLite which is same as DB2, PostgreSQL and SQL server.
  MySQL needs the RECURSIVE keyword on the CTE.
*/

/*
Example 13.5 Determining which rows are leaf, branch or root nodes
	Employees that are not managers are leaf nodes.
	Employees that is both a manager and has a manager is a branch node.
	Employee without a manager is a root node.
*/
SELECT e.ename,

(SELECT MAX(MIN(COUNT(*), 1), -1) FROM emp AS d
WHERE 0 = (SELECT COUNT(*) FROM emp AS f WHERE f.mgr = e.empno)) AS is_leaf,

(SELECT MAX(MIN(COUNT(*), 1), -1) FROM emp AS d
WHERE d.mgr = e.empno and e.mgr IS NOT NULL ) AS is_branch,

(SELECT MAX(MIN(COUNT(*), 1), -1) FROM emp AS d
WHERE d.mgr = e.empno and e.mgr IS NULL ) AS is_root

FROM emp e
ORDER BY 4 DESC, 3 DESC

/*
	MySQL, DB2, PostgreSQL and SQL server solution uses SIGN() function which some
	SQLite versions do not have.  Instead we use MIN nested in a MAX to accomplish
	the same thing.
*/

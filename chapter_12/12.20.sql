-- Example 12.20 Pivoting a result set with subtotals

/*
	You have a report with subtotals but you want to transpose to create readable
	format. Report that shows department, the managers in the department and a
	sum of the salaries in each department for those employees that have a 
	manager.

	The SQLite solution is lengthy because SQLite does not support ROLLUP() for
	calculating the subtotals. We have to create an extensive subquery with
	UNION ALL with one query for each department and one subtotal query for
	each department and one last query for the grand total. This approach would
	quickly be untenable as the numbe of departments in a company gets larger.

	Solution provided for completeness purposes.
*/

SELECT x.mgr,
	SUM(CASE x.deptno WHEN 10 THEN x.sal ELSE 0 END) AS dept10,
	SUM(CASE x.deptno WHEN 20 THEN x.sal ELSE 0 END) AS dept20,
	SUM(CASE x.deptno WHEN 30 THEN x.sal ELSE 0 END) AS dept30,
	SUM(CASE x.flag WHEN 3 THEN sal ELSE NULL END) AS total

FROM
(
	SELECT deptno, mgr, sal, 0 AS flag
	FROM emp
	WHERE deptno = 10 AND mgr IS NOT NULL

	UNION ALL

	SELECT '10', NULL, (SELECT SUM(sal) FROM emp WHERE deptno = 10 AND mgr IS NOT NULL), 1

	UNION ALL

	SELECT deptno, mgr, sal, 0
	FROM emp
	WHERE deptno = 20 AND mgr IS NOT NULL

	UNION  ALL

SELECT '20', NULL, (SELECT SUM(sal) FROM emp WHERE deptno = 20 AND mgr IS NOT NULL), 1

UNION ALL

SELECT deptno, mgr, sal, 0
FROM emp
WHERE deptno = 30 AND mgr IS NOT NULL

UNION ALL

SELECT '30', NULL, (SELECT SUM(sal) FROM emp WHERE deptno = 30 AND mgr IS NOT NULL), 1

UNION ALL

SELECT NULL, NULL, (SELECT SUM(sal) FROM emp WHERE mgr IS NOT NULL), 3
) AS x
GROUP BY mgr
ORDER BY COALESCE(mgr,9999 )

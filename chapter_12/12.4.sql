-- Example 12.4 Reverse pivoting a result set into one column

/*
  Return all the columns from a query in just one column. Report employee name,
  job and salary of all employees in department 10. We need two CTEs.  The first
  CTE uses recursion to create four rows of output for us. x_tab CTE does a
  cartesian join to gather all our data we need.
*/

WITH four_rows (id)
AS
(
	SELECT 1
	UNION ALL
	SELECT id + 1 FROM four_rows WHERE id < 4
)
,
x_tab (ename, job, sal, rn)
AS
(
	SELECT e.ename, e.job, e.sal,
		ROW_NUMBER() OVER (PARTITION BY e.empno ORDER BY e.empno)
	FROM emp AS e
	JOIN four_rows on 1=1
	WHERE e.deptno = 10
)

SELECT
 CASE rn
	WHEN 1 THEN ename
	WHEN 2 THEN job
	WHEN 3 THEN CAST(sal AS CHAR(4))
	END AS emps
FROM x_tab

/*
  No substantial difference between SQLite and MySQL. We could CAST to TEXT
  instead of CHAR(4) but SQLite accepts CHAR(4). Also MySQL requires the
  RECURSIVE keyword with the four_rows CTE.
*/

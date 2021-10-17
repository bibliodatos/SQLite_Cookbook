-- Example 12.3 Reverse pivoting a result set

/*
  Set up our data
*/
CREATE VIEW V12_3 (deptno_10, deptno_20, deptno_30) AS
  SELECT 3, 5, 6;

/*
  We can make a wide result set using CROSS JOIN and then a CASE statement.
*/
SELECT dept.deptno,
	CASE dept.deptno
		WHEN 10 THEN V12_3.deptno_10
		WHEN 20 THEN V12_3.deptno_20
		WHEN 30 THEN V12_3.deptno_30
	END AS counts_by_dept
FROM V12_3
CROSS JOIN
  (SELECT deptno FROM dept WHERE deptno <=30) AS dept;

-- No difference between SQLite and MySQL

-- Example 12.1 Pivoting a result set into one row

/*
  Set up our data
*/
CREATE VIEW V12_1 (deptno, cnt) AS
  SELECT 10, 3
  UNION ALL
  SELECT 20, 4
  UNION ALL
  SELECT 30, 6

/*
  Simple pivot using SUM and CASE statements
*/
SELECT
  SUM(CASE WHEN deptno=10 THEN cnt else 0 END) AS deptno_10,
  SUM(CASE WHEN deptno=20 THEN cnt else 0 END) AS deptno_20,
  SUM(CASE WHEN deptno=30 THEN cnt else 0 END) AS deptno_30
FROM
V12_1;

-- No difference between SQLite and MySQL

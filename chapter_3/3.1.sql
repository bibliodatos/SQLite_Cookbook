-- Example 3.1 Stacking one rowset atop of another

SELECT ename as ename_and_dname, deptno
  FROM emp
  WHERE deptno = 10
  UNION ALL
SELECT '-------------', NULL
  UNION ALL
SELECT dname, deptno
  FROM dept;

-- Need to check if you have to include a table name in MySQL

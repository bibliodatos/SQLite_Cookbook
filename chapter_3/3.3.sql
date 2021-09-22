-- Example 3.3 Finding rows in common between two tables

-- Create view
Create view V
AS
SELECT ename, job, sal
  FROM emp
  WHERE job = 'CLERK';

-- Join emp table to V view with explicit join
SELECT e.empno, e.ename, e.job, e.sal, e.deptno
  FROM emp AS e
  JOIN V on (e.ename = v.ename AND e.job = v.job AND e.sal = v.sal);

-- No difference between SQLite and MySQL

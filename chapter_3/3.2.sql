/*
  Query 3.2 - Combining related rows
*/

-- Join emp table to dept table on deptno field. Implicit join.
SELECT e.ename, d.loc
  FROM emp AS e, dept AS d
WHERE e.deptno = d.deptno
  AND e.deptno = 10

-- Join emp table to dept table on deptno field. Explicit inner join.
SELECT e.ename, d.loc
  FROM emp AS e
  INNER JOIN dept AS d ON (e.deptno = d.deptno)
WHERE e.deptno = 10

-- No difference between SQLite and MySQL

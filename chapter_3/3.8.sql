-- Example 3.8 Identifying and avoiding cartesian products


\*
Name of each employee in department 10 along with the location
of the department. Explicit JOIN
*\

SELECT e.ename, d.loc
  FROM emp AS e
  JOIN dept AS d ON (e.deptno = d.deptno)
  WHERE e.deptno = 10


\*
Name of each employee in department 10 along with the location
of the department. Implicit JOIN
*\

SELECT e.ename, d.loc
  FROM emp AS e, dept AS d
  WHERE d.deptno = e.deptno
    AND e.deptno = 10


-- No difference between SQLite and MySQL

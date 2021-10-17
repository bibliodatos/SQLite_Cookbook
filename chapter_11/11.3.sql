-- Example 11.3 Using OR logic when doing an outer join

/*
    Return the name and department info for all employees in
    departments 10 and 20 along with just the department information
    for departments 30 and 40
*/
SELECT e.ename, d.deptno, d.dname, d.loc
  FROM dept d LEFT JOIN emp e
  ON (d.deptno = e.deptno AND (e.deptno=10 OR e.deptno=20))
ORDER BY 2;

-- No difference between SQLite and MySQL

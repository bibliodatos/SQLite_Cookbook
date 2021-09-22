-- Example 3.6 Adding joins to query without interfering with other joins

-- LEFT OUTER join the emp_bonus table so we don't limit the other rows
SELECT e.ename, d.loc, eb.received
  FROM emp AS e
  JOIN dept AS d ON (e.deptno = d.deptno)
  LEFT JOIN emp_bonus AS eb ON (e.empno = eb.empno)
ORDER BY 2;

-- No difference between SQLite and MySQL

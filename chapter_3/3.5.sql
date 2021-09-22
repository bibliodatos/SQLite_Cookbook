-- Example 3.5 Selecting rows from one table that don't correspond to rows in another

--
SELECT d.*
  FROM dept AS d
  LEFT OUTER JOIN emp AS e
    ON (d.deptno = e.deptno)
WHERE e.deptno IS NULL;

-- No difference between SQLite and MySQL

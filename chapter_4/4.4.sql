-- Example 4.4 copying rows from one table to another


CREATE TABLE dept_east (
  deptno INTEGER default NULL,
  dname TEXT default NULL,
  loc TEXT default NULL
);

INSERT INTO dept_east (deptno, dname, loc)
  SELECT deptno, dname, loc
  FROM dept
  WHERE loc IN ('NEW YORK', 'BOSTON');

DROP TABLE dept_east;

-- No difference between SQLite and MySQL

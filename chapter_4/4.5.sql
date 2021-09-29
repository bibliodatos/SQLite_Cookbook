-- Example 4.5 copying a table definition

CREATE TABLE dept_2
  AS
  SELECT * FROM dept WHERE 1 = 0;

DROP TABLE dept_2;

-- No difference between SQLite and MySQL

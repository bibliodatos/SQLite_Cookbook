-- Example 7.4 Counting number of rows in a table

SELECT COUNT(*)
  FROM emp;

SELECT deptno, COUNT(*)
  FROM emp
GROUP BY deptno;


-- No difference between SQLite and MySQL

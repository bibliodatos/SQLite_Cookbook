-- Example 13.1 Display employee's name with the name of their manager


SELECT a.ename || ' works for ' || b.ename as emp_and_mgrs
FROM
  emp AS a, emp AS b
WHERE a.mgr = b.empno


/*
  MySQL would use CONCAT on the strings.  Our SQLite solution same as
  DB2, Oracle and PostgreSQL
*/

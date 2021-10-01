-- Example 6.8 Ordering by parts of a string



/*
  Order by last 2 characters of a text field
*/
SELECT ename
FROM emp
ORDER BY SUBSTR(ename, LENGTH(ename) - 1);

-- No difference between SQLite and MySQL

/*
  Query 3.4 -  Selecting values from one table that don't exist in another
*/

-- SQLite has EXCEPT operator
SELECT deptno FROM dept
EXCEPT
SELECT deptno FROM emp;


/*
  MySQL does not have EXCEPT operator.
  This also works in SQLite
*/

SELECT deptno FROM dept
WHERE deptno NOT IN (SELECT deptno FROM emp);

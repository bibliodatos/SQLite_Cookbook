/*
  Query 2.2 -  Results sorted by multiple fields
*/

-- Order by department number first and then salary within the department
SELECT ename, deptno, sal, ename, job
  FROM emp
  ORDER BY deptno, sal DESC;

-- no differences from SQLite to MySQL

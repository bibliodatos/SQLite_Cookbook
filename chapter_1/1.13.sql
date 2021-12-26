/*
  Query 1.12 - Searching for patterns
*/

SELECT ename, job
  FROM emp
WHERE deptno IN (10,20)
  AND (ename LIKE '%I%' OR job LIKE '%ER')
;

/*
  Employees in departments 10 and 20 return only those that have either
  an "I" somewhere in their name or job title ending with "ER"
*/

-- no differences from MySQL

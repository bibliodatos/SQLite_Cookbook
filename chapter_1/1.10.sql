/*
  Query 1.10 - Returning n random records from a table
*/

SELECT ename, job
  FROM emp
  ORDER BY RANDOM() LIMIT 5;

-- MySQL uses RAND() instead

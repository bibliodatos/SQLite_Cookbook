/*
  Query 1.7 - Concatenating column values
*/

SELECT ename ||' WORKS AS A '||job AS msg
  FROM emp
WHERE deptno = 10;

-- Same as DB2, Oracle, PostresSQL
-- MySQL uses CONCAT instead

-- Limiting the number of rows in a SELECT

SELECT ename, job
  FROM emp
  ORDER BY RANDOM() LIMIT 5;

-- MySQL uses RAND() instead

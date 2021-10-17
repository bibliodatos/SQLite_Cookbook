-- Example 11.10 Supressing duplicates


/*
  Find all the different job types from employee table
*/
SELECT DISTINCT(job)
FROM emp;

-- If you want to make it more complicated than you can do this...
SELECT job
FROM (
  SELECT job,
  ROW_NUMBER() OVER (PARTITION BY job ORDER BY job) AS rn
  FROM emp
) AS x
WHERE rn = 1;

-- No difference between SQLite and MySQL

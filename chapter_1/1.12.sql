-- Transforming NULLs into real values

SELECT COALESCE(comm,0)
  FROM emp;


-- or use CASE statement
SELECT CASE
       WHEN comm IS NOT NULL THEN comm
       ELSE 0
       END AS Commission
FROM emp;


-- no differences from MySQL

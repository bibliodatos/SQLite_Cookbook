/*
  Query 1.8 - Conditional logic in a SELECT
*/

SELECT ename, sal,
    CASE WHEN sal <= 2000 THEN 'UNDERPAID'
         WHEN sal >= 4000 THEN 'OVERPAID'
         ELSE 'OK'
    END AS status
FROM emp;

-- no differences from MySQL

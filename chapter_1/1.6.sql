/*
  Query 1.6.sql - Referencing an aliased column in WHERE clause
*/

SELECT *
  FROM (
    SELECT sal AS salary, comm AS commission
    FROM emp
  ) AS x
WHERE salary < 5000;

-- no differences from MySQL

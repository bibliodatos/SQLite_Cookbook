-- Example 3.12 Using NULLS in operatons and comparisons

\*
Find all employees with commission less than employee WARD
when some employees have NULL in comm 
*\

SELECT ename, comm, coalesce(comm, 0)
  FROM emp
  WHERE coalesce(comm, 0) <
    (SELECT comm FROM emp WHERE ename = 'WARD')


-- No difference between SQLite and MySQL

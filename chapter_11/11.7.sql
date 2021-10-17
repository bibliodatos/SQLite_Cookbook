-- Example 11.7 Investigating future rows


/*
  Find employees that make less salary then the employee
  hired immediately after them. Use the LEAD OVER window function
*/
SELECT ename, sal, hiredate
FROM
(
  SELECT ename, sal, hiredate,
    LEAD(sal) OVER (ORDER BY hiredate) AS next_sal
  FROM emp
) AS x
WHERE sal < next_sal;

-- No difference between SQLite and MySQL

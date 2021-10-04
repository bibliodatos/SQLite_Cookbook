-- Example 10.2 Finding differences between rows in the same group or partition

/*
  Find the difference in salary with the next employee in the same department.
*/
WITH next_sal_tab (deptno, ename, sal, hiredate, next_sal)
AS
(
  SELECT deptno, ename, sal, hiredate,
   LEAD(sal) OVER (PARTITION by deptno ORDER BY hiredate) AS next_sal
  FROM emp
)

SELECT deptno, ename, sal, hiredate,
  COALESCE( (CAST(sal - next_sal AS TEXT)), 'N/A') as diff
FROM next_sal_tab

-- No difference between SQLite and MySQL

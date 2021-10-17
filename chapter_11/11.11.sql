-- Example 11.11 Finding Knight values

/*
  Return employee name, department, salary, hire date and the salary of
  the last employee hired in that same department.
*/
SELECT deptno, ename, sal, hiredate,
	MAX(latest_sal) OVER (PARTITION BY deptno) AS latest_sal
FROM
(
SELECT deptno, ename, sal, hiredate,
	CASE
		WHEN hiredate = MAX(hiredate) OVER (PARTITION BY deptno)
		THEN sal
		ELSE 0
	END AS latest_sal
FROM emp
) AS x
ORDER BY 1, 4 DESC;

/*
  No solution was provided for MySQL for Knight values
*/

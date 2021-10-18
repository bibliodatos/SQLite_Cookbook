-- Example 12.11 Returning non-GROUP BY columns

/*
	Employees with highest and lowest salaries in each department along with
	employees who earn the highest and lowest salaries in each job. 
*/
SELECT deptno, ename, job, sal,
	CASE WHEN sal = max_by_dept THEN 'TOP SAL IN DEPT'
		WHEN sal = min_by_dept THEN 'LOW SAL IN DEPT'
	END AS dept_status,
	CASE WHEN sal = max_by_job THEN 'TOP SAL IN JOB'
		WHEN sal = min_by_job THEN 'LOW SAL IN JOB'
		END AS job_status
FROM

(
SELECT deptno, ename, job, sal,
	MAX(sal) OVER (PARTITION BY deptno) AS max_by_dept,
	MAX(sal) OVER (PARTITION BY job) AS max_by_job,
	MIN(sal) OVER (PARTITION BY deptno) AS min_by_dept,
	MIN(sal) OVER (PARTITION BY job) AS min_by_job
FROM emp
) AS emp_sals

WHERE sal in (max_by_dept, max_by_job, min_by_dept, min_by_job)


-- No difference between SQLite and MySQL.

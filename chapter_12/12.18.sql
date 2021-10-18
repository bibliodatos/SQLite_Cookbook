-- Example 12.18 Performing aggregations over different groups/partitions simultaneously

/*
	List each employee name, their department, number of employees in their
	department, job, number of employees that have the same job and the total
	number of employees in the company.
*/
SELECT ename, deptno,
	COUNT(*) OVER (PARTITION BY deptno) AS deptno_cnt,
	job,
	COUNT(*) OVER (PARTITION BY job) AS job_cnt,
	COUNT(*) OVER () total
FROM emp

-- No difference between SQLite and MySQL

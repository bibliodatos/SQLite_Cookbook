-- Example 12.10 Creating horizontal histograms

/*
	Generate a historgram that grows from the bottom up. Number of employees in
	each department in the emp table.
*/
SELECT MAX(deptno_10) AS d10,
	MAX(deptno_20) AS d20,
	MAX(deptno_30) AS d30
FROM

(
SELECT ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY empno) AS rn,
	CASE WHEN deptno = 10 THEN '*' ELSE NULL END AS deptno_10,
	CASE WHEN deptno = 20 THEN '*' ELSE NULL END AS deptno_20,
	CASE WHEN deptno = 30 THEN '*' ELSE NULL END AS deptno_30
FROM
emp
) AS x

GROUP BY rn
ORDER BY 1 ASC, 2 ASC, 3 ASC

-- No difference between SQLite and MySQL.

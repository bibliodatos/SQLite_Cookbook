-- Example 12.12 Calculating simple subtotals

/*
	Sum of salaries by job with a total at the bottom.
*/
SELECT  job, SUM(sal) AS sal
FROM emp
GROUP by job

UNION

SELECT 'Total', SUM(sal)
FROM emp

/*
	SQLite does not have ROLLUP() function so we have to do our total separately
	and UNION to the end of the results.
*/

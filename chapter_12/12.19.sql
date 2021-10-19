-- Example 12.19 Performing aggregations over a moving range of values

/*
	Setup our view with salary data
*/
CREATE VIEW V12_19 (hiredate, sal) AS
SELECT '2010-12-17', 800
UNION ALL
SELECT '2011-02-20', 1600
UNION ALL
SELECT '2011-02-22', 1250
UNION ALL
SELECT '2011-04-02', 2975
UNION ALL
SELECT '2011-05-01', 2850
UNION ALL
SELECT '2011-06-09', 2450
UNION ALL
SELECT '2011-09-08', 1500
UNION ALL
SELECT '2011-09-28', 1250
UNION ALL
SELECT '2011-11-17', 5000
UNION ALL
SELECT '2011-12-03', 950
UNION ALL
SELECT '2011-12-03', 3000
UNION ALL
SELECT '2012-01-23', 1300
UNION ALL
SELECT '2012-12-09', 3000
UNION ALL
SELECT '2013-01-12', 1100
;

/*
	Compute the moving sum of salaries for 90 days based on employee hire date.
	This solution uses a scalar subquery to calculate the spending pattern salary
	totals. This would work fine on MySQL excuding the difference in date
	manipulation that MySQL has with SQLite.
*/
SELECT e.hiredate, e.sal,
	(SELECT SUM(sal) FROM V12_19 AS d
		WHERE d.hiredate BETWEEN DATE(e.hiredate, '-90 days') AND DATE(e.hiredate)) AS spending_pattern
FROM V12_19 AS e

/*
	MySQL can accomplish this report without the scalar subquery by using the
	SUM() OVER() window function with a RANGE INTERVAL set of 90 days PRECEDING.
	SQLite's SUM() OVER() window function can only operate on INTEGER data so
	it can't be applied directly to TEXT/DATE fields.  The solution
	below works around this limitation by converting the TEXT/DATE field
	into an INTEGER representing the JULIAN day as an INTEGER.
*/

SELECT hiredate, sal,
	SUM(sal) OVER (ORDER BY CAST(STRFTIME('%J', hiredate) AS INTEGER)
		RANGE BETWEEN 90 PRECEDING AND CURRENT ROW) AS spending_pattern
FROM V12_19;

-- Example 10.4 Filling in missing dates. Employees hired by month

/*
	SQLite solution:
	Find the number of employees hired per year starting with the year of the
  first hire and then going for 9 more years.  Display a count even if no one
  was hired in a year.
*/
SELECT STRFTIME('%Y', start_day) AS YR,
  (SELECT COUNT(*) FROM emp WHERE hiredate >= start_day AND hiredate <= end_day) AS CNT
FROM
(
 SELECT
  DATE((SELECT MIN(hiredate) FROM emp), 'START OF YEAR', '+'||(pos -1)||' years') AS start_day,
  DATE((SELECT MIN(hiredate) FROM emp), 'START OF YEAR', '+'||(pos)||' year', '-1 day') AS end_day
 FROM V500
 WHERE end_day <  DATE((SELECT MAX(hiredate) FROM emp), 'START OF MONTH', '+8 years')
) AS x

/*
  The MySQL example solution uses COALESCE(), EXTRACT(), MOD() and TO_NUMBER()
  functions.
*/

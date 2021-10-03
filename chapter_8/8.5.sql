-- Example 8.5 Determining the number seconds, minutes or hours between two dates

/*
  Difference in hire dates between employees WARD and ALLEN
  SQLite solution we need to use JULIANDAY function to do date subtraction.
*/

SELECT (ward_hd - allen_hd) * 24 AS hrs,
	(ward_hd - allen_hd) * 24  * 60 AS min,
	(ward_hd - allen_hd) * 24  * 60 * 60 AS sec
FROM
(
  SELECT JULIANDAY(MAX(CASE WHEN ename = 'WARD' THEN hiredate END)) AS ward_hd,
      JULIANDAY(MAX(CASE WHEN ename = 'ALLEN' THEN hiredate END)) as allen_hd
    FROM emp
) AS x

/*
  MySQL solution very similar but MySQL has DATE_DIFF
*/

-- Example 8.4 Determining the number of months or years between two dates


/*
  SQLite solution we need to use STRFTIME function to extract year and
  month from date string.
*/

SELECT mnth, mnth / 12.0
FROM
  (
    SELECT (STRFTIME('%Y', max_hd) -  STRFTIME('%Y', min_hd)) * 12 +
	         (STRFTIME('%m', max_hd) - STRFTIME('%m', min_hd)) as mnth
    FROM
      (SELECT MIN(hiredate) AS min_hd, MAX(hiredate) AS max_hd
        FROM emp) AS x
  ) AS y

 
/*
  MySQL solution very similar but MySQL has built in YEAR() and MONTH()
  functions
*/

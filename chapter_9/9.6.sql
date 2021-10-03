-- Example 9.6 Determining the date of the first and last occurrences of a
-- specific weekday in the month

/*
	In SQLite find all the Mondays in the current month
	We utilize our dummy V500 view to iterate and generate a months worth of dates.

*/
SELECT MIN(day) AS first_monday, MAX(day) AS last_monday
FROM
(
 SELECT DATE('NOW','start of month', '+'||CAST(pos - 1 AS TEXT)||' day' ) as day, pos
 FROM V500
 WHERE STRFTIME('%m', day) = STRFTIME('%m', 'NOW')
	 AND STRFTIME('%w', day) = '1'
 LIMIT 31
) AS x

/*
  The example in SQL Cookbook for MySQL relies on ADDDATE() function and is
	much longer than our SQLite solution.
*/

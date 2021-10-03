-- Example 9.4 Determining all dates for a particular weekday throught a year

/*
	In SQLite find all the Fridays in the current year.
	We utilize our dummy V500 view to iterate and generate a year's worth of dates.
	From there it is simple to filter out only the Fridays.
*/
SELECT DATE('NOW','start of year', '+'||CAST(pos - 1 AS TEXT)||' day' ) as day
FROM V500
WHERE STRFTIME('%Y', day) = STRFTIME('%Y', 'NOW')
	AND STRFTIME('%w', day) = '5'
LIMIT 366

/*
  The example in SQL Cookbook for MySQL uses a recursive CTE. I like our simpler
	solution shown above.
*/

-- Example 9.6 Determining the date of the first and last occurrences of a
-- specific weekday in the month

/*
	In SQLite find all the Mondays in the current month
	We utilize our dummy V500 view to iterate and generate a month's worth of dates.
*/

SELECT
  MAX (CASE day_of_week WHEN '1' THEN STRFTIME('%d', day) END ) AS Mo,
  MAX (CASE day_of_week WHEN '2' THEN STRFTIME('%d', day) END ) AS Tu,
  MAX (CASE day_of_week WHEN '3' THEN STRFTIME('%d', day) END ) AS We,
  MAX (CASE day_of_week WHEN '4' THEN STRFTIME('%d', day) END ) AS Th,
  MAX (CASE day_of_week WHEN '5' THEN STRFTIME('%d', day) END ) AS Fr,
  MAX (CASE day_of_week WHEN '6' THEN STRFTIME('%d', day) END ) AS Sa,
  MAX (CASE day_of_week WHEN '0' THEN STRFTIME('%d', day) END ) AS Su
FROM
(
 SELECT day,
   STRFTIME('%W', day) - STRFTIME('%W', DATE('NOW', 'start of month')) + 1 AS week,
   STRFTIME('%w', day) AS day_of_week
 FROM
  (SELECT DATE('NOW','start of month', '+'||CAST(pos - 1 AS TEXT)||' day' ) as day, pos
   FROM sqlite100
   LIMIT 31
   )
   ) AS x
GROUP BY week
ORDER BY week

/*
  The example in SQL Cookbook for MySQL relies on ADDDATE() function and is
	much longer than our SQLite solution.
*/

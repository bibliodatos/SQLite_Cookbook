-- Example 9.7 Displaying a calendar for current month

/*
	SQLite solution
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
  -- Get a month's worth of dates for the current month
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
  The example in SQL Cookbook for MySQL uses a recursive CTE to get the dates
	for a month. It then uses MAX and CASE to pivot the data as we did above.
*/

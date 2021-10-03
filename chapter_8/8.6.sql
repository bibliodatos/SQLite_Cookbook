-- Example 8.6 Determining the occurrences of weekdays in a year


/*
  SQLite solution:
  We want to count the number of days each week day occurs in a year
  starting from today forward. we can't assume 365 days in a year because
  of possible leap year . Again JULIANDAY and STRFTIME do most of the work
  for us. 'NOW' gives us the today's date in SQLite. We use our dummy view
  V500 to help use iterate.
*/

SELECT  day_of_week,
				CASE WHEN day_of_week = '1' THEN 'Monday'
					WHEN day_of_week = '2' THEN 'Tuesday'
					WHEN day_of_week = '3' THEN 'Wednesday'
					WHEN day_of_week = '4' THEN 'Thursday'
					WHEN day_of_week = '5' THEN 'Friday'
				END AS day,
        COUNT(*) AS cnt
FROM
  (
    SELECT   STRFTIME('%w', DATE(JULIANDAY('NOW') - JULIANDAY('NOW' + (pos -1)))) as day_of_week
    FROM V500
    WHERE pos <=
	     (SELECT CAST(JULIANDAY('NOW',  '+1 YEAR') - JULIANDAY('NOW') AS INTEGER))
  ) AS x
WHERE day_of_week IN ('1','2','3','4','5')
GROUP BY day_of_week


/*
  MySQL solution uses DATE_FORMAT, DATE_ADD, and DATE_DIFF functions
  which SQLite does not have. CURRENT_DATE gives us today's
  date in MySQL.
*/

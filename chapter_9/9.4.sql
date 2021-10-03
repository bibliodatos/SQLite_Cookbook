-- Example 9.4 Determining the first and last days of a month

/*
	SQLite solution is very easy for this problem because of the 'start of month'
  time modifier provided.
  https://stackoverflow.com/questions/2489959/last-day-of-the-current-month/29530094
*/
SELECT DATE('NOW','start of month','+1 month','-1 day') AS last_day,
	DATE('NOW','start of month') AS first_day

/*
  MySQL has a LAST_DAY() function.
*/

-- Example 9.3 Extracting units of time from a date

/*
	SQLite solution using STRFTIME to show parts of the current time.
*/
SELECT STRFTIME('%H', 'NOW') AS hr,
  STRFTIME('%M', 'NOW') AS min,
  STRFTIME('%S', 'NOW') AS sec,
  STRFTIME('%d', 'NOW') AS day,
  STRFTIME('%m', 'NOW') AS mon,
  STRFTIME('%Y', 'NOW') AS year;


/*
  With MySQL you can use DATE_FORMAT() and CURRENT_TIMESTAMP to solve this
*/

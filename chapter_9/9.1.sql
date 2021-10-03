-- Example 9.1 Determining whether a year is a leap year


/*
  For SQLite we can calulate the number of days from February 1st to March 1st
  in the current year.  If it is 29 days then it is a leap year.  Pretty cool
  that we don't have to query a table at all.
*/
SELECT
	CASE WHEN
		CAST(JULIANDAY(STRFTIME('%Y', 'NOW') ||'-03-01')
		-  JULIANDAY(STRFTIME('%Y', 'NOW')||'-02-01') AS INTEGER) = 29
		THEN STRFTIME('%Y', 'NOW')|| ' is a leap year'
		ELSE STRFTIME('%Y', 'NOW')|| ' is not a leap year'
	END AS is_leap;

/*
  We could do the same thing in MySQL but use CURRENT_DATE instead of NOW.
  Also DATE_DIFF would be helpful.
*/

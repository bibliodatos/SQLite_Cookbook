-- Example 9.2 Determining the number of days in a year

/*
	Use SQLite to calculate the number of days in the current year
*/
SELECT
  CAST(JULIANDAY(STRFTIME('%Y', 'NOW') ||'-12-31')
  - JULIANDAY(STRFTIME('%Y', 'NOW')||'-01-01')
  AS INTEGER) + 1 as days;

-- Show a leap year exampl
SELECT
  CAST(JULIANDAY('2020-12-31') - JULIANDAY('2020-01-01')
  AS INTEGER) + 1 as days;

/*
  We could do the same thing in MySQL but use CURRENT_DATE instead of NOW.
  Also DATE_DIFF is helpful.
*/

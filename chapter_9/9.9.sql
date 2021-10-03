-- Example 9.9 Quarter start and end dates for a given quarter

/*
	SQLite solution:
  We can pull out the year and quarter using SUBSTR() then it is just a matter
  of using our date modifiers ('+X months' and '-x days') to create the correct
  dates.  Solution will work no matter how the quarters are ordered.
*/
SELECT
	DATE(DATE(y||'-01-01'), '+'||((q_int -1) * 3)||' months') AS q_start,
	DATE(DATE(y||'-01-01'), '+'||((q_int) * 3)||' months', '-1 days') AS q_end
FROM
(
  SELECT CAST(SUBSTR(column1, -1) AS INTEGER) AS q_int, SUBSTR(column1, 1, 4) AS y
  FROM (VALUES ('20051'),('20052'),('20053'),('20054'))
) AS x

/*
  We don't need the subquery to make this work but it does add to the
  readability.  Here is the solution without the subquery
*/
SELECT DATE(DATE( SUBSTR(column1, 1, 4)||'-01-01'), '+'||((CAST(SUBSTR(column1, -1) AS INTEGER) -1) * 3)||' months') AS q_start,
  DATE(DATE( SUBSTR(column1, 1, 4)||'-01-01'), '+'||((CAST(SUBSTR(column1, -1) AS INTEGER)) * 3)||' months') AS q_end
FROM (VALUES ('20051'),('20052'),('20053'),('20054'))


/*
  The MySQL example solution uses DATE_ADD(), ADDDATE(), STR_TO_DATE() and
  MOD() functions
*/

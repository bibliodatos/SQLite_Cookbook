-- Example 9.8 Listing quarter start and end dates for the year

/*
	SQLite solution:
    'start of year' date modifier makes this one fairly straight forward
    in SQLite.  We iterate 4 times and bump up the values by 3 months as we go.
*/

SELECT
  DATE('NOW', 'start of year', '+'||start||' months' ) AS 'Q_START',
  DATE('NOW', 'start of year', '+'||(start + 3)||' months', '-1 day' ) AS 'Q_END'
FROM

(SELECT column1 as pos,
    (CAST(column1 AS INTEGER) - 1) * 3 AS start
  FROM (VALUES (1),(2),(3),(4))
) AS x

/*
  The example in SQL Cookbook for MySQL uses a recursive CTE which is more
  complicated than our straight forward approach in SQLite
*/

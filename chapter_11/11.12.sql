-- Example 11.12 Generating simple forecasts



/*
  Based on current data return additional rows and columns representing
  future actions.  We can use a recursive CTE to generate the extra rows,
  3 rows per order for a total of 9 rows.
*/

WITH nrows(n) AS (
	SELECT 1
	UNION ALL
	SELECT n+1 FROM nrows WHERE n+1 <=3
)

SELECT id, order_date, process_date,
	CASE WHEN nrows.n >=2
		THEN DATE(process_date, '+1 days')
		ELSE NULL
	END AS verified,
	CASE WHEN nrows.n = 3
		THEN DATE(process_date, '+2 days')
		ELSE NULL
	END AS shipped
FROM

(
SELECT nrows .n AS id,
	DATE('NOW',  '+'||     nrows.n    ||' day' ) AS order_date,
	DATE('NOW',  '+'||     CAST(nrows.n + 2 AS TEXT)   ||' day' ) AS process_date
FROM nrows
) orders, nrows

ORDER BY 1

/*
  Our SQLite solution is essentially the same as those given for DB2, MySQL, and
  SQL Server in the book but we need to use DATE() function along with 'NOW' to
  genrate the current date while MySQL uses the CURDATE() function.
*/

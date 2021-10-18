-- Example 12.7 Grouping rows by units of time

/*
	Setup our view with data
*/
CREATE VIEW V12_17 (trx_id, trx_date, trx_cnt) AS
(
		SELECT 1, '2020-07-28 19:03:07', 44
		UNION ALL
		SELECT 2, '2020-07-28 19:03:08', 18
		UNION ALL
		SELECT 3, '2020-07-28 19:03:09', 23
		UNION ALL
		SELECT 4, '2020-07-28 19:03:10', 29
		UNION ALL
		SELECT 5, '2020-07-28 19:03:11', 27
		UNION ALL
		SELECT 6, '2020-07-28 19:03:12', 45
		UNION ALL
		SELECT 7, '2020-07-28 19:03:13', 45
		UNION ALL
		SELECT 8, '2020-07-28 19:03:14', 32
		UNION ALL
		SELECT 9, '2020-07-28 19:03:15', 41
		UNION ALL
		SELECT 10, '2020-07-28 19:03:16', 15
		UNION ALL
		SELECT 11, '2020-07-28 19:03:17', 24
		UNION ALL
		SELECT 12, '2020-07-28 19:03:18', 47
		UNION ALL
		SELECT 13, '2020-07-28 19:03:19', 37
		UNION ALL
		SELECT 14, '2020-07-28 19:03:20', 48
		UNION ALL
		SELECT 15, '2020-07-28 19:03:21', 46
		UNION ALL
		SELECT 16, '2020-07-28 19:03:22', 44
		UNION ALL
		SELECT 17, '2020-07-28 19:03:23', 36
		UNION ALL
		SELECT 18, '2020-07-28 19:03:24', 41
		UNION ALL
		SELECT 19, '2020-07-28 19:03:25', 33
		UNION ALL
		SELECT 20, '2020-07-28 19:03:26', 19
);

/*
	Summarize a transaction log into 5 second intervals.
*/

SELECT CAST(ROUND(((trx_id) + 2.4999999999) / 5.0, 0 ) AS INTEGER)  AS grp,
	MIN(trx_date) AS trx_start,
	MAX(trx_date) AS trx_end,
	SUM(trx_cnt) AS total
FROM V12_17
GROUP BY ROUND(((trx_id) + 2.4999999999) / 5.0, 0 )

/*
	SQLite solution is the same as MySQL except that MySQL can use the CEIL()
	function in lieu of the ROUND() we are using.  SQLite does not have CEIL().
*/

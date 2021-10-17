-- Example 12.7 Creating buckets of data of a fixed size

/*
	Organized employees into buckets of maximum size of five.
*/
SELECT CAST(ROUND(((ROW_NUMBER() OVER (ORDER BY empno)) + 2.4999999999) / 5.0, 0 ) AS INTEGER)  AS rn,
	empno,
	ename
FROM emp

/*
	SQLite does not have the CEIL() function like MySQL so this requires some
	creativity with the ROUND() function. Thanks to stackoverflow ...
	https://stackoverflow.com/questions/54399936/ceil-and-floor-in-sqlite
*/

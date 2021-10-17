-- Example 12.9 Creating horizontal histograms

/*
	Display the number of employees in a department with horizonatal histogram.
	One asterisk per employee.
*/
SELECT DEPTNO,  REPLACE(SUBSTR( CAST(HEX(ZEROBLOB(most)) AS TEXT), 1, cnt), '0', '*') AS CNT
FROM
(
	SELECT DEPTNO, COUNT(*)  AS cnt, MAX(COUNT(*)) OVER () AS most
	FROM emp
	GROUP BY deptno
);

/*
	SQLite does not have LPAD() function like MySQL so this gets harder.  We have
	to manufacture a long string with ZEROBLOG() big enough to represent our
	widest histogram value and then do some fancy footwork with SUBSTR and REPLACE to get what
	we want.  Inspired by solutions found at ...
	https://stackoverflow.com/questions/6576343/how-to-emulate-lpad-rpad-with-sqlite
*/

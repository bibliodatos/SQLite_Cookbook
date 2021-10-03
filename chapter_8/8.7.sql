-- Example 8.7 Determining the date difference between the current record
--	and the next record


/*
	Date difference between hiredate and the next employee hired for every
	employee in department 10. The next hire date can be from another
	department. JULIANDAY and the LEAD window function are key to this
	SQLite solution.
*/

SELECT e.ename, e.hiredate, e.next_hd,
		CAST(JULIANDAY(e.next_hd) - JULIANDAY(e.hiredate) AS INTEGER)  AS diff
FROM
(
SELECT deptno, ename, hiredate,
	LEAD(hiredate) OVER (ORDER BY hiredate) AS next_hd
	FROM emp AS e
) AS e
WHERE e.deptno = 10

/*
  MySQL solution uses DATE_DIFF function which SQLite does not have.
*/

-- Example 9.11 Searching on specific units of time

/*
	SQLite solution:
  Find all employees hired in any month of February or December or were hired
  on a Tuesday.
*/
SELECT ename
  FROM emp
  WHERE
	STRFTIME('%m', hiredate) IN ('02', '12')  -- February or December
	OR STRFTIME('%w', hiredate) = '2' -- Tuesday

/*
  The MySQL example solution MONTHNAME() and DAYNAME() functions
*/

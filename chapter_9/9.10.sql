-- Example 9.10 Filling in missing dates. Employees hired by month

/*
	SQLite solution:
	Find the number of employees hired per month in the history of the company
	and include any months where we did not hire anyone. We avoid CTE by iterating
	over the dummy V500 view to create our listing of start and end dates for each
	applicable month.
*/
SELECT start_day AS MTH,
    (SELECT COUNT(*) FROM emp WHERE hiredate >= start_day AND hiredate <= end_day) AS NUM_HIRED
  FROM
  (
  /*
   Create a listing of the start of the month and end of the month beginning
   with the first month we hired someone and ending with the last month we
   hired someone. Using V500 gives us a maximum of 60 years worth of hire dates
	 but we could make a larger iterator view if needed.
	*/
  SELECT
	  DATE((SELECT MIN(hiredate) FROM emp), 'START OF MONTH', '+'||(pos -1)||' months') AS start_day,
	  DATE((SELECT MIN(hiredate) FROM emp), 'START OF MONTH', '+'||(pos)||' months', '-1 day') AS end_day
  FROM V500
  WHERE end_day <  DATE((SELECT MAX(hiredate) FROM emp), 'START OF MONTH', '+1 months')
) AS x



/*
  The MySQL example solution uses a recursive CTE with ADDDATE(), DAYOFYEAR(),
	DATE_ADD() and EXTRACT() functions.
*/

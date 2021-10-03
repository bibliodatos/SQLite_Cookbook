-- Example 8.3 Determining the number of business days between two dates

/*
  Setup our dummy view with 500 rows
  sqlite100 table is something we setup ahead of time to ease our ability
  to iterate in a query.  SQLite itself does not have builtin dummy tables like
  T500 in MySQL
*/
CREATE view V500 AS
SELECT pos FROM sqlite100
UNION
SELECT pos + 100 FROM sqlite100
UNION
SELECT pos + 200 FROM sqlite100
UNION
SELECT pos + 300 FROM sqlite100
UNION
SELECT pos + 400 FROM sqlite100
ORDER BY 1
;

/*
  SQLite uses STRFTIME to get the business days and JULIANDAY function
  to select the appropriate dates in a subquery.  Then we just count
  the number of rows that match our criteria. We use the dummy V500 view
  to helps us iterate over the days.
*/

SELECT COUNT(*)
FROM
(
  SELECT day, STRFTIME('%w', day) AS day_of_week
  FROM
  (
    SELECT pos, (DATE((SELECT hiredate FROM emp WHERE ename = 'JONES'), '+'||pos||' days')) AS day
    FROM V500
    WHERE JULIANDAY(day) <= JULIANDAY(DATE((SELECT hiredate FROM emp WHERE ename = 'BLAKE')))
  )
  WHERE day_of_week IN ('1', '2', '3', '4', '5')
);


/*
  MySQL solution uses DATE_FORMAT, DATE_ADD, and DATE_DIFF functions
  which SQLite does not have.
*/

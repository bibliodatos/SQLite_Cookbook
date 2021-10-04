-- Example 9.12 Comparing records using specific parts of a date

/*
  SQLite solution:
  Find employees hired on the same month and on the same day of the week.
*/
SELECT a.ename||' was hired on the same month and weekday as '||b.ename AS MSG
  FROM emp as A, emp AS B
  WHERE a.empno < b.empno
    AND STRFTIME('%m', a.hiredate ) = STRFTIME('%m', b.hiredate)
    AND STRFTIME('%w', a.hiredate ) = STRFTIME('%w', b.hiredate)
  ORDER BY a.ename;


/*
  The MySQL example solution uses DATE_FORMAT() function
*/

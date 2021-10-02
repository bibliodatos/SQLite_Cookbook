-- Example 8.1 Adding and subtracting days, months and years

/*
  SQLite useds the DATE() function and built in intervals.
  https://www.sqlite.org/lang_datefunc.html
*/
SELECT hiredate, DATE(hiredate, '-5 days') AS hd_minus_5D,
  DATE(hiredate, '+5 days') AS hd_plus_5D,
  DATE(hiredate, '-5 months') AS hd_minus_5M,
  DATE(hiredate, '+5 months') AS hd_plus_5M,
  DATE(hiredate, '-5 years') AS hd_minus_5Y,
  DATE(hiredate, '+5 years') AS hd_plus_5Y
FROM emp
WHERE deptno = 10;

/*
  MySQL you can use DATE_ADD function or just use +- INTERVAL syntax
*/
SELECT hiredate, DATE_ADD(hiredate, INTERVAL -5 day) AS hd_minus_5D,
  DATE_ADD(hiredate, INTERVAL 5 day) AS hd_plus_5D,
  DATE_ADD(hiredate, INTERVAL -5 month) AS hd_minus_5M,
  DATE_ADD(hiredate, INTERVAL 5 month) AS hd_plus_5M,
  DATE_ADD(hiredate, INTERVAL -5 year) AS hd_minus_5Y,
  DATE_ADD(hiredate, INTERVAL 5 year) AS hd_plus_5Y
FROM emp
WHERE deptno = 10;

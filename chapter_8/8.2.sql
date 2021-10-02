-- Example 8.2 Determining the number of days between two dates

/*
  SQLite uses the JULIANDAY() function
  https://stackoverflow.com/questions/289680/difference-between-2-dates-in-sqlite/14790580
*/
SELECT JULIANDAY(allen_hd) -  JULIANDAY(allen_hd) AS days
FROM (
 (SELECT hiredate AS ward_hd
   FROM emp
   WHERE ename = 'WARD') AS x,
  (SELECT hiredate AS allen_hd
    FROM emp
    WHERE ename = 'ALLEN'
  ) AS y
);

/*
  MySQL you can use DATE_DIFF function
*/
SELECT DATEDIFF(day,allen_hd, ward_hd) AS days
FROM (
 (SELECT hiredate AS ward_hd
   FROM emp
   WHERE ename = 'WARD') AS x,
  (SELECT hiredate AS allen_hd
    FROM emp
    WHERE ename = 'ALLEN'
  ) AS y
);

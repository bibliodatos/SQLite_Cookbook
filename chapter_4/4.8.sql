-- Example 4.8 Modifying records in a table

/*
  Increase salaries by 10% for all employees in department 20
  No difference between MySQL and SQLite
*/

UPDATE emp
  SET sal = sal * 1.10
  WHERE deptno = 20;


/*
  Looks like SQLite is making some values into real data type after the increase.
  This should keep everything in place as an INTEGER
*/
UPDATE emp
  SET sal = CAST(sal * 1.10 AS INTEGER)
  WHERE deptno = 20;

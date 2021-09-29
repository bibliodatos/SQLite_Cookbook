-- Example 4.9 Updating when corresponding row in another table exists

/*
  Increase salaries by 20% for all employees that appear in the emp_bonus table.
  No difference between MySQL and SQLite
*/
UPDATE emp
  SET sal = sal * 1.20
  WHERE empno IN (SELECT empno FROM emp_bonus);


/*
  Looks like SQLite is making some values into real data type after the increase.
  This should keep everything in place as an INTEGER
*/
UPDATE emp
  SET sal = CAST(sal * 1.20 AS INTEGER)
  WHERE empno IN (SELECT empno FROM emp_bonus);

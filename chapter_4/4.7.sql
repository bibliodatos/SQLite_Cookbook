-- Example 4.7 blocking inserts into certain columns

CREATE view new_emps AS
  SELECT empno, ename, job
  FROM emp;


-- MySQL syntax
INSERT INTO new_emps (empno, ename, job)
  VALUES(1, 'Jonathan', 'Editor');

/* SQLite does not support INSERT into views. You will get error message like this
      -- Result: cannot modify new_emps because it is a view
*/

DROP view new_emps;

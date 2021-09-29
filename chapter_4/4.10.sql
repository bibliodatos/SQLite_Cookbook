-- Example 4.10 Updating with values from another table

-- Set up our new data
CREATE TABLE new_sal (deptno INTEGER, sal INTEGER);
INSERT INTO new_sal VALUES(10, 4000);


/*
  Set salary to value in new_sal table if department number matches between
  the emp table and new_sal table. Set commission to be 1/2 of salary.

  To get something that works in both SQLite and MySQL without modification
  you need to do a correlated subquery as shown below...
*/
UPDATE emp SET (sal, comm) =
  (SELECT ns.sal, ns.sal /2
   FROM new_sal AS ns
   WHERE ns.deptno = emp.deptno
  )
WHERE exists (SELECT * FROM new_sal AS ns WHERE ns.deptno = emp.deptno);

/*
  For just MySQL there is a more concise way of doing this that does
  not work in SQLite
*/
UPDATE emp e, new_sal ns
  SET e.sal = ns.sal, e.comm = ns.sal / 2
  WHERE e.deptno = ns.deptno;

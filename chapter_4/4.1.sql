-- Example 4.1 Inserting records

SAVEPOINT "RESTOREPOINT";

-- INSERT one row at a time
INSERT INTO dept (deptno, dname, loc)
 VALUES (50, 'PROGRAMMING', 'BALTIMORE');

-- INSERT more than one row at a time
INSERT INTO dept (deptno, dname, loc)
 VALUES (1, 'A', 'B'),
        (2, 'B', 'C');


ROLLBACK TO SAVEPOINT "RESTOREPOINT";

-- No difference between SQLite and MySQL

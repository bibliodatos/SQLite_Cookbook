-- Example 3.11 Returning missing data from multiple tables

-- setup an employee with no deparment
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
  SELECT 1111, 'YODA', 'JEDI', NULL, hiredate, sal, comm, NULL
    FROM emp
    WHERE ename = 'KING';


/*
We have some departments with no employees and some employees with no department.
Show both cases in the same query.
*/

SELECT d.deptno, d.dname, e.ename
FROM dept AS d
LEFT OUTER JOIN emp AS e ON (d.deptno = e.deptno)

UNION

SELECT d.deptno, d.dname, e.ename
FROM emp AS e
LEFT OUTER JOIN dept AS d ON (d.deptno = e.deptno);

DELETE FROM emp WHERE empno = 1111;


-- No difference between SQLite and MySQL since neither supports FULL OUTER JOIN

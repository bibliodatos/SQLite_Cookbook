-- Example 3.10 Outer Joins when using aggregates

SAVEPOINT "RESTOREPOINT";

DELETE FROM emp_bonus;

INSERT INTO emp_bonus VALUES(7934, '17-MAR-2005', 1);
INSERT INTO emp_bonus VALUES(7934, '15-MAR-2005', 2);



/*
  Total Salaries and Total Bonuses for department 10
  when not all employee in the department received a bonus
*/

SELECT deptno,
       SUM(DISTINCT sal) AS total_sal,
       SUM(bonus) AS total_bonus
FROM
  (
    SELECT e.empno, e.ename, e.sal, e.deptno, e.sal *
    CASE WHEN eb.type IS NULL then 0
         WHEN eb.type = 1 THEN .1
         WHEN eb.type = 2 THEN .2
         else .3
    END AS bonus
    FROM emp AS e
      LEFT OUTER JOIN emp_bonus AS eb ON (e.empno = eb.empno)
    WHERE e.deptno = 10

  )
GROUP BY deptno


ROLLBACK TO SAVEPOINT "RESTOREPOINT";

-- No difference between SQLite and MySQL

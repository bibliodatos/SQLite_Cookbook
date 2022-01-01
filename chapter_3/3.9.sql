/*
  Query 3.9 - Join when using aggregates
*/

SAVEPOINT "RESTOREPOINT";

DELETE FROM emp_bonus;

INSERT INTO emp_bonus VALUES(7934, '17-MAR-2005', 1);
INSERT INTO emp_bonus VALUES(7934, '15-MAR-2005', 2);
INSERT INTO emp_bonus VALUES(7839, '15-FEB-2005', 3);
INSERT INTO emp_bonus VALUES(7782, '15-FEB-2005', 1);


-- Total Salaries and Total Bonuses for department 10
SELECT deptno, SUM(DISTINCT sal) AS total_sal,
       SUM(bonus) AS total_bonus
FROM
  (
    SELECT e.empno, e.ename, e.sal, e.deptno, e.sal *
    CASE WHEN eb.type = 1 THEN .1
         WHEN eb.type = 2 THEN .2
         else .3
    END AS bonus
    FROM emp AS e, emp_bonus AS eb
    WHERE e.empno = eb.empno
      AND e.deptno = 10

  ) AS x
GROUP BY deptno;

ROLLBACK TO SAVEPOINT "RESTOREPOINT";

-- No difference between SQLite and MySQL

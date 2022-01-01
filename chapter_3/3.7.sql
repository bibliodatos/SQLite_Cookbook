/*
  Query 3.7 - Do two tables have the same data?
*/

-- Make a view
CREATE view V37
AS
SELECT * FROM emp WHERE deptno != 10
UNION ALL
SELECT * FROM emp WHERE ename = 'WARD';


-- Main query
SELECT *
  FROM (
    SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate,
      e.sal, e.comm, e.deptno, count(*) AS cnt
      FROM emp AS e
      GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno
  ) AS e
WHERE NOT EXISTS (
  SELECT NULL
    FROM (
      SELECT v.empno, v.ename, v.job, v.mgr, v.hiredate, v.sal, v.comm,
      v.deptno, COUNT(*) AS cnt
      FROM V37 AS v
      GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno

    ) AS v
WHERE v.empno = e.empno
AND v.ename = e.ename
AND v.job = e.job
AND coalesce(v.mgr,0) = coalesce(e.mgr, 0)
AND v.hiredate = e.hiredate
AND v.sal = e.sal
AND v.deptno = e.deptno
AND v.cnt = e.cnt
AND coalesce(v.comm, 0) = coalesce(e.comm, 0)

)

UNION ALL

SELECT *
  FROM (
    SELECT v.empno, v.ename, v.job, v.mgr, v.hiredate, v.sal,
      v.comm, v.deptno, count(*) AS cnt
    FROM V37 AS v
    GROUP BY empno, ename, job, mgr, hiredate,
      sal, comm, deptno
    ) AS v

  WHERE NOT EXISTS (
    SELECT NULL
    FROM (
      SELECT e.empno, e.ename, e.job, e.mgr, e.hiredate,
      e.sal, e.comm, e.deptno, COUNT(*) AS cnt
      FROM emp AS e
      GROUP BY empno, ename, job, mgr, hiredate, sal, comm, deptno

    ) AS e

  WHERE v.empno = e.empno
  AND v.ename = e.ename
  AND v.job = e.job
  AND coalesce(v.mgr, 0) = coalesce(e.mgr, 0)
  AND v.hiredate = e.hiredate
  AND v.sal = e.sal
  AND v.deptno = e.deptno
  AND v.cnt = e.cnt
  AND coalesce(v.comm, 0) = coalesce(e.comm, 0)

  )

-- No difference between SQLite and MySQL

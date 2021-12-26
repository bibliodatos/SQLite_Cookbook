/*
  Query 2.5 - Dealing with NULLs when sorting
*/

-- 2.5.a SQLite NULLS sort first by default
SELECT ename, sal, comm
  FROM emp
  ORDER BY 3

-- 2.5.b Make NULLS sort last using DESC
SELECT ename, sal, comm
  FROM emp
  ORDER BY 3 DESC

-- 2.5.c NON-NULL commission sorted ascending and all NULLS last
SELECT ename, sal, comm
  FROM  (
    SELECT ename, sal, comm,
      CASE WHEN comm is NULL then 0 ELSE 1 END AS is_null
    FROM emp
  ) x
ORDER BY is_null DESC, comm ASC

-- 2.5.d NON-NULL commission sorted descending and all NULLS last
SELECT ename, sal, comm
  FROM  (
    SELECT ename, sal, comm,
      CASE WHEN comm is NULL then 0 ELSE 1 END AS is_null
    FROM emp
  ) x
ORDER BY is_null DESC, comm DESC

-- 2.5.e NON-NULL commission sorted ascending and all NULLS first
SELECT ename, sal, comm
  FROM  (
    SELECT ename, sal, comm,
      CASE WHEN comm is NULL then 0 ELSE 1 END AS is_null
    FROM emp
  ) x
ORDER BY is_null ASC, comm ASC

-- 2.5.f NON-NULL commission sorted descending and all NULLS first
SELECT ename, sal, comm
  FROM  (
    SELECT ename, sal, comm,
      CASE WHEN comm is NULL then 0 ELSE 1 END AS is_null
    FROM emp
  ) x
ORDER BY is_null ASC, comm DESC


-- No differences from SQLite to MySQL

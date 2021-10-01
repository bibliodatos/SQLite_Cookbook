-- Example 6.12 Alphabetizing a string by character


/*
  employee name sorted by each individual characters in SQLite
*/
SELECT ename, GROUP_CONCAT(c, '')
FROM
  (
    SELECT ename, SUBSTR(a.ename, iter.pos, 1) AS c
    FROM emp AS a,
      (SELECT column1 AS pos FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10))) AS iter
    WHERE iter.pos <= LENGTH(a.ename)
    ORDER BY ename ASC, c ASC
  ) as X
GROUP BY ename


-- MySQL solution
SELECT ename, GROUP_CONCAT(c ORDER BY c separator '')
FROM
  (
    SELECT ename, SUBSTR(a.ename, iter.pos, 1) AS c
    FROM emp AS a,
      (SELECT id pos FROM t10) AS iter
    WHERE iter.pos <= LENGTH(a.ename)
    ORDER BY ename ASC, c ASC
  ) as X
GROUP BY ename

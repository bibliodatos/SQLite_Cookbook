-- Example 6.13 Identify strings that can be treated as numbers


-- Setup our data in a view
CREATE VIEW V AS
  SELECT REPLACE(mixed, ' ', '') AS mixed
  FROM (

    SELECT SUBSTR(ename,1,2)||
      CAST(deptno AS TEXT)||
      SUBSTR(ename,3,2) as mixed
    FROM emp
    WHERE deptno = 10

    UNION ALL

    SELECT CAST(empno AS TEXT) as mixed
    FROM emp
    WHERE deptno = 20

    UNION ALL

    SELECT ename AS mixed
    FROM emp
    WHERE deptno = 30

  ) AS x;


/*
  Return strings that are numeric or contain at least one number using SQLite
*/
SELECT CAST(GROUP_CONCAT(c, '') AS unsigned)
  AS MIXED1
  FROM (
    SELECT v.mixed, iter.pos, SUBSTR(v.mixed, iter.pos, 1) AS c
    FROM V, (SELECT column1 AS pos FROM (VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10))) AS iter
    WHERE iter.pos <= LENGTH(v.mixed)
    AND UNICODE(SUBSTR(v.mixed, iter.pos, 1)) BETWEEN 48 AND 57
  ) AS y
GROUP BY mixed
ORDER BY 1

-- MySQL solution
SELECT CAST(GROUP_CONCAT(c ORDER BY pos SEPARATOR '') AS unsigned)
  AS MIXED1
  FROM (
    SELECT v.mixed, iter.pos, SUBSTR(v.mixed, iter.pos, 1) AS c
    FROM V, (SELECT id pos FROM t10 ) AS iter
    WHERE iter.pos <= LENGTH(v.mixed)
    AND ASCII(SUBSTR(v.mixed, iter.pos, 1)) BETWEEN 48 AND 57
  ) AS y
GROUP BY mixed
ORDER BY 1

/*
  Differences are that SQLite uses UNICODE() function while MySQL uses ASCII().
  MySQL uses dummy t10 table while SQLite can SELECT without a table.
  ALSO GROUP_CONCAT syntax varies.
*/

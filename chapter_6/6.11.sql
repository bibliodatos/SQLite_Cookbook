-- Example 6.11 Converting delimited data into a multi-values IN-list



/*
  SQLite solution uses a common table expression (CTE) as there is no
  string function provided in SQLite that parses a string into parts.
  Thank you to user1461607 on stackoverflow for the CTE example...
    https://stackoverflow.com/questions/24258878/how-to-split-comma-separated-value-in-sqlite
*/
SELECT ename, sal, deptno
FROM emp WHERE empno IN (

  WITH split(word, str) AS (
    SELECT '', '7654,7698,7782,7788'||','
    UNION ALL SELECT
    substr(str, 0, instr(str, ',')),
    substr(str, instr(str, ',')+1)
    FROM split WHERE str!=''
  ) SELECT word FROM split WHERE word!=''

);


-- MySQL solution uses SUBSTRING_INDEX function which SQLite does not have
SELECT empno, ename, sal, deptno
  FROM emp
  WHERE empno IN
  (
    SELECT SUBSTRING_INDEX(
      SUBSTRING_INDEX(list.vals, ',',iter.pos), ',',-1) empno
      FROM (SELECT id pos FROM t10) AS iter,
           (SELECT '7654,7698,7782,7788' AS vals FROM t1) list
      WHERE iter.pos <=
        (LENGTH(list.vals) - LENGTH(REPLACE(list.vals, ',',''))) + 1
  );

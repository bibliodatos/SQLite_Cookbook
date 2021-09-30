-- Example 6.1 Walking a string


/*
  SQLite solution returning each character of a string as a row.
  We don't have the dummy t10 table in SQLite like other dbms' do but we
  don't need it as you will see below
*/
SELECT SUBSTR(e.ename, iter.pos, 1) AS C
  FROM (SELECT ename FROM emp WHERE ename = 'KING') AS e,
       (SELECT column1 AS pos FROM (VALUES (1), (2),(3),(4),(5), (6), (7),(8),(9),(10))) AS iter
  WHERE iter.pos <= length(e.ename);

-- MySQL solution
SELECT ename, iter.pos
  FROM (SELECT ename FROM emp WHERE ename = 'KING') AS e,
       (SELECT id AS pos FROM t10) iter;

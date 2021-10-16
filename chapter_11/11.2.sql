-- Example 11.2 Skipping N rows

/*
    SQLite query to return the odd numbered rows in a result set
*/
SELECT ename, rn
  FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY ename) AS rn,
    ename
    FROM emp
  ) AS x
WHERE rn % 2 = 1



/*
  MySQL used the MOD() operator for modulo while SQLite uses %
*/

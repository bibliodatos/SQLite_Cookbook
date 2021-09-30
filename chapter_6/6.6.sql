-- Example 6.6 Determing whether a string is alphanumeric


CREATE view V AS
SELECT ename as data FROM emp
  WHERE deptno = 10
UNION ALL
SELECT ename||', $'|| CAST(deptno as TEXT) ||'.00' as data FROM emp
  WHERE deptno = 20
UNION ALL
SELECT ename|| CAST(deptno AS TEXT) AS data FROM emp
  WHERE deptno = 30;

/*
  Find rows with non-alphanumeric data
*/
SELECT data
  FROM V
WHERE data REGEXP '[^0-9a-zA-Z]' = 0;

-- The view creation is different in MySQL but the query is the same.

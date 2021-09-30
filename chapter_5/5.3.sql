-- Example 5.3 Listing indexed columns for a table

CREATE INDEX empno_idx ON emp(empno);

/*
  You can't select specific column indexes in SQLite but you can
  query for all the index names and try to pattern match the sql
*/
SELECT name AS index_name
 FROM "main".sqlite_master
 WHERE type = 'index'
 AND  tbl_name = 'emp'
 AND  sql LIKE '%empno%';


/*
  MySQL solution
*/
SHOW INDEX FROM emp;

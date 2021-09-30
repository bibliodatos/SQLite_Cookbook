-- Example 5.2 Listing a table's columns

/*
 You can use SELECT to query the columns names in SQLite. You can retreive
 the SQL create table statement from the 'sql' column in sqlite_master.
*/
SELECT sql
 FROM "main".sqlite_master
 WHERE type = 'table' AND  tbl_name = 'emp';

/*
  You can also use the PRAGMA statement to retrieve column name and data type
  in SQLite
*/
PRAGMA table_info(emp);


/*
  MySQL solution
*/
SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = 'FOOBAR';

-- Example 5.1 Listing tables in a schema

/*
  My SQLite implementation uses sqlite_master but some use sqlite_schema.
  SQLite does not have schema names so the name of the database is what is used.
  In this case "main"
*/
SELECT tbl_name
 FROM "main".sqlite_master;

/* MySQL has schema names and uses information_schema as the table to query
   against.
*/
SELECT table_name
  FROM information_schema.tables
  WHERE table_schema = 'FOOBAR';

-- SQLite uses 'tbl_name' while MySQL uses 'table_name'

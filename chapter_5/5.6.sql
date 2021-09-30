-- Example 5.6


/*
  Use SQL to create an statement to count the number of rows
  for every table in a database
*/

SELECT 'SELECT COUNT(*) FROM ' || name || ';'
FROM
  ( SELECT name FROM sqlite_master
    WHERE type = 'table');

-- MySQL would use information_schema table instead of sqlite_master

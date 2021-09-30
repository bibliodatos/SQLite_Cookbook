-- Example 5.4 Listing constraints for a table


/*
 You can't use a SELECT query to get constraints in SQLite.
 You have to use PRAGMA table_info().  It will show 'notnull' attribute
 and 'dflt_value' attribute for the columns in a table
*/
PRAGMA table_info(emp);

/*
  MySQL solution
*/
SELECT a.table_name, a.constraint_name,
  b.column_name, a.constrain_type
  FROM information_schema.table_constraints a,
    information_schema.key_column_usage b
WHERE a.table_name = 'emp'
  AND a.table_schema = 'FOOBAR'
  AND a.table_name = b.table_name
  AND a.table_schema = b.table_schema
  AND a.constraint_name = b.constraint_name;

-- Example 6.2 Embedding quotes with string literals


/*
  SQLite solution does not require a table for a SELECT
  Three ways to create quote marks
*/
SELECT 'g''day mate' qmarks
UNION ALL
SELECT 'beavers'' teeth'
UNION ALL
SELECT ''''

-- MySQL solution requires dummy table t1
SELECT 'g''day mate' qmarks FROM t1
UNION ALL
SELECT 'beavers'' teeth' FROM t1
UNION ALL
SELECT '''' FROM t1

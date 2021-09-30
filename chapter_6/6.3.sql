-- Example 6.3 Counting the occurrences of a character in a string


/*
  How many commas in the string?
  SQLite does not require dummy t1 table
*/
SELECT (LENGTH('10,CLARK,MANAGER') -
        LENGTH(REPLACE('10,CLARK,MANAGER', ',',''))) / LENGTH(',')
        AS cnt

-- MySQL solution requires dummy table t1
SELECT (LENGTH('10,CLARK,MANAGER') -
        LENGTH(REPLACE('10,CLARK,MANAGER', ',',''))) / LENGTH(',')
        AS cnt
  FROM t1

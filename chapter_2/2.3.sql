-- Example 2.3 Sorting query by substrings

-- Sort by last 2 characters in job field
SELECT ename, job
  FROM emp
  ORDER BY substr(job, length(job) - 1, 2);

/*
Differences from SQLite to MySQL:
  SQLite uses length function
  MySQL uses len function
*/

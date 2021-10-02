-- Example 6.14 Extracting the nth delimited substring

CREATE VIEW V AS
  SELECT 'mo,larry,curly' AS csv
  UNION ALL
  SELECT 'tina,gina,juanita,regina,leena' AS csv;

/*
  SQLite solution uses a common table expression (CTE) as there is no
  string function provided in SQLite that parses a string into parts.
  Thank you to user1461607 on stackoverflow for the CTE example...
    https://stackoverflow.com/questions/24258878/how-to-split-comma-separated-value-in-sqlite
  As of yet I have not been able to figure out how to work with querying mulitple
  rows from the view.  Below is an example with the string hard coded in the CTE.
*/
WITH split(word, str) AS (
	SELECT '', 'tina,gina,juanita,regina,leena,'
    UNION ALL
	SELECT
		substr(str, 0, instr(str, ',')),
		substr(str, instr(str, ',') +1)
    FROM split WHERE str!=''
  )
SELECT word FROM split
WHERE word != ''
ORDER BY LENGTH(str) DESC
LIMIT 1 OFFSET 1;


/*
MySQL solution has the SUBSTRING_INDEX function which makes this relatively
simple to accomplish
*/

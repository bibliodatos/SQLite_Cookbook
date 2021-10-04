-- Example 10.5 Generating consecutive numeric values

/*
    Use a CTE to create a sequence from 1 to 10
*/
WITH x (id)
AS (
	SELECT 1
	  UNION ALL
	 SELECT id + 1
	 FROM x
	 WHERE id + 1 <= 10
)

SELECT * FROM x;

/*
  Create a view to hold a certain number of consecutive numeric values. Saves
  us a little typing in the future as we can use the view instead of typing out
  the CTE
*/

CREATE VIEW V420 (pos) AS

WITH x (id)
AS (
	SELECT 1
	  UNION ALL
	 SELECT id + 1
	 FROM x
	 WHERE id + 1 <= 420
)

SELECT * FROM x

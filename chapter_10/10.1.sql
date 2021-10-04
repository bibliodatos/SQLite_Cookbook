-- Example 10.1 Locating a range of consecutive values

/*
	Setup our data view
*/
CREATE VIEW V (proj_id, proj_start, proj_end) AS

SELECT 1, '2020-01-01', '2020-01-02'
UNION
SELECT 2, '2020-01-02', '2020-01-03'
UNION
SELECT 3, '2020-01-03', '2020-01-04'
UNION
SELECT 4, '2020-01-04', '2020-01-05'
UNION
SELECT 5, '2020-01-06', '2020-01-07'
UNION
SELECT 6, '2020-01-16', '2020-01-17'
UNION
SELECT 7, '2020-01-17', '2020-01-18'
UNION
SELECT 8, '2020-01-18', '2020-01-19'
UNION
SELECT 9, '2020-01-19', '2020-01-20'
UNION
SELECT 10, '2020-01-21', '2020-01-22'
UNION
SELECT 11, '2020-01-26', '2020-01-27'
UNION
SELECT 12, '2020-01-27', '2020-01-28'
UNION
SELECT 13, '2020-01-28', '2020-01-29'
UNION
SELECT 14, '2020-01-29', '2020-01-30'


/*
	Find rows that represent a range of consecutive projects.
	Use the LEAD() OVER() window function to see what is in the next row.
*/
SELECT proj_id, proj_start, proj_end
FROM
(
  SELECT proj_id, proj_start, proj_end,
    LEAD(proj_start) OVER (ORDER BY proj_id) next_proj_start
  FROM V
) AS x
WHERE next_proj_start = proj_end

-- No difference between SQLite and MySQL

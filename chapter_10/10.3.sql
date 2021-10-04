-- Example 10.1 Locating the beginning and end of a range of consecutive values


/*
  Find the start and end date of each group of overlapping projects.
  We use the same project view we set up in 10.1.
*/
SELECT proj_grp, MIN(proj_start), MAX(proj_end)
FROM
(
SELECT proj_id, proj_start, proj_end,
  SUM(flag) OVER (ORDER BY proj_id) as proj_grp
FROM
(
SELECT proj_id, proj_start, proj_end,
  CASE WHEN
    LAG(proj_end) OVER (ORDER BY proj_id) = proj_start THEN 0 ELSE 1 END as flag,
	LAG(proj_end) OVER (ORDER BY proj_id)  AS prev_proj_end
FROM V
) AS x
) AS y
GROUP BY proj_grp

-- No difference between SQLite and MySQL

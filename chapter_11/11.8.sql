-- Example 11.8 Shifting row values


/*
 SELECT each employee's name and salary with the next highest and next lowest
 salary. If no higher or lower then wrap around.  Use the LEAD OVER and LAG OVER
 window functions. To accomplish the wrap around for the first and last rows
 use COALESCE() function.
*/
SELECT ename, sal,
  COALESCE(LEAD(sal) OVER (ORDER BY sal), MIN(SAL) OVER () ) AS forward,
  COALESCE(LAG(sal) OVER (ORDER BY sal), MAX(SAL) OVER () ) AS rewind
FROM emp;

-- No difference between SQLite and MySQL

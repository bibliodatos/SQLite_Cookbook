-- Example 7.10 Calculating a median


/*
    Other RDBMS have PERCENTILE_CONT function but neither SQLite nor MySQL do.
    Solution is to use CUME_DIST window function in a CTE.
*/
WITH rank_tab (sal, rank_sal) AS
(
    SELECT sal, CUME_DIST() OVER (ORDER BY SAL)
    FROM emp
    WHERE deptno=20
),

inter AS
(
  SELECT sal, rank_sal FROM rank_tab
  WHERE rank_sal >= 0.5

  UNION

  SELECT sal, rank_sal FROM rank_tab
  WHERE rank_sal <= 0.5

)

-- When even number of rows we have to average the two closest to mid-point.
SELECT AVG(sal) AS MedianSal
FROM inter;


-- No difference between SQLite and MySQL

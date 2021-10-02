-- Example 7.15 Changing values in a running total

-- setup our data view
DROP VIEW V;

CREATE VIEW V (id, amt,trx) AS
  SELECT 1, 100, 'PR'
  UNION ALL
  SELECT 2, 100, 'PR'
  UNION ALL
  SELECT 3, 50, 'PY'
  UNION ALL
  SELECT 4, 100, 'PR'
  UNION ALL
  SELECT 5, 200, 'PY'
  UNION ALL
  SELECT 6, 50, 'PY';

/*
 Use a case statement and SUM OVER to make a running balance column
*/
SELECT CASE WHEN trx = 'PY' THEN 'PAYMENT' ELSE 'PURCHASE' END AS trx_type,
  amt,
  SUM(CASE WHEN trx = 'PY' THEN -amt ELSE amt END
  ) OVER (ORDER BY id, amt) AS balance
FROM V;

-- No difference between SQLite and MySQL

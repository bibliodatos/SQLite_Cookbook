-- Example 6.15 Parsing an IP Address


/*
  Nothing in SQLite lets us split strings by a delimiter so we
  have to get creative with making our delimiter very wide so
  we can count on our number parts being in certain ranges.
*/
SELECT REPLACE(SUBSTR(addr,1, 3), '_', '') AS a,
	     REPLACE(SUBSTR(addr,13, 19), '_', '') AS b ,
	     REPLACE(SUBSTR(addr,36, 19), '_', '') AS c,
       REPLACE(SUBSTR(addr,55, 19), '_', '') AS d
FROM
  (SELECT REPLACE('92.111.0.2','.', '____________________') AS addr )

/*
MySQL has the SUBSTRING_INDEX function which makes this relatively
simple to accomplish.
*/

-- Example 6.10 Creating a delimited list from table rows


/*
  Order by last 2 characters of a text field in SQLite
*/
SELECT deptno,
  GROUP_CONCAT(ename, ',') as emps
  FROM emp
GROUP BY deptno;


--MySQL solution
SELECT deptno,
  GROUP_CONCAT(ename ORDER BY EMPNO separator, ',') as emps
  FROM emp
GROUP BY deptno;

/*
  Both MySQL have group_concat but MySQL syntax is a bit different as seen
  above.
*/

-- Example 9.13 Identifying overlapping date ranges

/*
  SQLite solution:
  Self join the emp_bonus table and then look for overlapping dates for projects
  for the same employee.
*/
SELECT a.empno, a.ename, 'Project '||b.proj_id||' overlaps project '||a.proj_id
FROM emp_project AS a, emp_project AS b
WHERE a.empno = b.empno
AND DATE(b.proj_start) >= DATE(a.proj_start)
AND DATE(b.proj_start) <= DATE(a.proj_end)
AND a.proj_id != b.proj_id


/*
  The MySQL example solution virtually the same but does not have to use the
  DATE() function to do the data comparisons.
*/
